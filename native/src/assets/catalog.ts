import { CATALOG_VERSION, PICTURES } from './catalog.generated'

export { CATALOG_VERSION, PICTURES }

export type CatalogPicture = (typeof PICTURES)[number]
export type CatalogRegion = CatalogPicture['regions'][number]

export function getPicture(pack: string, picture: number): CatalogPicture | undefined {
  return PICTURES.find((item) => item.pack === pack && item.picture === picture)
}
