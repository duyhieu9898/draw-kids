import { useCallback, useEffect, useRef, useState, type ReactNode } from 'react'
import { Platform, StyleSheet, View } from 'react-native'
import { setAudioModeAsync, useAudioPlayer, useAudioPlayerStatus } from 'expo-audio'
import { WebView } from 'react-native-webview'
import { fadeThenNavigate, useScreenFadeHold } from '../navigation/screenFade'
import { INTRO_HTML } from './intro-html.generated'

let introPlayed = false

export function IntroGate({ children }: { children: ReactNode }) {
  const [done, setDone] = useState(introPlayed || Platform.OS === 'web')
  // After the intro, go through the white overlay like every other screen transition.
  const finish = useCallback(() => {
    introPlayed = true
    fadeThenNavigate(() => setDone(true))
  }, [])

  if (done) return <>{children}</>
  return <IntroScreen onFinish={finish} />
}

function IntroScreen({ onFinish }: { onFinish: () => void }) {
  const webView = useRef<WebView<object>>(null)
  const started = useRef(false)
  const player = useAudioPlayer(require('../../assets/intro/Drawing_intro.wav'))
  const status = useAudioPlayerStatus(player)
  const [webReady, setWebReady] = useState(false)
  const [audioModeReady, setAudioModeReady] = useState(false)
  const [audioTimedOut, setAudioTimedOut] = useState(false)
  // The white overlay is on from app launch and shares the intro background color,
  // so it is only released once the WebView is ready — the user never sees an
  // unrendered frame.
  useScreenFadeHold(!webReady)

  useEffect(() => {
    let active = true
    void setAudioModeAsync({ playsInSilentMode: true, shouldPlayInBackground: false, allowsRecording: false })
      .catch(() => undefined)
      .finally(() => { if (active) setAudioModeReady(true) })
    // An unavailable audio asset must never prevent the animation from playing.
    const timer = setTimeout(() => setAudioTimedOut(true), 5000)
    return () => { active = false; clearTimeout(timer) }
  }, [])

  useEffect(() => {
    if (started.current || !webReady || !(audioModeReady && status.isLoaded) && !audioTimedOut) return
    started.current = true
    if (audioModeReady && status.isLoaded) {
      try { player.play() } catch { /* Continue silently if playback fails. */ }
    }
    webView.current?.injectJavaScript('window.startIntro(); true;')
  }, [audioModeReady, audioTimedOut, player, status.isLoaded, webReady])

  const finish = useCallback(() => {
    try { player.pause() } catch { /* The player may already be unavailable. */ }
    onFinish()
  }, [onFinish, player])

  return (
    <View style={styles.root}>
      <WebView
        ref={webView}
        source={{ html: INTRO_HTML }}
        originWhitelist={['*']}
        javaScriptEnabled
        scrollEnabled={false}
        style={styles.web}
        onMessage={(event) => {
          try {
            const message = JSON.parse(event.nativeEvent.data) as { type?: string }
            if (message.type === 'ready') setWebReady(true)
            if (message.type === 'complete' || message.type === 'error') finish()
          } catch {
            // Ignore unrelated messages.
          }
        }}
        onError={finish}
        onHttpError={finish}
      />
    </View>
  )
}

const styles = StyleSheet.create({
  root: { flex: 1, backgroundColor: '#ffffff' },
  web: { flex: 1, backgroundColor: '#ffffff' },
})
