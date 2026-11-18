import { createAudioPlayer, setAudioModeAsync, type AudioPlayer } from 'expo-audio'
import { BGM_SOURCES, BRUSH_SOURCE, EFFECT_SOURCES, type BgmName, type EffectName } from '../assets/sounds'

/**
 * Thin wrapper around `expo-audio`:
 * one looping BGM channel, one looping brush channel, cached one-shot effects.
 * Every call swallows audio errors — a silent device must never break drawing.
 */
class SoundManager {
  private modePromise: Promise<void> | null = null
  private bgm: AudioPlayer | null = null
  private bgmName: BgmName | null = null
  private brush: AudioPlayer | null = null
  private effects = new Map<EffectName, AudioPlayer>()

  private ready(): Promise<void> {
    if (!this.modePromise) {
      this.modePromise = setAudioModeAsync({
        playsInSilentMode: true,
        shouldPlayInBackground: false,
        allowsRecording: false,
      }).catch(() => undefined)
    }
    return this.modePromise
  }

  playEffect(name: EffectName) {
    try {
      let player = this.effects.get(name)
      if (!player) {
        player = createAudioPlayer(EFFECT_SOURCES[name])
        player.volume = 0.8
        this.effects.set(name, player)
      }
      void player.seekTo(0)
      player.play()
    } catch {
      // Audio is best-effort.
    }
  }

  playBgm(name: BgmName) {
    try {
      if (this.bgmName === name && this.bgm?.playing) return
      if (!this.bgm) {
        this.bgm = createAudioPlayer(BGM_SOURCES[name])
        this.bgm.loop = true
        // Full level: the 3.141 tracks peak around -8 dBFS, and the APK plays its music
        // at source level (0.35 left it far too quiet on device).
        this.bgm.volume = 1
      } else {
        this.bgm.replace(BGM_SOURCES[name])
      }
      this.bgmName = name
      this.bgm.play()
    } catch {
      // Audio is best-effort.
    }
    void this.ready()
  }

  startBrush() {
    try {
      if (!this.brush) {
        this.brush = createAudioPlayer(BRUSH_SOURCE)
        this.brush.loop = true
        this.brush.volume = 0.4
      }
      if (!this.brush.playing) this.brush.play()
    } catch {
      // Audio is best-effort.
    }
  }

  stopBrush() {
    try {
      if (this.brush?.playing) {
        this.brush.pause()
        void this.brush.seekTo(0)
      }
    } catch {
      // Audio is best-effort.
    }
  }
}

export const sound = new SoundManager()
