# Inspection Report: `image-1-3.plist` & Matching PNG

This document records the static inspection of `assets/res/pack1/image-1-3.plist` and `assets/res/pack1/image-1-3.png` directly extracted from `original/kids-coloring-and-drawing-games-3-101.apk` using Python standard library `plistlib` and `zipfile`.

---

## 1. Archive & File Verification

- **Source Archive**: `original/kids-coloring-and-drawing-games-3-101.apk`
- **Plist Path**: `assets/res/pack1/image-1-3.plist`
- **Matching PNG Path**: `assets/res/pack1/image-1-3.png`
- **PNG Byte Size**: `9899` bytes
- **PNG Dimensions**: `779 x 1289` pixels (IHDR chunk)
- **PNG Color Model**: Bit depth `2`, Color type `3` (palette_indexed)

---

## 2. Atlas Metadata

Metadata extracted directly from the plist dictionary:

| Key | Value |
| :--- | :--- |
| `format` | `3` |
| `pixelFormat` | `RGBA8888` |
| `premultiplyAlpha` | `False` |
| `realTextureFileName` | `image-1-3.png` |
| `size` | `{779,1289}` |
| `smartupdate` | `$TexturePacker:SmartUpdate:cec5abd2c3664a197d07bc8ef8492189:57f0bb262b633ecd492741c99c53a903:9d766be4d22e0eca1fbe1fdd62d77715$` |
| `textureFileName` | `image-1-3.png` |

---

## 3. Frame Data Inventory

Total frames present: **9** (`img-1-3-1.png` through `img-1-3-9.png`).

### Summary Table

| Frame Name | textureRect | textureRotated | spriteOffset | spriteSize | spriteSourceSize | Vertices Count | Triangles Count |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `img-1-3-1.png` | `{{2,2},{775,775}}` | `False` | `{0,0}` | `{775,775}` | `{775,775}` | 41 | 41 |
| `img-1-3-2.png` | `{{2,781},{677,205}}` | `False` | `{24,-257}` | `{677,205}` | `{775,775}` | 22 | 20 |
| `img-1-3-3.png` | `{{282,390},{309,278}}` | `False` | `{-30,168.5}` | `{309,278}` | `{775,775}` | 14 | 12 |
| `img-1-3-4.png` | `{{227,99},{130,116}}` | `False` | `{59.5,270.5}` | `{130,116}` | `{775,775}` | 5 | 3 |
| `img-1-3-5.png` | `{{298,326},{113,117}}` | `False` | `{-120,264}` | `{113,117}` | `{775,775}` | 5 | 3 |
| `img-1-3-6.png` | `{{220,147},{274,175}}` | `False` | `{93.5,-181}` | `{274,175}` | `{775,775}` | 10 | 8 |
| `img-1-3-7.png` | `{{378,982},{323,305}}` | `False` | `{53,-95}` | `{323,305}` | `{775,775}` | 16 | 14 |
| `img-1-3-8.png` | `{{306,1031},{93,234}}` | `False` | `{-112,-120.5}` | `{93,234}` | `{775,775}` | 7 | 5 |
| `img-1-3-9.png` | `{{405,1201},{1,1}}` | `False` | `{-387,387}` | `{1,1}` | `{775,775}` | 4 | 2 |

### Detailed Frame Specifications

#### Frame `img-1-3-1.png`

