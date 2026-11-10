# Migration reference 3.141

> **Tiến trình & Kế hoạch chi tiết hiện tại:** Xem tại [docs/v3.141/PROGRESS.md](PROGRESS.md).

## Scope and checkpoint

- Active reference: user-supplied `Kids-Color-Games-Baby-Drawing_3.141_apkcube.apks`.
- Recovery point: Git tag `version-1`, commit `a26e2fc`.
- Work branch: `reference-3.141`.
- Target remains React/Vite PWA, landscape; Chrome MCP mobile responsive verification as requested.
- This phase inventories and extracts the reference. Existing web assets/logic are not yet migrated.

## Verified package facts

REA inspected the actual base APK manifest: package `com.bimiboo.drawing`,
versionName `3.141`, versionCode `1369`, minSdk `29`, targetSdk `36`.
Launcher: `com.unity3d.player.UnityPlayerActivity`.
Evidence: `reports/v3.141/rea-package-summary.json`, parent evidence
`ev_e2ab5073e9c16523e653b6cb4edeb911f1b5c56313253559467199827d1487fa`.
This establishes declared identity, not signature authenticity or latest store release.

The outer package contains base.apk and split_config.arm64_v8a.apk.
The native split contains libunity.so and libil2cpp.so; metadata is in the base.
UnityPy read data.unity3d as Unity 6000.3.24f1. IL2CPP metadata has magic
0xfab11baf and version 39. Tool compatibility must be checked before deep code analysis.
The serialized data includes spine-unity classes and intro-drawing TextAssets.
The intro payload declares Spine 3.8.99; see [Unity assets](UNITY_ASSETS.md). The existing 3.6.53 web widget must not be assumed compatible.

## Runtime availability

`adb devices -l` reports no connected device. The sole installed AVD
A new Android 11/API 30 Google APIs x86_64 AVD boots with ARM64 translation (`libndk_translation.so`). Both `base.apk` and `split_config.arm64_v8a.apk` installed successfully with `adb install-multiple`. The launcher reaches `UnityPlayerActivity`, but UnityMain immediately aborts with SIGILL (signal 4); the captured frame is blank. Thus install/launch were exercised, but no gameplay behavior was observed. Evidence: `reports/v3.141/runtime/launch.png`, `launch-logcat.txt`. Do not label old Android captures as 3.141 evidence.

## Delegation

Antigravity CLI (`agy`) receives bounded package enumeration/hash work only.
Task: `reports/delegation/agy-v3141-inventory-task.txt`.
Output: `reports/v3.141/package-inventory.json` and `PACKAGE_INVENTORY.md`.
Parent agent reviews hashes/counts before relying on results. Gameplay conclusions,
renderer decisions and acceptance remain with the parent/user.

## Steps and acceptance

1. Package identity and split inventory: manifest verified; delegated inventory hashes/counts reviewed.
2. New Android runtime: installed/launched, but SIGILL in UnityMain prevents behavior capture; old behavior is historical only.
3. Unity extraction: inventory complete across 18 containers (53,491 objects), 42 TextAssets exported; intro JSON/atlas/texture exported; scene read is partial (96 of 301 records have parse errors). Custom MonoBehaviour layouts and remaining texture/audio/prefab exports are pending.
4. Delta/spec: link each screen, tool and asset to new-version evidence before implementation.
5. Vertical slice: intro, menu, gallery, one drawing, save/reopen, compared to native.
6. Expand and test: remaining mapped content, Chrome responsive, persistence, offline/cache upgrade.

## Documentation reconciliation

Existing docs/PLAN.md declares broad completion, while docs/BEHAVIOR.md retains
POC limitations and unknown behavior. These files describe historical 3.101 work;
their completion labels must not be inherited by 3.141. A passing web check alone
does not establish Android parity. New findings use VERIFIED (with evidence),
INFERRED, or UNKNOWN and record version/source.

## Static logic evidence

See [LOGIC_MAP.md](LOGIC_MAP.md) for native call-flow findings. Metadata 39 is decoded and linked to ARM64 method pointers; selected types/members and disassembly are now saved. Save-name-only inference was corrected: DrawingPage.OnSaveButtonUp is a no-op in this build. Trash has a two-second confirmation branch leading to ClearAll.

## Completed extraction pass

See [EXTRACTION_RESULTS.md](EXTRACTION_RESULTS.md): 3,353 original texture PNGs, all 14 Spine bundles, original payloads for all 267 audio clips, 267 WAV exports, and Chrome compatibility evidence. All 3,675 sprites are reconstructed; final scene calibration, picture bindings and behavior mapping remain open. Agy Spine report reviewed against independent Chrome loads.
