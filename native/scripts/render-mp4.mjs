import { readFile, writeFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';
import { spawn } from 'node:child_process';

const require = createRequire('/home/bap/.nvm/versions/node/v24.22.2/lib/node_modules/');
const puppeteer = require('puppeteer');

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const asset = (name) => path.join(root, 'assets', 'intro', name);
const ffmpegPath = '/home/bap/.nvm/versions/node/v24.22.2/lib/node_modules/@ffmpeg-installer/ffmpeg/node_modules/@ffmpeg-installer/linux-x64/ffmpeg';

const [runtime, skeleton, atlas, texture] = await Promise.all([
  readFile(asset('spine-webgl.js'), 'utf8'),
  readFile(asset('intro-drawing.json'), 'utf8'),
  readFile(asset('intro-drawing.atlas'), 'utf8'),
  readFile(asset('intro-drawing.png')),
]);

const TEXT_FADE_SLOTS = ['where-learning-begins', 'trade-mark'];
const TEXT_FADE_SECONDS = 0.2;

function compactTextFades(jsonText) {
  const data = JSON.parse(jsonText);
  const slots = data.animations?.intro?.slots ?? {};
  for (const name of TEXT_FADE_SLOTS) {
    const keys = slots[name]?.color;
    if (!Array.isArray(keys) || keys.length === 0) continue;
    const last = keys[keys.length - 1];
    for (const key of keys) {
      if (key.color === 'ffffff00' && key.time !== undefined && key.time > 0) {
        key.time = Math.max(0, last.time - TEXT_FADE_SECONDS);
      }
    }
  }
  return JSON.stringify(data);
}

const png = `data:image/png;base64,${texture.toString('base64')}`;

const html = `<!doctype html>
<html><head><meta charset="utf-8">
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
  
  var context = new spine.webgl.ManagedWebGLRenderingContext(canvas);
  var renderer = new spine.webgl.SceneRenderer(canvas, context);
  var gl = context.gl;
  var skeleton = null;
  var state = null;
  
  window.isReady = false;
  window.isComplete = false;
  
  var image = new Image();
  image.onload = function () {
    var textureAtlas = new spine.TextureAtlas(atlasText, function () {
      return new spine.webgl.GLTexture(context, image);
    });
    var loader = new spine.SkeletonJson(new spine.AtlasAttachmentLoader(textureAtlas));
    var data = loader.readSkeletonData(skeletonJson);
    skeleton = new spine.Skeleton(data);
    state = new spine.AnimationState(new spine.AnimationStateData(data));
    state.addListener({ complete: function() { window.isComplete = true; } });
    state.setAnimation(0, 'intro', false);
    
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    
    window.isReady = true;
  };
  image.src = textureSrc;

  window.renderStep = function(delta) {
    if (!skeleton || !state) return;
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
  };
})();
</script>
</body>
</html>`;

const tmpHtmlPath = path.join(root, 'scripts', 'temp-intro.html');
await writeFile(tmpHtmlPath, html, 'utf8');

console.log('Launching browser...');
const browser = await puppeteer.launch({
  headless: true,
  executablePath: '/usr/bin/google-chrome-stable',
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});

const page = await browser.newPage();
const width = 1920;
const height = 1080;
await page.setViewport({ width, height, deviceScaleFactor: 1 });
await page.goto(`file://${tmpHtmlPath}`);

await page.waitForFunction('window.isReady === true');
console.log('Page ready. Setting up ffmpeg stream...');

const outputMp4 = asset('intro.mp4');
const audioWav = asset('Drawing_intro.wav');

const fps = 60;
// Total duration: 7.3s (7.0s + 0.3s)
const duration = 7.3;
const animDuration = 6.8;
const totalFrames = Math.ceil(duration * fps);
const delta = 1 / fps;

// Audio offset 0.5s matching original sync
const ffmpeg = spawn(ffmpegPath, [
  '-y',
  '-f', 'image2pipe',
  '-vcodec', 'png',
  '-r', String(fps),
  '-i', '-',
  '-itsoffset', '0.5',
  '-i', audioWav,
  '-c:v', 'libx264',
  '-pix_fmt', 'yuv420p',
  '-preset', 'slow',
  '-crf', '18',
  '-c:a', 'aac',
  '-b:a', '192k',
  '-shortest',
  outputMp4
]);

let lastFrameBuffer = null;

for (let i = 0; i < totalFrames; i++) {
  const currentTime = i * delta;
  if (currentTime <= animDuration) {
    await page.evaluate((dt) => {
      window.renderStep(dt);
    }, delta);
    lastFrameBuffer = await page.screenshot({ type: 'png' });
    ffmpeg.stdin.write(lastFrameBuffer);
  } else {
    // Hold the completed last pose for the remaining 1.2s while audio finishes
    ffmpeg.stdin.write(lastFrameBuffer);
  }
  
  if (i % 60 === 0) {
    console.log(`Rendered frame ${i}/${totalFrames} (${Math.round((i/totalFrames)*100)}%)`);
  }
}

ffmpeg.stdin.end();

await new Promise((resolve, reject) => {
  ffmpeg.on('close', (code) => {
    if (code === 0) resolve();
    else reject(new Error(`ffmpeg exited with code ${code}`));
  });
});

console.log('Video render completed successfully:', outputMp4);
await browser.close();
