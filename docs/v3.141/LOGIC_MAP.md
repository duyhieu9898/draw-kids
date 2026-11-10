# 3.141 static logic map

Sources: original base APK metadata + original ARM64 split libil2cpp.so.
Metadata SHA-256 `74c297e59adca67550002c43eb95ecc814a8a14e5be97b96f47a3f7286d1a5d0`;
native SHA-256 `bd0f03471d09990aa35abd10ce590dbd315cf8854044f5ceee9ba120bbfe5261`.
REA summary, selected type/member inventories, and field types are retained as JSON in
reports/v3.141. `core-entrypoints.asm` is bounded Capstone ARM64 disassembly;
`entry-method-addresses.json` and `direct-callee-*.json` identify entry/callee addresses.
This is compiled artifact analysis, not recovered original C# source.

## Confirmed declarations

- `f+BrushTypes`: Marker, Pencil, Brush, Bucket, Spray, Shine, Pattern, Eraser.
- `f+PaletteTypes`: Color, Shine, Pattern. Numeric values have not been decoded.
- DrawingPage has layer selection, mask transform, image loader, trash/undo buttons,
  audio manager, layers/stroke, clear-all component, background texture, paintables and marker.
- LayerSelection implements OnPointerDown/OnPointerUp/OnDisable and carries a mask.
  This does not by itself prove whether a drag is clipped to its starting region.
- PaintablesController owns paintable prefab/instances, camera, texture and p3DMask.
- SaveImage has separate save/screenshot buttons, screenshot/stroke cameras,
  paintables, background, blocker and IAP tools.
- ManageTools declares tools/colors/eraser buttons and UndoPlaySound.
- Gallery classes include GalleryMenu, DynamicGalleryMenu, PacksList,
  LoadImage, LoadIcons and GalleryTouchSystem. Ordering/catalog IDs remain unverified.

## Confirmed native call flow

### Trash

`DrawingPage.OnButtonTrash` at 0x153c18c compares `Time.time` minus a stored
float at offset 0x90 with 2.0 seconds. For a delta greater than 2 it stores the
current time and starts a two-second DOMoveZ tween. For a delta at most 2 it
stores current time minus 3, kills the tween and calls the method mapped to
`ClearAll` at 0x1fcad0c; it also calls PlaySound and changes visual state.

Inference: this is a second-tap confirmation window, rather than immediate clear
on every tap. First-use behavior depends on initial field state and game time.
Pending user corroboration; clear's exact effect on saved versus draft layers and
Undo history still needs following the ClearAll implementation.

### Undo

`PaintablesController.Undo` at 0x153dbd0 contains a direct call to
`PaintIn3D.P3dPaintableTexture.Undo` at 0x1ff0768. This establishes reuse of the
PaintIn3D texture history mechanism. Cross-layer ordering, max history and state
retention are not established by this entry-point inspection.

### Save

`DrawingPage.OnSaveButtonUp` at 0x153c0dc is a single `ret`: it is a no-op in this
build. The function name alone must not be mapped to web save behavior.
`SaveImage.OnSave` at 0x15613fc activates a GameObject, invokes an indirect
callback, handles a platform-dependent score call, calls two obfuscated methods
and starts a coroutine. File encoding/path and subsequent gallery transition are
not yet resolved; follow the coroutine and actual scene button bindings.

### Intro

`IntroSceneDRA.PlaySpine` gets Spine AnimationState and registers a Complete
handler. `OnEndSpineAction` calls `OnEndSpineActionAsync` and Forget. This confirms
an animation-completion callback rather than proving a fixed delay.
Declarations also include PrepareNextSceneAsync, LoadNextScene and
LoadOnboardingSceneAsync. The packaged BuildSettings scene list is a registry,
not evidence of an unconditional Start -> Intro -> Menu -> Drawing -> Gallery flow.
Onboarding/first-run branches still need tracing.

## Extraction limits and remaining work

Some method and field names are obfuscated (ga, uk, etc.); their meaning must come
from bodies and scene bindings. Direct branch target mapping is complete only
within the retained static method table; runtime helpers, indirect calls and
generic instantiations can remain unresolved. No native gameplay parity is claimed.

Next follow-ups: ClearAll body and texture-history ordering; save coroutine;
intro scene settings/scale and completion branch; gallery/picture ID mapping.
