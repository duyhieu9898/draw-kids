import { useEffect, useState } from 'react'
import { openDB } from 'idb'
import { PACKS } from './types'
import type { SavedPictureData } from './types'
import { sound } from './audio'

const dbPromise = openDB('drawing-rebuild-poc', 1, {
  upgrade(db) {
    if (!db.objectStoreNames.contains('pictures')) {
      db.createObjectStore('pictures')
    }
  },
})

interface GalleryProps {
  packId: number
  onBack: () => void
  onSelectPicture: (pictureNumber: number) => void
}

export default function Gallery({ packId, onBack, onSelectPicture }: GalleryProps) {
  const pack = PACKS.find((p) => p.id === packId) || PACKS[0]
  const [savedThumbnails, setSavedThumbnails] = useState<Record<number, string>>({})

  useEffect(() => {
    sound.playBgm('bg_menu')
  }, [])

  useEffect(() => {
    let active = true
    async function loadSavedData() {
      try {
        const db = await dbPromise
        const thumbs: Record<number, string> = {}
        for (let i = 1; i <= pack.pictureCount; i++) {
          const key = `${pack.id}-${i}`
          const data = (await db.get('pictures', key)) as SavedPictureData | undefined
          if (data?.thumbnail) {
            thumbs[i] = data.thumbnail
          }
        }
        if (active) {
          setSavedThumbnails(thumbs)
        }
      } catch (err) {
        console.error('Không tải được ảnh đã tô từ IndexedDB:', err)
      }
    }
    void loadSavedData()
    return () => {
      active = false
    }
  }, [pack.id, pack.pictureCount])

  const coloredCount = Object.keys(savedThumbnails).length

  return (
    <div
      className="gallery-container"
      style={{
        backgroundColor: pack.bgColor,
        backgroundImage: 'url("/game-assets/ui/gallery_pattern.png")',
      }}
      aria-label={`${pack.name} Gallery`}
    >
      <header className="gallery-header">
        <button
          type="button"
          className="gallery-back-button"
          onClick={() => {
            sound.playEffect('click')
            onBack()
          }}
          aria-label="Back to main menu"
        >
          <img
            src="/game-assets/ui/gallery-back-button.png"
            alt=""
            width="113"
            height="69"
          />
        </button>

        <div className="gallery-header-info">
          <h2>{pack.name}</h2>
          <span className="gallery-counter">
            {coloredCount > 0 ? `${coloredCount}/${pack.pictureCount} Colored` : `${pack.pictureCount} Pictures`}
          </span>
        </div>
      </header>

      <main className="gallery-grid-viewport" role="region" aria-label={`${pack.name} pictures list`}>
        <div className="gallery-grid-track">
          {Array.from({ length: pack.pictureCount }, (_, index) => {
            const pictureNumber = index + 1
            const customThumb = savedThumbnails[pictureNumber]
            const mappedPackId = ((pack.id - 1) % 10) + 1
            const defaultThumb = `/game-assets/ui/sprites/gallery_icons/img-preview-${mappedPackId}-${pictureNumber}.png`

            return (
              <button
                key={pictureNumber}
                type="button"
                className={`gallery-picture-card ${customThumb ? 'is-colored' : ''}`}
                onClick={() => {
                  sound.playEffect('click')
                  onSelectPicture(pictureNumber)
                }}
                aria-label={`${pack.name} picture ${pictureNumber}${customThumb ? ' (Colored)' : ''}`}
              >
                <div className="gallery-frame-wrapper">
                  <img
                    src="/game-assets/ui/gallery_icon_frame.png"
                    alt=""
                    className="gallery-frame-border"
                    width="276"
                    height="276"
                    loading="lazy"
                  />
                  <div className="gallery-thumb-container">
                    <img
                      src={customThumb || defaultThumb}
                      alt=""
                      className="gallery-thumb-image"
                      width="264"
                      height="264"
                      loading="lazy"
                      onError={(e) => {
                        // Fallback to pack 1 if preview icon not found
                        const target = e.currentTarget
                        if (!target.src.includes('img-preview-1-')) {
                          target.src = `/game-assets/ui/sprites/gallery_icons/img-preview-1-${pictureNumber}.png`
                        }
                      }}
                    />
                  </div>
                </div>
              </button>
            )
          })}
        </div>
      </main>
    </div>
  )
}
