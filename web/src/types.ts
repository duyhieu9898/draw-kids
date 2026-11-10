export interface PackInfo {
  id: number
  theme: string
  name: string
  subtitle: string
  bgCard: string
  bgColor: string
  pictureCount: number
}

export const PACKS: PackInfo[] = [
  {
    id: 1,
    theme: 'zoo',
    name: 'Động vật',
    subtitle: 'Animals',
    bgCard: '/game-assets/main_menu/cards/pack-1-bg.png',
    bgColor: '#9676d9',
    pictureCount: 16,
  },
  {
    id: 2,
    theme: 'dolls',
    name: 'Búp bê & Công chúa',
    subtitle: 'Dolls',
    bgCard: '/game-assets/main_menu/cards/pack-2-bg.png',
    bgColor: '#e8779b',
    pictureCount: 16,
  },
  {
    id: 3,
    theme: 'school',
    name: 'Trường học',
    subtitle: 'School',
    bgCard: '/game-assets/main_menu/cards/pack-3-bg.png',
    bgColor: '#e89f41',
    pictureCount: 16,
  },
  {
    id: 4,
    theme: 'music',
    name: 'Âm nhạc',
    subtitle: 'Music',
    bgCard: '/game-assets/main_menu/cards/pack-4-bg.png',
    bgColor: '#46a2dc',
    pictureCount: 16,
  },
  {
    id: 5,
    theme: 'cars',
    name: 'Xe cộ',
    subtitle: 'Cars',
    bgCard: '/game-assets/main_menu/cards/pack-5-bg.png',
    bgColor: '#d84742',
    pictureCount: 16,
  },
  {
    id: 6,
    theme: 'food',
    name: 'Món ăn',
    subtitle: 'Food',
    bgCard: '/game-assets/main_menu/cards/pack-6-bg.png',
    bgColor: '#47b988',
    pictureCount: 16,
  },
  {
    id: 7,
    theme: 'halloween',
    name: 'Halloween',
    subtitle: 'Spooky',
    bgCard: '/game-assets/main_menu/cards/pack-7-bg.png',
    bgColor: '#6b3ba7',
    pictureCount: 16,
  },
  {
    id: 8,
    theme: 'christmas',
    name: 'Giáng sinh',
    subtitle: 'Christmas',
    bgCard: '/game-assets/main_menu/cards/pack-8-bg.png',
    bgColor: '#3368a5',
    pictureCount: 16,
  },
]

export type FillAction = { type: 'fill'; regionId: number; color: string }
export type StrokeAction = {
  type: 'stroke' | 'erase'
  regionId: number
  color: string
  points: Array<[number, number]>
}
export type Action = FillAction | StrokeAction

export interface SavedPictureData {
  actions: Action[]
  thumbnail?: string
  updatedAt: number
}

