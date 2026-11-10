import { useCallback, useEffect, useRef, useState } from 'react'
import type { CSSProperties, PointerEvent as ReactPointerEvent } from 'react'
import { openDB } from 'idb'
import { sound } from './audio'
import type { Action, SavedPictureData, StrokeAction } from './types'

const ART_SIZE = 775
const COLORS = [
  '#d33e33', '#9dea2e', '#45dbff', '#904721', '#075f29', '#1e2e71',
  '#998e2a', '#6f2877', '#421f72', '#937e70', '#e8dbe0', '#424242',
  '#3f2b26', '#4e0303', '#000000',
]
const UI = '/game-assets/ui/sprites'
const TOOL_ICONS: Record<string, string> = {
  marker: 'marker', pencil: 'pencil', brush: 'brush', fill: 'fill', spray: 'spray',
}

type RegionMeta = {
  regionId: number
  frameIndex: number
  frame: string
  bounds: [number, number, number, number]
  mask: string
}

type PictureMeta = {
  id: string
  logicalSize: [number, number]
  outline: string
  regions: RegionMeta[]
}

type Region = RegionMeta & {
  image: HTMLImageElement
  hitCanvas: HTMLCanvasElement
  maskSurface: HTMLCanvasElement
}

type Tool = 'marker' | 'fill' | 'eraser'
type ActiveStroke = StrokeAction & { pointerId: number }

type StarParticle = {
  x: number
  y: number
  size: number
  initialSize: number
  opacity: number
  rotation: number
  vRot: number
  vx: number
  vy: number
  life: number
  maxLife: number
}

function NativeToolIcon({ name, color }: { name: string; color: string }) {
  const base = `${UI}/main_shelf/tools/${TOOL_ICONS[name]}/icon_${TOOL_ICONS[name]}`
  return (
    <span className="native-tool-icon" style={{ '--tool-color': color } as CSSProperties} aria-hidden="true">
      <span className="tool-part tool-part-bottom" style={{ maskImage: `url("${base}_bottom.png")` }} />
      <span className="tool-part tool-part-main" style={{ maskImage: `url("${base}_main.png")` }} />
      <span className="tool-part tool-part-top" style={{ maskImage: `url("${base}_top.png")` }} />
      <span className="tool-part tool-part-outline" style={{ maskImage: `url("${base}_outline.png")` }} />
    </span>
  )
}

const dbPromise = openDB('drawing-rebuild-poc', 1, {
  upgrade(db) {
    if (!db.objectStoreNames.contains('pictures')) {
      db.createObjectStore('pictures')
    }
  },
})

function loadImage(url: string) {
  return new Promise<HTMLImageElement>((resolve, reject) => {
    const image = new Image()
    image.onload = () => resolve(image)
    image.onerror = () => reject(new Error(`Failed to load asset: ${url}`))
    image.src = url
  })
}

async function loadPicture(pack: number, pictureNumber: number) {
  const effectivePack = pack > 8 ? ((pack - 1) % 8) + 1 : pack
  const pictureUrl = `/art/pack${effectivePack}/${pictureNumber}`
  const response = await fetch(`${pictureUrl}/picture.json`)
  if (!response.ok) throw new Error('Failed to load picture data.')
  const metadata = (await response.json()) as PictureMeta
  const [outline, ...regions] = await Promise.all([
    loadImage(`${pictureUrl}/outline.png`),
    ...metadata.regions.map(async (region) => {
      const image = await loadImage(`${pictureUrl}/${region.mask}`)
      const hitCanvas = document.createElement('canvas')
      hitCanvas.width = image.naturalWidth
      hitCanvas.height = image.naturalHeight
      hitCanvas.getContext('2d', { willReadFrequently: true })!.drawImage(image, 0, 0)
      const maskSurface = document.createElement('canvas')
      maskSurface.width = ART_SIZE
      maskSurface.height = ART_SIZE
      const [left, top, width, height] = region.bounds
      maskSurface.getContext('2d')!.drawImage(image, left, top, width, height)
      return { ...region, image, hitCanvas, maskSurface } satisfies Region
    }),
  ])
  return { metadata, outline, regions }
}

