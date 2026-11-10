# Scene Index & Serialized Hierarchy (v3.141)

**Source:** `reports/v3.141/scene-structure.json`  
**Extracted Unity Build Settings:**
- `level2` (`Assets/Scenes/DrawingMainMenu.unity`): 370 GameObjects, 370 Transforms/RectTransforms, 502 MonoBehaviours
- `level4` (`Assets/Scenes/DrawingPages.unity`): 522 GameObjects, 522 Transforms/RectTransforms, 812 MonoBehaviours
- `level6` (`Assets/Scenes/Gallery.unity`): 54 GameObjects, 54 Transforms/RectTransforms, 67 MonoBehaviours

---

## 1. Scene Level & Hierarchy Roots

### `level2`: DrawingMainMenu (`Assets/Scenes/DrawingMainMenu.unity`)
Top-level root GameObjects (Father Path ID = 0):
- **GO 1** `MenuLifetimeScope` (Transform ID 371) — Component: `MenuLifetimeScope` (ID 1082)
- **GO 12** `CanvasRestore-Variant1(2)` (RectTransform ID 730) — Components: `Canvas` (711), `CanvasScaler` (1158), `GraphicRaycaster` (1157), `RestoreButton` (1156), `bs` (1159)
- **GO 17** `[NewScroll]` (RectTransform ID 735) — Components: `ScrollController` (1165), `Canvas` (712), `CanvasScaler` (1164), `GraphicRaycaster` (1163)
- **GO 20** `[IAP-popup]` (RectTransform ID 738) — Components: `Canvas` (713), `CanvasScaler` (1169), `GraphicRaycaster` (1168), `MenuIAP` (1170)
- **GO 22** `Canvas-DEBUG` (RectTransform ID 740) — Components: `Canvas` (714), `CanvasScaler` (1174), `GraphicRaycaster` (1173), `DebugPaywalls` (1172)
- **GO 24** `[InAppPurchaseManager]` (Transform ID 372) — Components: `InAppPurchaseManager` (1582), `ManagePreloader` (1175)
- **GO 25** `CanvasRestore-OriginalCocos` (RectTransform ID 742) — Components: `Canvas` (715), `CanvasScaler` (1177), `GraphicRaycaster` (1176), `RestoreButton` (1178), `bs` (1179)
- **GO 63** `Main Camera` (Transform ID 373) — Components: `Camera` (383), `AudioListener` (384)
- **GO 74** `MainMenuController` (Transform ID 374) — Component: `MainMenuController` (1245)
- **GO 76** `PackAnimationController` (Transform ID 375) — Components: `PackAnimationController` (1247), `PackVisibilityChecker` (1246)
- **GO 107** `ParentalGateMathCanvas` (RectTransform ID 808) — Components: `Canvas` (716), `CanvasScaler` (1255), `GraphicRaycaster` (1256), `CanvasGroup` (1080), `ParentalGateMath` (1254)
- **GO 133** `Shelf Canvas Controller` (RectTransform ID 846) — Components: `Canvas` (717), `CanvasScaler` (1371), `GraphicRaycaster` (1370), `ShelfCanvasController` (1567), `MonoBehaviour` (1139)
- **GO 218** `SimplifyCanvas` (RectTransform ID 989) — Components: `Canvas` (718), `CanvasScaler` (1461), `GraphicRaycaster` (1462)

