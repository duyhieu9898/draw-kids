import { memo, useCallback, useMemo, useState } from 'react'
import { Image, Pressable, StyleSheet, View, useWindowDimensions } from 'react-native'
import { UI } from '../assets/ui'
import { COLORS } from '../domain/palette'
import type { ToolType } from '../domain/types'
import { sound } from '../audio/sound'

// Real measurements from level4 (reports/v3.141/scene-structure.json): 1080-unit canvas;
// BrushPanel 329x1020, pivot (0,922179; 0,726953), its right edge matches the shelf's left edge.
// Each tool slot: 216x128 frame (marker/pencil), 209x154 (fill), right edge +81.3 from panel center;
// divider 16x964 at x 243.33, top 28.
// Scene serializes the slot at scale 0.8, but when the panel opens the APK tweens the
// parent to 1: measurements on reports/runtime/12-tools.png show each icon ~216 units
// wide (~66% of panel width), left edge flush with the inner frame and right edge
// covered by the divider - drawing at 0.8 (172.8 units = 52.5%) makes the icon smaller
// than the original and shifted right. So icons use the 1:1 frame and the divider is
// drawn AFTER the icon to cover its right edge like the APK.
const UNITY_CANVAS_HEIGHT = 1080
const TOOLS_PANEL_WIDTH_UNITS = 329
const TOOLS_PANEL_HEIGHT_UNITS = 1020
const TOOLS_PANEL_RIGHT_EDGE_UNITS = 81.3
// Both panels anchor to the shelf's left edge with a top fixed to app height (PWA:
// `.native-tool-picker { top: 2.8% }`, `.native-palette-picker { top: 7% }`), not to the
// center of the Tools/Colors button - changing screen size or button position does not
// drag the panel along.
const TOOLS_POPUP_TOP_FRAC = 0.028
const PALETTE_POPUP_TOP_FRAC = 0.07
const TOOLS_DIVIDER = { left: 243.33, top: 28, width: 16, height: 964 }
/** `center` = distance from the panel's top edge to the slot's center (Unity 510 - y). */
const TOOL_ROWS = [
  { name: 'marker', center: 121, width: 216, height: 128 },
  { name: 'pencil', center: 251, width: 216, height: 128 },
  { name: 'fill', center: 509, width: 209, height: 154 },
] as const
// popup_palette.png: 990x927. PWA sets the panel to 413% of shelf width, 85.8% of screen height;
// 8x7 grid at left 2.125%, top 3.72%, size 92.74% x 92.77%.
// Unity pivot (1, 0.479294) -> arrow on the RIGHT side, center at 52.0706% of height.
const PALETTE_POPUP_WIDTH_RATIO = 4.13
const PALETTE_POPUP_HEIGHT_RATIO = 0.858
// PWA `.workspace`: shelf column = art width + left padding + right padding, while buttons
// stay inside the art width, so button size is unchanged.
const SHELF_LEFT_PADDING = 10
const SHELF_RIGHT_PADDING = 25  // Top/bottom padding of the button column, measured against screen height. Previously the
// button block sat inside the safe-area-adjusted region, so the Undo/Delete row also added
// insets.bottom (21 pt on iPhone landscape) and ended up ~2.5x higher than the top padding.
const SHELF_VERTICAL_PADDING_FRAC = 0.037
// The drop shadow (button-shadow.png) should be only slightly larger than the button. Leaving
// 5.24% on each side made the halo double in size and fill the gaps between the 3 round buttons.
const ROUND_SHADOW_OVERFLOW_FRAC = 0.0262
const PALETTE_GRID = { left: 0.02125, top: 0.0372, width: 0.9274, height: 0.9277 }
const PALETTE_COLUMNS = 8
const PALETTE_ROWS = 7
// Unity: 110 swatch on a 125 (row) / 130 (column) step; selection border 135.
const PALETTE_SWATCH_OF_SLOT = 110 / 125
const PALETTE_CHECK_SCALE = 135 / 110

type PalettePopupProps = {
  open: boolean
  width: number  // art width of the shelf
  right: number  // distance from the right screen edge to the shelf's left edge
  color: string
  tool: ToolType
  previous: Exclude<ToolType, 'eraser'>
  onColor: (color: string) => void
  onTool: (tool: ToolType) => void
  onClose: () => void
}

