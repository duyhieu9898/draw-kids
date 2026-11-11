import { useEffect, useRef } from 'react'
import { sound } from './audio'

interface MainMenuProps {
  onSelectPack: (packId: number) => void
  onReplayIntro?: () => void
}

export default function MainMenu({ onSelectPack, onReplayIntro }: MainMenuProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const bgRef = useRef<HTMLDivElement>(null)
  const scrollRef = useRef<HTMLDivElement>(null)
  const worldRef = useRef<HTMLDivElement>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const controlsRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    sound.playBgm('bg_menu')
  }, [])

  useEffect(() => {
    const container = containerRef.current
    const bgLayer = bgRef.current
    const scrollEl = scrollRef.current
    const worldEl = worldRef.current
    const canvas = canvasRef.current
    const controlsLayer = controlsRef.current

    if (!container || !bgLayer || !scrollEl || !worldEl || !canvas || !controlsLayer) {
      return
    }

    let isDisposed = false
    let animationFrameId: number

    ;(async () => {
      try {
        const spec = await fetch('/v3.141/menu/menu.json').then((r) => {
          if (!r.ok) throw new Error(`HTTP error ${r.status}`)
          return r.json()
        })

        if (isDisposed) return

        const spine = window.spine
        if (!spine?.webgl) {
          console.warn('Spine WebGL 3.8 not available')
          return
        }

        const ctx = new spine.webgl.ManagedWebGLRenderingContext(canvas)
        const renderer = new spine.webgl.SceneRenderer(canvas, ctx)
        const assets = new spine.webgl.AssetManager(ctx)
        const slots: Array<{
          element: HTMLElement
          component: any
          pivot: { x: number; y: number }
          pack?: any
          skeleton?: any
          state?: any
        }> = []

        let factor = window.innerHeight / 1080

        function createNode(n: any, parentSize: [number, number], parent: HTMLElement) {
          if (!n.active || !n.transform.m_AnchorMin) return

          const t = n.transform
          const min = t.m_AnchorMin
          const max = t.m_AnchorMax
          const p = t.m_Pivot
          const size = t.m_SizeDelta
          const pos = t.m_AnchoredPosition
          const s = t.m_LocalScale

          const w = parentSize[0] * (max.x - min.x) + size.x
          const h = parentSize[1] * (max.y - min.y) + size.y
          const ax = parentSize[0] * (min.x + (max.x - min.x) * p.x) + pos.x
          const ay = parentSize[1] * (min.y + (max.y - min.y) * p.y) + pos.y

          const el = document.createElement('div')
          el.className = 'unity-node'
          el.dataset.node = String(n.id)
          Object.assign(el.style, {
            width: `${w}px`,
            height: `${h}px`,
            left: `${ax - w * p.x * s.x}px`,
            top: `${parentSize[1] - ay - h * (1 - p.y) * s.y}px`,
            transform: `scale(${s.x}, ${s.y})`,
          })
          parent.append(el)

          for (const c of n.components) {
            if (c.class === 'Image' && c.sprite) {
              const im = document.createElement('img')
              im.src = `/v3.141/menu/${c.sprite.url}`
              im.alt = ''
              im.className = 'unity-sprite'
              im.style.opacity = String(c.color[3])
              el.append(im)
            }
            if (c.class === 'TextMeshProUGUI') {
              el.classList.add('unity-label')
              let text = c.text
              if (text === 'Transportasyon') text = 'Vehicles'
              el.textContent = text
            }
            if (c.class === 'SkeletonGraphic') {
              slots.push({ element: el, component: c, pivot: p })
            }
          }

          for (const child of n.children) {
            createNode(child, [w, h], el)
          }
        }

        const [cw, ch] = spec.grid.cell
        const [sx, sy] = spec.grid.spacing
        const [pl, pr, pt] = spec.grid.padding
        const rows = spec.grid.constraint_count
        const cols = Math.ceil(spec.packs.length / rows)
        const height = 1080
        const width = pl + pr + cols * cw + (cols - 1) * sx

        worldEl.style.width = `${width}px`
        worldEl.style.height = `${height}px`

        for (let i = 0; i < spec.packs.length; i++) {
          const pack = spec.packs[i]
          const button = document.createElement('button')
          button.className = 'unity-pack'
          button.dataset.product = String(pack.product)
          const packLabel = pack.label === 'Transportasyon' ? 'Vehicles' : pack.label
          button.setAttribute('aria-label', packLabel)
          Object.assign(button.style, {
            width: `${cw}px`,
            height: `${ch}px`,
            left: `${pl + Math.floor(i / rows) * (cw + sx)}px`,
            top: `${pt + (i % rows) * (ch + sy)}px`,
          })
          worldEl.append(button)

          for (const n of pack.node.children) {
            createNode(n, [cw, ch], button)
          }

          let startTime = 0
          button.addEventListener('pointerenter', () => {
            startTime = performance.now()
            if (pack.player) pack.player.state.setAnimation(0, 'action', false)
          })

          button.addEventListener('click', () => {
            sound.playEffect('click')
            startTime = performance.now()
            if (pack.player) pack.player.state.setAnimation(0, 'action', false)
            window.setTimeout(() => {
              // product is 0..11, map to pack id 1..12
              onSelectPack(pack.product + 1)
            }, 260)
          })

          const player = slots.find(
            (x) =>
              x.component.skeleton_data.name === `${pack.name}_SkeletonData` ||
              x.component.skeleton_data.name === `${pack.name === 'dinosaurs' ? 'dino' : ''}_SkeletonData`
          )
          if (player) {
            player.pack = pack
            assets.loadText(`/v3.141/menu/${pack.spine}skeleton.json`)
            assets.loadTextureAtlas(`/v3.141/menu/${pack.spine}skeleton.atlas`)
          }

          Object.defineProperty(pack, 'time', {
            get() {
              return startTime
                ? Math.min(
                    (performance.now() - startTime) / 1000,
                    pack.player?.skeleton.data.animations.find((a: any) => a.name === 'action')?.duration || 0
                  )
                : pack.static_frame
            },
          })
        }

        function resize() {
          if (!container || !bgLayer || !worldEl || !canvas || !controlsLayer) return
          factor = window.innerHeight / height
          worldEl.style.transform = `scale(${factor})`
          worldEl.style.marginRight = `${width * (factor - 1)}px`
          const dpr = window.devicePixelRatio || 1
          canvas.width = Math.round(window.innerWidth * dpr)
          canvas.height = Math.round(window.innerHeight * dpr)

          // Background
          bgLayer.replaceChildren()
          Object.assign(bgLayer.style, {
            width: `${window.innerWidth / factor}px`,
            height: `${height}px`,
            transform: `scale(${factor})`,
          })
          createNode(spec.background, [window.innerWidth / factor, height], bgLayer)

          // Controls layer (For parents & Unlock all intentionally removed per user directive)
          controlsLayer.replaceChildren()
        }

        resize()
        window.addEventListener('resize', resize)

        let loaded = false

        function frame() {
          if (isDisposed || !canvas) return

          try {
            if (!loaded) {
              if (!assets.isLoadingComplete()) {
                animationFrameId = requestAnimationFrame(frame)
                return
              }
              if (assets.hasErrors()) {
                console.warn('Spine load errors:', assets.getErrors())
              }

              for (const slot of slots) {
                const pack = slot.pack
                if (!pack) continue
                try {
                  const atlasText = assets.get(`/v3.141/menu/${pack.spine}skeleton.atlas`)
                  const jsonText = assets.get(`/v3.141/menu/${pack.spine}skeleton.json`)
                  const loader = new spine.SkeletonJson(new spine.AtlasAttachmentLoader(atlasText))
                  const data = loader.readSkeletonData(JSON.parse(jsonText))
                  slot.skeleton = new spine.Skeleton(data)
                  slot.state = new spine.AnimationState(new spine.AnimationStateData(data))
                  slot.state.setAnimation(0, 'action', false)
                  slot.state.update(pack.static_frame)
                  slot.state.apply(slot.skeleton)
                  pack.player = slot
                } catch (e) {
                  console.warn(`Spine skeleton error for ${pack.name}:`, e)
                }
              }
              loaded = true
            }

            ctx.gl.viewport(0, 0, canvas.width, canvas.height)
            ctx.gl.clearColor(0, 0, 0, 0)
            ctx.gl.clear(ctx.gl.COLOR_BUFFER_BIT)

            renderer.camera.viewportWidth = window.innerWidth / factor
            renderer.camera.viewportHeight = height
            renderer.camera.position.set(window.innerWidth / factor / 2, height / 2, 0)
            renderer.begin()

            for (const slot of slots) {
              if (!slot.skeleton) continue
              const rect = slot.element.getBoundingClientRect()
              if (rect.right < 0 || rect.left > window.innerWidth) continue

              slot.skeleton.x = (rect.left + rect.width * slot.pivot.x) / factor
              slot.skeleton.y = height - (rect.top + rect.height * (1 - slot.pivot.y)) / factor
              slot.state.tracks[0].trackTime = slot.pack.time
              slot.state.apply(slot.skeleton)
              slot.skeleton.updateWorldTransform()
              renderer.drawSkeleton(slot.skeleton, false)
            }

            renderer.end()
          } catch (e) {
            console.warn('Frame render error:', e)
          }

          animationFrameId = requestAnimationFrame(frame)
        }

        animationFrameId = requestAnimationFrame(frame)
      } catch (err) {
        console.error('Failed to load menu spec:', err)
      }
    })()

    return () => {
      isDisposed = true
      cancelAnimationFrame(animationFrameId)
    }
  }, [onSelectPack, onReplayIntro])

  return (
    <div className="native-unity-menu-container" ref={containerRef} aria-label="Main Menu">
      {/* Unity Native Background Layer */}
      <div id="unity-background" ref={bgRef} className="unity-fixed-layer" />

      {/* Unity Native Scroll Layer & 12 Packs */}
      <div id="unity-scroll" ref={scrollRef} aria-label="Category Selection">
        <div id="unity-world" ref={worldRef} />
      </div>

      {/* Unity Native Spine Characters WebGL Canvas */}
      <canvas id="unity-spines" ref={canvasRef} aria-hidden="true" />

      {/* Unity Native Controls Layer */}
      <div id="unity-controls" ref={controlsRef} className="unity-fixed-layer" />
    </div>
  )
}