### `level4`: DrawingPages (`Assets/Scenes/DrawingPages.unity`)
Top-level root GameObjects (Father Path ID = 0):
- **GO 4** `ScreenShotLayer` (RectTransform ID 1057) — `Canvas` (1052), `CanvasScaler` (1557), `GraphicRaycaster` (1556), `ScreenShotLayer` (1558)
- **GO 6** `[ChoosePaintables]` (Transform ID 523) — `ChoosePaintables` (1560)
- **GO 13** `[SetupBrushes]` (Transform ID 524) — `SetupBrushes` (1571)
- **GO 21** `DrawingPage` (Transform ID 526) — Container hierarchy (holds `LayerSelectionManager`, `boardSecondary`, `transform-for-shines`, `transform-for-patterns`, `brushes`, `mask`)
- **GO 22** `[ChangeBoardSize]` (Transform ID 527) — `ChangeBoardSize` (1581)
- **GO 23** `ScreenShotStrokeCamera ` (Transform ID 528) — `Camera` (552), `AudioListener` (559), `Physics2DRaycaster` (1582)
- **GO 27** `IconScreenShotCamera` (Transform ID 530) — `Camera` (553), `AudioListener` (560), `Physics2DRaycaster` (1589)
- **GO 32** `Main Camera` (Transform ID 532) — `Camera` (554), `AudioListener` (561), `Physics2DRaycaster` (1595)
- **GO 33** `[Save Load]` (Transform ID 533) — `SaveImage` (1597), `LoadImage` (1596)
- **GO 36** `GameplayLifetimeScope` (Transform ID 534) — `GameplayLifetimeScope` (1547)
- **GO 48** `[Drawing Page]` (Transform ID 535) — `DrawingPage` (1614)
- **GO 59** `ScreenShotCamera` (Transform ID 540) — `Camera` (555), `AudioListener` (562), `Physics2DRaycaster` (1628)
- **GO 60** `PaintablesController` (Transform ID 541) — `PaintablesController` (1629)
- **GO 75** `Tools and Palettes` (RectTransform ID 1105) — `Canvas` (1053), `CanvasScaler` (1658), `GraphicRaycaster` (1657)
- **GO 83** `ScriptedParticleSystem` (Transform ID 546) — `ParticleEffectManager` (1667)

### `level6`: Gallery (`Assets/Scenes/Gallery.unity`)
Top-level root GameObjects (Father Path ID = 0):
- **GO 4** `[LoadCacheIcons]` (Transform ID 55) — `LoadIcons` (175)
- **GO 6** `HUDCanvas` (RectTransform ID 130) — `Canvas` (123), `CanvasScaler` (177), `GraphicRaycaster` (176)
- **GO 7** `ScrollCanvas` (RectTransform ID 131) — `Canvas` (124), `CanvasScaler` (179), `GraphicRaycaster` (178), `GalleryController` (180)
- **GO 11** `LifetimeScope` (Transform ID 56) — `GalleryLifetimeScope` (171)
- **GO 16** `[IAP-popup]` (RectTransform ID 139) — `Canvas` (125), `CanvasScaler` (190), `GraphicRaycaster` (189), `MenuIAP` (188)
- **GO 21** `[CustomSpirte]` (Transform ID 57) — `SpriteRenderer` (88)
- **GO 25** `Main Camera` (Transform ID 58) — `Camera` (66), `FlareLayer` (69), `AudioListener` (67)

---

## 2. Menu Pack Roots & Content Hierarchy (`level2`)

### Parent Ancestry Chain to `Content`
```
GO 17 "[NewScroll]" (RectTransform ID 735)
  └─ GO 6 "SafeAreaRoot" (RectTransform ID 724)
       └─ GO 46 "ScrollRect" (RectTransform ID 763)
            └─ GO 14 "Viewport" (RectTransform ID 732)
                 └─ GO 40 "Content" (RectTransform ID 757)
```

### Parent GameObject: `Content` (GO ID 40)
- **RectTransform ID:** 757
- **m_Father:** Path ID 732 (`Viewport`)
- **Serialized Transform/RectTransform:**
  - `m_LocalPosition`: `{"x": 0.0, "y": 0.0, "z": 0.0}`
  - `m_LocalRotation`: `{"x": 0.0, "y": 0.0, "z": 0.0, "w": 1.0}`
  - `m_LocalScale`: `{"x": 1.0, "y": 1.0, "z": 1.0}`
  - `m_AnchoredPosition`: `{"x": -0.001708984375, "y": 0.0}`
  - `m_SizeDelta`: `{"x": 2436.0, "y": 0.0}`
  - `m_Pivot`: `{"x": 0.0, "y": 1.0}`
  - `m_AnchorMin`: `{"x": 0.0, "y": 0.0}`
  - `m_AnchorMax`: `{"x": 0.0, "y": 1.0}`
