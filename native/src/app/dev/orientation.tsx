import { useState } from 'react'
import { Pressable, StyleSheet, Text, useWindowDimensions, View } from 'react-native'
import { StatusBar } from 'expo-status-bar'
import * as ScreenOrientation from 'expo-screen-orientation'

export default function OrientationCheck() {
  const { width, height } = useWindowDimensions()
  const [result, setResult] = useState('Requesting landscape mode…')
  const [showStatus, setShowStatus] = useState(false)

  const lockLandscape = async () => {
    try {
      const supported = await ScreenOrientation.supportsOrientationLockAsync(
        ScreenOrientation.OrientationLock.LANDSCAPE,
      )
      await ScreenOrientation.lockAsync(ScreenOrientation.OrientationLock.LANDSCAPE)
      const current = await ScreenOrientation.getOrientationLockAsync()
      setResult(
        `Supported: ${supported ? 'yes' : 'no'} · Lock: ${ScreenOrientation.OrientationLock[current] ?? current}`,
      )
    } catch (error) {
      setResult(`Could not lock: ${error instanceof Error ? error.message : String(error)}`)
    }
  }

  return (
    <View style={styles.screen}>
      <StatusBar hidden={!showStatus} />
      <Text style={styles.title}>Expo Go check</Text>
      <Text style={styles.line}>
        Screen: {Math.round(width)} × {Math.round(height)} · {width > height ? 'landscape' : 'portrait'}
      </Text>
      <Text style={styles.line}>{result}</Text>
      <Text style={styles.help}>Rotate the phone both ways, then stand it up to check the landscape lock.</Text>
      <View style={styles.row}>
        <Pressable style={styles.button} onPress={() => void lockLandscape()}>
          <Text style={styles.buttonText}>Try landscape lock</Text>
        </Pressable>
        <Pressable style={styles.button} onPress={() => setShowStatus((value) => !value)}>
          <Text style={styles.buttonText}>{showStatus ? 'Hide status bar' : 'Show status bar'}</Text>
        </Pressable>
      </View>
      <Text style={styles.help}>Watch the status bar, home indicator and the gaps at the screen edges.</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  screen: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 25,
    backgroundColor: '#066a80',
  },
  title: { fontSize: 26, fontWeight: 'bold', color: '#ffffff', marginBottom: 8 },
  line: { color: '#ffffff', fontSize: 16, marginBottom: 5, textAlign: 'center' },
  help: { color: '#e6faff', fontSize: 13, textAlign: 'center', marginVertical: 5 },
  row: { flexDirection: 'row', gap: 12, marginVertical: 8 },
  button: {
    backgroundColor: '#30225c',
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 15,
  },
  buttonText: { color: 'white', fontWeight: 'bold' },
})
