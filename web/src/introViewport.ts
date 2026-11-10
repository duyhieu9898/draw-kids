export interface IntroViewportWidget {
  canvas: HTMLCanvasElement
  skeleton: { x: number; y: number }
  mvp: { ortho2d(x: number, y: number, width: number, height: number): unknown }
  context: { gl: { viewport(x: number, y: number, width: number, height: number): void } }
  resize(): void
}

/** Match IntroScene::setupScene: origin at screen center, shorter axis 1076.
 * Setup-pose bounds include offstage props and MUST NOT determine the camera.
 * Keep JSON coordinates unscaled; apply the native scale once in projection.
 */
export function installIntroViewport(widget: IntroViewportWidget) {
  widget.resize = () => {
    const { canvas, skeleton, mvp, context } = widget
    const w = canvas.clientWidth
    const h = canvas.clientHeight
    if (w <= 0 || h <= 0) return
    const dpr = window.devicePixelRatio || 1
    const pixelWidth = Math.round(w * dpr)
    const pixelHeight = Math.round(h * dpr)
    if (canvas.width !== pixelWidth || canvas.height !== pixelHeight) {
      canvas.width = pixelWidth
      canvas.height = pixelHeight
    }
    const unitsPerPixel = 1076 / Math.min(w, h)
    const width = w * unitsPerPixel
    const height = h * unitsPerPixel
    skeleton.x = skeleton.y = 0
    mvp.ortho2d(-width / 2, -height / 2, width, height)
    context.gl.viewport(0, 0, canvas.width, canvas.height)
  }
}