- **Attached Component Header Classes:**
  - `RectTransform` (ID 757)
  - `GridLayoutGroup` (ID 1195) — Class: `UnityEngine.UI.GridLayoutGroup`, Assembly: `UnityEngine.UI`
  - `HorizontalGridSizer` (ID 1196) — Class: `BimiBoo.Drawing.MainMenu.HorizontalGridSizer`, Assembly: `Assembly-CSharp`

---

### Pack Roots Serialized Order & Properties
The 12 menu packs are indexed in `Content` RectTransform `m_Children` in the exact serialized sequence below:

| Index | Pack Root Name | GO ID | RectTransform ID | AnchoredPosition | SizeDelta | Pivot | AnchorMin / AnchorMax | Active |
|:---:|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | `animals` | 202 | 796 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 1 | `music` | 210 | 805 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 2 | `food` | 211 | 806 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 3 | `insects` | 208 | 803 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 4 | `dolls` | 204 | 798 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 5 | `magic` | 207 | 802 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 6 | `dinosaurs` | 213 | 800 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 7 | `school` | 209 | 804 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 8 | `ocean` | 206 | 797 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 9 | `halloween` | 214 | 801 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 10 | `christmas` | 212 | 807 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |
| 11 | `vehicles` | 205 | 799 | `(0.0, 0.0)` | `(0.0, 0.0)` | `(0.5, 0.5)` | `(0.0, 0.0)` / `(0.0, 0.0)` | True |

*(Note: Serialized `m_LocalPosition` is `(0.0, 0.0, 0.0)` and `m_LocalScale` is `(1.0, 1.0, 1.0)` for all 12 pack roots.)*

### Serialized Component Identities per Pack Root
Each pack root GameObject shares the identical 6-component structure:
1. `RectTransform`
2. `CanvasRenderer`
3. `Image` — Class: `UnityEngine.UI.Image`, Namespace: `UnityEngine.UI`, Assembly: `UnityEngine.UI`
4. `Button` — Class: `UnityEngine.UI.Button`, Namespace: `UnityEngine.UI`, Assembly: `UnityEngine.UI`
5. `MainMenuPack` — Class: `BimiBoo.Drawing.MainMenu.MainMenuPack`, Namespace: `BimiBoo.Drawing.MainMenu`, Assembly: `Assembly-CSharp`
6. `PackAnimatedIcon` — Class: `BimiBoo.Drawing.MainMenu.PackAnimatedIcon`, Namespace: `BimiBoo.Drawing.MainMenu`, Assembly: `Assembly-CSharp`

Component Path IDs per pack:
- `animals` (GO 202): RT 796, CR 710, Image 1539, Button 1396, MainMenuPack 1353, PackAnimatedIcon 1315
- `music` (GO 210): RT 805, CR 694, Image 1528, Button 1405, MainMenuPack 1360, PackAnimatedIcon 1319
- `food` (GO 211): RT 806, CR 689, Image 1533, Button 1406, MainMenuPack 1365, PackAnimatedIcon 1324
- `insects` (GO 208): RT 803, CR 692, Image 1530, Button 1403, MainMenuPack 1361, PackAnimatedIcon 1320
- `dolls` (GO 204): RT 798, CR 697, Image 1536, Button 1398, MainMenuPack 1356, PackAnimatedIcon 1326
- `magic` (GO 207): RT 802, CR 691, Image 1531, Button 1404, MainMenuPack 1362, PackAnimatedIcon 1321
- `dinosaurs` (GO 213): RT 800, CR 688, Image 1534, Button 1400, MainMenuPack 1358, PackAnimatedIcon 1317
- `school` (GO 209): RT 804, CR 693, Image 1529, Button 1402, MainMenuPack 1363, PackAnimatedIcon 1322
- `ocean` (GO 206): RT 797, CR 695, Image 1538, Button 1397, MainMenuPack 1355, PackAnimatedIcon 1325
- `halloween` (GO 214): RT 801, CR 687, Image 1535, Button 1401, MainMenuPack 1359, PackAnimatedIcon 1318
- `christmas` (GO 212): RT 807, CR 690, Image 1532, Button 1407, MainMenuPack 1364, PackAnimatedIcon 1323
- `vehicles` (GO 205): RT 799, CR 696, Image 1537, Button 1399, MainMenuPack 1357, PackAnimatedIcon 1327