// The panel stays mounted and is shown/hidden via display (like the PWA keeping
// .native-palette-picker in the DOM and toggling the `open` class, and the APK toggling
// the GameObject's active state). Previously every open re-mounted 56 swatches + images,
// costing a decode hitch mid-drawing.
const PalettePopup = memo(function PalettePopup({ open, width, right, color, tool, previous, onColor, onTool, onClose }: PalettePopupProps) {
  const { height } = useWindowDimensions()
  const popupW = width * PALETTE_POPUP_WIDTH_RATIO
  const popupH = height * PALETTE_POPUP_HEIGHT_RATIO
  // Unity lays out 56 colors by column: 7 rows, then the next column (step 125 / 130).
  const slotW = (popupW * PALETTE_GRID.width) / PALETTE_COLUMNS
  const slotH = (popupH * PALETTE_GRID.height) / PALETTE_ROWS
  const swatch = Math.min(slotW, slotH) * PALETTE_SWATCH_OF_SLOT
  const check = swatch * PALETTE_CHECK_SCALE
  const gridLeft = popupW * PALETTE_GRID.left
  const gridTop = popupH * PALETTE_GRID.top
  const popupTop = height * PALETTE_POPUP_TOP_FRAC
  return (
    <View
      style={{
        position: 'absolute',
        top: popupTop,
        right,
        width: popupW,
        height: popupH,
        display: open ? 'flex' : 'none',
      }}
    >
      <Image source={UI.popupPalette} style={styles.layer} resizeMode="stretch" />
      {COLORS.map((swatchColor, index) => {
        const column = Math.floor(index / PALETTE_ROWS)
        const row = index % PALETTE_ROWS
        return (
          <Pressable
            key={index}
            accessibilityLabel={`Color ${index + 1}`}
            onPress={() => {
              sound.playEffect('click-color')
              onColor(swatchColor)
              if (tool === 'eraser') onTool(previous)
              onClose()
            }}
            style={{
              position: 'absolute',
              left: gridLeft + column * slotW + (slotW - swatch) / 2,
              top: gridTop + row * slotH + (slotH - swatch) / 2,
              width: swatch,
              height: swatch,
            }}
          >
            <Image source={UI.colorSwatch} style={styles.layer} tintColor={swatchColor} />
            {color === swatchColor && (
              <Image
                source={UI.check}
                style={{
                  position: 'absolute',
                  left: (swatch - check) / 2,
                  top: (swatch - check) / 2,
                  width: check,
                  height: check,
                }}
                resizeMode="contain"
              />
            )}
          </Pressable>
        )
      })}
    </View>
  )
})

type Props = {
  tool: ToolType; color: string; hasActions: boolean; saving: boolean; clearArmed: boolean
  popup: 'tools' | 'palette' | null; setPopup: (value: 'tools' | 'palette' | null) => void
  onTool: (tool: ToolType) => void; onColor: (color: string) => void
  onSave: () => void; onUndo: () => void; onClear: () => void
}

const toolParts = {
  marker: [UI.marker, UI.markerMain, UI.markerTop],
  pencil: [UI.pencil, UI.pencilMain, UI.pencilTop],
  fill: [UI.fill, UI.fillMain, UI.fillTop],
} as const

