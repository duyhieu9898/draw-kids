/** Labels and descriptive slugs for the extracted 3.141 topics. */
export const PACK_LABELS: Record<string, string> = {
  animals: 'Animals',
  dolls: 'Dolls',
  school: 'School',
  music: 'Music',
  vehicles: 'Vehicles',
  food: 'Food',
  halloween: 'Halloween',
  christmas: 'Christmas',
  insects: 'Insects',
  dinosaurs: 'Dinosaurs',
  ocean: 'Ocean',
  magic: 'Magic',
}

/** Menu order is a reconstruction; runtime order is unverified. */
export const PACK_ORDER = [
  'animals', 'dolls', 'school', 'music', 'vehicles', 'food',
  'insects', 'halloween', 'christmas', 'dinosaurs', 'ocean', 'magic',
]

export function packLabel(pack: string): string {
  return PACK_LABELS[pack] ?? pack
}

/** Asset group number in the 3.141 extraction (`group-<n>` icons, sprite names). */
export const PACK_GROUPS: Record<string, number> = {
  animals: 1,
  dolls: 2,
  school: 3,
  music: 4,
  vehicles: 5,
  food: 6,
  halloween: 7,
  christmas: 8,
}

export function packGroup(pack: string): number | null {
  return PACK_GROUPS[pack] ?? null
}
