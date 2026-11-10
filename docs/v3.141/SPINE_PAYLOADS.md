# Spine Payloads Inventory: v3.141

**Scope**: Bounded delegated static analysis based exclusively on `reports/v3.141/unity-objects.json` and exported TextAssets under `extracted/v3.141/unity-text`.

> [!IMPORTANT]
> **Caveats & Analytical Boundaries**:
> 1. **Timeline Duration Disclaimer**: The timeline max key indicates the timestamp of the last explicit numeric keyframe in the exported Spine JSON payload. **The timeline max key is not necessarily the full runtime transition duration** (runtime playback may loop, mix, transition, or be governed by external Unity/C# controller logic).
> 2. **No Runtime/Gameplay Claims**: This report documents static serialized assets only; it makes no claims regarding gameplay flow, progression, unlock states, or runtime execution.
> 3. **Review Context**: This is bounded delegated analysis subject to parent review.

## Summary Table

| Payload Name | Scoped Source (Container : File : PathID) | Version | Bones | Slots | Skins | Animations (Last Numeric Key s) | Matching Atlas Candidate |
|---|---|:---:|---:|---:|---:|---|---|
| **intro-drawing** | bin/Data/data.unity3d : sharedassets1.assets : `9` | 3.8.99 | 63 | 52 | 1 | intro (6.8s) | `intro-drawing.atlas` |
| **insects** | bin/Data/data.unity3d : sharedassets2.assets : `201` | 3.8.99 | 1 | 19 | 1 | action (3.3333s), idle (none / empty) | `insects.atlas` |
| **magic** | bin/Data/data.unity3d : sharedassets2.assets : `204` | 3.8.99 | 1 | 15 | 1 | action (3.3333s), idle (none / empty) | `magic.atlas` |
| **ocean** | bin/Data/data.unity3d : sharedassets2.assets : `206` | 3.8.99 | 1 | 13 | 1 | action (3.3333s), idle (none / empty) | `ocean.atlas` |
| **school** | bin/Data/data.unity3d : sharedassets2.assets : `209` | 3.8.99 | 1 | 23 | 1 | action (3.3333s), idle (none / empty) | `school.atlas` |
| **dino** | bin/Data/data.unity3d : sharedassets2.assets : `211` | 3.8.99 | 1 | 14 | 1 | action (3.3333s), idle (none / empty) | `dino.atlas` |
| **animals** | bin/Data/data.unity3d : sharedassets2.assets : `213` | 3.8.99 | 1 | 11 | 1 | action (3.3333s), idle (none / empty) | `animals.atlas` |
| **dolls** | bin/Data/data.unity3d : sharedassets2.assets : `215` | 3.8.99 | 1 | 18 | 1 | action (3.3333s), idle (none / empty) | `dolls.atlas` |
| **music** | bin/Data/data.unity3d : sharedassets2.assets : `218` | 3.8.99 | 1 | 19 | 1 | action (3.3333s), idle (none / empty) | `music.atlas` |
| **halloween** | bin/Data/data.unity3d : sharedassets2.assets : `221` | 3.8.99 | 1 | 15 | 1 | action (3.3333s), idle (none / empty) | `halloween.atlas` |
| **christmas** | bin/Data/data.unity3d : sharedassets2.assets : `222` | 3.8.99 | 1 | 23 | 1 | action (3.3333s), idle (none / empty) | `christmas.atlas` |
| **food** | bin/Data/data.unity3d : sharedassets2.assets : `223` | 3.8.99 | 1 | 13 | 1 | action (3.3333s), idle (none / empty) | `food.atlas` |
| **vehicles** | bin/Data/data.unity3d : sharedassets2.assets : `224` | 3.8.99 | 2 | 19 | 1 | action (4s), idle (none / empty) | `vehicles.atlas` |
| **pop-up-drawing-an** | aa/Android/defaultlocalgroup_assets_assets_prefabs_paywalls_prefabs_fullgame.prefab_84123612d0882089a74e9fdbe1d26dfc.bundle : CAB-a5fd52a248b7c3492298e4180a59bab8 : `-3828652467745795968` | 3.8.99 | 45 | 64 | 1 | bell (1.6s), car (3.6667s), dino (3s), items (2.3s), notes (3.3333s), parrot (3.1667s), snow-man (4.3333s), stars (2.3333s) | `pop-up-drawing-an.atlas` |

---

## Detailed Payload Breakdowns

### 1. `intro-drawing`

- **Original Name**: `intro-drawing`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets1.assets`
- **Path ID**: `9`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets1.assets/9.bytes` (126,244 bytes, SHA-256: `ede7eb6a6873e94b074a44ee48b4632ee75da2d595fa96830b8aa3e49023e757`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `XOXtw4tgrw1dt3RjZJqBWQksQnk`, Dimensions: 269.07 × 509, Images Path: `./images/`, Audio Path: `E:/Project/Bimi_Boo/Sandbox/Intro`
- **Structural Counts**:
  - Bones: **63**
  - Slots: **52**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `intro` | `bones`, `deform`, `drawOrder`, `slots` | 765 | 6.8 s | Active keyframes |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets1.assets`: **1**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `intro-drawing.atlas` | `8` | ✅ **Yes** | `intro-drawing.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets1.assets/8.bytes` |


### 2. `insects`

- **Original Name**: `insects`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `201`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/201.bytes` (16,183 bytes, SHA-256: `033b444465d550635511e4590afce51215abd66cd6e524445c8ff19633da3b30`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `FPIi7v+Etce0K6QYiMs3tIWKJzc`, Dimensions: 199.06 × 196.06, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/insects`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **19**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 55 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `insects.atlas` | `220` | ✅ **Yes** | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 3. `magic`

- **Original Name**: `magic`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `204`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/204.bytes` (16,240 bytes, SHA-256: `fa5efacd77d1c673eb19cc40bf10ccfd8b5d502bb9e234613679fdacede818f9`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `T+FhzAfN9ULPzyC7OfTb4uD6UME`, Dimensions: 128 × 230, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/magic`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **15**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 50 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `magic.atlas` | `205` | ✅ **Yes** | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 4. `ocean`

- **Original Name**: `ocean`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `206`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/206.bytes` (17,537 bytes, SHA-256: `34b274f7d882e51a8d8f9e5980908109eb5c9eb93a2afd05cbfd285cd9e3cb5c`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `9HBXkq2UcBQWVyJBI/eF5uEgl9s`, Dimensions: 129 × 219, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/ocean`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **13**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 48 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `ocean.atlas` | `217` | ✅ **Yes** | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 5. `school`

- **Original Name**: `school`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `209`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/209.bytes` (27,684 bytes, SHA-256: `6ffebc1318d8cf12baf67b1d82150fe74ecfd9b478063763e20d476b1a9cd019`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `aV6FP0QKrNgwMGtAJBnVzPtwMqc`, Dimensions: 178 × 219, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/school`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **23**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 93 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `school.atlas` | `208` | ✅ **Yes** | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 6. `dino`

- **Original Name**: `dino`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `211`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/211.bytes` (23,795 bytes, SHA-256: `d41113de85ed7ae4b9140c4e17b212db1f7e825bc1abbcffc7303eeb1e216e26`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `lT0DHo9V0G5w2TmZR1t0hwBqzF8`, Dimensions: 185 × 219, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/dino`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **14**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 57 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `dino.atlas` | `216` | ✅ **Yes** | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 7. `animals`

- **Original Name**: `animals`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `213`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/213.bytes` (17,579 bytes, SHA-256: `b53d81e8a6611a67f5bb8a4fc25114839d10185e147f107d3640cd09e5c576d7`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `NjrgJnc2q/98vzXjOSU+zSLVHiE`, Dimensions: 199 × 203, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/animals`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **11**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 49 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `animals.atlas` | `219` | ✅ **Yes** | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 8. `dolls`

- **Original Name**: `dolls`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `215`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/215.bytes` (17,830 bytes, SHA-256: `5413a37fad4fb7852c98bea39917fbabe368381c6120df167bcef9f827c005b0`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `rWEGcPprHcGnlzGS6535xSDIijg`, Dimensions: 168 × 219, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/dolls`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **18**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 65 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `dolls.atlas` | `202` | ✅ **Yes** | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 9. `music`

- **Original Name**: `music`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `218`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/218.bytes` (29,601 bytes, SHA-256: `6b19e0ff2cde734454039b50917c85c6f1ed1fa3fb3be6e8f3d29c97e7266869`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `4ZRf0jcPQ13iFfeknb1Scg4Sx7k`, Dimensions: 170 × 219, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/music`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **19**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 95 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `music.atlas` | `214` | ✅ **Yes** | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 10. `halloween`

- **Original Name**: `halloween`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `221`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/221.bytes` (20,747 bytes, SHA-256: `542b7e9fdc2f99a91457c06659868b41fc9d218bb8899e15cf79cfe58eaeb635`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `IL/cjWrZ1A/qinV23YOJCL+QLTQ`, Dimensions: 199 × 184, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/halloween`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **15**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 60 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `halloween.atlas` | `207` | ✅ **Yes** | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 11. `christmas`

- **Original Name**: `christmas`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `222`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/222.bytes` (19,924 bytes, SHA-256: `701fcf7b42699935d9735496138e745143dfac9f00d21a6d96210d28a32d6086`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `E6SKd+RMlf9b8Zxz4bRqEWR6ftU`, Dimensions: 189 × 219, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/christmas`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **23**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 78 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `christmas.atlas` | `203` | ✅ **Yes** | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 12. `food`

- **Original Name**: `food`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `223`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/223.bytes` (12,083 bytes, SHA-256: `f8d2788ee908ba59ad3e505fe4b6e7105a64d8cdae74ac65811ab98ace9f3e4e`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `yint7/0XUQaJpw8ENncZn2mR9Sw`, Dimensions: 199 × 187, Images Path: `./images/`, Audio Path: `E:/1 нужные папки/Kimikosoft/Drawing/[DRA39] Animation Main Menu icons/food`
- **Structural Counts**:
  - Bones: **1**
  - Slots: **13**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 41 | 3.3333 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `food.atlas` | `210` | ✅ **Yes** | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |
| `vehicles.atlas` | `212` | No (co-packaged) | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |


### 13. `vehicles`

- **Original Name**: `vehicles`
- **Scoped Source Container**: `bin/Data/data.unity3d`
- **Serialized File**: `sharedassets2.assets`
- **Path ID**: `224`
- **Export File**: `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/224.bytes` (27,628 bytes, SHA-256: `e963d10a7f77d8110bf3d6520153d7c596c3b7b9367b6f2b69a99ab19b3aba68`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `OsSRNDA+aZxqxh0JcY92C593NHM`, Dimensions: 198 × 198, Images Path: `./images/`, Audio Path: `(none)`
- **Structural Counts**:
  - Bones: **2**
  - Slots: **19**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `action` | `deform`, `slots` | 84 | 4 s | Active keyframes |
| `idle` | (empty dict) | 0 | None | Empty timeline dictionary `{}` |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `sharedassets2.assets`: **12**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `vehicles.atlas` | `212` | ✅ **Yes** | `vehicles.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/212.bytes` |
| `animals.atlas` | `219` | No (co-packaged) | `animals.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/219.bytes` |
| `christmas.atlas` | `203` | No (co-packaged) | `christmas.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/203.bytes` |
| `dino.atlas` | `216` | No (co-packaged) | `dino.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/216.bytes` |
| `dolls.atlas` | `202` | No (co-packaged) | `dolls.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/202.bytes` |
| `food.atlas` | `210` | No (co-packaged) | `food.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/210.bytes` |
| `halloween.atlas` | `207` | No (co-packaged) | `halloween.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/207.bytes` |
| `insects.atlas` | `220` | No (co-packaged) | `insects.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/220.bytes` |
| `magic.atlas` | `205` | No (co-packaged) | `magic.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/205.bytes` |
| `music.atlas` | `214` | No (co-packaged) | `music.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/214.bytes` |
| `ocean.atlas` | `217` | No (co-packaged) | `ocean.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/217.bytes` |
| `school.atlas` | `208` | No (co-packaged) | `school.png` | `extracted/v3.141/unity-text/data.unity3d/sharedassets2.assets/208.bytes` |


### 14. `pop-up-drawing-an`

- **Original Name**: `pop-up-drawing-an`
- **Scoped Source Container**: `aa/Android/defaultlocalgroup_assets_assets_prefabs_paywalls_prefabs_fullgame.prefab_84123612d0882089a74e9fdbe1d26dfc.bundle`
- **Serialized File**: `CAB-a5fd52a248b7c3492298e4180a59bab8`
- **Path ID**: `-3828652467745795968`
- **Export File**: `extracted/v3.141/unity-text/defaultlocalgroup_assets_assets_prefabs_paywalls_prefabs_fullgame.prefab_84123612d0882089a74e9fdbe1d26dfc.bundle/CAB-a5fd52a248b7c3492298e4180a59bab8/-3828652467745795968.bytes` (88,256 bytes, SHA-256: `815b686f95617e458cecce37436cdda38712c022f055e40c59c9805c27604d27`)
- **Exact Spine Version**: `3.8.99`
- **Skeleton Metadata**: Hash: `u67zVy+d/Iu8/etI4TZw6971qvo`, Dimensions: 742.01 × 714, Images Path: `./images/`, Audio Path: `C:/Users/admin/Desktop/Новая папка (3)`
- **Structural Counts**:
  - Bones: **45**
  - Slots: **64**
  - Skins: **1** (Skin names: `default`)

**Animations Breakdown**:

| Animation Name | Timeline Channels | Numeric Keys Count | Last Numeric Time Key (s) | Notes |
|---|---|---:|---:|---|
| `bell` | `bones` | 5 | 1.6 s | Active keyframes |
| `car` | `bones` | 12 | 3.6667 s | Active keyframes |
| `dino` | `bones`, `slots` | 62 | 3 s | Active keyframes |
| `items` | `bones` | 32 | 2.3 s | Active keyframes |
| `notes` | `bones` | 32 | 3.3333 s | Active keyframes |
| `parrot` | `bones`, `slots` | 126 | 3.1667 s | Active keyframes |
| `snow-man` | `bones` | 269 | 4.3333 s | Active keyframes |
| `stars` | `bones` | 68 | 2.3333 s | Active keyframes |

**Atlas Candidates in Same Serialized File**:

Total atlas candidates in `CAB-a5fd52a248b7c3492298e4180a59bab8`: **1**

| Atlas TextAsset | Path ID | Exact Match? | Declared Texture Page(s) | Export Path |
|---|---:|:---:|---|---|
| `pop-up-drawing-an.atlas` | `-1342860290518334678` | ✅ **Yes** | `pop-up-drawing-an.png` | `extracted/v3.141/unity-text/defaultlocalgroup_assets_assets_prefabs_paywalls_prefabs_fullgame.prefab_84123612d0882089a74e9fdbe1d26dfc.bundle/CAB-a5fd52a248b7c3492298e4180a59bab8/-1342860290518334678.bytes` |


---

## Observations & Technical Notes

1. **Uniform Spine Version**: All 14 discovered Spine JSON TextAssets target exact version `3.8.99`.
2. **Asset Packaging Distribution**:

   - `bin/Data/data.unity3d` -> `sharedassets1.assets`: 1 Spine payload (`intro-drawing`), 1 companion atlas (`intro-drawing.atlas`).
   - `bin/Data/data.unity3d` -> `sharedassets2.assets`: 12 category Spine payloads (`insects`, `magic`, `ocean`, `school`, `dino`, `animals`, `dolls`, `music`, `halloween`, `christmas`, `food`, `vehicles`) paired 1:1 with 12 matching `.atlas` TextAssets in the same serialized file.
   - `aa/Android/...prefab_84123612d0882089a74e9fdbe1d26dfc.bundle` -> `CAB-a5fd52a248b7c3492298e4180a59bab8`: 1 paywall Spine payload (`pop-up-drawing-an`) paired 1:1 with `pop-up-drawing-an.atlas`.
3. **Idle Animations**: In all 12 category payloads in `sharedassets2.assets`, the `idle` animation definition is an empty object (`{}`). There are 0 timeline keys, meaning static/default pose at runtime unless animated via code.
4. **Max Timeline Key vs Runtime Duration**: The last numeric time key reflects the highest time offset in seconds explicitly defined on any bone, slot, or deform timeline in the JSON. Actual runtime duration, blending, loop cycles, or state transitions are determined by Unity runtime scripts and cannot be inferred from static JSON keys alone.