---

### Pack Children Order & Subtrees
Every pack GameObject contains exactly 4 serialized children in identical order:

```
Pack Root GameObject
  ├─ [0] ButtonImage (RectTransform, CanvasRenderer, UnityEngine.UI.Image)
  ├─ [1] Spine Pivot (RectTransform)
  │        └─ Spine (RectTransform)
  │             ├─ BG (Image, serialized m_IsActive: False)
  │             ├─ Objects (Image, serialized m_IsActive: False, 10 Leaf/Flower Image children)
  │             └─ SkeletonGraphic (zoo) (CanvasRenderer, Spine.Unity.SkeletonGraphic)
  ├─ [2] Text (TMP) (RectTransform, TMPTextSizeAdjuster, CanvasRenderer, TextMeshProUGUI, Localize)
  └─ [3] LockRoot (RectTransform, CanvasRenderer, UnityEngine.UI.Image, serialized m_IsActive: False)
```

#### Serialized Coordinates and IDs for Children
- **Child 0: `ButtonImage`**
  - Serialized Pos: `m_LocalPosition: (0, 0, 0)`, `m_AnchoredPosition: (0, 0)`, `m_SizeDelta: (0, 0)`
  - Active: `True`
  - IDs: `animals` (GO 294 / RT 859), `music` (GO 286 / RT 868), `food` (GO 285 / RT 865), `insects` (GO 287 / RT 867), `dolls` (GO 292 / RT 862), `magic` (GO 288 / RT 866), `dinosaurs` (GO 295 / RT 858), `school` (GO 289 / RT 869), `ocean` (GO 290 / RT 863), `halloween` (GO 282 / RT 870), `christmas` (GO 284 / RT 864), `vehicles` (GO 291 / RT 861).

- **Child 1: `Spine Pivot`**
  - Serialized `m_SizeDelta`: `(0, 0)`, `m_LocalPosition: (0, 0, 0)`
  - Serialized `m_AnchoredPosition` per pack:
    - `animals`: `(0.0, 13.90)` (GO 129 / RT 1027)
    - `music`: `(4.70, 38.40)` (GO 121 / RT 1059)
    - `food`: `(0.0, 29.60)` (GO 124 / RT 1060)
    - `insects`: `(2.90, 33.60)` (GO 123 / RT 1057)
    - `dolls`: `(0.0, 32.20)` (GO 127 / RT 1058)
    - `magic`: `(0.0, 13.90)` (GO 122 / RT 1052)
    - `dinosaurs`: `(0.0, 28.70)` (GO 130 / RT 1054)
    - `school`: `(1.50, 28.20)` (GO 120 / RT 1056)
    - `ocean`: `(1.50, 31.00)` (GO 126 / RT 1051)
    - `halloween`: `(-0.90, 35.00)` (GO 119 / RT 1055)
    - `christmas`: `(-1.20, 13.10)` (GO 125 / RT 1061)
    - `vehicles`: `(0.40, 42.40)` (GO 128 / RT 1053)

- **Child 2: `Text (TMP)`**
  - Serialized Pos: `m_LocalPosition: (0, 0, 0)`, `m_AnchoredPosition: (1.0, -120.70)`, `m_SizeDelta: (263.55, 73.0)`
  - Active: `True`
  - Component Classes: `TMPTextSizeAdjuster` (`BimiBoo.Drawing.MainMenu.TMPTextSizeAdjuster`), `TextMeshProUGUI` (`TMPro.TextMeshProUGUI`), `Localize` (`I2.Loc.Localize`)
  - IDs: `animals` (GO 346 / RT 922), `music` (GO 341 / RT 928), `food` (GO 338 / RT 931), `insects` (GO 340 / RT 929), `dolls` (GO 345 / RT 924), `magic` (GO 339 / RT 930), `dinosaurs` (GO 348 / RT 921), `school` (GO 342 / RT 927), `ocean` (GO 343 / RT 926), `halloween` (GO 335 / RT 934), `christmas` (GO 337 / RT 932), `vehicles` (GO 344 / RT 925).

