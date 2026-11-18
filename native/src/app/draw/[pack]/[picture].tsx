import { useCallback, useEffect, useRef, useState } from 'react'
import {
  ActivityIndicator,
  Pressable,
  StyleSheet,
  Text,
  View,
} from 'react-native'
import { router, useFocusEffect, useLocalSearchParams } from 'expo-router'
import { sound } from '../../../audio/sound'
import { DrawingShelf } from '../../../components/DrawingShelf'
import { COLORS } from '../../../domain/palette'
import type { Action, ToolType } from '../../../domain/types'
import { getPicture } from '../../../assets/catalog'
import { loadPictureAssets, type LoadedPicture } from '../../../drawing/loadPicture'
import { PictureCanvas, type PictureCanvasHandle } from '../../../drawing/PictureCanvas'
import { fadeThenNavigate, useScreenFadeHold } from '../../../navigation/screenFade'
import { loadSavedDrawing, saveDrawing } from '../../../storage/pictures'

type ScreenState =
  | { kind: 'loading' }
  | { kind: 'ready'; picture: LoadedPicture }
  | { kind: 'error'; problem: string }

export default function DrawScreen() {
  const params = useLocalSearchParams<{ pack: string; picture: string }>()
  const pack = typeof params.pack === 'string' ? params.pack : (params.pack?.[0] ?? '')
  const pictureNumber = Number(
    typeof params.picture === 'string' ? params.picture : (params.picture?.[0] ?? ''),
  )

  return <DrawScreenContent key={`${pack}/${pictureNumber}`} pack={pack} pictureNumber={pictureNumber} />
}

function DrawScreenContent({ pack, pictureNumber }: { pack: string; pictureNumber: number }) {
  const canvasRef = useRef<PictureCanvasHandle>(null)
  const [state, setState] = useState<ScreenState>({ kind: 'loading' })
  const [actions, setActions] = useState<Action[]>([])
  const [tool, setTool] = useState<ToolType>('marker')
  const [color, setColor] = useState(COLORS[0])
  const [saving, setSaving] = useState(false)
  const [popup, setPopup] = useState<'tools' | 'palette' | null>(null)
  const [problem, setProblem] = useState('')
  // 3.141 `DrawingPage.OnButtonTrash` only calls ClearAll when a second tap
  // arrives within 2 s of the first (docs/v3.141/LOGIC_MAP.md, "Trash").
  const [clearArmed, setClearArmed] = useState(false)
  const clearTimer = useRef<ReturnType<typeof setTimeout> | null>(null)
  // Keep the white overlay until the picture and its mask are ready, instead of
  // revealing the "Opening picture…" screen right after tapping a thumbnail.
  useScreenFadeHold(state.kind === 'loading')

  useEffect(() => {
    let active = true

    async function prepare() {
      const catalog = getPicture(pack, pictureNumber)
      if (!catalog) throw new Error(`No picture ${pack}/${pictureNumber} in catalog.`)
      const [loaded, saved] = await Promise.all([
        loadPictureAssets(catalog),
        loadSavedDrawing(catalog.key),
      ])
      if (!active) return
      setActions(saved?.actions ?? [])
      setState({ kind: 'ready', picture: loaded })
    }

    prepare().catch((error: unknown) => {
      if (!active) return
      setState({
        kind: 'error',
        problem: error instanceof Error ? error.message : String(error),
      })
    })

    return () => {
      active = false
    }
  }, [pack, pictureNumber])

  const disarmClear = useCallback(() => {
    if (clearTimer.current) {
      clearTimeout(clearTimer.current)
      clearTimer.current = null
    }
    setClearArmed(false)
  }, [])

  useEffect(() => disarmClear, [disarmClear])

  useFocusEffect(
    useCallback(() => {
      sound.playBgm('game')
      // A stroke can be interrupted by navigation; never leave the loop running.
      return () => sound.stopBrush()
    }, []),
  )

  const handleClear = useCallback(() => {
    if (actions.length === 0) return
    sound.playEffect('click')
    if (!clearArmed) {
      disarmClear()
      setClearArmed(true)
      clearTimer.current = setTimeout(() => {
        clearTimer.current = null
        setClearArmed(false)
      }, 2000)
      return
    }
    disarmClear()
    setActions([])
  }, [actions.length, clearArmed, disarmClear])

  const handleSave = useCallback(async () => {
    if (state.kind !== 'ready') return
    sound.playEffect('click')
    setSaving(true)
    setProblem('')
    try {
      const thumbnailBase64 = (await canvasRef.current?.snapshotArt()) ?? null
      await saveDrawing({ key: state.picture.catalog.key, actions, thumbnailBase64 })
      fadeThenNavigate(() => router.back())
    } catch (error) {
      setProblem(error instanceof Error ? error.message : String(error))
    } finally {
      setSaving(false)
    }
  }, [actions, state])

  if (state.kind !== 'ready') {
    return (
      <View style={styles.centered}>
        {state.kind === 'loading' ? (
          <>
            <ActivityIndicator size="large" color="#c98a2e" />
            <Text style={styles.centeredText}>Opening picture…</Text>
          </>
        ) : (
          <Text style={styles.centeredText}>{state.problem || 'Could not open picture.'}</Text>
        )}
      </View>
    )
  }

  // Root adds no safe-area padding: the paper must reach the screen edges, otherwise
  // white gaps appear along the right/bottom. The shelf handles safe area for its
  // own buttons.
  return (
    <View style={styles.screen}>
      <View style={styles.left}>
        <PictureCanvas
          ref={canvasRef}
          picture={state.picture}
          actions={actions}
          tool={tool}
          color={color}
          onChange={setActions}
        />
        {problem ? <Text style={styles.toast}>{problem}</Text> : null}
      </View>

      {popup && <Pressable accessibilityLabel="Close picker" style={StyleSheet.absoluteFill} onPress={() => setPopup(null)} />}
      <DrawingShelf popup={popup} setPopup={setPopup} tool={tool} color={color} hasActions={actions.length > 0} saving={saving} clearArmed={clearArmed}
        onTool={setTool} onColor={setColor} onSave={handleSave} onUndo={() => setActions((current) => current.slice(0, -1))} onClear={handleClear} />
    </View>
  )
}

const styles = StyleSheet.create({
  screen: { flex: 1, flexDirection: 'row', backgroundColor: '#ffffff' },
  left: { flex: 1 },
  centered: { flex: 1, alignItems: 'center', justifyContent: 'center', gap: 12, padding: 24 },
  centeredText: { fontSize: 16, color: '#4a3b22', textAlign: 'center' },
  toast: {
    position: 'absolute',
    bottom: 12,
    left: 12,
    right: 12,
    backgroundColor: '#000000cc',
    color: '#ffffff',
    padding: 10,
    borderRadius: 8,
    fontSize: 13,
    textAlign: 'center',
  },
})
