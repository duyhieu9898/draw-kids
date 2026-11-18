import { useEffect, useRef, useState } from 'react'
import { Animated, Easing, Image, StyleSheet, View } from 'react-native'

type Props = { x: number; y: number; color: string; scale: number; onDone: () => void }

export function StarBurst({ x, y, color, scale, onDone }: Props) {
  const [progress] = useState(() => new Animated.Value(0))
  const done = useRef(onDone)
  useEffect(() => { done.current = onDone }, [onDone])
  const [stars] = useState(() => Array.from({ length: 8 }, (_, i) => {
    const angle = 2 * Math.PI * i / 8 + (Math.random() - .5) * .4
    // Travel radius stays as requested; the star size is 30% smaller (84–130 -> 59–91).
    const distance = (Math.random() * 4 + 3.5) * 30 * scale
    return { x: Math.cos(angle) * distance, y: (Math.sin(angle) * distance - 20 * scale), size: (Math.random() * 32 + 59) * scale, rotation: Math.random() * 360 }
  }))
  useEffect(() => {
    const animation = Animated.timing(progress, { toValue: 1, duration: 480, easing: Easing.out(Easing.quad), useNativeDriver: true })
    animation.start(({ finished }) => { if (finished) done.current() })
    return () => animation.stop()
  }, [progress])
  return <View pointerEvents="none" style={StyleSheet.absoluteFill}>
    {stars.map((star, index) => <Animated.View key={index} style={{ position: 'absolute', left: x - star.size / 2, top: y - star.size / 2, width: star.size, height: star.size, opacity: progress.interpolate({ inputRange: [0, .55, 1], outputRange: [.75, .75, 0] }), transform: [{ translateX: Animated.multiply(progress, star.x) }, { translateY: Animated.multiply(progress, star.y) }, { rotate: `${star.rotation}deg` }, { scale: progress.interpolate({ inputRange: [0, 1], outputRange: [1, .65] }) }] }}><Image source={require('../../assets/ui/particle-star.png')} style={{ width: '100%', height: '100%', tintColor: color }} /></Animated.View>)}
  </View>
}
