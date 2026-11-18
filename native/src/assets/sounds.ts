/**
 * The clips copied from the original 3.141 game assets.
 * Which action fires which clip has not been captured from the APK yet,
 * so every trigger remains labelled as unverified in NATIVE_BEHAVIOR_TRACKER (N14).
 */
export const EFFECT_SOURCES = {
  click: require('../../assets/sounds/click.mp3'),
  'click-color': require('../../assets/sounds/click-color.mp3'),
  'draw-erase': require('../../assets/sounds/draw-erase.mp3'),
  fill: require('../../assets/sounds/fill.mp3'),
  star: require('../../assets/sounds/star.mp3'),
} as const

export type EffectName = keyof typeof EFFECT_SOURCES

// 3.141's own music, decoded from the APK and re-encoded to 128 kbps MP3:
// `dra-mus-menu` for the topic menu and picture gallery, `dra-mus-gameplay` for drawing.
// The previous bg_menu.mp3/bg_game.mp3 came from APK 3.101 and did not match on device.
export const BGM_SOURCES = {
  menu: require('../../assets/sounds/bg_menu_3141.mp3'),
  game: require('../../assets/sounds/bg_game_3141.mp3'),
} as const

export type BgmName = keyof typeof BGM_SOURCES

/** Looped while a stroke is being drawn (PWA `brush.wav` at 0.4 volume). */
export const BRUSH_SOURCE = require('../../assets/sounds/brush.wav')
