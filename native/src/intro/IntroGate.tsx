import { useCallback, useEffect, useRef, useState, type ReactNode } from 'react'
import { Platform, StyleSheet, View } from 'react-native'
import { useVideoPlayer, VideoView } from 'expo-video'
import { fadeThenNavigate, useScreenFadeHold } from '../navigation/screenFade'

let introPlayed = false

export function IntroGate({ children }: { children: ReactNode }) {
  const [done, setDone] = useState(introPlayed || Platform.OS === 'web')

  const finish = useCallback(() => {
    introPlayed = true
    fadeThenNavigate(() => setDone(true))
  }, [])

  if (done) return <>{children}</>
  return <IntroScreen onFinish={finish} />
}

function IntroScreen({ onFinish }: { onFinish: () => void }) {
  const videoSource = require('../../assets/intro/intro.mp4')
  const [ready, setReady] = useState(false)
  const finishedRef = useRef(false)

  const finishOnce = useCallback(() => {
    if (finishedRef.current) return
    finishedRef.current = true
    onFinish()
  }, [onFinish])

  const player = useVideoPlayer(videoSource, (p) => {
    p.loop = false
    p.play()
  })

  useScreenFadeHold(!ready)

  useEffect(() => {
    const statusSub = player.addListener('statusChange', ({ status, error }) => {
      if (status === 'readyToPlay') {
        setReady(true)
      }
      if (error) {
        finishOnce()
      }
    })

    const endSub = player.addListener('playToEnd', () => {
      finishOnce()
    })

    // Safety fallback: if video doesn't end within 8s, continue
    const timeout = setTimeout(finishOnce, 8000)

    return () => {
      clearTimeout(timeout)
      statusSub.remove()
      endSub.remove()
    }
  }, [finishOnce, player])

  return (
    <View style={styles.root}>
      <VideoView
        player={player}
        style={styles.video}
        nativeControls={false}
        contentFit="cover"
      />
    </View>
  )
}

const styles = StyleSheet.create({
  root: {
    flex: 1,
    backgroundColor: '#ffffff',
  },
  video: {
    ...StyleSheet.absoluteFill,
  },
})
