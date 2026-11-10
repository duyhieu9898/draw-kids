import { test } from 'node:test'
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import vm from 'node:vm'
import { installIntroViewport } from '../src/introViewport.ts'

const context = vm.createContext({ window: { devicePixelRatio: 3, addEventListener() {} }, document: { addEventListener() {} } })
vm.runInContext(readFileSync(new URL('../public/vendor/spine-widget-3.6.53.js', import.meta.url), 'utf8'), context)
globalThis.window = context.window
function fixture() {
  let camera
  const widget = {
    canvas: { clientWidth: 844, clientHeight: 390, width: 0, height: 0 },
    skeleton: { x: 0, y: 0 },
    bounds: { offset: { x: -728.815, y: -728.721 }, size: { x: 2614.471, y: 1567.956 } },
    config: { fitToCanvas: true },
    mvp: { ortho2d(...args) { camera = args } },
    context: { gl: { viewport() {} } },
    resize: context.spine.SpineWidget.prototype.resize,
  }
  installIntroViewport(widget)
  return { widget, project(x, y) { const [left, bottom, width, height] = camera; return [(x-left)/width, (y-bottom)/height] } }
}
test('native origin stays centered; props waiting above/below the stage stay offscreen', () => {
  const {widget, project} = fixture()
  widget.resize()
  assert.deepEqual(project(0, 0), [0.5, 0.5])
  assert.ok(project(72.78, 622.75)[1] > 1, 'waiting hat must be above viewport')
  assert.ok(project(-406.99, -703.52)[1] < 0, 'spare hands must be below viewport')
  assert.deepEqual(project(0, 538), [0.5, 1])
  assert.equal(widget.canvas.width, 2532)
  assert.equal(widget.canvas.height, 1170)
})
test('resize and DPR change preserve the native frame, without stretching', () => {
  const {widget, project} = fixture()
  widget.resize()
  widget.canvas.clientWidth = 1076
  widget.canvas.clientHeight = 1438
  window.devicePixelRatio = 2
  widget.resize()
  assert.deepEqual(project(538, 719), [1, 1])
  assert.equal(widget.canvas.width, 2152)
  assert.equal(widget.canvas.height, 2876)
  window.devicePixelRatio = 3
})