function getCanvasPoint(canvas: HTMLCanvasElement, clientX: number, clientY: number) {
  const rect = canvas.getBoundingClientRect()
  const scale = Math.min(rect.width / ART_SIZE, rect.height / ART_SIZE)
  const left = rect.left + (rect.width - ART_SIZE * scale) / 2
  const top = rect.top + (rect.height - ART_SIZE * scale) / 2
  return [(clientX - left) / scale, (clientY - top) / scale] as const
}

function hitRegion(regions: Region[], x: number, y: number) {
  for (const region of regions) {
    const [left, top, width, height] = region.bounds
    const px = Math.floor(x - left)
    const py = Math.floor(y - top)
    if (px < 0 || py < 0 || px >= width || py >= height) continue
    const alpha = region.hitCanvas.getContext('2d', { willReadFrequently: true })!
      .getImageData(px, py, 1, 1).data[3]
    if (alpha !== 0) return region.regionId
  }
  return null
}

function fitRect(width: number, height: number) {
  const scale = Math.min(width / ART_SIZE, height / ART_SIZE)
  return {
    scale,
    x: (width - ART_SIZE * scale) / 2,
    y: (height - ART_SIZE * scale) / 2,
  }
}

function drawTintedRegion(
  context: CanvasRenderingContext2D,
  region: Region,
  color: string,
  scale: number,
  x: number,
  y: number,
) {
  const tint = document.createElement('canvas')
  tint.width = region.image.naturalWidth
  tint.height = region.image.naturalHeight
  const tintContext = tint.getContext('2d')!
  tintContext.drawImage(region.image, 0, 0)
  tintContext.globalCompositeOperation = 'source-in'
  tintContext.fillStyle = color
  tintContext.fillRect(0, 0, tint.width, tint.height)
  const [left, top, width, height] = region.bounds
  context.drawImage(tint, x + left * scale, y + top * scale, width * scale, height * scale)
}

interface DrawSceneProps {
  pack: number
  pictureNumber: number
  onBack: () => void
}

