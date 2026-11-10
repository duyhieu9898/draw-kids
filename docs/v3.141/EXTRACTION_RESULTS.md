# Extraction and runtime compatibility results

All input is the user-selected 3.141 APKS. Source APKs and generated payloads stay
in ignored extracted/v3.141; scripts and JSON evidence remain in the repository.

| Item | Result | Evidence |
| --- | --- | --- |
| Object inventory | 53,491 objects in 18 containers | unity-objects.json |
| Asset catalog | 20,017 selected objects, no metadata read errors | unity-asset-catalog.json |
| Textures | 3,353 PNG exports; 32 zero-sized dynamic font placeholders | texture-exports.json |
| Sprite declarations | 3,675 reconstructed PNGs, zero decode errors; pivot/rect/PPU retained | unity-asset-catalog.json |
| Audio | 267 original payloads retained and 267 WAV exports, zero failures | audio-exports.json |
| Spine | 14 complete original JSON/atlas/texture sets | spine-bundles.json |
| Chrome compatibility | 14/14 parse and evaluate start/mid/end of each animation with official 3.8 runtime | spine-chrome-compatibility.json |
| Intro preview | Original mascot, logo and props render on white; 844×390 DPR3 | runtime/spine38-mobile-6.5s.png |

Evidence paths above are under reports/v3.141. Original audio payloads have SHA-256,
size and header bytes; decoder failure does not remove or replace original data.
Texture placeholder records have explicit status rather than fabricated PNGs.

The initial 252 audio FORMAT failures came from resource-name resolution: the parser selected a texture resS instead of a sibling audio resource file. The exporter now prefers the exact sibling audio file and its serialized offset/size. All 267 retained payloads start with FSB5; their WAV conversions succeed.

The local searchable asset viewer is http://127.0.0.1:4181/review.html (7,295 images/audio records). Rebuild its index with `python3 scripts/prepare_asset_review_v3141.py`.

## Reproduce the reference preview

After extraction and Spine packaging:

```sh
python3 scripts/prepare_spine_preview_v3141.py
python3 -m http.server 4181 --bind 127.0.0.1 --directory extracted/v3.141
```

Open http://127.0.0.1:4181/preview/ for playback or append `?t=6.5` to freeze a frame.
The runtime download is checked against the digest in spine-runtime-origin.json.
Its original license is retained beside the downloaded file. This is a local
research preview; runtime distribution/licensing has not been added to web yet.

Viewport uses a fixed centered 1080-high reference frame to check compatibility,
not setup-pose auto bounds. Unity camera is orthographic 5.4, but custom skeleton
scale/scene bindings have not all been recovered; exact native parity is pending.
Chrome output establishes runtime compatibility, not Android scene/audio parity.

## Delegation review

Agy produced SPINE_PAYLOADS.md and spine-payloads.json from source JSON. Parent
independently compared all 14 names to actual loaded bundles in Chrome and checked
intro duration (runtime 6.80000019s), bones (63), slots (52), and empty idle timelines.
Package inventory hashes were also checked against source APK bytes and REA.

## Remaining mapping work

Map drawing region/mask IDs, menu order and scene bindings. Sprite metadata and numeric-name grouping are available in sprite-exports.json and art-candidates.json. Continue ClearAll/save-coroutine tracing. User descriptions of first-run
onboarding, trash confirmation and save/back behavior supplement static evidence.