export function DrawingShelf({ tool, color, hasActions, saving, clearArmed, popup, setPopup, onTool, onColor, onSave, onUndo, onClear }: Props) {
  const { height } = useWindowDimensions()
  const [previous, setPrevious] = useState<Exclude<ToolType, 'eraser'>>('marker')
  const closePopup = useCallback(() => setPopup(null), [setPopup])
  // All geometry derives from screen height; memoize so a re-render (popup open/close,
  // tool/color change) does not recompute the whole column layout.
  const { width, shelfWidth, round, topButton, shadowOverflow, doneTop, toolsTop, colorsTop, eraserTop, actionsTop } = useMemo(() => {
    const width = height * 0.2464
    const shelfWidth = width + SHELF_LEFT_PADDING + SHELF_RIGHT_PADDING
    const round = width * 0.7854
    const topButton = width * 0.435
    const shadowOverflow = round * ROUND_SHADOW_OVERFLOW_FRAC
    const verticalPadding = height * SHELF_VERTICAL_PADDING_FRAC
    const stackGap = Math.max(0, (height - verticalPadding * 2 - topButton * 2 - round * 3) / 4)
    const doneTop = verticalPadding
    const toolsTop = doneTop + topButton + stackGap
    const colorsTop = toolsTop + round + stackGap
    const eraserTop = colorsTop + round + stackGap
    const actionsTop = eraserTop + round + stackGap
    return { width, shelfWidth, round, topButton, shadowOverflow, doneTop, toolsTop, colorsTop, eraserTop, actionsTop }
  }, [height])
  const press = (fn: () => void) => { sound.playEffect('click'); fn() }
  const roundButton = (label: string, top: number, icon: number | null, active: boolean, action: () => void) => (
    <Pressable accessibilityRole="button" accessibilityLabel={label} onPress={() => press(action)} style={{ position: 'absolute', left: width * 0.1146, top, width: round, height: round }}>
      <Image source={UI.shadow} style={[styles.layer, { left: -shadowOverflow, top: -shadowOverflow, width: round + shadowOverflow * 2, height: round + shadowOverflow * 2 }]} resizeMode="stretch" />
      <Image source={UI.button} style={styles.layer} />
      {icon ? <Image source={icon} style={styles.layer} /> : <Image source={UI.colorButton} style={[styles.layer, { tintColor: color }]} />}
      <Image source={active ? UI.pressed : UI.shine} style={styles.layer} />
      <Image source={UI.stroke} style={styles.layer} />
    </Pressable>
  )
  return (
    <>
      <View style={{ width: shelfWidth }} />
      <View pointerEvents="box-none" style={{ position: 'absolute', top: 0, bottom: 0, left: 0, right: 0 }}>
    {/* Shelf art reaches the screen edge so the left border runs full height and the width
        is exactly 0.2464 of height. Buttons are positioned in pixels from screen height
        (app is landscape-locked) rather than from the safe-area-adjusted region, so the
        top and bottom padding are truly equal. */}
    <View style={{ position: 'absolute', right: 0, top: 0, bottom: 0, width: shelfWidth }}>
      <Image source={UI.shelf} resizeMode="stretch" style={styles.fill} />
      <View style={{ position: 'absolute', left: SHELF_LEFT_PADDING, right: SHELF_RIGHT_PADDING, top: 0, bottom: 0 }}>
      <Pressable accessibilityLabel="Done" onPress={() => { setPopup(null); onSave() }} disabled={saving} style={{ position: 'absolute', top: doneTop, left: (width - topButton) / 2, width: topButton, height: topButton }}><Image source={UI.ok} style={styles.image} /></Pressable>
      {roundButton('Tools', toolsTop, UI.tool, popup === 'tools', () => { if (tool === 'eraser') onTool(previous); setPopup(popup === 'tools' ? null : 'tools') })}
      {roundButton('Colors', colorsTop, null, popup === 'palette', () => { if (tool === 'eraser') onTool(previous); setPopup(popup === 'palette' ? null : 'palette') })}
      {roundButton('Eraser', eraserTop, UI.eraser, tool === 'eraser', () => { if (tool === 'eraser') onTool(previous); else { setPrevious(tool); onTool('eraser') }; setPopup(null) })}
      <View style={{ position: 'absolute', top: actionsTop, left: width * .038, width: width * .939, flexDirection: 'row', justifyContent: 'space-between' }}>
        <Pressable accessibilityLabel="Undo" disabled={!hasActions} onPress={() => { setPopup(null); press(onUndo) }} style={{ width: topButton, height: topButton, opacity: hasActions ? 1 : .48 }}><Image source={UI.undo} style={styles.image} /></Pressable>
        <Pressable accessibilityLabel={clearArmed ? 'Tap again to clear' : 'Clear'} disabled={!hasActions} onPress={() => { setPopup(null); onClear() }} style={{ width: topButton, height: topButton, opacity: hasActions ? (clearArmed ? .65 : 1) : .48 }}><Image source={UI.delete} style={styles.image} /></Pressable>
      </View>
      </View>
    </View>
      {popup === 'tools' && (() => {
        const scale = height / UNITY_CANVAS_HEIGHT
        const popupToolsW = TOOLS_PANEL_WIDTH_UNITS * scale
        const popupToolsH = TOOLS_PANEL_HEIGHT_UNITS * scale
        const popupToolsTop = height * TOOLS_POPUP_TOP_FRAC
        return (
          <View style={{ position: 'absolute', top: popupToolsTop, right: shelfWidth, width: popupToolsW, height: popupToolsH }}>
            <Image source={UI.popupTools} resizeMode="stretch" style={styles.fill} />
            {TOOL_ROWS.map((row) => {
              const widthPx = row.width * scale
              const heightPx = row.height * scale
              return (
                <Pressable key={row.name} accessibilityLabel={row.name}
                  onPress={() => press(() => { setPrevious(row.name); onTool(row.name); setPopup(null) })}
                  style={{
                    position: 'absolute',
                    left: popupToolsW / 2 + TOOLS_PANEL_RIGHT_EDGE_UNITS * scale - widthPx,
                    top: row.center * scale - heightPx / 2,
                    width: widthPx,
                    height: heightPx,
                    // The image uses styles.layer (100%) instead of absoluteFill: with only
                    // an inset, Image draws at the PNG's intrinsic size (216x128 pt) and
                    // overflows the slot, overlapping the panel/shelf.
                    overflow: 'hidden',
                  }}>
                  {toolParts[row.name].map((part, index) => (
                    <Image key={index} source={part} resizeMode="contain"
                      style={[styles.layer, index === 1 && { tintColor: color }]} />
                  ))}
                </Pressable>
              )
            })}
            {/* Divider drawn after the icon to cover its right edge, like the APK viewport mask. */}
            <Image source={UI.popupDivider} resizeMode="stretch"
              style={{
                position: 'absolute',
                left: TOOLS_DIVIDER.left * scale,
                top: TOOLS_DIVIDER.top * scale,
                width: TOOLS_DIVIDER.width * scale,
                height: TOOLS_DIVIDER.height * scale,
              }} />
          </View>
        )
      })()}
      <PalettePopup open={popup === 'palette'} width={width} right={shelfWidth} color={color} tool={tool} previous={previous} onColor={onColor} onTool={onTool} onClose={closePopup} />
      </View>
    </>
  )
}

const styles = StyleSheet.create({
  image: { width: '100%', height: '100%', resizeMode: 'contain' },
  fill: { position: 'absolute', left: 0, top: 0, width: '100%', height: '100%' },
  layer: { position: 'absolute', width: '100%', height: '100%', resizeMode: 'contain' },
})
