import { useEffect, useRef } from 'react'
import { installIntroViewport } from './introViewport'
import type { IntroViewportWidget } from './introViewport'

type IntroWidget = IntroViewportWidget & {
  state?: { addListener(listener: Record<string, (...args: any[]) => void>): void }
  pause?: () => void
}

const INTRO = '/game-assets/intro'

type Props = { onComplete: () => void }

export default function OriginalIntro({ onComplete }: Props) {
  const hostRef = useRef<HTMLDivElement>(null)
  const completeRef = useRef(onComplete)

  useEffect(() => { completeRef.current = onComplete }, [onComplete])

  useEffect(() => {
    const host = hostRef.current
    const SpineWidget = window.spine?.SpineWidget
    if (!host || !SpineWidget) {
      const fallback = window.setTimeout(() => completeRef.current(), 8200)
      return () => window.clearTimeout(fallback)
    }

    let disposed = false
    let finished = false
    let startedAt = performance.now()
    let audioUnlocked = false
    const audioRoot = `${INTRO}/`
    const background = new Audio(`${audioRoot}bg.mp3`)
    background.volume = 1
    background.loop = false
    const effects = new Map<string, HTMLAudioElement>()
    for (const name of ['ball1', 'ball2', 'kick', 'appear', 'bimiboo', 'brush', 'palette', 'hat', 'end']) {
      const audio = new Audio(`${audioRoot}${name}.mp3`)
      audio.volume = 1
      effects.set(name, audio)
    }

    const unlockAudio = () => {
      if (audioUnlocked || disposed) return
      audioUnlocked = true
      const elapsed = Math.max(0, (performance.now() - startedAt) / 1000)
      try { background.currentTime = Math.min(elapsed, Math.max(0, background.duration || elapsed)) } catch { /* metadata may not be ready */ }
      void background.play().catch(() => { audioUnlocked = false })
    }
    // Keep listening until playback succeeds. A tap can arrive before the
    // Spine assets finish loading, and browsers reject play() without a live
    // user activation.
    host.addEventListener('pointerdown', unlockAudio)

    const finish = () => {
      if (finished || disposed) return
      finished = true
      completeRef.current()
    }

    const widget = new SpineWidget(host.id, {
      json: `${INTRO}/intro.json`,
      atlas: `${INTRO}/intro.atlas`,
      animation: 'intro',
      loop: false,
      backgroundColor: '#ffffff',
      fitToCanvas: false,
      scale: 1,
      success: (loaded: IntroWidget) => {
        if (disposed) { loaded.pause?.(); return }
        installIntroViewport(loaded)
        startedAt = performance.now()
        const timer = window.setTimeout(finish, 8250)
        host.dataset.timer = String(timer)
        loaded.state?.addListener({
          event: (_entry: unknown, event: { data?: { name?: string }; stringValue?: string }) => {
            if (event.data?.name === 'sound' && event.stringValue) {
              const sound = effects.get(event.stringValue)
              if (audioUnlocked && sound) {
                sound.currentTime = 0
                void sound.play().catch(() => undefined)
              }
            }
            if (event.data?.name === 'end') finish()
          },
        })
        void background.play().then(() => { audioUnlocked = true }).catch(() => undefined)
      },
      error: () => finish(),
    })

    return () => {
      disposed = true
      const timer = Number(host.dataset.timer)
      if (timer) window.clearTimeout(timer)
      host.removeEventListener('pointerdown', unlockAudio)
      widget.pause?.()
      host.replaceChildren()
      background.pause()
      for (const audio of effects.values()) audio.pause()
    }
  }, [])

  return (
    <div className="original-intro" role="region" aria-label="Bimi Boo Intro">
      <div className="spine-stage" id="bimiboo-original-intro" ref={hostRef} />
    </div>
  )
}