- **`textureRect`**: `{{2,2},{775,775}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{0,0}`
- **`spriteSize`**: `{775,775}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 41 vertices
- **Triangle Count**: 41 triangles (123 indices)
- **Canvas Vertex Bounds**: `X ∈ [0.0, 775.0], Y ∈ [0.0, 775.0]`
- **Atlas UV Bounds**: `U ∈ [2.0, 777.0], V ∈ [2.0, 777.0]`
- **`vertices`**:
  ```text
  775 775 0 775 0 0 775 0 394 93 317 93 254 76 226 76 217 127 222 167 213 255 231 296 291 338 274 550 224 552 177 583 152 655 96 676 93 686 128 720 162 692 188 717 229 732 289 739 546 735 626 721 667 696 699 720 722 700 720 667 674 655 663 601 610 552 583 449 554 416 439 338 491 291 506 250 496 168 501 99 484 71
  ```
- **`verticesUV`**:
  ```text
  777 777 2 777 2 2 777 2 396 95 319 95 256 78 228 78 219 129 224 169 215 257 233 298 293 340 276 552 226 554 179 585 154 657 98 678 95 688 130 722 164 694 190 719 231 734 291 741 548 737 628 723 669 698 701 722 724 702 722 669 676 657 665 603 612 554 585 451 556 418 441 340 493 293 508 252 498 170 503 101 486 73
  ```
- **`triangles`**:
  ```text
  23 0 1 22 23 1 19 21 22 19 20 21 19 22 1 18 19 1 17 18 1 17 1 2 15 16 17 10 15 17 15 10 11 15 11 14 14 12 13 14 11 12 10 17 2 9 10 2 8 9 2 7 8 2 40 2 3 6 7 2 40 6 2 6 40 4 6 4 5 39 40 3 38 39 3 37 38 3 33 37 3 34 35 36 34 36 37 33 34 37 31 33 3 31 32 33 29 31 3 29 30 31 0 29 3 25 26 27 0 25 27 0 23 24 0 28 29 27 28 0 0 24 25
  ```

#### Frame `img-1-3-2.png`

- **`textureRect`**: `{{2,781},{677,205}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{24,-257}`
- **`spriteSize`**: `{677,205}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 22 vertices
- **Triangle Count**: 20 triangles (60 indices)
- **Canvas Vertex Bounds**: `X ∈ [73.0, 750.0], Y ∈ [542.0, 747.0]`
- **Atlas UV Bounds**: `U ∈ [2.0, 679.0], V ∈ [781.0, 986.0]`
- **`vertices`**:
  ```text
  651 564 702 649 750 672 723 731 559 743 251 747 151 717 114 735 73 674 149 634 159 589 206 542 288 544 240 586 259 606 295 607 342 631 375 616 454 647 547 631 596 584 610 542
  ```
- **`verticesUV`**:
  ```text
  580 803 631 888 679 911 652 970 488 982 180 986 80 956 43 974 2 913 78 873 88 828 135 781 217 783 169 825 188 845 224 846 271 870 304 855 383 886 476 870 525 823 539 781
  ```
- **`triangles`**:
  ```text
  16 17 18 5 15 16 11 12 13 10 11 13 9 13 14 14 5 6 9 10 13 5 16 18 6 9 14 6 7 8 6 8 9 4 18 19 5 14 15 4 5 18 1 19 20 4 1 3 1 4 19 1 2 3 0 1 20 0 20 21
  ```

#### Frame `img-1-3-3.png`

- **`textureRect`**: `{{282,390},{309,278}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{-30,168.5}`
- **`spriteSize`**: `{309,278}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 14 vertices
- **Triangle Count**: 12 triangles (36 indices)
- **Canvas Vertex Bounds**: `X ∈ [203.0, 512.0], Y ∈ [80.0, 358.0]`
- **Atlas UV Bounds**: `U ∈ [282.0, 591.0], V ∈ [390.0, 668.0]`
- **`vertices`**:
  ```text
  419 88 472 120 512 180 512 275 472 330 399 358 299 354 243 321 215 287 203 242 207 170 253 113 302 89 352 80
  ```
- **`verticesUV`**:
  ```text
  498 398 551 430 591 490 591 585 551 640 478 668 378 664 322 631 294 597 282 552 286 480 332 423 381 399 431 390
  ```
- **`triangles`**:
  ```text
  6 12 13 9 11 12 9 10 11 6 9 12 7 8 9 6 7 9 5 6 13 3 4 5 5 1 2 5 2 3 0 1 5 0 5 13
  ```

#### Frame `img-1-3-4.png`

- **`textureRect`**: `{{227,99},{130,116}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{59.5,270.5}`
- **`spriteSize`**: `{130,116}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 5 vertices
- **Triangle Count**: 3 triangles (9 indices)
- **Canvas Vertex Bounds**: `X ∈ [382.0, 512.0], Y ∈ [59.0, 175.0]`
- **Atlas UV Bounds**: `U ∈ [227.0, 357.0], V ∈ [99.0, 215.0]`
- **`vertices`**:
  ```text
  512 75 503 175 453 117 382 84 476 59
  ```
- **`verticesUV`**:
  ```text
  357 115 348 215 298 157 227 124 321 99
  ```
- **`triangles`**:
  ```text
  2 3 4 0 1 2 0 2 4
  ```

#### Frame `img-1-3-5.png`

- **`textureRect`**: `{{298,326},{113,117}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{-120,264}`
- **`spriteSize`**: `{113,117}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 5 vertices
- **Triangle Count**: 3 triangles (9 indices)
- **Canvas Vertex Bounds**: `X ∈ [211.0, 324.0], Y ∈ [65.0, 182.0]`
- **Atlas UV Bounds**: `U ∈ [298.0, 411.0], V ∈ [326.0, 443.0]`
- **`vertices`**:
  ```text
  324 89 272 113 211 182 211 65 281 65
  ```
- **`verticesUV`**:
  ```text
  411 350 359 374 298 443 298 326 368 326
  ```
- **`triangles`**:
  ```text
  1 3 4 1 2 3 0 1 4
  ```

#### Frame `img-1-3-6.png`

- **`textureRect`**: `{{220,147},{274,175}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{93.5,-181}`
- **`spriteSize`**: `{274,175}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 10 vertices
- **Triangle Count**: 8 triangles (24 indices)
- **Canvas Vertex Bounds**: `X ∈ [344.0, 618.0], Y ∈ [481.0, 656.0]`
- **Atlas UV Bounds**: `U ∈ [220.0, 494.0], V ∈ [147.0, 322.0]`
- **`vertices`**:
  ```text
  618 513 613 571 581 619 517 656 408 655 344 591 434 548 528 561 570 543 601 481
  ```
- **`verticesUV`**:
  ```text
  494 179 489 237 457 285 393 322 284 321 220 257 310 214 404 227 446 209 477 147
  ```
- **`triangles`**:
  ```text
  3 6 7 4 5 6 2 7 8 3 4 6 0 1 8 2 3 7 1 2 8 0 8 9
  ```

#### Frame `img-1-3-7.png`

- **`textureRect`**: `{{378,982},{323,305}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{53,-95}`
- **`spriteSize`**: `{323,305}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 16 vertices
- **Triangle Count**: 14 triangles (42 indices)
- **Canvas Vertex Bounds**: `X ∈ [279.0, 602.0], Y ∈ [330.0, 635.0]`
- **Atlas UV Bounds**: `U ∈ [378.0, 701.0], V ∈ [982.0, 1287.0]`
- **`vertices`**:
  ```text
  557 404 602 456 602 517 576 554 530 575 440 557 386 586 372 635 289 635 289 597 312 550 309 524 279 444 279 336 359 350 450 330
  ```
- **`verticesUV`**:
  ```text
  656 1056 701 1108 701 1169 675 1206 629 1227 539 1209 485 1238 471 1287 388 1287 388 1249 411 1202 408 1176 378 1096 378 988 458 1002 549 982
  ```
- **`triangles`**:
  ```text
  12 13 14 5 14 15 11 12 14 5 11 14 10 11 6 9 7 8 9 10 6 9 6 7 5 6 11 1 2 3 4 0 1 0 4 5 1 3 4 0 5 15
  ```

#### Frame `img-1-3-8.png`

- **`textureRect`**: `{{306,1031},{93,234}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{-112,-120.5}`
- **`spriteSize`**: `{93,234}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 7 vertices
- **Triangle Count**: 5 triangles (15 indices)
- **Canvas Vertex Bounds**: `X ∈ [229.0, 322.0], Y ∈ [391.0, 625.0]`
- **Atlas UV Bounds**: `U ∈ [306.0, 399.0], V ∈ [1031.0, 1265.0]`
- **`vertices`**:
  ```text
  316 512 322 577 282 625 237 613 229 575 265 550 274 391
  ```
- **`verticesUV`**:
  ```text
  393 1152 399 1217 359 1265 314 1253 306 1215 342 1190 351 1031
  ```
- **`triangles`**:
  ```text
  3 4 5 2 3 5 1 2 5 0 1 5 0 5 6
  ```

#### Frame `img-1-3-9.png`

- **`textureRect`**: `{{405,1201},{1,1}}`
- **`textureRotated`**: `False`
- **`spriteOffset`**: `{-387,387}`
- **`spriteSize`**: `{1,1}`
- **`spriteSourceSize`**: `{775,775}`
- **Vertex Count**: 4 vertices
- **Triangle Count**: 2 triangles (6 indices)
- **Canvas Vertex Bounds**: `X ∈ [0.0, 1.0], Y ∈ [0.0, 1.0]`
- **Atlas UV Bounds**: `U ∈ [405.0, 406.0], V ∈ [1201.0, 1202.0]`
- **`vertices`**:
  ```text
  0 0 1 0 1 1 0 1
  ```
- **`verticesUV`**:
  ```text
  405 1201 406 1201 406 1202 405 1202
  ```
- **`triangles`**:
  ```text
  0 1 2 0 2 3
  ```

---

## 4. Coordinate Facts vs. Unknown Mapping to Interactive Regions

### Verified Coordinate Facts

- **VERIFIED**: Atlas texture dimensions in PNG IHDR (779x1289) match metadata size {779,1289}.
- **VERIFIED**: Untrimmed canvas size (spriteSourceSize) is {775,775} for all 9 frames.
- **VERIFIED**: textureRect {{x,y},{w,h}} defines the bounding box of trimmed sprite pixels within the 779x1289 atlas.
- **VERIFIED**: textureRotated is false for all 9 frames, indicating axis-aligned packing with no rotation.
- **VERIFIED**: vertices coordinates are in the untrimmed 775x775 canvas coordinate space.
- **VERIFIED**: spriteSize {w,h} strictly matches the vertex bounding range (x_max - x_min, y_max - y_min).
- **VERIFIED**: spriteOffset {x,y} strictly matches the center offset of the trimmed bounding box relative to the untrimmed canvas center (387.5, 387.5): offset.x = (x_min + x_max)/2 - 387.5; offset.y = 387.5 - (y_min + y_max)/2 (inverting Y due to top-down image vs bottom-up Cocos2d axes).
- **VERIFIED**: verticesUV coordinates are atlas pixel coordinates matching uv_x = v_x - x_min + rect.x and uv_y = v_y - y_min + rect.y.
- **VERIFIED**: triangles are vertex index triplets defining 2D polygon rendering meshes for Cocos2d polygon sprites.

### Unknown Mapping to Interactive Regions

- **UNKNOWN**: The plist format (TexturePacker / Cocos2d format 3) specifies purely geometric rendering and packing information.
- **UNKNOWN**: The plist contains no semantic tags, layer roles, coloring zone identifiers, or interactive region mappings.
- **UNKNOWN**: It is unknown from the plist data whether any frame represents an outline, line art, mask, fill area, background, or accessory.
- **UNKNOWN**: It is unknown whether touch hit-testing utilizes polygon vertices, runtime alpha testing, separate physics shapes, or bounding boxes.
- **UNKNOWN**: Rendering order (z-order) and compositing hierarchy are not specified in the plist and are governed by runtime scene graph code.
- **UNKNOWN**: Frame img-1-3-9.png is a 1x1 pixel quad at (0,0) canvas coordinates; its runtime purpose (e.g., placeholder, dummy quad, color tint reference) is unknown from atlas data alone.