export default function DrawScene({ pack, pictureNumber, onBack }: DrawSceneProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const stageRef = useRef<HTMLDivElement>(null)
  const pictureRef = useRef<Awaited<ReturnType<typeof loadPicture>> | null>(null)
  const starImgRef = useRef<HTMLImageElement | null>(null)
  const particlesRef = useRef<StarParticle[]>([])
  const animFrameRef = useRef<number | null>(null)

  const [ready, setReady] = useState(false)
  const [problem, setProblem] = useState('')
  const [tool, setTool] = useState<Tool>('marker')
  const [color, setColor] = useState(COLORS[0])
  const [showToolPicker, setShowToolPicker] = useState(false)
  const [showPalette, setShowPalette] = useState(false)
  const [actions, setActions] = useState<Action[]>([])
  const [draft, setDraft] = useState<ActiveStroke | null>(null)
  const [message, setMessage] = useState('')
  const messageTimer = useRef<number | undefined>(undefined)

  const pictureKey = `${pack}-${pictureNumber}`

  useEffect(() => {
    sound.playBgm('bg_game')
    const img = new Image()
    img.src = '/game-assets/drawing/particle-star.png'
    starImgRef.current = img
  }, [])

  useEffect(() => {
    let active = true
    async function prepare() {
      try {
        setReady(false)
        const picture = await loadPicture(pack, pictureNumber)
        if (!active) return
        pictureRef.current = picture
        const db = await dbPromise
        const saved = (await db.get('pictures', pictureKey)) as SavedPictureData | Action[] | undefined
        if (saved) {
          if (Array.isArray(saved)) {
            setActions(saved)
          } else if (saved.actions) {
            setActions(saved.actions)
          }
        } else {
          setActions([])
        }
        setReady(true)
      } catch (error) {
        setProblem(error instanceof Error ? error.message : 'Unable to open picture.')
      }
    }
    void prepare()
    return () => {
      active = false
    }
  }, [pack, pictureNumber, pictureKey])

  const render = useCallback(() => {
    const canvas = canvasRef.current
    const stage = stageRef.current
    const picture = pictureRef.current
    if (!canvas || !stage || !picture || !ready) return
    const rect = canvas.getBoundingClientRect()
    const dpr = window.devicePixelRatio || 1
    canvas.width = Math.max(1, Math.round(rect.width * dpr))
    canvas.height = Math.max(1, Math.round(rect.height * dpr))
    const ctx = canvas.getContext('2d')!
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0)
    ctx.clearRect(0, 0, rect.width, rect.height)
    ctx.fillStyle = '#fff'
    ctx.fillRect(0, 0, rect.width, rect.height)
    const fit = fitRect(rect.width, rect.height)

    // Base fill layer
    for (const action of actions) {
      if (action.type !== 'fill') continue
      const region = picture.regions.find((item) => item.regionId === action.regionId)
      if (region) drawTintedRegion(ctx, region, action.color, fit.scale, fit.x, fit.y)
    }

    // Clip strokes to starting region
    const allStrokes = draft ? [...actions, draft] : actions
    for (const action of allStrokes) {
      if (action.type !== 'stroke' && action.type !== 'erase') continue
      const region = picture.regions.find((item) => item.regionId === action.regionId)
      if (!region || action.points.length === 0) continue
      const buffer = document.createElement('canvas')
      buffer.width = ART_SIZE
      buffer.height = ART_SIZE
      const bctx = buffer.getContext('2d')!
      bctx.lineCap = 'round'
      bctx.lineJoin = 'round'
      bctx.lineWidth = action.type === 'erase' ? 36 : 28
      bctx.strokeStyle = action.type === 'erase' ? '#ffffff' : action.color
      bctx.beginPath()
      const [firstX, firstY] = action.points[0]
      bctx.moveTo(firstX, firstY)
      for (let i = 1; i < action.points.length; i++) {
        const [x, y] = action.points[i]
        bctx.lineTo(x, y)
      }
      bctx.stroke()
      bctx.globalCompositeOperation = 'destination-in'
      bctx.drawImage(region.maskSurface, 0, 0)

      ctx.save()
      ctx.drawImage(buffer, fit.x, fit.y, ART_SIZE * fit.scale, ART_SIZE * fit.scale)
      ctx.restore()
    }

    // Outline on top
    ctx.drawImage(picture.outline, fit.x, fit.y, ART_SIZE * fit.scale, ART_SIZE * fit.scale)

    // Star particles overlay
    const starImg = starImgRef.current
    if (starImg && starImg.complete && particlesRef.current.length > 0) {
      for (const p of particlesRef.current) {
        if (p.opacity <= 0 || p.size <= 0) continue
        ctx.save()
        ctx.globalAlpha = p.opacity
        ctx.translate(fit.x + p.x * fit.scale, fit.y + p.y * fit.scale)
        ctx.rotate(p.rotation)
        const sz = p.size * fit.scale
        ctx.drawImage(starImg, -sz / 2, -sz / 2, sz, sz)
        ctx.restore()
      }
    }
  }, [actions, draft, ready])

  useEffect(() => {
    render()
  }, [render])

  useEffect(() => {
    const handleResize = () => render()
    window.addEventListener('resize', handleResize)
    return () => window.removeEventListener('resize', handleResize)
  }, [render])

  // Star particle animation loop with native burst physics
  useEffect(() => {
    const updateParticles = () => {
      if (particlesRef.current.length > 0) {
        particlesRef.current = particlesRef.current
          .map((p) => {
            const life = p.life + 1
            const progress = life / p.maxLife
            return {
              ...p,
              x: p.x + p.vx,
              y: p.y + p.vy,
              vx: p.vx * 0.94,
              vy: p.vy * 0.94 + 0.15,
              opacity: Math.max(0, 1 - progress * progress),
              size: p.initialSize * Math.max(0, 1 - progress * 0.35),
              rotation: p.rotation + p.vRot,
              life,
            }
          })
          .filter((p) => p.life < p.maxLife && p.opacity > 0)
        render()
      }
      animFrameRef.current = requestAnimationFrame(updateParticles)
    }
    animFrameRef.current = requestAnimationFrame(updateParticles)
    return () => {
      if (animFrameRef.current) cancelAnimationFrame(animFrameRef.current)
    }
  }, [render])

  const spawnStarBurst = (x: number, y: number, count = 14) => {
    sound.playEffect('star')
    const newParticles: StarParticle[] = []
    for (let i = 0; i < count; i++) {
      const angle = (Math.PI * 2 * i) / count + (Math.random() - 0.5) * 0.4
      const speed = Math.random() * 4 + 3.5
      const size = Math.random() * 16 + 24
      const maxLife = Math.floor(Math.random() * 10 + 22)
      newParticles.push({
        x: x + (Math.random() - 0.5) * 8,
        y: y + (Math.random() - 0.5) * 8,
        size,
        initialSize: size,
        opacity: 1,
        rotation: Math.random() * Math.PI * 2,
        vRot: (Math.random() - 0.5) * 0.25,
        vx: Math.cos(angle) * speed,
        vy: Math.sin(angle) * speed - 1.5,
        life: 0,
        maxLife,
      })
    }
    particlesRef.current.push(...newParticles)
  }

  const notify = (text: string) => {
    window.clearTimeout(messageTimer.current)
    setMessage(text)
    messageTimer.current = window.setTimeout(() => setMessage(''), 1800)
  }

  const handlePointerDown = (event: ReactPointerEvent<HTMLCanvasElement>) => {
    const canvas = canvasRef.current
    const picture = pictureRef.current
    if (!canvas || !picture) return
    const [x, y] = getCanvasPoint(canvas, event.clientX, event.clientY)
    const targetRegion = hitRegion(picture.regions, x, y)
    if (targetRegion === null) return

    if (tool === 'fill') {
      sound.playEffect('fill')
      spawnStarBurst(x, y, 16)
      setActions((prev) => [...prev, { type: 'fill', regionId: targetRegion, color }])
      return
    }

    sound.playEffect(tool === 'eraser' ? 'draw-erase' : 'star')
    try {
      event.currentTarget.setPointerCapture(event.pointerId)
    } catch {
      // In synthetic tests or unsupported pointers
    }
    setDraft({
      type: tool === 'eraser' ? 'erase' : 'stroke',
      regionId: targetRegion,
      color,
      points: [[x, y]],
      pointerId: event.pointerId,
    })
  }

  const handlePointerMove = (event: ReactPointerEvent<HTMLCanvasElement>) => {
    if (!draft || draft.pointerId !== event.pointerId) return
    const canvas = canvasRef.current
    if (!canvas) return
    const [x, y] = getCanvasPoint(canvas, event.clientX, event.clientY)
    setDraft((prev) => (prev ? { ...prev, points: [...prev.points, [x, y]] } : null))

    if (draft.type === 'stroke' && Math.random() < 0.28) {
      const size = Math.random() * 10 + 16
      particlesRef.current.push({
        x: x + (Math.random() - 0.5) * 8,
        y: y + (Math.random() - 0.5) * 8,
        size,
        initialSize: size,
        opacity: 1,
        rotation: Math.random() * Math.PI * 2,
        vRot: (Math.random() - 0.5) * 0.2,
        vx: (Math.random() - 0.5) * 1.5,
        vy: (Math.random() - 0.5) * 1.5 - 0.5,
        life: 0,
        maxLife: 16,
      })
    }
  }

  const handlePointerUp = (event: ReactPointerEvent<HTMLCanvasElement>) => {
    if (!draft || draft.pointerId !== event.pointerId) return
    try {
      if (event.currentTarget.hasPointerCapture(event.pointerId)) {
        event.currentTarget.releasePointerCapture(event.pointerId)
      }
    } catch {}
    const finalStroke: StrokeAction = {
      type: draft.type,
      regionId: draft.regionId,
      color: draft.color,
      points: draft.points,
    }
    // Star burst on lifting finger after finishing stroke
    if (draft.type === 'stroke' && draft.points.length > 0) {
      const [lastX, lastY] = draft.points[draft.points.length - 1]
      spawnStarBurst(lastX, lastY, 14)
    }
    setDraft(null)
    setActions((prev) => [...prev, finalStroke])
  }

  const handlePointerCancel = (event: ReactPointerEvent<HTMLCanvasElement>) => {
    if (draft && draft.pointerId === event.pointerId) {
      try {
        if (event.currentTarget.hasPointerCapture(event.pointerId)) {
          event.currentTarget.releasePointerCapture(event.pointerId)
        }
      } catch {}
      setDraft(null)
    }
  }

  const handleUndo = () => {
    sound.playEffect('click')
    setActions((prev) => prev.slice(0, -1))
  }

  const handleSaveAndExit = async () => {
    sound.playEffect('click')
    try {
      const canvas = canvasRef.current
      let thumbnail: string | undefined = undefined
      if (canvas) {
        const rect = canvas.getBoundingClientRect()
        const dpr = window.devicePixelRatio || 1
        const fit = fitRect(rect.width, rect.height)
        const renderSize = ART_SIZE * fit.scale * dpr
        const thumbCanvas = document.createElement('canvas')
        thumbCanvas.width = 264
        thumbCanvas.height = 264
        const tctx = thumbCanvas.getContext('2d')!
        tctx.fillStyle = '#fff'
        tctx.fillRect(0, 0, 264, 264)
        tctx.drawImage(
          canvas,
          fit.x * dpr,
          fit.y * dpr,
          renderSize,
          renderSize,
          0,
          0,
          264,
          264
        )
        thumbnail = thumbCanvas.toDataURL('image/png')
      }
      const db = await dbPromise
      const dataToSave: SavedPictureData = {
        actions,
        thumbnail,
        updatedAt: Date.now(),
      }
      await db.put('pictures', dataToSave, pictureKey)
      notify('Drawing saved!')
      setTimeout(() => onBack(), 350)
    } catch {
      notify('Unable to save drawing.')
    }
  }

  const handleScreenshot = () => {
    sound.playEffect('screenshot')
    const canvas = canvasRef.current
    if (!canvas) return
    const rect = canvas.getBoundingClientRect()
    const dpr = window.devicePixelRatio || 1
    const fit = fitRect(rect.width, rect.height)
    const renderSize = ART_SIZE * fit.scale * dpr
    const exportCanvas = document.createElement('canvas')
    exportCanvas.width = 775
    exportCanvas.height = 775
    const ectx = exportCanvas.getContext('2d')!
    ectx.fillStyle = '#fff'
    ectx.fillRect(0, 0, 775, 775)
    ectx.drawImage(
      canvas,
      fit.x * dpr,
      fit.y * dpr,
      renderSize,
      renderSize,
      0,
      0,
      775,
      775
    )
    const link = document.createElement('a')
    link.download = `drawing-${pack}-${pictureNumber}.png`
    link.href = exportCanvas.toDataURL('image/png')
    link.click()
    notify('Screenshot saved!')
  }

  const handleReset = () => {
    sound.playEffect('draw-erase')
    setActions([])
    notify('Canvas cleared!')
  }

  return (
    <main className="workspace" aria-label="Drawing screen">
      {problem && <div className="error-state" role="alert">{problem}</div>}

      <header className="drawing-top-bar">
        <button
          type="button"
          className="drawing-back-button"
          onClick={() => {
            sound.playEffect('click')
            onBack()
          }}
          aria-label="Back to gallery"
        >
          <img
            src="/game-assets/ui/gallery-back-button.png"
            alt=""
            width="113"
            height="69"
          />
        </button>
        <span className="drawing-title-indicator">
          Pack {pack} • Picture {pictureNumber}
        </span>
      </header>

      <section className="picture-stage" ref={stageRef}>
        <canvas
          ref={canvasRef}
          className="drawing-canvas"
          onPointerDown={handlePointerDown}
          onPointerMove={handlePointerMove}
          onPointerUp={handlePointerUp}
          onPointerCancel={handlePointerCancel}
          aria-label="Drawing canvas"
        />
      </section>

      <aside className="native-shelf" aria-label="Main shelf">
        <div className="shelf-top-buttons">
          <button
            type="button"
            onClick={handleScreenshot}
            aria-label="Save screenshot"
            title="Screenshot"
          >
            <img
              src={`${UI}/main_shelf/buttons small/btn_screenshot.png`}
              alt=""
              width="84"
              height="81"
            />
          </button>
          <button
            type="button"
            onClick={handleSaveAndExit}
            aria-label="Save and exit"
            title="Done"
          >
            <img
              src={`${UI}/main_shelf/buttons small/btn_ok.png`}
              alt=""
              width="84"
              height="81"
            />
          </button>
        </div>

        <button
          type="button"
          className="shelf-tool-button"
          aria-label="Select tool"
          aria-expanded={showToolPicker}
          onClick={() => {
            sound.playEffect('click')
            setShowToolPicker((prev) => !prev)
            setShowPalette(false)
          }}
        >
          <img
            className="shelf-round-button"
            src={`${UI}/main_shelf/buttons big/button_tools.png`}
            alt=""
            width="168"
            height="168"
          />
          <NativeToolIcon name={tool === 'eraser' ? 'marker' : tool} color={color} />
        </button>

        <button
          type="button"
          className={`shelf-color-button ${tool === 'eraser' ? 'disabled' : ''}`}
          aria-label="Select color"
          aria-expanded={showPalette}
          onClick={() => {
            sound.playEffect('click')
            setShowPalette((prev) => !prev)
            setShowToolPicker(false)
          }}
        >
          <img
            className="palette-round-base"
            src={`${UI}/main_shelf/buttons big/button_palette_default.png`}
            alt=""
            width="168"
            height="168"
          />
          <span className="palette-round-fill" style={{ backgroundColor: color }} />
          <img
            className="palette-round-outline"
            src={`${UI}/main_shelf/buttons big/button_palette_outline.png`}
            alt=""
            width="168"
            height="168"
          />
        </button>

        <button
          type="button"
          className={`shelf-eraser-button ${tool === 'eraser' ? 'active' : ''}`}
          aria-label="Eraser"
          aria-pressed={tool === 'eraser'}
          onClick={() => {
            sound.playEffect('click')
            setTool((prev) => (prev === 'eraser' ? 'marker' : 'eraser'))
            setShowPalette(false)
            setShowToolPicker(false)
          }}
        >
          <img
            className="shelf-round-button"
            src={`${UI}/main_shelf/buttons big/${tool === 'eraser' ? 'button_erase_pressed' : 'button_erase'}.png`}
            alt=""
            width="168"
            height="168"
          />
        </button>

        <div className="shelf-bottom-buttons">
          <button
            type="button"
            onClick={handleUndo}
            disabled={actions.length === 0}
            aria-label="Undo last action"
            title="Undo"
          >
            <img
              src={`${UI}/main_shelf/buttons small/btn_undo.png`}
              alt=""
              width="84"
              height="81"
            />
          </button>

          <button
            type="button"
            onClick={handleReset}
            disabled={actions.length === 0}
            aria-label="Clear canvas"
            title="Clear"
          >
            <img
              src={`${UI}/main_shelf/buttons small/btn_delete.png`}
              alt=""
              width="84"
              height="81"
            />
          </button>
        </div>

        {showToolPicker && (
          <div className="native-tool-picker" aria-label="Tools">
            <button
              type="button"
              onClick={() => {
                sound.playEffect('click')
                setTool('marker')
                setShowToolPicker(false)
              }}
              aria-label="Marker"
            >
              <NativeToolIcon name="marker" color={color} />
            </button>
            <button
              type="button"
              onClick={() => {
                sound.playEffect('click')
                setTool('fill')
                setShowToolPicker(false)
              }}
              aria-label="Fill"
            >
              <NativeToolIcon name="fill" color={color} />
            </button>
            <button type="button" disabled aria-label="Pencil">
              <NativeToolIcon name="pencil" color={color} />
            </button>
            <button type="button" disabled aria-label="Brush">
              <NativeToolIcon name="brush" color={color} />
            </button>
            <button type="button" disabled aria-label="Spray">
              <NativeToolIcon name="spray" color={color} />
            </button>
            <button type="button" disabled aria-label="Glitter">
              <img src={`${UI}/main_shelf/tools/shine/icon_shine1.png`} alt="" width="58" height="58" />
            </button>
            <button type="button" disabled aria-label="Pattern">
              <img src={`${UI}/main_shelf/tools/pattern/icon_pattern1.png`} alt="" width="58" height="58" />
            </button>
          </div>
        )}

        {showPalette && (
          <div className="native-palette-picker" aria-label="Color palette">
            <div className="native-color-grid">
              {COLORS.map((swatch, index) => (
                <button
                  key={swatch}
                  type="button"
                  className={`native-color ${index >= 3 ? 'locked' : ''}`}
                  style={{ backgroundColor: swatch }}
                  aria-label={`Color ${index + 1}`}
                  aria-pressed={color === swatch}
                  onClick={() => {
                    if (index >= 3) return
                    sound.playEffect('click-color')
                    setColor(swatch)
                    setShowPalette(false)
                  }}
                >
                  {color === swatch && (
                    <img
                      className="native-color-check"
                      src={`${UI}/popup_palette/palette_checked.png`}
                      alt=""
                      width="38"
                      height="38"
                    />
                  )}
                </button>
              ))}
            </div>
            <div className="native-locked-grid-mask" aria-hidden="true">
              <img src="/game-assets/ui/mm_lock.png" alt="" width="48" height="48" />
            </div>
          </div>
        )}
      </aside>

      <div className={`toast ${message ? 'visible' : ''}`} role="status">
        {message}
      </div>
    </main>
  )
}
