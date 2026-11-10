export interface PackInfo {
  id: number
  product: number
  theme: string
  name: string
  subtitle: string
  bgCard: string
  bgColor: string
  pictureCount: number
  spinePath?: string
  staticFrame?: number
}

export const PACKS: PackInfo[] = [
  {
    id: 1,
    product: 0,
    theme: 'animals',
    name: 'Động vật',
    subtitle: 'Animals',
    bgCard: '/v3.141/menu/sharedassets2.assets-248.png',
    bgColor: '#9676d9',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/animals/',
    staticFrame: 2.7,
  },
  {
    id: 2,
    product: 1,
    theme: 'dolls',
    name: 'Búp bê & Công chúa',
    subtitle: 'Dolls',
    bgCard: '/v3.141/menu/sharedassets2.assets-249.png',
    bgColor: '#e8779b',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/dolls/',
    staticFrame: 2.7,
  },
  {
    id: 3,
    product: 2,
    theme: 'school',
    name: 'Trường học',
    subtitle: 'School',
    bgCard: '/v3.141/menu/sharedassets2.assets-248.png',
    bgColor: '#e89f41',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/school/',
    staticFrame: 2.7,
  },
  {
    id: 4,
    product: 3,
    theme: 'music',
    name: 'Âm nhạc',
    subtitle: 'Music',
    bgCard: '/v3.141/menu/sharedassets2.assets-257.png',
    bgColor: '#46a2dc',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/music/',
    staticFrame: 2.7,
  },
  {
    id: 5,
    product: 4,
    theme: 'vehicles',
    name: 'Xe cộ',
    subtitle: 'Vehicles',
    bgCard: '/v3.141/menu/sharedassets2.assets-249.png',
    bgColor: '#d84742',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/vehicles/',
    staticFrame: 2.7,
  },
  {
    id: 6,
    product: 5,
    theme: 'food',
    name: 'Món ăn',
    subtitle: 'Food',
    bgCard: '/v3.141/menu/sharedassets2.assets-235.png',
    bgColor: '#47b988',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/food/',
    staticFrame: 2.7,
  },
  {
    id: 7,
    product: 6,
    theme: 'insects',
    name: 'Côn trùng',
    subtitle: 'Insects',
    bgCard: '/v3.141/menu/sharedassets2.assets-269.png',
    bgColor: '#a1c45a',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/insects/',
    staticFrame: 2.7,
  },
  {
    id: 8,
    product: 7,
    theme: 'halloween',
    name: 'Halloween',
    subtitle: 'Spooky',
    bgCard: '/v3.141/menu/sharedassets2.assets-235.png',
    bgColor: '#6b3ba7',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/halloween/',
    staticFrame: 2.7,
  },
  {
    id: 9,
    product: 8,
    theme: 'christmas',
    name: 'Giáng sinh',
    subtitle: 'Christmas',
    bgCard: '/v3.141/menu/sharedassets2.assets-264.png',
    bgColor: '#3368a5',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/christmas/',
    staticFrame: 2.7,
  },
  {
    id: 10,
    product: 9,
    theme: 'dinosaurs',
    name: 'Khủng long',
    subtitle: 'Dinosaurs',
    bgCard: '/v3.141/menu/sharedassets2.assets-269.png',
    bgColor: '#489f68',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/dino/',
    staticFrame: 2.7,
  },
  {
    id: 11,
    product: 10,
    theme: 'ocean',
    name: 'Đại dương',
    subtitle: 'Ocean',
    bgCard: '/v3.141/menu/sharedassets2.assets-257.png',
    bgColor: '#2980b9',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/ocean/',
    staticFrame: 2.7,
  },
  {
    id: 12,
    product: 11,
    theme: 'magic',
    name: 'Phép thuật',
    subtitle: 'Magic',
    bgCard: '/v3.141/menu/sharedassets2.assets-264.png',
    bgColor: '#8e44ad',
    pictureCount: 16,
    spinePath: '/v3.141/menu/spine/magic/',
    staticFrame: 2.7,
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