- **Child 3: `LockRoot`**
  - Serialized Pos: `m_LocalPosition: (0, 0, 0)`, `m_AnchoredPosition: (91.0, 133.0)`, `m_SizeDelta: (70.0, 70.0)`
  - Active: **`False`** (serialized inactive across all 12 packs)
  - Component Classes: `RectTransform`, `CanvasRenderer`, `Image` (`UnityEngine.UI.Image`)
  - IDs: `animals` (GO 189 / RT 936), `music` (GO 185 / RT 944), `food` (GO 186 / RT 945), `insects` (GO 184 / RT 943), `dolls` (GO 180 / RT 941), `magic` (GO 182 / RT 947), `dinosaurs` (GO 190 / RT 935), `school` (GO 183 / RT 942), `ocean` (GO 177 / RT 940), `halloween` (GO 181 / RT 948), `christmas` (GO 187 / RT 946), `vehicles` (GO 179 / RT 939).

---

## 3. Drawing Buttons & Actions (`level4`)

### Container Ancestry
```
GO 75 "Tools and Palettes" (RectTransform ID 1105)
  └─ GO 68 "ManageTools" (RectTransform ID 1099)
       ├─ GO 11 "TopContainer" (RectTransform ID 1063)
       │    ├─ GO 90 "Save" (RectTransform ID 1118)
       │    └─ GO 8 "ScreenShot" (RectTransform ID 1060)
       ├─ GO 52 "BottomContainer" (RectTransform ID 1090)
       │    ├─ GO 100 "Undo" (RectTransform ID 1126)
       │    └─ GO 3 "Trash" (RectTransform ID 1056)
       └─ GO 96 "BigToolButtons" (RectTransform ID 1122)
            ├─ GO 63 "color" (RectTransform ID 1096)
            ├─ GO 360 "tools new" (RectTransform ID 1377)
            └─ GO 73 "eraser" (RectTransform ID 1103)
```

### Action Buttons

#### 1. `Trash`
- **GameObject:** ID 3, `m_Name: "Trash"`, `m_IsActive: True`
- **Parent:** `BottomContainer` (GO 52, RT 1090)
- **RectTransform ID:** 1056
- **Serialized Transform/RectTransform:**
  - `m_LocalPosition`: `{"x": 0.0, "y": 0.0, "z": -24.600000381469727}`
  - `m_AnchoredPosition`: `{"x": 0.0, "y": 0.0}`
  - `m_SizeDelta`: `{"x": 116.0, "y": 113.0}`
  - `m_Pivot`: `{"x": 0.5, "y": 0.5}`
  - `m_AnchorMin` / `m_AnchorMax`: `{"x": 0.0, "y": 0.0}`
- **Attached Component Header Classes:**
  - `RectTransform` (ID 1056)
  - `CanvasRenderer` (ID 570)
  - `Image` (ID 1555) — Class: `UnityEngine.UI.Image`, Assembly: `UnityEngine.UI`
  - `Button` (ID 1554) — Class: `UnityEngine.UI.Button`, Assembly: `UnityEngine.UI`
- **Children:**
  - `pressed` (GO ID 105, RT ID 1131, `Image` 1700, serialized `m_IsActive: False`)
  - `clearAll` (GO ID 14, RT ID 1065, serialized `m_IsActive: True`)
    - Component: `P3dButtonClearAll` (ID 1572) — Class: `PaintIn3D.P3dButtonClearAll`, Namespace: `PaintIn3D`, Assembly: `PaintIn3D`

