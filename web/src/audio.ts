class SoundManager {
  private unlocked = false
  private bgmAudio: HTMLAudioElement | null = null
  private currentBgm = ''
  private effects = new Map<string, HTMLAudioElement>()

  constructor() {
    if (typeof window !== 'undefined') {
      const unlock = () => {
        this.unlocked = true
        if (this.bgmAudio && this.bgmAudio.paused) {
          void this.bgmAudio.play().catch(() => undefined)
        }
        window.removeEventListener('pointerdown', unlock)
        window.removeEventListener('keydown', unlock)
      }
      window.addEventListener('pointerdown', unlock)
      window.addEventListener('keydown', unlock)
    }
  }

  playEffect(
    name:
      | 'click'
      | 'click-color'
      | 'fill'
      | 'draw-erase'
      | 'star'
      | 'screenshot'
      | 'draw-color-select'
      | 'game-particle'
      | 'mm-scroll'
      | 'mm_scroll_short'
      | 'mm_scroll_long'
      | 'mm_transition_in'
      | 'parental-right'
      | 'parental-wrong'
      | 'tip'
  ) {
    try {
      let sound = this.effects.get(name)
      if (!sound) {
        sound = new Audio(`/game-assets/sounds/${name}.mp3`)
        sound.volume = 0.8
        this.effects.set(name, sound)
      }
      sound.currentTime = 0
      void sound.play().catch(() => undefined)
    } catch {
      // Audio might fail in non-interactive state
    }
  }

  playBgm(track: 'bg_menu' | 'bg_game') {
    if (this.currentBgm === track && this.bgmAudio && !this.bgmAudio.paused) {
      return
    }
    this.stopBgm()
    this.currentBgm = track
    this.bgmAudio = new Audio(`/game-assets/sounds/${track}.mp3`)
    this.bgmAudio.loop = true
    this.bgmAudio.volume = 0.4
    if (this.unlocked) {
      void this.bgmAudio.play().catch(() => undefined)
    }
  }

  stopBgm() {
    if (this.bgmAudio) {
      this.bgmAudio.pause()
      this.bgmAudio = null
      this.currentBgm = ''
    }
  }
}

export const sound = new SoundManager()

