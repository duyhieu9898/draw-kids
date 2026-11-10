import { useEffect, useRef, useState } from 'react'
import { PACKS } from './types'
import type { PackInfo } from './types'
import { sound } from './audio'

interface MainMenuProps {
  onSelectPack: (packId: number) => void
  onReplayIntro: () => void
}

interface SpineSlot {
  pack: PackInfo
  element: HTMLElement
  skeleton?: any
  state?: any
  actionStartTime?: number
}

export default function MainMenu({ onSelectPack, onReplayIntro }: MainMenuProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const scrollRef = useRef<HTMLDivElement>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const [activePackId, setActivePackId] = useState<number | null>(null)
  const [spineReady, setSpineReady] = useState(false)

  useEffect(() => {
    sound.playBgm('bg_menu')
  }, [])

  // Setup Spine 3.8 WebGL rendering for the 12 animated pack cards
  useEffect(() => {
    const canvas = canvasRef.current
    const scrollEl = scrollRef.current
    if (!canvas || !scrollEl || typeof window === 'undefined' || !window.spine?.webgl) {
      return
    }

    let animationFrameId: number
    let isDisposed = false

    try {
      const spine = window.spine
      const spineWebgl = spine.webgl
      const ctx = new spineWebgl.ManagedWebGLRenderingContext(canvas)
      const renderer = new spineWebgl.SceneRenderer(canvas, ctx)
      const assetManager = new spineWebgl.AssetManager(ctx)

      // Load all 12 spine skeletons
      for (const pack of PACKS) {
        if (pack.spinePath) {
          assetManager.loadText(`${pack.spinePath}skeleton.json`)
          assetManager.loadTextureAtlas(`${pack.spinePath}skeleton.atlas`)
        }
      }

      const slots: SpineSlot[] = []
      let loaded = false
      const referenceHeight = 1080

      const handlePointer = (pack: PackInfo) => {
        const slot = slots.find((s) => s.pack.id === pack.id)
        if (slot) {
          slot.actionStartTime = performance.now()
          if (slot.state) {
            slot.state.setAnimation(0, 'action', false)
          }
        }
      }

      const render = () => {
        if (isDisposed) return

        try {
          if (!loaded) {
            if (assetManager.isLoadingComplete()) {
              if (!assetManager.hasErrors()) {
                // Initialize skeletons for each pack
                for (const pack of PACKS) {
                  if (!pack.spinePath) continue
                  const el = scrollEl.querySelector(`[data-pack-id="${pack.id}"] .pack-card-spine-anchor`) as HTMLElement
                  if (!el) continue

                  try {
                    const atlasText = assetManager.get(`${pack.spinePath}skeleton.atlas`)
                    const jsonText = assetManager.get(`${pack.spinePath}skeleton.json`)
                    if (atlasText && jsonText) {
                      const loader = new spine.SkeletonJson(new spine.AtlasAttachmentLoader(atlasText))
                      const data = loader.readSkeletonData(JSON.parse(jsonText))
                      const skeleton = new spine.Skeleton(data)
                      const state = new spine.AnimationState(new spine.AnimationStateData(data))
                      state.setAnimation(0, 'action', false)
                      state.update(pack.staticFrame || 2.7)
                      state.apply(skeleton)

                      slots.push({
                        pack,
                        element: el,
                        skeleton,
                        state,
                      })
                    }
                  } catch (e) {
                    console.warn(`Could not init spine for pack ${pack.name}:`, e)
                  }
                }
                loaded = true
                setSpineReady(true)
              }
            }
          }

          if (loaded && slots.length > 0) {
            const dpr = window.devicePixelRatio || 1
            const innerW = window.innerWidth
            const innerH = window.innerHeight
            const targetW = Math.round(innerW * dpr)
            const targetH = Math.round(innerH * dpr)

            if (canvas.width !== targetW || canvas.height !== targetH) {
              canvas.width = targetW
              canvas.height = targetH
            }

            const factor = innerH / referenceHeight
            ctx.gl.viewport(0, 0, canvas.width, canvas.height)
            ctx.gl.clearColor(0, 0, 0, 0)
            ctx.gl.clear(ctx.gl.COLOR_BUFFER_BIT)

            renderer.camera.viewportWidth = innerW / factor
            renderer.camera.viewportHeight = referenceHeight
            renderer.camera.position.set(innerW / factor / 2, referenceHeight / 2, 0)
            renderer.begin()

            for (const slot of slots) {
              if (!slot.skeleton || !slot.state) continue
              const rect = slot.element.getBoundingClientRect()
              // Skip if outside viewport
              if (rect.right < 0 || rect.left > innerW) continue

              slot.skeleton.x = (rect.left + rect.width * 0.5) / factor
              slot.skeleton.y = referenceHeight - (rect.top + rect.height * 0.5) / factor

              // Action duration
              const duration = slot.skeleton.data.animations.find((a: any) => a.name === 'action')?.duration || 2.7
              const elapsed = slot.actionStartTime ? (performance.now() - slot.actionStartTime) / 1000 : 0
              if (slot.actionStartTime && elapsed < duration) {
                slot.state.tracks[0].trackTime = elapsed
              } else {
                slot.state.tracks[0].trackTime = slot.pack.staticFrame || 2.7
              }

              slot.state.apply(slot.skeleton)
              slot.skeleton.updateWorldTransform()
              renderer.drawSkeleton(slot.skeleton, false)
            }

            renderer.end()
          }
        } catch (err) {
          console.warn('Spine render loop warning:', err)
        }

        animationFrameId = requestAnimationFrame(render)
      }

      animationFrameId = requestAnimationFrame(render)

      // Store handler on container for interaction
      const container = containerRef.current as any
      if (container) {
        container.__triggerSpineAction = handlePointer
      }

      return () => {
        isDisposed = true
        cancelAnimationFrame(animationFrameId)
        ctx.dispose?.()
      }
    } catch (e) {
      console.warn('Failed to start Spine 3.8 WebGL in MainMenu:', e)
    }
  }, [])

  const handleCardClick = (pack: PackInfo) => {
    sound.playEffect('click')
    setActivePackId(pack.id)

    // Trigger action animation if spine is running
    const trigger = (containerRef.current as any)?.__triggerSpineAction
    if (trigger) {
      trigger(pack)
    }

    // Small delay so animation and audio give immediate visual feedback
    window.setTimeout(() => {
      onSelectPack(pack.id)
    }, 280)
  }

  return (
    <div className="main-menu-container v3141-menu" ref={containerRef} aria-label="Màn hình chính chọn bộ tranh">
      {/* Background Decor */}
      <div className="menu-clouds-bg" aria-hidden="true" />

      {/* Top Header */}
      <header className="main-menu-header">
        <div className="main-menu-title-badge">
          <h1>BÉ TÔ MÀU</h1>
          <span className="subtitle">12 Bộ Tranh Bimi Boo • Phiên bản 3.141</span>
        </div>
        <button
          type="button"
          className="replay-intro-button"
          onClick={() => {
            sound.playEffect('click')
            onReplayIntro()
          }}
          title="Xem lại hoạt hình mở đầu"
        >
          🎬 Xem hoạt hình
        </button>
      </header>

      {/* 2-Row Grid Horizontal Scrolling Track */}
      <main
        className="main-menu-scroll-area"
        ref={scrollRef}
        role="region"
        aria-label="Danh sách 12 bộ tranh"
      >
        <div className="menu-grid-world">
          {PACKS.map((pack) => (
            <button
              key={pack.id}
              data-pack-id={pack.id}
              type="button"
              className={`pack-card-v3141 ${activePackId === pack.id ? 'active-tap' : ''}`}
              onClick={() => handleCardClick(pack)}
              aria-label={`Bộ tranh ${pack.name} (${pack.subtitle})`}
            >
              <div className="pack-card-frame">
                <img
                  src={pack.bgCard}
                  alt=""
                  className="pack-card-bg-img"
                  loading="eager"
                  draggable={false}
                />
                {/* Anchor container for Spine rendering */}
                <div className="pack-card-spine-anchor" />

                {/* Fallback preview icon if Spine is loading */}
                {!spineReady && (
                  <div className="pack-card-fallback-badge">
                    <span>{pack.name.slice(0, 2)}</span>
                  </div>
                )}
              </div>

              {/* Title & Badge */}
              <div className="pack-card-info">
                <span className="pack-name">{pack.name}</span>
                <span className="pack-subtitle">{pack.subtitle}</span>
              </div>
            </button>
          ))}
        </div>
      </main>

      {/* Shared WebGL Canvas for 60FPS Spine 3.8 animations */}
      <canvas
        ref={canvasRef}
        className="menu-spines-canvas"
        aria-hidden="true"
      />
    </div>
  )
}