#### 2. `Undo`
- **GameObject:** ID 100, `m_Name: "Undo"`, `m_IsActive: True`
- **Parent:** `BottomContainer` (GO 52, RT 1090)
- **RectTransform ID:** 1126
- **Serialized Transform/RectTransform:**
  - `m_LocalPosition`: `{"x": 0.0, "y": 0.0, "z": 0.0}`
  - `m_AnchoredPosition`: `{"x": 0.0, "y": 0.0}`
  - `m_SizeDelta`: `{"x": 116.0, "y": 113.0}`
  - `m_Pivot`: `{"x": 0.5, "y": 0.5}`
  - `m_AnchorMin` / `m_AnchorMax`: `{"x": 0.0, "y": 0.0}`
- **Attached Component Header Classes:**
  - `RectTransform` (ID 1126)
  - `CanvasRenderer` (ID 631)
  - `Image` (ID 1690) — Class: `UnityEngine.UI.Image`, Assembly: `UnityEngine.UI`
  - `Button` (ID 1689) — Class: `UnityEngine.UI.Button`, Assembly: `UnityEngine.UI`
  - `MonoBehaviour` (ID 1688) — References external MonoScript `m_Script: {"m_FileID": 1, "m_PathID": 2478}` (`PaintIn3D.P3dButtonUndoAll` in `globalgamemanagers.assets`)
- **Children:**
  - `pressed` (GO ID 89, RT ID 1117, `Image` 1676, serialized `m_IsActive: False`)

#### 3. `Save`
- **GameObject:** ID 90, `m_Name: "Save"`, `m_IsActive: True`
- **Parent:** `TopContainer` (GO 11, RT 1063)
- **RectTransform ID:** 1118
- **Serialized Transform/RectTransform:**
  - `m_LocalPosition`: `{"x": 0.0, "y": 0.0, "z": 0.0}`
  - `m_AnchoredPosition`: `{"x": 0.0, "y": 0.0}`
  - `m_SizeDelta`: `{"x": 116.0, "y": 113.0}`
  - `m_Pivot`: `{"x": 0.5, "y": 0.5}`
  - `m_AnchorMin` / `m_AnchorMax`: `{"x": 0.0, "y": 0.0}`
- **Attached Component Header Classes:**
  - `RectTransform` (ID 1118)
  - `CanvasRenderer` (ID 624)
  - `Image` (ID 1678) — Class: `UnityEngine.UI.Image`, Assembly: `UnityEngine.UI`
  - `Button` (ID 1677) — Class: `UnityEngine.UI.Button`, Assembly: `UnityEngine.UI`
- **Children:**
  - `pressed` (GO ID 61, RT ID 1095, `Image` 1633, serialized `m_IsActive: False`)

#### 4. `ScreenShot`
- **GameObject:** ID 8, `m_Name: "ScreenShot"`, `m_IsActive: True`
- **Parent:** `TopContainer` (GO 11, RT 1063)
- **RectTransform ID:** 1060
- **Serialized Transform/RectTransform:**
  - `m_LocalPosition`: `{"x": 0.0, "y": 0.0, "z": 0.0}`
  - `m_AnchoredPosition`: `{"x": 0.0, "y": 0.0}`
  - `m_SizeDelta`: `{"x": 116.0, "y": 113.0}`
- **Attached Component Header Classes:**
  - `RectTransform` (ID 1060), `CanvasRenderer` (ID 573), `Image` (ID 1564), `Button` (ID 1563)
- **Children:**
  - `pressed` (GO ID 38, RT ID 1079, `Image` 1603, serialized `m_IsActive: False`)

