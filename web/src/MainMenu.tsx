import { useEffect } from 'react'
import { PACKS } from './types'
import { sound } from './audio'

interface MainMenuProps {
  onSelectPack: (packId: number) => void
  onReplayIntro: () => void
}

export default function MainMenu({ onSelectPack, onReplayIntro }: MainMenuProps) {
  useEffect(() => {
    sound.playBgm('bg_menu')
  }, [])

  return (
    <div className="main-menu-container" aria-label="Màn hình chính chọn bộ tranh">
      <header className="main-menu-header">
        <div className="main-menu-title-badge">
          <h1>BÉ TÔ MÀU</h1>
          <span className="subtitle">Bimi Boo Coloring</span>
        </div>
        <button
          type="button"
          className="replay-intro-button"
          onClick={() => {
            sound.playEffect('click')
            onReplayIntro()
          }}
          title="Xem lại hoạt hình mở đầu"
        >
          🎬 Xem hoạt hình
        </button>
      </header>

      <main className="main-menu-carousel" role="region" aria-label="Danh sách bộ tranh">
        <div className="carousel-track">
          {PACKS.map((pack) => (
            <button
              key={pack.id}
              type="button"
              className="pack-card"
              style={{ '--pack-bg-image': `url("${pack.bgCard}")` } as React.CSSProperties}
              onClick={() => {
                sound.playEffect('click')
                onSelectPack(pack.id)
              }}
            >
              <div className="pack-card-frame">
                <img
                  src={pack.bgCard}
                  alt=""
                  className="pack-card-bg-img"
                  width="220"
                  height="206"
                  loading="lazy"
                />
                <div className="pack-card-circle">
                  <img
                    src={`/game-assets/ui/sprites/gallery_icons/img-preview-${pack.id}-1.png`}
                    alt={pack.name}
                    className="pack-card-preview"
                    width="110"
                    height="110"
                    loading="lazy"
                  />
                </div>
              </div>
              <div className="pack-card-info">
                <span className="pack-name">{pack.name}</span>
                <span className="pack-count">{pack.pictureCount} tranh</span>
              </div>
            </button>
          ))}
        </div>
      </main>
    </div>
  )
}
