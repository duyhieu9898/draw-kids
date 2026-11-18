import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Animated, Easing, FlatList, Image, Pressable, StyleSheet, Text, View, useWindowDimensions } from 'react-native'
import { router, useFocusEffect, useLocalSearchParams } from 'expo-router'
import { useSafeAreaInsets } from 'react-native-safe-area-context'
import { PICTURES } from '../../assets/catalog'
import { PACK_ORDER } from '../../assets/packs'
import { UI } from '../../assets/ui'
import { sound } from '../../audio/sound'
import { fadeThenNavigate } from '../../navigation/screenFade'
import { listSavedDrawings, type SavedDrawing } from '../../storage/pictures'

const colors: Record<string, string> = {
  animals: '#9676d9', dolls: '#e8779b', school: '#e89f41', music: '#46a2dc',
  vehicles: '#d84742', food: '#47b988', insects: '#a1c45a', halloween: '#6b3ba7',
  christmas: '#3368a5', dinosaurs: '#489f68', ocean: '#2980b9', magic: '#8e44ad',
}
const COLUMNS_PER_TOPIC = 8
const COLUMNS_PER_CYCLE = COLUMNS_PER_TOPIC * PACK_ORDER.length

type Column = { pack: string; pictures: typeof PICTURES; key: string }

export default function GalleryScreen() {
  const params = useLocalSearchParams<{ pack: string }>()
  const pack = typeof params.pack === 'string' ? params.pack : (params.pack?.[0] ?? '')
  return <GalleryContent key={pack} initialPack={pack} />
}

function GalleryContent({ initialPack }: { initialPack: string }) {
  const [saved, setSaved] = useState<Record<string, SavedDrawing>>({})
  const [problem, setProblem] = useState('')
  const list = useRef<FlatList<Column>>(null)
  const recenterTimer = useRef<ReturnType<typeof setTimeout> | null>(null)
  const { width, height } = useWindowDimensions()
  const insets = useSafeAreaInsets()
  const cardSize = Math.max(1, Math.min(148, height * .34, (height - insets.top - insets.bottom - 90) / 2))
  const columnWidth = cardSize + 18
  const startIndex = COLUMNS_PER_CYCLE + Math.max(0, PACK_ORDER.indexOf(initialPack)) * COLUMNS_PER_TOPIC
  const data = useMemo(() => Array.from({ length: 3 }, (_, cycle) => PACK_ORDER.flatMap((pack) => {
    const pictures = PICTURES.filter((item) => item.pack === pack).sort((a, b) => a.picture - b.picture)
    return Array.from({ length: COLUMNS_PER_TOPIC }, (_, column) => ({ key: `${cycle}-${pack}-${column}`, pack, pictures: pictures.slice(column * 2, column * 2 + 2) }))
  })).flat(), [])
  // The background follows the topic nearest the viewport centre; the colour itself is
  // animated inside GalleryBackground, so changing topic never re-renders the FlatList.
  const [scrollX] = useState(() => new Animated.Value(startIndex * columnWidth))
  const onScroll = useMemo(
    () => Animated.event([{ nativeEvent: { contentOffset: { x: scrollX } } }], { useNativeDriver: false }),
    [scrollX],
  )
  const contentContainerStyle = useMemo(
    () => [styles.track, { paddingTop: Math.max(56, insets.top + 44), paddingBottom: Math.max(12, insets.bottom) }],
    [insets.top, insets.bottom],
  )
  useFocusEffect(useCallback(() => {
    sound.playBgm('menu')
    let active = true
    listSavedDrawings().then((rows) => { if (active) { setSaved(rows); setProblem('') } }).catch((error: unknown) => { if (active) setProblem(error instanceof Error ? error.message : String(error)) })
    return () => { active = false }
  }, []))

  useEffect(() => () => { if (recenterTimer.current) clearTimeout(recenterTimer.current) }, [])

  const recenter = (x: number) => {
    const cycleWidth = columnWidth * COLUMNS_PER_CYCLE
    if (x < cycleWidth * .5) list.current?.scrollToOffset({ offset: x + cycleWidth, animated: false })
    else if (x > cycleWidth * 2.5) list.current?.scrollToOffset({ offset: x - cycleWidth, animated: false })
  }
  return (
    <View style={styles.screen}>
      <GalleryBackground scrollX={scrollX} width={width} columnWidth={columnWidth} initialPack={initialPack} />
      <View pointerEvents="none" style={StyleSheet.absoluteFill}>
        <Image source={UI.galleryPattern} resizeMode="repeat" style={styles.full} />
      </View>
      <Pressable accessibilityLabel="Back to topics" onPress={() => { sound.playEffect('click'); fadeThenNavigate(() => { if (router.canGoBack()) router.back(); else router.replace('/') }) }} style={[styles.back, { top: Math.max(10, insets.top), left: Math.max(24, insets.left) }]}><Image source={UI.back} resizeMode="contain" style={styles.full} /></Pressable>
      {problem ? <Text style={styles.error}>{problem}</Text> : null}
      <FlatList ref={list} horizontal data={data} keyExtractor={(item) => item.key} initialScrollIndex={startIndex}
        getItemLayout={(_, index) => ({ length: columnWidth, offset: columnWidth * index, index })}
        initialNumToRender={8} maxToRenderPerBatch={8} windowSize={5} removeClippedSubviews
        showsHorizontalScrollIndicator={false} scrollEventThrottle={16}
        onScroll={onScroll}
        contentContainerStyle={contentContainerStyle}
        onScrollEndDrag={(event) => { const x = event.nativeEvent.contentOffset.x; recenterTimer.current = setTimeout(() => recenter(x), 180) }}
        onMomentumScrollBegin={() => { if (recenterTimer.current) clearTimeout(recenterTimer.current) }}
        onMomentumScrollEnd={(event) => recenter(event.nativeEvent.contentOffset.x)}
        renderItem={({ item }) => <View style={[styles.column, { width: columnWidth }]}>
          {item.pictures.map((picture) => <Pressable key={picture.key} accessibilityLabel={`${item.pack} picture ${picture.picture}`} onPress={() => { sound.playEffect('click'); fadeThenNavigate(() => router.push({ pathname: '/draw/[pack]/[picture]', params: { pack: item.pack, picture: String(picture.picture) } })) }} style={{ width: cardSize, height: cardSize }}>
            <View style={styles.thumb}><Image source={saved[picture.key]?.thumbnailUri ? { uri: saved[picture.key].thumbnailUri ?? undefined } : picture.outline} resizeMode="contain" style={{ width: '92%', height: '92%' }} /></View>
            <Image source={UI.galleryFrame} resizeMode="stretch" style={styles.frame} />
          </Pressable>)}
        </View>}
      />
    </View>
  )
}

