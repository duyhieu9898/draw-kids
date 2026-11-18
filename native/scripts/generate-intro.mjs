#!/usr/bin/env node
/**
 * Builds a self-contained intro page for the WebView from the original
 * Spine 3.8 assets in assets/intro, then writes src/intro/intro-html.generated.ts.
 *
 * A WebView is the only way to run the 3.8 spine-webgl runtime inside Expo Go:
 * npm only ships spine-core 4.x, which cannot read 3.8.99 data
 * (see NATIVE_BEHAVIOR_TRACKER N03/N18). Run: npm run intro
 */
import { readFile, writeFile } from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const asset = (name) => path.join(root, 'assets', 'intro', name)
const outFile = path.join(root, 'src', 'intro', 'intro-html.generated.ts')

const [runtime, skeleton, atlas, texture] = await Promise.all([
  readFile(asset('spine-webgl.js'), 'utf8'),
  readFile(asset('intro-drawing.json'), 'utf8'),
  readFile(asset('intro-drawing.atlas'), 'utf8'),
  readFile(asset('intro-drawing.png')),
])

if (runtime.includes('</script>')) throw new Error('spine-webgl.js contains </script>')

// In the original file, the "Where Learning Begins" line and the (R) mark fade alpha over 0.43 s
// (1.90 -> 2.33 s). On a white background, that low-alpha phase looks like a block of white
// text that only darkens later. Concentrating the fade into the last 0.2 s keeps the gradual
// reveal while removing the long faint phase.
const TEXT_FADE_SLOTS = ['where-learning-begins', 'trade-mark']
const TEXT_FADE_SECONDS = 0.2

function compactTextFades(jsonText) {
  const data = JSON.parse(jsonText)
  const slots = data.animations?.intro?.slots ?? {}
  for (const name of TEXT_FADE_SLOTS) {
    const keys = slots[name]?.color
    if (!Array.isArray(keys) || keys.length === 0) continue
    const last = keys[keys.length - 1]
    for (const key of keys) {
      if (key.color === 'ffffff00' && key.time !== undefined && key.time > 0) {
        key.time = Math.max(0, last.time - TEXT_FADE_SECONDS)
      }
    }
  }
  return JSON.stringify(data)
}

const png = `data:image/png;base64,${texture.toString('base64')}`

const html = `<!doctype html>
<html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<style>
html,body{margin:0;padding:0;width:100%;height:100%;overflow:hidden;background:#ffffff}
canvas{position:absolute;inset:0;width:100%;height:100%;display:block}
</style></head>
<body>
<canvas id="stage"></canvas>
<script>${runtime}</script>
<script>
(function () {
  var skeletonJson = ${JSON.stringify(compactTextFades(skeleton))};
  var atlasText = ${JSON.stringify(atlas)};
  var textureSrc = ${JSON.stringify(png)};
  var canvas = document.getElementById('stage');
  var completed = false;

  function send(type, detail) {
    try {
      window.ReactNativeWebView.postMessage(JSON.stringify({ type: type, detail: detail || '' }));
    } catch (error) {}
  }
  function complete() {
    if (completed) return;
    completed = true;
    send('complete');
  }

  var context = new spine.webgl.ManagedWebGLRenderingContext(canvas);
  var renderer = new spine.webgl.SceneRenderer(canvas, context);
  var gl = context.gl;
  var skeleton = null;
  var state = null;
  var last = 0;
  var started = false;
  window.startIntro = function () {
    if (started || !state) return;
    started = true;
    state.setAnimation(0, 'intro', false);
    last = performance.now();
  };

  var image = new Image();
  image.onload = function () {
    try {
      var textureAtlas = new spine.TextureAtlas(atlasText, function () {
        return new spine.webgl.GLTexture(context, image);
      });
      var loader = new spine.SkeletonJson(new spine.AtlasAttachmentLoader(textureAtlas));
      var data = loader.readSkeletonData(skeletonJson);
      skeleton = new spine.Skeleton(data);
      state = new spine.AnimationState(new spine.AnimationStateData(data));
      state.addListener({ complete: complete });
      send('ready');
    } catch (error) {
      send('error', String(error));
      complete();
    }
  };
  image.onerror = function () {
    send('error', 'texture');
    complete();
  };
  image.src = textureSrc;

  function resize() {
    var dpr = window.devicePixelRatio || 1;
    canvas.width = Math.round(window.innerWidth * dpr);
    canvas.height = Math.round(window.innerHeight * dpr);
  }
  window.addEventListener('resize', resize);
  resize();

  function frame(now) {
    requestAnimationFrame(frame);
    if (!skeleton || !started) return;
    var delta = Math.min(0.05, (now - last) / 1000);
    last = now;
    if (delta < 0) delta = 0;
    state.update(delta);
    state.apply(skeleton);
    skeleton.updateWorldTransform();
    renderer.camera.viewportHeight = 1080;
    renderer.camera.viewportWidth = (1080 * window.innerWidth) / window.innerHeight;
    renderer.camera.position.set(0, 0, 0);
    gl.viewport(0, 0, canvas.width, canvas.height);
    gl.clearColor(1, 1, 1, 1);
    gl.clear(gl.COLOR_BUFFER_BIT);
    renderer.begin();
    renderer.drawSkeleton(skeleton, false);
    renderer.end();
  }
  requestAnimationFrame(frame);

  // Never leave the user stuck on a white screen if decoding fails silently.
  setTimeout(function () {
    if (!skeleton) {
      send('error', 'timeout');
      complete();
    }
  }, 8000);
})();
</script>
</body></html>
`

await writeFile(
  outFile,
  `// Generated by scripts/generate-intro.mjs — do not edit by hand.\nexport const INTRO_HTML = ${JSON.stringify(html)}\n`,
)
console.log(`intro: wrote ${path.relative(root, outFile)} (${Math.round(html.length / 1024)} KB)`)
