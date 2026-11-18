#!/usr/bin/env node
/**
 * Scans native/assets/pictures/<pack>/<picture>/picture.json, validates the
 * files and geometry, then writes src/assets/catalog.generated.ts with literal
 * imports Metro can analyse. Run: npm run catalog
 */
import { readdir, readFile, writeFile } from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const picturesRoot = path.join(root, 'assets', 'pictures')
const outFile = path.join(root, 'src', 'assets', 'catalog.generated.ts')

const errors = []
const warnings = []


function pngSize(buffer) {
  if (buffer.length < 24) return null
  if (buffer.subarray(0, 8).toString('hex') !== '89504e470d0a1a0a') return null
  return { width: buffer.readUInt32BE(16), height: buffer.readUInt32BE(20) }
}

async function readPngSize(file) {
  try {
    return pngSize(await readFile(file))
  } catch {
    return null
  }
}

function identifier(value) {
  return value.replace(/[^a-zA-Z0-9]/g, '_')
}

async function listDirectories(directory) {
  const entries = await readdir(directory, { withFileTypes: true })
  return entries.filter((entry) => entry.isDirectory()).map((entry) => entry.name).sort()
}

async function main() {
  let packNames = []
  try {
    packNames = await listDirectories(picturesRoot)
  } catch {
    errors.push(`Missing directory ${path.relative(root, picturesRoot)}`)
  }

  const pictures = []
  const imports = []

  for (const pack of packNames) {
    const packDir = path.join(picturesRoot, pack)
    for (const pictureName of await listDirectories(packDir)) {
      const dir = path.join(packDir, pictureName)
      const label = `${pack}/${pictureName}`
      const metaPath = path.join(dir, 'picture.json')
      let raw
      try {
        raw = JSON.parse(await readFile(metaPath, 'utf8'))
      } catch (error) {
        errors.push(`${label}: could not read picture.json (${error.message})`)
        continue
      }

      const logicalSize = raw.logicalSize
      if (!Array.isArray(logicalSize) || logicalSize.length !== 2) {
        errors.push(`${label}: invalid logicalSize`)
        continue
      }
      if (!Array.isArray(raw.regions) || raw.regions.length === 0) {
        errors.push(`${label}: no region`)
        continue
      }

      const outline = typeof raw.outline === 'string' ? raw.outline : 'outline.png'
      const outlinePath = path.join(dir, outline)
      const outlineSize = await readPngSize(outlinePath)
      if (!outlineSize) {
        errors.push(`${label}: missing or broken ${outline}`)
        continue
      }
      if (outlineSize.width !== logicalSize[0] || outlineSize.height !== logicalSize[1]) {
        warnings.push(
          `${label}: outline ${outlineSize.width}x${outlineSize.height} differs from logicalSize ${logicalSize[0]}x${logicalSize[1]}`,
        )
      }

      const regionIds = new Set()
      const regions = []
      for (const region of raw.regions) {
        const { regionId, bounds, mask } = region ?? {}
        if (!Number.isInteger(regionId) || regionIds.has(regionId)) {
          errors.push(`${label}: duplicate or invalid regionId (${regionId})`)
          continue
        }
        regionIds.add(regionId)
        if (
          !Array.isArray(bounds) ||
          bounds.length !== 4 ||
          !bounds.every((value) => Number.isFinite(value))
        ) {
          errors.push(`${label}: invalid bounds at region ${regionId}`)
          continue
        }
        const [left, top, width, height] = bounds
        if (width <= 0 || height <= 0 || left < 0 || top < 0) {
          errors.push(`${label}: bounds outside frame at region ${regionId}`)
          continue
        }
        if (left + width > logicalSize[0] || top + height > logicalSize[1]) {
          warnings.push(`${label}: region ${regionId} exceeds logicalSize`)
        }
        if (typeof mask !== 'string') {
          errors.push(`${label}: region ${regionId} missing mask name`)
          continue
        }
        const maskPath = path.join(dir, mask)
        const maskSize = await readPngSize(maskPath)
        if (!maskSize) {
          errors.push(`${label}: missing or broken ${mask}`)
          continue
        }
        if (maskSize.width !== width || maskSize.height !== height) {
          errors.push(
            `${label}: ${mask} is ${maskSize.width}x${maskSize.height}, bounds need ${width}x${height}`,
          )
          continue
        }
        const importName = `mask_${identifier(pack)}_${identifier(pictureName)}_${regionId}`
        imports.push({
          name: importName,
          relative: path.relative(path.join(root, 'src', 'assets'), maskPath).split(path.sep).join('/'),
        })
        regions.push({ regionId, bounds, mask: importName })
      }

      if (regions.length === 0) continue

      const outlineImport = `outline_${identifier(pack)}_${identifier(pictureName)}`
      imports.push({
        name: outlineImport,
        relative: path.relative(path.join(root, 'src', 'assets'), outlinePath).split(path.sep).join('/'),
      })

      pictures.push({
        key: label,
        pack,
        picture: Number(pictureName),
        source: typeof raw.source === 'string' ? raw.source : '',
        logicalSize,
        outline: outlineImport,
        regions,
      })
    }
  }

  for (const message of warnings) console.warn(`warn  ${message}`)
  if (errors.length > 0) {
    for (const message of errors) console.error(`error ${message}`)
    console.error(`\nInvalid catalog: ${errors.length} errors. File not written.`)
    process.exitCode = 1
    return
  }

  const lines = [
    '// AUTO-GENERATED by scripts/generate-catalog.mjs. Do not edit by hand.',
    '// Run `npm run catalog` after adding or moving files in assets/pictures.',
    '',
    ...imports.map((entry) => `import ${entry.name} from '${entry.relative}'`),
    '',
    'export const CATALOG_VERSION = 1',
    '',
    'export type GeneratedRegion = {',
    '  regionId: number',
    '  bounds: [number, number, number, number]',
    '  mask: number',
    '}',
    '',
    'export type GeneratedPicture = {',
    '  key: string',
    '  pack: string',
    '  picture: number',
    '  source: string',
    '  logicalSize: [number, number]',
    '  outline: number',
    '  regions: GeneratedRegion[]',
    '}',
    '',
    'export const PICTURES: GeneratedPicture[] = [',
  ]

  for (const picture of pictures) {
    lines.push('  {')
    lines.push(`    key: '${picture.key}',`)
    lines.push(`    pack: '${picture.pack}',`)
    lines.push(`    picture: ${picture.picture},`)
    lines.push(`    source: '${picture.source.replace(/'/g, "\\'")}',`)
    lines.push(`    logicalSize: [${picture.logicalSize.join(', ')}],`)
    lines.push(`    outline: ${picture.outline},`)
    lines.push('    regions: [')
    for (const region of picture.regions) {
      lines.push(
        `      { regionId: ${region.regionId}, bounds: [${region.bounds.join(', ')}], mask: ${region.mask} },`,
      )
    }
    lines.push('    ],')
    lines.push('  },')
  }
  lines.push(']')
  lines.push('')

  await writeFile(outFile, lines.join('\n'), 'utf8')
  const regionCount = pictures.reduce((sum, picture) => sum + picture.regions.length, 0)
  console.log(
    `catalog: ${pictures.length} pictures, ${regionCount} regions, ${imports.length} assets -> ${path.relative(root, outFile)}`,
  )
}

await main()
