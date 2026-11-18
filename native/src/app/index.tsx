import { useCallback, useRef, useState } from 'react'
import { FlatList, Image, Pressable, StyleSheet, Text, View, useWindowDimensions } from 'react-native'
import { router, useFocusEffect } from 'expo-router'
import { useSafeAreaInsets } from 'react-native-safe-area-context'
import { MENU_BACKGROUND_LEFT, MENU_BACKGROUND_RIGHT, TOPICS } from '../assets/topics'
import { sound } from '../audio/sound'
import { fadeThenNavigate, useScreenFadeHold } from '../navigation/screenFade'

// The APK labels use an outline around the glyphs, not a drop shadow. React Native has
// no text-stroke, so eight offset copies in the outline colour are drawn behind the
// white text; each copy is 2 design px out from the glyph.
const LABEL_FONT_SIZE = 35
const LABEL_BOTTOM = 54
const LABEL_OUTLINE_COLOR = '#1a1108'
const LABEL_OUTLINE_WIDTH = 2
const LABEL_OUTLINE_OFFSETS: readonly (readonly [number, number])[] = [
  [-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [1, -1], [-1, 1], [1, 1],
]

export default function TopicsScreen() {
  const { width, height } = useWindowDimensions()
  const insets = useSafeAreaInsets()
  const scale = height / 1080
  const cardWidth = 350 * scale
  const cardHeight = 430 * scale
  const gapX = -25 * scale
  // APK grid spacing is -16 (rows overlap); per request the rows now get a real gap.
  const gapY = 8 * scale
  const gridWidth = 6 * cardWidth + 5 * gapX
  const padding = Math.max(24, (width - gridWidth) / 2, insets.left, insets.right)
  useFocusEffect(useCallback(() => { sound.playBgm('menu') }, []))
  // Two backgrounds + every topic card image: the white overlay fades out only after
  // all of them have loaded.
  const [imagesReady, setImagesReady] = useState(false)
  const pendingImages = useRef(TOPICS.length * 2 + 2)
  const markImageLoaded = useCallback(() => {
    pendingImages.current -= 1
    if (pendingImages.current <= 0) setImagesReady(true)
  }, [])
  useScreenFadeHold(!imagesReady)
  const selectTopic = (pack: string) => {
    sound.playEffect('click')
    fadeThenNavigate(() => router.push({ pathname: '/topics/[pack]', params: { pack } }))
  }
  return (
    <View style={styles.screen}>
      <View pointerEvents="none" style={[styles.background, { width: 2774 * scale, left: width / 2 - 1387 * scale }]}>
        <Image source={MENU_BACKGROUND_LEFT} resizeMode="stretch" onLoadEnd={markImageLoaded} style={{ width: 1387 * scale, height }} />
        <Image source={MENU_BACKGROUND_RIGHT} resizeMode="stretch" onLoadEnd={markImageLoaded} style={{ width: 1387 * scale, height }} />
      </View>
      <FlatList
        horizontal
        showsHorizontalScrollIndicator={false}
        data={Array.from({ length: 6 }, (_, column) => column)}
        keyExtractor={(column) => String(column)}
        getItemLayout={(_, index) => ({ length: cardWidth + gapX, offset: (cardWidth + gapX) * index, index })}
        contentContainerStyle={{ alignItems: 'center', paddingHorizontal: padding }}
        renderItem={({ item: column }) => (
          <View style={{ marginRight: column < 5 ? gapX : 0 }}>
            {TOPICS.slice(column * 2, column * 2 + 2).map((topic, row) => <Pressable key={topic.pack} accessibilityRole="button" accessibilityLabel={topic.label} onPress={() => selectTopic(topic.pack)} style={{ width: cardWidth, height: cardHeight, marginBottom: row === 0 ? gapY : 0 }}>
              <Image source={topic.card} resizeMode="stretch" onLoadEnd={markImageLoaded} style={styles.full} />
              <Image source={topic.character} resizeMode="stretch" onLoadEnd={markImageLoaded} style={styles.layer} />
              {LABEL_OUTLINE_OFFSETS.map(([dx, dy]) => (
                <Text key={`${dx}:${dy}`} numberOfLines={1} style={[styles.label, { fontSize: LABEL_FONT_SIZE * scale, bottom: (LABEL_BOTTOM + dy * LABEL_OUTLINE_WIDTH) * scale, left: dx * LABEL_OUTLINE_WIDTH * scale, color: LABEL_OUTLINE_COLOR }]}>{topic.label}</Text>
              ))}
              <Text numberOfLines={1} style={[styles.label, { fontSize: LABEL_FONT_SIZE * scale, bottom: LABEL_BOTTOM * scale }]}>{topic.label}</Text>
            </Pressable>)}
          </View>
        )}
      />
    </View>
  )
}
const styles = StyleSheet.create({
  screen: { flex: 1, backgroundColor: '#84d6f5' },
  background: { position: 'absolute', top: 0, height: '100%', flexDirection: 'row' },
  full: { width: '100%', height: '100%' }, layer: { position: 'absolute', top: 0, left: 0, width: '100%', height: '100%' },
  label: { position: 'absolute', left: 0, width: '100%', textAlign: 'center', fontWeight: 'bold', color: '#fff' },
})
