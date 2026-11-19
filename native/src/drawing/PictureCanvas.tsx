import {
  forwardRef,
  useImperativeHandle,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import { StyleSheet, View, type GestureResponderEvent } from 'react-native'
import {
  Canvas,
  Circle,
  Fill,
  Group,
  Image as SkiaImage,
  ImageFormat,
  Mask,
  Path,
  Rect,
  Skia,
  useCanvasRef,
} from 'react-native-skia'
import {
  ART_SIZE,
  BACKGROUND_REGION_ID,
  fitRect,
  hitTest,
  strokePathData,
  viewToArt,
} from '../domain/geometry'
import type { Action, StrokeAction, ToolType } from '../domain/types'
import { sound } from '../audio/sound'
import { StarBurst } from '../components/StarBurst'
import type { LoadedPicture, LoadedRegion } from './loadPicture'

const PAPER = '#ffffff'
const MIN_POINT_DISTANCE = 0.75
/** Gallery cards are 264×264 in the original app (PWA `DrawScene` thumbnail). */
const THUMBNAIL_SIZE = 264

type Props = {
  picture: LoadedPicture
  actions: Action[]
  tool: ToolType
  color: string
  onChange: (actions: Action[]) => void
}

export type PictureCanvasHandle = {
  /** PNG base64 of the art square, downscaled to 264×264 for the gallery. */
  snapshotArt: () => Promise<string | null>
}

type RenderStroke = {
  path: string
  color: string
  width: number
  dot: [number, number] | null
}

/** Paper regions (full-square masks) count as the background for old saved actions. */
function matchesRegion(action: Action, regionId: number, paperRegionIds: readonly number[]): boolean {
  if (action.regionId === regionId) return true
  return regionId === BACKGROUND_REGION_ID && paperRegionIds.includes(action.regionId)
}

function buildFill(actions: Action[], regionId: number, paperRegionIds: readonly number[]): string | null {
  let color: string | null = null
  for (const action of actions) {
    if (matchesRegion(action, regionId, paperRegionIds) && action.type === 'fill') color = action.color
  }
  return color
}

function buildStrokes(actions: Action[], regionId: number, paperRegionIds: readonly number[]): RenderStroke[] {
  // Find the index of the latest fill action for this region.
  // Any strokes drawn prior to this fill are covered up by the new paint.
  let lastFillIndex = -1
  for (let i = 0; i < actions.length; i++) {
    const action = actions[i]
    if (matchesRegion(action, regionId, paperRegionIds) && action.type === 'fill') {
      lastFillIndex = i
    }
  }

  const strokes: RenderStroke[] = []
  // Only render strokes that were drawn AFTER the latest fill for this region
  for (let i = lastFillIndex + 1; i < actions.length; i++) {
    const action = actions[i]
    if (!matchesRegion(action, regionId, paperRegionIds) || action.type === 'fill') continue
    if (action.points.length === 0) continue
    strokes.push({
      path: strokePathData(action.points),
      color: action.type === 'erase' ? PAPER : action.color,
      width: action.width,
      dot: action.points.length === 1 ? action.points[0] : null,
    })
  }
  return strokes
}

function StrokeShape({ stroke }: { stroke: RenderStroke }) {
  if (stroke.dot) {
    return <Circle cx={stroke.dot[0]} cy={stroke.dot[1]} r={stroke.width / 2} color={stroke.color} />
  }
  return (
    <Path
      path={stroke.path}
      style="stroke"
      color={stroke.color}
      strokeWidth={stroke.width}
      strokeCap="round"
      strokeJoin="round"
    />
  )
}

function RegionMask({ region, children }: { region: LoadedRegion; children: ReactNode }) {
  const [left, top, width, height] = region.bounds
  return (
    <Mask
      mode="alpha"
      mask={<SkiaImage image={region.mask} x={left} y={top} width={width} height={height} fit="fill" />}
    >
      {children}
    </Mask>
  )
}

export const PictureCanvas = forwardRef<PictureCanvasHandle, Props>(function PictureCanvas(
  { picture, actions, tool, color, onChange },
  ref,
) {
  const canvasRef = useCanvasRef()
  const [layout, setLayout] = useState({ width: 0, height: 0 })
  const [draft, setDraft] = useState<StrokeAction | null>(null)
  const pendingFill = useRef<{ x: number; y: number; color: string } | null>(null)
  const [burst, setBurst] = useState<{ x: number; y: number; color: string; id: number } | null>(null)
  const burstId = useRef(0)

  const fit = useMemo(() => fitRect(layout.width, layout.height), [layout.width, layout.height])

  const pointFrom = (event: GestureResponderEvent): [number, number] =>
    viewToArt(fit, event.nativeEvent.locationX, event.nativeEvent.locationY)

  const handleGrant = (event: GestureResponderEvent) => {
    const [x, y] = pointFrom(event)
    // Shapes win where their mask covers; everything else on the stage is paper.
    // The paper spans the whole stage, so strokes and fills are not limited to the
    // art square (which only fits the outline and its masks).
    const shape = hitTest(picture.regions, x, y)
    const regionId = shape ? shape.regionId : BACKGROUND_REGION_ID
    if (tool === 'fill') {
      sound.playEffect('fill')
      pendingFill.current = { x, y, color }
      onChange([...actions, { type: 'fill', regionId, color }])
      return
    }
    sound.playEffect(tool === 'eraser' ? 'draw-erase' : 'star')
    sound.startBrush()
    // The APK draws in a 1080-unit canvas, native draws the same art in 775 units, so
    // original sizes convert with x775/1080 (0.7176): the measured 85 px marker band
    // (brushes/1.4/marker.png is 87 px) is 62 units, pencil is 12 px at 1.0 and the
    // eraser matches the 76 px brush sprite. The user asked for 30% more on top:
    // 62/12/76 -> 81/16/99.
    const width = tool === 'pencil' ? 16 : tool === 'eraser' ? 99 : 81
    setDraft({
      type: tool === 'eraser' ? 'erase' : 'stroke',
      regionId,
      color,
      points: [[x, y]],
      width,
      tool,
    })
  }

  const handleMove = (event: GestureResponderEvent) => {
    setDraft((current) => {
      if (!current) return current
      const [x, y] = pointFrom(event)
      const last = current.points[current.points.length - 1]
      if (last && Math.hypot(x - last[0], y - last[1]) < MIN_POINT_DISTANCE) return current
      return { ...current, points: [...current.points, [x, y]] }
    })
  }

  const handleRelease = () => {
    sound.stopBrush()
    if (draft) onChange([...actions, draft])
    const lastPoint = draft?.type === 'stroke' ? draft.points[draft.points.length - 1] : null
    const effect = lastPoint ? { x: lastPoint[0], y: lastPoint[1], color: draft!.color } : pendingFill.current
    if (effect) {
      if (pendingFill.current) sound.playEffect('star')
      setBurst({ ...effect, id: ++burstId.current })
    }
    pendingFill.current = null
    setDraft(null)
  }

  const layers = useMemo(
    () =>
      picture.regions.map((region) => ({
        region,
        fill: buildFill(actions, region.regionId, picture.paperRegionIds),
        strokes: buildStrokes(actions, region.regionId, picture.paperRegionIds),
      })),
    [picture, actions],
  )

  const paperFill = useMemo(
    () => buildFill(actions, BACKGROUND_REGION_ID, picture.paperRegionIds),
    [actions, picture.paperRegionIds],
  )
  const paperStrokes = useMemo(
    () => buildStrokes(actions, BACKGROUND_REGION_ID, picture.paperRegionIds),
    [actions, picture.paperRegionIds],
  )
  const draftStrokes = useMemo(
    () => (draft ? buildStrokes([draft], draft.regionId, picture.paperRegionIds) : []),
    [draft, picture.paperRegionIds],
  )

  useImperativeHandle(
    ref,
    () => ({
      snapshotArt: async () => {
        const canvas = canvasRef.current
        if (!canvas || fit.scale <= 0) return null
        const image = canvas.makeImageSnapshot(
          Skia.XYWHRect(fit.x, fit.y, ART_SIZE * fit.scale, ART_SIZE * fit.scale),
        )
        // The art snapshot is square, so a square downscale keeps the aspect.
        const surface = Skia.Surface.MakeOffscreen(THUMBNAIL_SIZE, THUMBNAIL_SIZE)
        if (!surface) return image.encodeToBase64(ImageFormat.PNG, 100)
        surface.getCanvas().drawImageRect(
          image,
          Skia.XYWHRect(0, 0, image.width(), image.height()),
          Skia.XYWHRect(0, 0, THUMBNAIL_SIZE, THUMBNAIL_SIZE),
          Skia.Paint(),
        )
        const snapshot = surface.makeImageSnapshot()
        surface.dispose()
        return snapshot.encodeToBase64(ImageFormat.PNG, 100)
      },
    }),
    [canvasRef, fit],
  )

  return (
    <View
      style={styles.stage}
      onLayout={(event) => {
        const { width, height } = event.nativeEvent.layout
        setLayout({ width, height })
      }}
      onStartShouldSetResponder={() => true}
      onMoveShouldSetResponder={() => true}
      onResponderTerminationRequest={() => false}
      onResponderGrant={handleGrant}
      onResponderMove={handleMove}
      onResponderRelease={handleRelease}
      onResponderTerminate={() => {
        sound.stopBrush()
        pendingFill.current = null
        setDraft(null)
      }}
    >
      <Canvas ref={canvasRef} style={StyleSheet.absoluteFill}>
        <Fill color={PAPER} />
        {/* The paper is the whole stage, not just the art square: fills and strokes
            used to stop at the square and leave two white letterbox bands. */}
        {paperFill ? (
          <Rect x={0} y={0} width={layout.width} height={layout.height} color={paperFill} />
        ) : null}
        <Group transform={[{ translateX: fit.x }, { translateY: fit.y }, { scale: fit.scale }]}>
          {/* Shapes repaint their masked area with paper on top, which clips paper
              strokes and fills without needing a paper mask image. */}
          {paperStrokes.map((stroke, index) => (
            <StrokeShape key={`paper-${index}`} stroke={stroke} />
          ))}
          {draft && draft.regionId === BACKGROUND_REGION_ID
            ? draftStrokes.map((stroke, index) => (
                <StrokeShape key={`paper-draft-${index}`} stroke={stroke} />
              ))
            : null}
          {layers.map(({ region, fill, strokes }) => (
            <Group key={region.regionId}>
              <RegionMask region={region}>
                <Rect x={0} y={0} width={ART_SIZE} height={ART_SIZE} color={PAPER} />
                {fill ? (
                  <Rect
                    x={region.bounds[0]}
                    y={region.bounds[1]}
                    width={region.width}
                    height={region.height}
                    color={fill}
                  />
                ) : null}
                {strokes.map((stroke, index) => (
                  <StrokeShape key={index} stroke={stroke} />
                ))}
                {draft && draft.regionId === region.regionId
                  ? draftStrokes.map((stroke, index) => (
                      <StrokeShape key={`draft-${index}`} stroke={stroke} />
                    ))
                  : null}
              </RegionMask>
            </Group>
          ))}
          <SkiaImage
            image={picture.outline}
            x={0}
            y={0}
            width={ART_SIZE}
            height={ART_SIZE}
            fit="fill"
          />
        </Group>
      </Canvas>
      {burst && <StarBurst key={burst.id} x={fit.x + burst.x * fit.scale} y={fit.y + burst.y * fit.scale} color={burst.color} scale={fit.scale} onDone={() => setBurst(null)} />}
    </View>
  )
})

const styles = StyleSheet.create({
  stage: { flex: 1 },
})
