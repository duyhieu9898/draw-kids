export const ART_SIZE = 775

/** Same id the web reference uses for the paper behind the shapes. */
export const BACKGROUND_REGION_ID = -1

export type Fit = {
  scale: number
  x: number
  y: number
}

export type HitRegion = {
  regionId: number
  bounds: [number, number, number, number]
  width: number
  height: number
  /** One byte per pixel of the region bounds, 1 when the mask is covered. */
  alpha: Uint8Array
}

/** Largest square of ART_SIZE fitted and centred inside the view. */
export function fitRect(width: number, height: number): Fit {
  const scale = Math.min(width / ART_SIZE, height / ART_SIZE)
  if (!Number.isFinite(scale) || scale <= 0) return { scale: 0, x: 0, y: 0 }
  return {
    scale,
    x: (width - ART_SIZE * scale) / 2,
    y: (height - ART_SIZE * scale) / 2,
  }
}

/** View coordinates (points, relative to the canvas) to art coordinates. */
export function viewToArt(fit: Fit, x: number, y: number): [number, number] {
  if (fit.scale <= 0) return [0, 0]
  return [(x - fit.x) / fit.scale, (y - fit.y) / fit.scale]
}

/**
 * Packs the alpha channel into one byte per pixel so hit testing is a plain
 * lookup instead of a per-touch pixel readback.
 */
export function alphaIndex(
  rgba: Uint8Array | Uint8ClampedArray,
  width: number,
  height: number,
): Uint8Array {
  const index = new Uint8Array(width * height)
  for (let position = 0, alpha = 3; position < index.length; position++, alpha += 4) {
    index[position] = rgba[alpha] > 0 ? 1 : 0
  }
  return index
}

/** True inside the art square, false on the letterbox around it. */
export function insideArt(x: number, y: number): boolean {
  return x >= 0 && y >= 0 && x < ART_SIZE && y < ART_SIZE
}

export function isOpaqueAt(alpha: Uint8Array, width: number, px: number, py: number): boolean {
  return alpha[py * width + px] === 1
}

/**
 * First covered region from the end of the list, so later (smaller) shapes win
 * over earlier ones. Regions outside their bounds are skipped.
 */
export function hitTest(
  regions: readonly HitRegion[],
  x: number,
  y: number,
): HitRegion | null {
  for (let index = regions.length - 1; index >= 0; index--) {
    const region = regions[index]
    const [left, top, width, height] = region.bounds
    const px = Math.floor(x - left)
    const py = Math.floor(y - top)
    if (px < 0 || py < 0 || px >= width || py >= height) continue
    if (isOpaqueAt(region.alpha, region.width, px, py)) return region
  }
  return null
}

function round(value: number): number {
  return Math.round(value * 10) / 10
}

/**
 * SVG path data for a smoothed stroke through the points. Mirrors the web
 * canvas quadratic-midpoint smoothing. Returns '' for a single point, which
 * callers render as a dot instead.
 */
export function strokePathData(points: readonly [number, number][]): string {
  if (points.length < 2) return ''
  let data = `M ${round(points[0][0])} ${round(points[0][1])}`
  if (points.length === 2) {
    return `${data} L ${round(points[1][0])} ${round(points[1][1])}`
  }
  for (let index = 1; index < points.length - 1; index++) {
    const midX = (points[index][0] + points[index + 1][0]) / 2
    const midY = (points[index][1] + points[index + 1][1]) / 2
    data += ` Q ${round(points[index][0])} ${round(points[index][1])} ${round(midX)} ${round(midY)}`
  }
  const last = points[points.length - 1]
  return `${data} L ${round(last[0])} ${round(last[1])}`
}
