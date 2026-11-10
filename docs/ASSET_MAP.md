# Bản đồ asset của game gốc

Nguồn: APK game `com.bimiboo.drawing` 3.101, không phải bộ cài Uptodown. Bản đồ được sinh bởi `scripts/build_asset_map.py` từ `catalog.json` và plist đi kèm từng atlas.

- **VERIFIED:** 128 tranh, 2035 frame/mask thuộc 8 pack.
- **VERIFIED:** Mỗi tranh ghép theo ID `pack-picture` (`image-PACK-PICTURE`): outline PNG riêng, atlas PNG và plist TexturePacker.
- **VERIFIED:** Frame mask được dựng theo mesh tam giác và UV trong plist; crop chữ nhật đơn thuần không đủ vì chứa pixel ngoài mesh.
- **INFERRED:** Tên pack theo chủ đề suy từ contact sheet hình outline; đây là nhãn nội bộ cho bản web, chưa xác minh bằng chuỗi UI gốc.
- **UNKNOWN:** Quyền tái sử dụng/phát hành các asset chưa được xác minh. Không deploy public trước khi làm rõ quyền.

## Nhóm và toàn bộ tranh

| Pack | Chủ đề suy từ hình | ID tranh | Outline | Atlas / plist | Số frame vùng |
| --- | --- | --- | --- | --- | ---: |
| 1 | Animals | 1-1 | `extracted/atlas-frames/pack1/image-1-1/outline.png` | `assets/res/pack1/image-1-1.png` / `assets/res/pack1/image-1-1.plist` | 20 |
| 1 | Animals | 1-2 | `extracted/atlas-frames/pack1/image-1-2/outline.png` | `assets/res/pack1/image-1-2.png` / `assets/res/pack1/image-1-2.plist` | 27 |
| 1 | Animals | 1-3 | `extracted/atlas-frames/pack1/image-1-3/outline.png` | `assets/res/pack1/image-1-3.png` / `assets/res/pack1/image-1-3.plist` | 9 |
| 1 | Animals | 1-4 | `extracted/atlas-frames/pack1/image-1-4/outline.png` | `assets/res/pack1/image-1-4.png` / `assets/res/pack1/image-1-4.plist` | 16 |
| 1 | Animals | 1-5 | `extracted/atlas-frames/pack1/image-1-5/outline.png` | `assets/res/pack1/image-1-5.png` / `assets/res/pack1/image-1-5.plist` | 14 |
| 1 | Animals | 1-6 | `extracted/atlas-frames/pack1/image-1-6/outline.png` | `assets/res/pack1/image-1-6.png` / `assets/res/pack1/image-1-6.plist` | 6 |
| 1 | Animals | 1-7 | `extracted/atlas-frames/pack1/image-1-7/outline.png` | `assets/res/pack1/image-1-7.png` / `assets/res/pack1/image-1-7.plist` | 13 |
| 1 | Animals | 1-8 | `extracted/atlas-frames/pack1/image-1-8/outline.png` | `assets/res/pack1/image-1-8.png` / `assets/res/pack1/image-1-8.plist` | 16 |
| 1 | Animals | 1-9 | `extracted/atlas-frames/pack1/image-1-9/outline.png` | `assets/res/pack1/image-1-9.png` / `assets/res/pack1/image-1-9.plist` | 13 |
| 1 | Animals | 1-10 | `extracted/atlas-frames/pack1/image-1-10/outline.png` | `assets/res/pack1/image-1-10.png` / `assets/res/pack1/image-1-10.plist` | 10 |
| 1 | Animals | 1-11 | `extracted/atlas-frames/pack1/image-1-11/outline.png` | `assets/res/pack1/image-1-11.png` / `assets/res/pack1/image-1-11.plist` | 10 |
| 1 | Animals | 1-12 | `extracted/atlas-frames/pack1/image-1-12/outline.png` | `assets/res/pack1/image-1-12.png` / `assets/res/pack1/image-1-12.plist` | 14 |
| 1 | Animals | 1-13 | `extracted/atlas-frames/pack1/image-1-13/outline.png` | `assets/res/pack1/image-1-13.png` / `assets/res/pack1/image-1-13.plist` | 14 |
| 1 | Animals | 1-14 | `extracted/atlas-frames/pack1/image-1-14/outline.png` | `assets/res/pack1/image-1-14.png` / `assets/res/pack1/image-1-14.plist` | 14 |
| 1 | Animals | 1-15 | `extracted/atlas-frames/pack1/image-1-15/outline.png` | `assets/res/pack1/image-1-15.png` / `assets/res/pack1/image-1-15.plist` | 9 |
| 1 | Animals | 1-16 | `extracted/atlas-frames/pack1/image-1-16/outline.png` | `assets/res/pack1/image-1-16.png` / `assets/res/pack1/image-1-16.plist` | 13 |
| 2 | People / princesses | 2-1 | `extracted/atlas-frames/pack2/image-2-1/outline.png` | `assets/res/pack2/image-2-1.png` / `assets/res/pack2/image-2-1.plist` | 44 |
| 2 | People / princesses | 2-2 | `extracted/atlas-frames/pack2/image-2-2/outline.png` | `assets/res/pack2/image-2-2.png` / `assets/res/pack2/image-2-2.plist` | 19 |
| 2 | People / princesses | 2-3 | `extracted/atlas-frames/pack2/image-2-3/outline.png` | `assets/res/pack2/image-2-3.png` / `assets/res/pack2/image-2-3.plist` | 30 |
| 2 | People / princesses | 2-4 | `extracted/atlas-frames/pack2/image-2-4/outline.png` | `assets/res/pack2/image-2-4.png` / `assets/res/pack2/image-2-4.plist` | 34 |
| 2 | People / princesses | 2-5 | `extracted/atlas-frames/pack2/image-2-5/outline.png` | `assets/res/pack2/image-2-5.png` / `assets/res/pack2/image-2-5.plist` | 30 |
| 2 | People / princesses | 2-6 | `extracted/atlas-frames/pack2/image-2-6/outline.png` | `assets/res/pack2/image-2-6.png` / `assets/res/pack2/image-2-6.plist` | 28 |
| 2 | People / princesses | 2-7 | `extracted/atlas-frames/pack2/image-2-7/outline.png` | `assets/res/pack2/image-2-7.png` / `assets/res/pack2/image-2-7.plist` | 22 |
| 2 | People / princesses | 2-8 | `extracted/atlas-frames/pack2/image-2-8/outline.png` | `assets/res/pack2/image-2-8.png` / `assets/res/pack2/image-2-8.plist` | 24 |
| 2 | People / princesses | 2-9 | `extracted/atlas-frames/pack2/image-2-9/outline.png` | `assets/res/pack2/image-2-9.png` / `assets/res/pack2/image-2-9.plist` | 22 |
| 2 | People / princesses | 2-10 | `extracted/atlas-frames/pack2/image-2-10/outline.png` | `assets/res/pack2/image-2-10.png` / `assets/res/pack2/image-2-10.plist` | 30 |
| 2 | People / princesses | 2-11 | `extracted/atlas-frames/pack2/image-2-11/outline.png` | `assets/res/pack2/image-2-11.png` / `assets/res/pack2/image-2-11.plist` | 25 |
| 2 | People / princesses | 2-12 | `extracted/atlas-frames/pack2/image-2-12/outline.png` | `assets/res/pack2/image-2-12.png` / `assets/res/pack2/image-2-12.plist` | 23 |
| 2 | People / princesses | 2-13 | `extracted/atlas-frames/pack2/image-2-13/outline.png` | `assets/res/pack2/image-2-13.png` / `assets/res/pack2/image-2-13.plist` | 20 |
| 2 | People / princesses | 2-14 | `extracted/atlas-frames/pack2/image-2-14/outline.png` | `assets/res/pack2/image-2-14.png` / `assets/res/pack2/image-2-14.plist` | 23 |
| 2 | People / princesses | 2-15 | `extracted/atlas-frames/pack2/image-2-15/outline.png` | `assets/res/pack2/image-2-15.png` / `assets/res/pack2/image-2-15.plist` | 29 |
| 2 | People / princesses | 2-16 | `extracted/atlas-frames/pack2/image-2-16/outline.png` | `assets/res/pack2/image-2-16.png` / `assets/res/pack2/image-2-16.plist` | 20 |
| 3 | School | 3-1 | `extracted/atlas-frames/pack3/image-3-1/outline.png` | `assets/res/pack3/image-3-1.png` / `assets/res/pack3/image-3-1.plist` | 15 |
| 3 | School | 3-2 | `extracted/atlas-frames/pack3/image-3-2/outline.png` | `assets/res/pack3/image-3-2.png` / `assets/res/pack3/image-3-2.plist` | 27 |
| 3 | School | 3-3 | `extracted/atlas-frames/pack3/image-3-3/outline.png` | `assets/res/pack3/image-3-3.png` / `assets/res/pack3/image-3-3.plist` | 5 |
| 3 | School | 3-4 | `extracted/atlas-frames/pack3/image-3-4/outline.png` | `assets/res/pack3/image-3-4.png` / `assets/res/pack3/image-3-4.plist` | 18 |
| 3 | School | 3-5 | `extracted/atlas-frames/pack3/image-3-5/outline.png` | `assets/res/pack3/image-3-5.png` / `assets/res/pack3/image-3-5.plist` | 19 |
| 3 | School | 3-6 | `extracted/atlas-frames/pack3/image-3-6/outline.png` | `assets/res/pack3/image-3-6.png` / `assets/res/pack3/image-3-6.plist` | 10 |
| 3 | School | 3-7 | `extracted/atlas-frames/pack3/image-3-7/outline.png` | `assets/res/pack3/image-3-7.png` / `assets/res/pack3/image-3-7.plist` | 18 |
| 3 | School | 3-8 | `extracted/atlas-frames/pack3/image-3-8/outline.png` | `assets/res/pack3/image-3-8.png` / `assets/res/pack3/image-3-8.plist` | 10 |
| 3 | School | 3-9 | `extracted/atlas-frames/pack3/image-3-9/outline.png` | `assets/res/pack3/image-3-9.png` / `assets/res/pack3/image-3-9.plist` | 9 |
| 3 | School | 3-10 | `extracted/atlas-frames/pack3/image-3-10/outline.png` | `assets/res/pack3/image-3-10.png` / `assets/res/pack3/image-3-10.plist` | 15 |
| 3 | School | 3-11 | `extracted/atlas-frames/pack3/image-3-11/outline.png` | `assets/res/pack3/image-3-11.png` / `assets/res/pack3/image-3-11.plist` | 17 |
| 3 | School | 3-12 | `extracted/atlas-frames/pack3/image-3-12/outline.png` | `assets/res/pack3/image-3-12.png` / `assets/res/pack3/image-3-12.plist` | 18 |
| 3 | School | 3-13 | `extracted/atlas-frames/pack3/image-3-13/outline.png` | `assets/res/pack3/image-3-13.png` / `assets/res/pack3/image-3-13.plist` | 9 |
| 3 | School | 3-14 | `extracted/atlas-frames/pack3/image-3-14/outline.png` | `assets/res/pack3/image-3-14.png` / `assets/res/pack3/image-3-14.plist` | 13 |
| 3 | School | 3-15 | `extracted/atlas-frames/pack3/image-3-15/outline.png` | `assets/res/pack3/image-3-15.png` / `assets/res/pack3/image-3-15.plist` | 16 |
| 3 | School | 3-16 | `extracted/atlas-frames/pack3/image-3-16/outline.png` | `assets/res/pack3/image-3-16.png` / `assets/res/pack3/image-3-16.plist` | 12 |
| 4 | Music | 4-1 | `extracted/atlas-frames/pack4/image-4-1/outline.png` | `assets/res/pack4/image-4-1.png` / `assets/res/pack4/image-4-1.plist` | 16 |
| 4 | Music | 4-2 | `extracted/atlas-frames/pack4/image-4-2/outline.png` | `assets/res/pack4/image-4-2.png` / `assets/res/pack4/image-4-2.plist` | 20 |
| 4 | Music | 4-3 | `extracted/atlas-frames/pack4/image-4-3/outline.png` | `assets/res/pack4/image-4-3.png` / `assets/res/pack4/image-4-3.plist` | 15 |
| 4 | Music | 4-4 | `extracted/atlas-frames/pack4/image-4-4/outline.png` | `assets/res/pack4/image-4-4.png` / `assets/res/pack4/image-4-4.plist` | 13 |
| 4 | Music | 4-5 | `extracted/atlas-frames/pack4/image-4-5/outline.png` | `assets/res/pack4/image-4-5.png` / `assets/res/pack4/image-4-5.plist` | 11 |
| 4 | Music | 4-6 | `extracted/atlas-frames/pack4/image-4-6/outline.png` | `assets/res/pack4/image-4-6.png` / `assets/res/pack4/image-4-6.plist` | 11 |
| 4 | Music | 4-7 | `extracted/atlas-frames/pack4/image-4-7/outline.png` | `assets/res/pack4/image-4-7.png` / `assets/res/pack4/image-4-7.plist` | 8 |
| 4 | Music | 4-8 | `extracted/atlas-frames/pack4/image-4-8/outline.png` | `assets/res/pack4/image-4-8.png` / `assets/res/pack4/image-4-8.plist` | 19 |
| 4 | Music | 4-9 | `extracted/atlas-frames/pack4/image-4-9/outline.png` | `assets/res/pack4/image-4-9.png` / `assets/res/pack4/image-4-9.plist` | 15 |
| 4 | Music | 4-10 | `extracted/atlas-frames/pack4/image-4-10/outline.png` | `assets/res/pack4/image-4-10.png` / `assets/res/pack4/image-4-10.plist` | 12 |
| 4 | Music | 4-11 | `extracted/atlas-frames/pack4/image-4-11/outline.png` | `assets/res/pack4/image-4-11.png` / `assets/res/pack4/image-4-11.plist` | 24 |
| 4 | Music | 4-12 | `extracted/atlas-frames/pack4/image-4-12/outline.png` | `assets/res/pack4/image-4-12.png` / `assets/res/pack4/image-4-12.plist` | 13 |
| 4 | Music | 4-13 | `extracted/atlas-frames/pack4/image-4-13/outline.png` | `assets/res/pack4/image-4-13.png` / `assets/res/pack4/image-4-13.plist` | 12 |
| 4 | Music | 4-14 | `extracted/atlas-frames/pack4/image-4-14/outline.png` | `assets/res/pack4/image-4-14.png` / `assets/res/pack4/image-4-14.plist` | 13 |
| 4 | Music | 4-15 | `extracted/atlas-frames/pack4/image-4-15/outline.png` | `assets/res/pack4/image-4-15.png` / `assets/res/pack4/image-4-15.plist` | 22 |
| 4 | Music | 4-16 | `extracted/atlas-frames/pack4/image-4-16/outline.png` | `assets/res/pack4/image-4-16.png` / `assets/res/pack4/image-4-16.plist` | 11 |
| 5 | Vehicles | 5-1 | `extracted/atlas-frames/pack5/image-5-1/outline.png` | `assets/res/pack5/image-5-1.png` / `assets/res/pack5/image-5-1.plist` | 16 |
| 5 | Vehicles | 5-2 | `extracted/atlas-frames/pack5/image-5-2/outline.png` | `assets/res/pack5/image-5-2.png` / `assets/res/pack5/image-5-2.plist` | 12 |
| 5 | Vehicles | 5-3 | `extracted/atlas-frames/pack5/image-5-3/outline.png` | `assets/res/pack5/image-5-3.png` / `assets/res/pack5/image-5-3.plist` | 16 |
| 5 | Vehicles | 5-4 | `extracted/atlas-frames/pack5/image-5-4/outline.png` | `assets/res/pack5/image-5-4.png` / `assets/res/pack5/image-5-4.plist` | 18 |
| 5 | Vehicles | 5-5 | `extracted/atlas-frames/pack5/image-5-5/outline.png` | `assets/res/pack5/image-5-5.png` / `assets/res/pack5/image-5-5.plist` | 15 |
| 5 | Vehicles | 5-6 | `extracted/atlas-frames/pack5/image-5-6/outline.png` | `assets/res/pack5/image-5-6.png` / `assets/res/pack5/image-5-6.plist` | 16 |
| 5 | Vehicles | 5-7 | `extracted/atlas-frames/pack5/image-5-7/outline.png` | `assets/res/pack5/image-5-7.png` / `assets/res/pack5/image-5-7.plist` | 13 |
| 5 | Vehicles | 5-8 | `extracted/atlas-frames/pack5/image-5-8/outline.png` | `assets/res/pack5/image-5-8.png` / `assets/res/pack5/image-5-8.plist` | 17 |
| 5 | Vehicles | 5-9 | `extracted/atlas-frames/pack5/image-5-9/outline.png` | `assets/res/pack5/image-5-9.png` / `assets/res/pack5/image-5-9.plist` | 14 |
| 5 | Vehicles | 5-10 | `extracted/atlas-frames/pack5/image-5-10/outline.png` | `assets/res/pack5/image-5-10.png` / `assets/res/pack5/image-5-10.plist` | 17 |
| 5 | Vehicles | 5-11 | `extracted/atlas-frames/pack5/image-5-11/outline.png` | `assets/res/pack5/image-5-11.png` / `assets/res/pack5/image-5-11.plist` | 15 |
| 5 | Vehicles | 5-12 | `extracted/atlas-frames/pack5/image-5-12/outline.png` | `assets/res/pack5/image-5-12.png` / `assets/res/pack5/image-5-12.plist` | 15 |
| 5 | Vehicles | 5-13 | `extracted/atlas-frames/pack5/image-5-13/outline.png` | `assets/res/pack5/image-5-13.png` / `assets/res/pack5/image-5-13.plist` | 13 |
| 5 | Vehicles | 5-14 | `extracted/atlas-frames/pack5/image-5-14/outline.png` | `assets/res/pack5/image-5-14.png` / `assets/res/pack5/image-5-14.plist` | 17 |
| 5 | Vehicles | 5-15 | `extracted/atlas-frames/pack5/image-5-15/outline.png` | `assets/res/pack5/image-5-15.png` / `assets/res/pack5/image-5-15.plist` | 20 |
| 5 | Vehicles | 5-16 | `extracted/atlas-frames/pack5/image-5-16/outline.png` | `assets/res/pack5/image-5-16.png` / `assets/res/pack5/image-5-16.plist` | 16 |
| 6 | Food | 6-1 | `extracted/atlas-frames/pack6/image-6-1/outline.png` | `assets/res/pack6/image-6-1.png` / `assets/res/pack6/image-6-1.plist` | 18 |
| 6 | Food | 6-2 | `extracted/atlas-frames/pack6/image-6-2/outline.png` | `assets/res/pack6/image-6-2.png` / `assets/res/pack6/image-6-2.plist` | 15 |
| 6 | Food | 6-3 | `extracted/atlas-frames/pack6/image-6-3/outline.png` | `assets/res/pack6/image-6-3.png` / `assets/res/pack6/image-6-3.plist` | 10 |
| 6 | Food | 6-4 | `extracted/atlas-frames/pack6/image-6-4/outline.png` | `assets/res/pack6/image-6-4.png` / `assets/res/pack6/image-6-4.plist` | 16 |
| 6 | Food | 6-5 | `extracted/atlas-frames/pack6/image-6-5/outline.png` | `assets/res/pack6/image-6-5.png` / `assets/res/pack6/image-6-5.plist` | 17 |
| 6 | Food | 6-6 | `extracted/atlas-frames/pack6/image-6-6/outline.png` | `assets/res/pack6/image-6-6.png` / `assets/res/pack6/image-6-6.plist` | 19 |
| 6 | Food | 6-7 | `extracted/atlas-frames/pack6/image-6-7/outline.png` | `assets/res/pack6/image-6-7.png` / `assets/res/pack6/image-6-7.plist` | 13 |
| 6 | Food | 6-8 | `extracted/atlas-frames/pack6/image-6-8/outline.png` | `assets/res/pack6/image-6-8.png` / `assets/res/pack6/image-6-8.plist` | 10 |
| 6 | Food | 6-9 | `extracted/atlas-frames/pack6/image-6-9/outline.png` | `assets/res/pack6/image-6-9.png` / `assets/res/pack6/image-6-9.plist` | 10 |
| 6 | Food | 6-10 | `extracted/atlas-frames/pack6/image-6-10/outline.png` | `assets/res/pack6/image-6-10.png` / `assets/res/pack6/image-6-10.plist` | 18 |
| 6 | Food | 6-11 | `extracted/atlas-frames/pack6/image-6-11/outline.png` | `assets/res/pack6/image-6-11.png` / `assets/res/pack6/image-6-11.plist` | 10 |
| 6 | Food | 6-12 | `extracted/atlas-frames/pack6/image-6-12/outline.png` | `assets/res/pack6/image-6-12.png` / `assets/res/pack6/image-6-12.plist` | 22 |
| 6 | Food | 6-13 | `extracted/atlas-frames/pack6/image-6-13/outline.png` | `assets/res/pack6/image-6-13.png` / `assets/res/pack6/image-6-13.plist` | 8 |
| 6 | Food | 6-14 | `extracted/atlas-frames/pack6/image-6-14/outline.png` | `assets/res/pack6/image-6-14.png` / `assets/res/pack6/image-6-14.plist` | 12 |
| 6 | Food | 6-15 | `extracted/atlas-frames/pack6/image-6-15/outline.png` | `assets/res/pack6/image-6-15.png` / `assets/res/pack6/image-6-15.plist` | 9 |
| 6 | Food | 6-16 | `extracted/atlas-frames/pack6/image-6-16/outline.png` | `assets/res/pack6/image-6-16.png` / `assets/res/pack6/image-6-16.plist` | 10 |
| 7 | Halloween | 7-1 | `extracted/atlas-frames/pack7/image-7-1/outline.png` | `assets/res/pack7/image-7-1.png` / `assets/res/pack7/image-7-1.plist` | 8 |
| 7 | Halloween | 7-2 | `extracted/atlas-frames/pack7/image-7-2/outline.png` | `assets/res/pack7/image-7-2.png` / `assets/res/pack7/image-7-2.plist` | 12 |
| 7 | Halloween | 7-3 | `extracted/atlas-frames/pack7/image-7-3/outline.png` | `assets/res/pack7/image-7-3.png` / `assets/res/pack7/image-7-3.plist` | 16 |
| 7 | Halloween | 7-4 | `extracted/atlas-frames/pack7/image-7-4/outline.png` | `assets/res/pack7/image-7-4.png` / `assets/res/pack7/image-7-4.plist` | 8 |
| 7 | Halloween | 7-5 | `extracted/atlas-frames/pack7/image-7-5/outline.png` | `assets/res/pack7/image-7-5.png` / `assets/res/pack7/image-7-5.plist` | 13 |
| 7 | Halloween | 7-6 | `extracted/atlas-frames/pack7/image-7-6/outline.png` | `assets/res/pack7/image-7-6.png` / `assets/res/pack7/image-7-6.plist` | 14 |
| 7 | Halloween | 7-7 | `extracted/atlas-frames/pack7/image-7-7/outline.png` | `assets/res/pack7/image-7-7.png` / `assets/res/pack7/image-7-7.plist` | 14 |
| 7 | Halloween | 7-8 | `extracted/atlas-frames/pack7/image-7-8/outline.png` | `assets/res/pack7/image-7-8.png` / `assets/res/pack7/image-7-8.plist` | 21 |
| 7 | Halloween | 7-9 | `extracted/atlas-frames/pack7/image-7-9/outline.png` | `assets/res/pack7/image-7-9.png` / `assets/res/pack7/image-7-9.plist` | 14 |
| 7 | Halloween | 7-10 | `extracted/atlas-frames/pack7/image-7-10/outline.png` | `assets/res/pack7/image-7-10.png` / `assets/res/pack7/image-7-10.plist` | 12 |
| 7 | Halloween | 7-11 | `extracted/atlas-frames/pack7/image-7-11/outline.png` | `assets/res/pack7/image-7-11.png` / `assets/res/pack7/image-7-11.plist` | 18 |
| 7 | Halloween | 7-12 | `extracted/atlas-frames/pack7/image-7-12/outline.png` | `assets/res/pack7/image-7-12.png` / `assets/res/pack7/image-7-12.plist` | 7 |
| 7 | Halloween | 7-13 | `extracted/atlas-frames/pack7/image-7-13/outline.png` | `assets/res/pack7/image-7-13.png` / `assets/res/pack7/image-7-13.plist` | 16 |
| 7 | Halloween | 7-14 | `extracted/atlas-frames/pack7/image-7-14/outline.png` | `assets/res/pack7/image-7-14.png` / `assets/res/pack7/image-7-14.plist` | 20 |
| 7 | Halloween | 7-15 | `extracted/atlas-frames/pack7/image-7-15/outline.png` | `assets/res/pack7/image-7-15.png` / `assets/res/pack7/image-7-15.plist` | 9 |
| 7 | Halloween | 7-16 | `extracted/atlas-frames/pack7/image-7-16/outline.png` | `assets/res/pack7/image-7-16.png` / `assets/res/pack7/image-7-16.plist` | 12 |
| 8 | Christmas | 8-1 | `extracted/atlas-frames/pack8/image-8-1/outline.png` | `assets/res/pack8/image-8-1.png` / `assets/res/pack8/image-8-1.plist` | 11 |
| 8 | Christmas | 8-2 | `extracted/atlas-frames/pack8/image-8-2/outline.png` | `assets/res/pack8/image-8-2.png` / `assets/res/pack8/image-8-2.plist` | 12 |
| 8 | Christmas | 8-3 | `extracted/atlas-frames/pack8/image-8-3/outline.png` | `assets/res/pack8/image-8-3.png` / `assets/res/pack8/image-8-3.plist` | 15 |
| 8 | Christmas | 8-4 | `extracted/atlas-frames/pack8/image-8-4/outline.png` | `assets/res/pack8/image-8-4.png` / `assets/res/pack8/image-8-4.plist` | 18 |
| 8 | Christmas | 8-5 | `extracted/atlas-frames/pack8/image-8-5/outline.png` | `assets/res/pack8/image-8-5.png` / `assets/res/pack8/image-8-5.plist` | 21 |
| 8 | Christmas | 8-6 | `extracted/atlas-frames/pack8/image-8-6/outline.png` | `assets/res/pack8/image-8-6.png` / `assets/res/pack8/image-8-6.plist` | 10 |
| 8 | Christmas | 8-7 | `extracted/atlas-frames/pack8/image-8-7/outline.png` | `assets/res/pack8/image-8-7.png` / `assets/res/pack8/image-8-7.plist` | 12 |
| 8 | Christmas | 8-8 | `extracted/atlas-frames/pack8/image-8-8/outline.png` | `assets/res/pack8/image-8-8.png` / `assets/res/pack8/image-8-8.plist` | 8 |
| 8 | Christmas | 8-9 | `extracted/atlas-frames/pack8/image-8-9/outline.png` | `assets/res/pack8/image-8-9.png` / `assets/res/pack8/image-8-9.plist` | 11 |
| 8 | Christmas | 8-10 | `extracted/atlas-frames/pack8/image-8-10/outline.png` | `assets/res/pack8/image-8-10.png` / `assets/res/pack8/image-8-10.plist` | 14 |
| 8 | Christmas | 8-11 | `extracted/atlas-frames/pack8/image-8-11/outline.png` | `assets/res/pack8/image-8-11.png` / `assets/res/pack8/image-8-11.plist` | 17 |
| 8 | Christmas | 8-12 | `extracted/atlas-frames/pack8/image-8-12/outline.png` | `assets/res/pack8/image-8-12.png` / `assets/res/pack8/image-8-12.plist` | 15 |
| 8 | Christmas | 8-13 | `extracted/atlas-frames/pack8/image-8-13/outline.png` | `assets/res/pack8/image-8-13.png` / `assets/res/pack8/image-8-13.plist` | 19 |
| 8 | Christmas | 8-14 | `extracted/atlas-frames/pack8/image-8-14/outline.png` | `assets/res/pack8/image-8-14.png` / `assets/res/pack8/image-8-14.plist` | 20 |
| 8 | Christmas | 8-15 | `extracted/atlas-frames/pack8/image-8-15/outline.png` | `assets/res/pack8/image-8-15.png` / `assets/res/pack8/image-8-15.plist` | 24 |
| 8 | Christmas | 8-16 | `extracted/atlas-frames/pack8/image-8-16/outline.png` | `assets/res/pack8/image-8-16.png` / `assets/res/pack8/image-8-16.plist` | 20 |

## Dữ liệu chi tiết và cách tái tạo

`extracted/atlas-frames/asset-map.json` là catalog máy đọc đầy đủ: từng tranh có kích thước/hash, outline, atlas, plist, và từng region có frame ID, `textureRect`, `spriteOffset`, `spriteSize`, `spriteSourceSize`, `vertices`, `verticesUV`, `triangles`, bounding box và đường dẫn mask PNG đã raster hóa.

Mỗi ảnh `*-region.png` chỉ giữ alpha của mesh tương ứng, sau khi ánh xạ UV về tọa độ tranh. Để vẽ: tô màu qua alpha mask theo `regionId`, xếp lớp theo danh sách frame, rồi vẽ outline PNG ở trên cùng. `regionId` ổn định theo thứ tự frame trong plist; không đổi thứ tự khi cần khôi phục màu đã lưu.

Tái tạo các file đã trích từ APK:

```sh
python3 scripts/extract_atlas_frames.py
python3 scripts/build_asset_map.py
```

Mỗi `contact-sheet.jpg` là chỉ mục thị giác của các frame atlas; `packN-outlines.jpg` là chỉ mục thị giác của 16 tranh trong pack N.
