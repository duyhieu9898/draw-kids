# Unity assets: 3.141

Parser: UnityPy 1.25.4. Script: `scripts/inventory_unity_v3141.py`.
Source: extracted base APK; evidence: `reports/v3.141/unity-objects.json`.

Read 18 containers and 53,491 serialized objects; no container/read errors reported.
These are object counts, not counts of unique pictures or verified playable content.

| Type | Objects |
| --- | ---: |
| Texture2D | 3,385 |
| Sprite | 3,675 |
| TextAsset | 42 |
| AudioClip | 267 |
| MonoBehaviour | 12,646 |
| PolygonCollider2D | 2,682 |
| Material | 510 |

## Spine payloads

| Name | Version | Animations | Source object |
| --- | --- | --- | --- |
| intro-drawing | 3.8.99 | intro | sharedassets1.assets:9 |
| insects | 3.8.99 | action, idle | sharedassets2.assets:201 |
| magic | 3.8.99 | action, idle | sharedassets2.assets:204 |
| ocean | 3.8.99 | action, idle | sharedassets2.assets:206 |
| school | 3.8.99 | action, idle | sharedassets2.assets:209 |
| dino | 3.8.99 | action, idle | sharedassets2.assets:211 |
| animals | 3.8.99 | action, idle | sharedassets2.assets:213 |
| dolls | 3.8.99 | action, idle | sharedassets2.assets:215 |
| music | 3.8.99 | action, idle | sharedassets2.assets:218 |
| halloween | 3.8.99 | action, idle | sharedassets2.assets:221 |
| christmas | 3.8.99 | action, idle | sharedassets2.assets:222 |
| food | 3.8.99 | action, idle | sharedassets2.assets:223 |
| vehicles | 3.8.99 | action, idle | sharedassets2.assets:224 |
| pop-up-drawing-an | 3.8.99 | bell, car, dino, items, notes, parrot, snow-man, stars | CAB-a5fd52a248b7c3492298e4180a59bab8:-3828652467745795968 |

Intro payload: `extracted/v3.141/unity-text/data.unity3d/sharedassets1.assets/9.bytes`.
All exported TextAssets retain bytes and SHA-256 in the inventory.

## Mapping decisions

- The 3.141 intro payload declares Spine 3.8.99. The old web widget is version 3.6.53; runtime compatibility must be validated against a 3.8 runtime before migration.
- Keep original skeleton, atlas, texture and timing together. Read Unity scene transforms and SkeletonData scale before choosing web viewport.
- Do not reuse the 3.101 camera constant 1076 as a verified new-version setting.
- Menu payload names establish available animations; they do not prove ordering, availability, unlock state or the complete picture catalog.
- Texture/audio extraction, prefab dependencies, Addressables catalog mapping and native gameplay capture are still pending.

Tool reference: [UnityPy documentation](https://github.com/K0lb3/UnityPy).

## Intro extraction and remaining limits

`extracted/v3.141/intro/` contains the original JSON, atlas and decoded 2048×512 texture.
Scene evidence: `reports/v3.141/intro-scene.json`; extraction script:
`scripts/extract_intro_v3141.py`. BuildSettings maps level1 to Assets/Scenes/Intro.unity.
The serialized intro Camera is orthographic, size approximately 5.4, with white RGB background.
The intro material enables straight-alpha input. These settings still need runtime corroboration.

Deep scene extraction read 301 records, of which 96 have explicit parse errors,
including the custom SkeletonData/Atlas MonoBehaviours. Object inventory succeeded,
but custom field layouts have not been recovered; do not infer skeleton scale or
final viewport from camera size alone. Recover compatible IL2CPP/type metadata or
corroborate with native runtime before implementing the new intro.