#### 5. Additional Tool / Popup Buttons in `level4`
- **GO 63 `color`** (RT ID 1096, parent `BigToolButtons` GO 96): `Button` (1634), `Image` (1635), `ToolColors` (1636)
- **GO 360 `tools new`** (RT ID 1377, parent `BigToolButtons` GO 96): `Button` (2115), `Image` (2116), `ButtonTools` (1973)
- **GO 73 `eraser`** (RT ID 1103, parent `BigToolButtons` GO 96): `Button` (1654), `Image` (1655), `ButtonTools` (1758)
- **GO 2 `close-area`** (RT ID 1055, parent `BuyMenuPopup` GO 101): `Button` (1552), `Image` (1553)
- **GO 12 `close button`** (RT ID 1064, parent `Variant1(2)` GO 42 in `BuyMenuPopup`): `Button` (1569), `Image` (1570)
- **GO 103 `Restore Button`** (RT ID 1129, parent `Variant1(2)` GO 42 in `BuyMenuPopup`): `Button` (1695), `Image` (1696), `ParentalGatePositionController` (1694)
- **GO 37 `LockPanel_small`** (RT ID 1078, parent `Tools and Palettes` GO 75): `Button` (1601), `Image` (1602), `LockPanel` (1600), serialized `m_IsActive: False`
- **GO 104 `LockPanel_big`** (RT ID 1130, parent `Tools and Palettes` GO 75): `Button` (1697), `Image` (1698), `LockPanel` (1699), serialized `m_IsActive: False`

### Drawing Page Controllers & Roots
- **GO 33 `[Save Load]`** (Transform ID 533):
  - LocalPos: `(0, 0, 0.1)`
  - Components: `SaveImage` (ID 1597, Assembly: `Assembly-CSharp`), `LoadImage` (ID 1596, Assembly: `Assembly-CSharp`)
  - Children: `BackTexture` (GO 91), `Fon_back` (GO 58)
- **GO 48 `[Drawing Page]`** (Transform ID 535):
  - LocalPos: `(0, 0, 0)`
  - Component: `DrawingPage` (ID 1614, Assembly: `Assembly-CSharp`)
- **GO 21 `DrawingPage`** (Transform ID 526):
  - LocalPos: `(0, 0, 0)`
  - Children: `LayerSelectionManager` (GO 88), `boardSecondary` (GO 26), `transform-for-shines` (GO 53), `transform-for-patterns` (GO 49), `brushes` (GO 95), `mask` (GO 67)
- **GO 60 `PaintablesController`** (Transform ID 541):
  - LocalPos: `(0, 0, 0)`
  - Component: `PaintablesController` (ID 1629, Assembly: `Assembly-CSharp`)

---

## 4. Distinction: Serialized State vs Runtime Changes

1. **Pack Positioning:**
   - **Serialized State:** All 12 menu pack roots (`animals`, `music`, `food`, `insects`, `dolls`, `magic`, `dinosaurs`, `school`, `ocean`, `halloween`, `christmas`, `vehicles`) are serialized at identical coordinates `m_LocalPosition = (0, 0, 0)`, `m_AnchoredPosition = (0, 0)`, `m_SizeDelta = (0, 0)`.
   - **Runtime State:** Actual horizontal placement and spacing are controlled entirely at runtime by `GridLayoutGroup` (ID 1195) and `HorizontalGridSizer` (ID 1196) attached to `Content` (GO 40).
2. **Lock State:**
   - **Serialized State:** Every `LockRoot` child (Child index 3 under each pack root) is serialized with `m_IsActive: False`.
   - **Runtime State:** Pack unlock/lock status is dynamically toggled by runtime code (e.g., `MainMenuPack` / `InAppPurchaseManager`); no pack is serialized as locked in the scene asset.
3. **Drawing Action Handlers:**
   - **Serialized State:**
     - `Trash` contains both a Unity UI `Button` (1554) and a child `clearAll` (GO 14) carrying `PaintIn3D.P3dButtonClearAll` (1572).
     - `Undo` contains a Unity UI `Button` (1689) and `P3dButtonUndoAll` (MonoBehaviour 1688).
     - `Save` contains a Unity UI `Button` (1677) in `TopContainer`, while persistence logic components `SaveImage` (1597) and `LoadImage` (1596) reside separately on root `[Save Load]` (GO 33), and `DrawingPage` (1614) resides on root `[Drawing Page]` (GO 48).
   - **Runtime State:** Button click bindings and coroutine invocations (e.g., double-tap confirmation timers or texture undo buffers) execute dynamically in runtime scripts without hardcoded static scene delegates.
