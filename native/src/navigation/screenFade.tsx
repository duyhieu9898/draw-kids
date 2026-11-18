import { useEffect, useSyncExternalStore } from 'react'
import { Animated, StyleSheet } from 'react-native'

/**
 * White overlay for the whole app.
 *
 * The overlay is **on by default** (same background color as the intro) so the
 * screen being rendered is never exposed: each screen keeps the overlay while it
 * still loads (images, Skia…) and releases it only once drawn; the overlay then
 * fades out. `Animated.Value` is in module scope so every screen shares one
 * overlay.
 */
const cover = new Animated.Value(1)

const HOLD_MS = 120
const FADE_OUT_MS = 260
// If a screen never reports ready (broken image, bad deep link…), release on
// its own so the app never gets stuck on the white screen.
const HOLD_TIMEOUT_MS = 5000

let blocking = true
let holds = 0
let revealTimer: ReturnType<typeof setTimeout> | null = null
const listeners = new Set<() => void>()

function subscribeBlocking(listener: () => void) {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

function isBlocking() {
  return blocking
}

function setBlocking(next: boolean) {
  if (blocking === next) return
  blocking = next
  for (const listener of listeners) listener()
}

function cancelReveal() {
  if (revealTimer) {
    clearTimeout(revealTimer)
    revealTimer = null
  }
}

function release() {
  holds = Math.max(0, holds - 1)
  if (holds > 0) return
  cancelReveal()
  revealTimer = setTimeout(() => {
    revealTimer = null
    if (holds > 0) return
    // Release touch as soon as fading out starts, without waiting for the animation.
    setBlocking(false)
    Animated.timing(cover, {
      toValue: 0,
      duration: FADE_OUT_MS,
      useNativeDriver: true,
    }).start()
  }, HOLD_MS)
}

/** Keep the white overlay until the screen is ready; returns the release function. */
export function holdScreenFade(): () => void {
  holds += 1
  cancelReveal()
  if (!blocking) {
    setBlocking(true)
    // A fade-out may still be running — stop it, then cover opaquely.
    cover.stopAnimation()
    cover.setValue(1)
  }
  let released = false
  let timer: ReturnType<typeof setTimeout>
  const releaseHold = () => {
    if (released) return
    released = true
    clearTimeout(timer)
    release()
  }
  timer = setTimeout(releaseHold, HOLD_TIMEOUT_MS)
  return releaseHold
}

/** Navigate to another screen: cover with white first, then navigate. */
export function fadeThenNavigate(navigate: () => void): void {
  const releaseHold = holdScreenFade()
  Animated.timing(cover, {
    toValue: 1,
    duration: 160,
    useNativeDriver: true,
  }).start(() => {
    navigate()
    releaseHold()
  })
}

/** Keep the overlay while the screen is still loading data; release when ready. */
export function useScreenFadeHold(active: boolean): void {
  useEffect(() => {
    if (!active) return
    return holdScreenFade()
  }, [active])
}

export function ScreenFade() {
  const blocked = useSyncExternalStore(subscribeBlocking, isBlocking)
  return (
    <Animated.View
      // Block touch while the overlay is opaque, and also while fading out.
      pointerEvents={blocked ? 'auto' : 'none'}
      style={[StyleSheet.absoluteFill, styles.cover, { opacity: cover }]}
    />
  )
}

const styles = StyleSheet.create({
  cover: { backgroundColor: '#ffffff' },
})
