import { Image as RNImage } from 'react-native'
import { AlphaType, ColorType, Skia, type SkImage } from '@shopify/react-native-skia'
import type { CatalogPicture } from '../assets/catalog'
import { ART_SIZE, alphaIndex } from '../domain/geometry'
import type { Bounds } from '../domain/types'

export type LoadedRegion = {
  regionId: number
  bounds: Bounds
  width: number
  height: number
  /** Region-sized alpha index, built once at load. */
  alpha: Uint8Array
  mask: SkImage
}

export type LoadedPicture = {
  catalog: CatalogPicture
  outline: SkImage
  regions: LoadedRegion[]
  /**
   * Regions whose bounds cover the whole art square. Their mask is the white paper,
   * so they are drawn and hit-tested as the background instead of as a shape; this
   * keeps the paper one object on both sides of the art-square edge.
   */
  paperRegionIds: number[]
}

async function loadSkiaImage(source: number): Promise<SkImage> {
  const resolved = RNImage.resolveAssetSource(source)
  if (!resolved?.uri) throw new Error('Asset has no URI.')
  // fromURI reads http (Expo Go) and file:// (release build) without a JS copy.
  // Web reachability is untested: react-native-web does not expose
  // resolveAssetSource, and CanvasKit needs LoadSkiaWeb first (see README).
  const data = await Skia.Data.fromURI(resolved.uri)
  const image = Skia.Image.MakeImageFromEncoded(data)
  if (!image) throw new Error(`Could not decode image: ${resolved.uri}`)
  return image
}

function readAlpha(image: SkImage, width: number, height: number): Uint8Array {
  const pixels = image.readPixels(0, 0, {
    width,
    height,
    colorType: ColorType.RGBA_8888,
    alphaType: AlphaType.Unpremul,
  })
  if (!pixels) throw new Error('Could not read mask pixels.')
  if (!(pixels instanceof Uint8Array)) throw new Error('Mask did not return RGBA8888.')
  return alphaIndex(pixels, width, height)
}

export async function loadPictureAssets(catalog: CatalogPicture): Promise<LoadedPicture> {
  // Some 3.141 pictures serialize the paper as region 1 with a full-square mask. It is
  // not a shape to clip strokes to: the paper spans the whole stage, so it is merged
  // into the background (see picture.paperRegionIds).
  const isPaper = (bounds: readonly number[]) =>
    bounds[0] === 0 && bounds[1] === 0 && bounds[2] === ART_SIZE && bounds[3] === ART_SIZE
  const paperRegionIds = catalog.regions
    .filter((region) => isPaper(region.bounds))
    .map((region) => region.regionId)

  const [outline, ...regions] = await Promise.all([
    loadSkiaImage(catalog.outline),
    ...catalog.regions.filter((region) => !isPaper(region.bounds)).map(async (region) => {
      const [left, top, width, height] = region.bounds
      const mask = await loadSkiaImage(region.mask)
      return {
        regionId: region.regionId,
        bounds: [left, top, width, height] as Bounds,
        width,
        height,
        alpha: readAlpha(mask, width, height),
        mask,
      }
    }),
  ])

  return { catalog, outline, regions, paperRegionIds }
}
