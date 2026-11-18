import test from 'node:test'
import assert from 'node:assert/strict'
import {
  ART_SIZE,
  alphaIndex,
  fitRect,
  hitTest,
  insideArt,
  strokePathData,
  viewToArt,
} from '../src/domain/geometry.ts'

test('fitRect centres the art square and never scales up', () => {
  assert.deepEqual(fitRect(ART_SIZE, ART_SIZE), { scale: 1, x: 0, y: 0 })
  const wide = fitRect(1550, 775)
  assert.equal(wide.scale, 1)
  assert.equal(wide.x, 387.5)
  assert.equal(wide.y, 0)
  const empty = fitRect(0, 0)
  assert.deepEqual(empty, { scale: 0, x: 0, y: 0 })
})

test('viewToArt inverts fitRect at the centre and the art corners', () => {
  const fit = fitRect(1000, 600)
  const [cx, cy] = viewToArt(fit, 500, 300)
  assert.ok(Math.abs(cx - ART_SIZE / 2) < 1e-9)
  assert.ok(Math.abs(cy - ART_SIZE / 2) < 1e-9)
  const [x0, y0] = viewToArt(fit, fit.x, fit.y)
  assert.deepEqual([x0, y0], [0, 0])
})

test('alphaIndex keeps only pixels with alpha above zero', () => {
  const rgba = new Uint8Array([
    255, 0, 0, 255,
    0, 0, 0, 0,
    0, 255, 0, 1,
  ])
  assert.deepEqual(Array.from(alphaIndex(rgba, 3, 1)), [1, 0, 1])
})

test('hitTest walks regions backwards and respects bounds', () => {
  const region = (regionId, bounds, alpha) => ({
    regionId,
    bounds,
    width: bounds[2],
    height: bounds[3],
    alpha,
  })
  const lower = region(1, [0, 0, 10, 10], new Uint8Array(100).fill(1))
  const upper = region(2, [2, 2, 4, 4], new Uint8Array(16).fill(1))
  assert.equal(hitTest([lower, upper], 3, 3)?.regionId, 2)
  assert.equal(hitTest([lower, upper], 8, 8)?.regionId, 1)
  assert.equal(hitTest([lower, upper], 20, 20), null)

  const hole = region(3, [0, 0, 2, 2], new Uint8Array([0, 0, 0, 0]))
  assert.equal(hitTest([hole], 1, 1), null)
})

test('insideArt accepts the art square and rejects the letterbox', () => {
  assert.equal(insideArt(0, 0), true)
  assert.equal(insideArt(ART_SIZE - 0.1, ART_SIZE - 0.1), true)
  assert.equal(insideArt(-1, 10), false)
  assert.equal(insideArt(10, ART_SIZE), false)
})

test('strokePathData smooths through midpoints and keeps short strokes simple', () => {
  assert.equal(strokePathData([[1, 2]]), '')
  assert.equal(strokePathData([[0, 0], [10, 0]]), 'M 0 0 L 10 0')
  assert.equal(
    strokePathData([[0, 0], [10, 0], [10, 10]]),
    'M 0 0 Q 10 0 10 5 L 10 10',
  )
})
