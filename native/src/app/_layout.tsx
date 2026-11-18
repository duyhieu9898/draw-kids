import { useEffect } from 'react'
import { View } from 'react-native'
import { Stack } from 'expo-router'
import { StatusBar } from 'expo-status-bar'
import * as ScreenOrientation from 'expo-screen-orientation'
import { SafeAreaProvider } from 'react-native-safe-area-context'
import { IntroGate } from '../intro/IntroGate'
import { ScreenFade } from '../navigation/screenFade'

export default function RootLayout() {
  useEffect(() => {
    ScreenOrientation.lockAsync(ScreenOrientation.OrientationLock.LANDSCAPE).catch(() => {
      // Expo Go can refuse the lock; the app still lays out for the real size.
    })
  }, [])

  return (
    <SafeAreaProvider>
      <StatusBar hidden />
      <View style={{ flex: 1, backgroundColor: '#fff8ec' }}>
        <IntroGate>
          {/* Screen transitions are handled by the white `ScreenFade` overlay, so Stack
              animation is disabled: iOS would otherwise slide horizontally and expose
              the screen being rendered. */}
          <Stack
            screenOptions={{
              headerShown: false,
              animation: 'none',
              // iOS back swipe slides horizontally regardless of `animation`, so
              // navigation uses the Back button + white fade only.
              gestureEnabled: false,
              contentStyle: { backgroundColor: '#fff8ec' },
            }}
          >
            {/* Left-edge swipe is the drawing stroke, but iOS reads it as a back
                gesture and jumps back to the topic gallery mid-drawing. */}
            <Stack.Screen name="draw/[pack]/[picture]" options={{ gestureEnabled: false }} />
          </Stack>
        </IntroGate>
      </View>
      {/* Must stay on top to cover the screen being rendered during transitions. */}
      <ScreenFade />
    </SafeAreaProvider>
  )
}