type Rgb = [number, number, number]

function parseColor(hex: string): Rgb {
  const value = parseInt(hex.slice(1), 16)
  return [(value >> 16) & 255, (value >> 8) & 255, value & 255]
}

function mixRgb(from: Rgb, to: Rgb, t: number): Rgb {
  return [
    Math.round(from[0] + (to[0] - from[0]) * t),
    Math.round(from[1] + (to[1] - from[1]) * t),
    Math.round(from[2] + (to[2] - from[2]) * t),
  ]
}

function cssColor([r, g, b]: Rgb): string {
  return `rgb(${r}, ${g}, ${b})`
}

function GalleryBackground({ scrollX, width, columnWidth, initialPack }: { scrollX: Animated.Value; width: number; columnWidth: number; initialPack: string }) {
  const step = columnWidth * COLUMNS_PER_TOPIC
  const half = width / 2
  const initialIndex = Math.max(0, PACK_ORDER.indexOf(initialPack))
  const initialColor = parseColor(colors[PACK_ORDER[initialIndex]] ?? '#9676d9')
  const [fromColor, setFromColor] = useState<Rgb>(initialColor)
  const [toColor, setToColor] = useState<Rgb>(initialColor)
  const [progress] = useState(() => new Animated.Value(1))
  const activeRef = useRef(initialIndex)
  const fromRef = useRef<Rgb>(initialColor)
  const toRef = useRef<Rgb>(initialColor)
  const progressRef = useRef(1)
  useEffect(() => {
    const id = progress.addListener(({ value }) => { progressRef.current = value })
    return () => progress.removeListener(id)
  }, [progress])
  useEffect(() => {
    const id = scrollX.addListener(({ value }) => {
      const idx = ((Math.floor((value + half) / step) % PACK_ORDER.length) + PACK_ORDER.length) % PACK_ORDER.length
      if (idx === activeRef.current) return
      activeRef.current = idx
      const next = parseColor(colors[PACK_ORDER[idx]] ?? '#9676d9')
      // The APK calls DOColor on its background with a 0.75 s duration when the topic
      // nearest the viewport centre changes (GalleryMenu.kz, 0x1546e9c;
      // docs/v3.141/GALLERY_SCROLL_EVIDENCE.md). Restart from the colour actually on
      // screen so a fast flick across several topics keeps fading instead of snapping.
      const start = mixRgb(fromRef.current, toRef.current, progressRef.current)
      fromRef.current = start
      toRef.current = next
      setFromColor(start)
      setToColor(next)
      progressRef.current = 0
      progress.setValue(0)
      Animated.timing(progress, {
        toValue: 1,
        duration: 750,
        // DOTween's default (and the project's gallery approximation) is OutQuad.
        easing: Easing.out(Easing.quad),
        // Opacity is native-driver compatible; animating backgroundColor would run on
        // the JS thread and stutter while the list scrolls.
        useNativeDriver: true,
      }).start()
    })
    return () => scrollX.removeListener(id)
  }, [scrollX, step, half, progress])
  // Two solid layers crossfaded by opacity produce exactly the same per-channel mix
  // as a colour lerp, but on the UI thread.
  return (
    <View pointerEvents="none" style={StyleSheet.absoluteFill}>
      <View style={[StyleSheet.absoluteFill, { backgroundColor: cssColor(fromColor) }]} />
      <Animated.View style={[StyleSheet.absoluteFill, { backgroundColor: cssColor(toColor), opacity: progress }]} />
    </View>
  )
}

const styles = StyleSheet.create({
  screen: { flex: 1 }, full: { width: '100%', height: '100%' },
  back: { position: 'absolute', width: 72, height: 44, zIndex: 2 },
  track: { alignItems: 'center' }, column: { gap: 14 },
  thumb: { position: 'absolute', top: '6.5%', left: '6.5%', width: '87%', height: '87%', backgroundColor: 'white', borderRadius: 10, overflow: 'hidden', alignItems: 'center', justifyContent: 'center' },
  frame: { position: 'absolute', left: 0, top: 0, width: '100%', height: '100%' },
  error: { color: '#8a1717', backgroundColor: '#fff', padding: 8, position: 'absolute', top: 60, zIndex: 3 },
})
