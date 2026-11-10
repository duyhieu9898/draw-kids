import { useState } from 'react'
import OriginalIntro from './OriginalIntro'
import MainMenu from './MainMenu'
import Gallery from './Gallery'
import DrawScene from './DrawScene'
import './App.css'

type ScreenState = 'intro' | 'menu' | 'gallery' | 'drawing'

function getInitialParams() {
  if (typeof window === 'undefined') return { screen: 'intro' as ScreenState, pack: 1, pic: 1 }
  const params = new URLSearchParams(window.location.search)
  const screenParam = params.get('screen') as ScreenState | null
  const packParam = Number(params.get('pack')) || 1
  const picParam = Number(params.get('pic')) || 1
  return {
    screen: screenParam || ('intro' as ScreenState),
    pack: packParam,
    pic: picParam,
  }
}

export default function App() {
  const initial = getInitialParams()
  const [screen, setScreen] = useState<ScreenState>(initial.screen)
  const [selectedPack, setSelectedPack] = useState<number>(initial.pack)
  const [selectedPicture, setSelectedPicture] = useState<number>(initial.pic)

  return (
    <div className="game-root-viewport">
      {screen === 'intro' && (
        <OriginalIntro onComplete={() => setScreen('menu')} />
      )}

      {screen === 'menu' && (
        <MainMenu
          onSelectPack={(packId) => {
            setSelectedPack(packId)
            setScreen('gallery')
          }}
          onReplayIntro={() => setScreen('intro')}
        />
      )}

      {screen === 'gallery' && (
        <Gallery
          packId={selectedPack}
          onBack={() => setScreen('menu')}
          onSelectPicture={(pictureNumber) => {
            setSelectedPicture(pictureNumber)
            setScreen('drawing')
          }}
        />
      )}

      {screen === 'drawing' && (
        <DrawScene
          pack={selectedPack}
          pictureNumber={selectedPicture}
          onBack={() => setScreen('gallery')}
        />
      )}

      <div className="portrait-rotate-notice" aria-hidden="true">
        <span>↻</span>
        <p>Vui lòng xoay ngang màn hình để chơi</p>
      </div>
    </div>
  )
}
