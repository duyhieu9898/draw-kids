import { test } from 'node:test'
import assert from 'node:assert/strict'
import { readdir, readFile } from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const picturesRoot = path.join(root, 'assets', 'pictures')
const ART_SIZE = 775
const PACKS = ['animals', 'dolls', 'school', 'music', 'vehicles', 'food', 'halloween', 'christmas', 'insects', 'dinosaurs', 'ocean', 'magic']
const PICTURES_PER_PACK = 16
/** Original eight groups plus the four topic hierarchies extracted from 3.141. */
const TOTAL_REGIONS = 2552

async function readPictures() {
  const pictures = []
  for (const pack of PACKS) {
    const dirs = await readdir(path.join(picturesRoot, pack))
    for (const dir of dirs.filter((name) => /^\d+$/.test(name))) {
      const dirPath = path.join(picturesRoot, pack, dir)
      const json = JSON.parse(await readFile(path.join(dirPath, 'picture.json'), 'utf8'))
      pictures.push({ pack, dir, dirPath, json })
    }
  }
  return pictures
}

test('catalog covers 12 packs with 16 pictures each', async () => {
  const packs = (await readdir(picturesRoot)).filter((name) => !name.startsWith('.'))
  assert.deepEqual(packs.sort(), [...PACKS].sort())

  for (const pack of PACKS) {
    const dirs = (await readdir(path.join(picturesRoot, pack))).filter((name) => /^\d+$/.test(name))
    assert.equal(dirs.length, PICTURES_PER_PACK, `${pack} must have ${PICTURES_PER_PACK} pictures`)
    assert.deepEqual(dirs.map(Number).sort((a, b) => a - b), Array.from({ length: 16 }, (_, index) => index + 1))
  }
})

test('new topics keep their recovered regions and exclude inactive objects', async () => {
  const expected = { dinosaurs: 148, insects: 131, ocean: 133, magic: 266 }
  const pictures = await readPictures()
  for (const [pack, total] of Object.entries(expected)) {
    const entries = pictures.filter((picture) => picture.pack === pack)
    assert.equal(entries.reduce((sum, { json }) => sum + json.regions.length, 0), total)
    for (const { json } of entries) {
      const inactive = new Set((json.inactiveSourceRegions ?? []).map((region) => region.spritePathId))
      assert.ok(json.regions.every((region) => !inactive.has(region.spritePathId)))
    }
  }
})

test('picture.json matches its folder and art size', async () => {
  const pictures = await readPictures()
  assert.equal(pictures.length, PACKS.length * PICTURES_PER_PACK)

  for (const { pack, dir, json } of pictures) {
    assert.equal(json.pictureNumber, Number(dir), `${pack}/${dir}: pictureNumber mismatch`)
    assert.deepEqual(json.logicalSize, [ART_SIZE, ART_SIZE], `${pack}/${dir}: logicalSize`)
    assert.ok(typeof json.source === 'string' && json.source.length > 0, `${pack}/${dir}: missing source`)
  }
})

test('every picture has an outline and masks inside the art box', async () => {
  const pictures = await readPictures()
  let regions = 0

  for (const { pack, dir, dirPath, json } of pictures) {
    const files = new Set(await readdir(dirPath))
    assert.ok(files.has(json.outline), `${pack}/${dir}: missing ${json.outline}`)

    const ids = new Set()
    for (const region of json.regions) {
      regions += 1
      const where = `${pack}/${dir} region ${region.regionId}`
      assert.ok(region.regionId >= 1, `${where}: regionId must be >= 1`)
      assert.ok(!ids.has(region.regionId), `${where}: duplicate regionId`)
      ids.add(region.regionId)
      assert.ok(files.has(region.mask), `${where}: missing ${region.mask}`)

      const [x, y, width, height] = region.bounds
      assert.ok(Number.isInteger(x) && Number.isInteger(y), `${where}: bounds are not integers`)
      assert.ok(width > 0 && height > 0, `${where}: size <= 0`)
      assert.ok(x >= 0 && y >= 0, `${where}: negative bounds`)
      assert.ok(x + width <= ART_SIZE && y + height <= ART_SIZE, `${where}: bounds exceed ${ART_SIZE}`)
    }
  }

  assert.equal(regions, TOTAL_REGIONS, 'total region count must match extracted 3.141 data')
})

test('generated catalog lists every picture folder once', async () => {
  const generated = await readFile(path.join(root, 'src', 'assets', 'catalog.generated.ts'), 'utf8')
  const keys = [...generated.matchAll(/^\s+key: '([^']+)',$/gm)].map((match) => match[1])

  assert.equal(keys.length, PACKS.length * PICTURES_PER_PACK)
  assert.equal(new Set(keys).size, keys.length, 'duplicate key in catalog.generated.ts')

  const pictures = await readPictures()
  for (const { pack, dir } of pictures) {
    assert.ok(keys.includes(`${pack}/${dir}`), `catalog missing ${pack}/${dir}`)
  }
})
