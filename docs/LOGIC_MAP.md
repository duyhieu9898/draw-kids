# Bản đồ logic gameplay từ APK

## Màn mở đầu

- APK chứa skeleton Spine `assets/intro/intro.json`, atlas/texture cùng thư mục và audio `bg.mp3`/sound effect. Native `IntroScene::setupScene` nạp `intro.json` + `intro.atlas`, chạy animation `intro` không lặp và nhận event âm thanh; `IntroScene::startIntro` phát `intro/bg` không lặp. Chi tiết event timeline và call-flow ở `reports/game/intro-and-audio.asm`.
- Web POC dùng cùng skeleton, atlas, texture và file âm thanh với Spine runtime 3.6.53 phù hợp phiên bản skeleton. `scripts/prepare_original_intro.py` chỉ thêm ba alias attachment (`head_f`, `mouth_smile`, `nose_f`) để nối tên attachment trong JSON với region có sẵn trong atlas; không vẽ lại mascot.
- Chrome chặn một số trường hợp autoplay. Web thử phát nhạc khi tải và chờ pointer gesture để mở âm thanh khi browser từ chối; âm thanh trên PWA cài đặt vẫn cần xác minh trên thiết bị.
- Đây mới là ánh xạ intro và gameplay POC. Home/gallery, quyền phụ huynh, camera, toàn bộ tool và semantics còn UNKNOWN/chưa triển khai; không coi đây là parity hoàn chỉnh.

Phạm vi: đường đi cốt lõi từ input tới tô, Undo và lưu của `com.bimiboo.drawing` 3.101. Nguồn gồm symbol + assembly x86 trong APK, ảnh runtime và thao tác lặp lại trên emulator. Assembly là mã biên dịch, không phải source gốc; REA không có provider Ghidra/Hopper khả dụng trong môi trường này, nên các trường không được chứng minh rõ được giữ UNKNOWN.

## Pipeline input

1. `DrawScene::onTouchBegan` lấy tọa độ chạm, xử lý permission/tools UI trước, rồi dò ảnh có pixel khác 0. Nếu nằm trên vùng tranh, gọi `startDraw(spriteIndex, touch)`. Assembly: `reports/game/core-logic.asm`; chi tiết pixel-hit-test: `reports/game/hit-test.asm`.
2. `getTouchedSprite` duyệt danh sách `Image*` theo chỉ số tăng dần, scale tọa độ, và dừng ở image đầu tiên mà `tapsOnNonTransparent` trả true. Không thấy khớp trả index 0; ý nghĩa sentinel/index 0 trong mọi ngữ cảnh còn UNKNOWN.
3. `tapsOnNonTransparent` chuyển điểm thành offset pixel theo kích thước image và coi pixel được chạm nếu ít nhất một trong bốn byte RGBA khác 0. Định dạng byte thực tế và alpha threshold riêng không được thấy; nó kiểm tra byte khác 0, không phải một flood-fill theo đường biên.
4. `startDraw` lấy tool hiện tại và dispatch tới marker/brush/spray/fill/pencil/pattern. `onTouchMoved` chuyển sang `continueDraw`; `onTouchEnded` chuyển sang `stopDraw`; cancel gọi `cancelDraw`.

## Hành vi tool và lịch sử

| Chức năng | Đường logic và kết quả | Trạng thái / bằng chứng |
| --- | --- | --- |
| Marker | Tool hiện tại dispatch `startDrawMarker`, rồi `continueDrawMarker`, kết thúc qua `stopDrawMarker`; tạo lịch sử thao tác canvas | VERIFIED bởi symbol/assembly + B03/B04; đường chéo, nhiều pointer UNKNOWN |
| Fill | `fillImage(index, touch)` lấy clean canvas, gọi `prepareCanvasToDraw` với index, tạo `LayerColor` theo màu hiện tại, render vào vùng đã chuẩn bị, rồi `completeDraw` | VERIFIED về call-flow trong assembly; B06/B07/B16 xác nhận một vùng độc lập và Undo. Bản chất đầy đủ của `prepareCanvasToDraw` còn cần đọc sâu hơn |
| Undo | `undoButtonPressed` dùng lịch sử render canvas; runtime hoàn tác một nét, tẩy hoặc fill gần nhất | VERIFIED: B04/B11/B16. Giới hạn lịch sử/nhánh sau save UNKNOWN |
| Clear | Có `clearButtonPressed` và `clearAll`; thử runtime B12/B14 không làm rõ trạng thái cần xóa hoặc điều kiện kích hoạt | UNKNOWN về semantics; không gán cho nút reset trong bản web |
| Eraser | Dùng thao tác kéo trên canvas, xóa màu; Undo khôi phục | VERIFIED runtime B10–B11. Chưa kết luận từ assembly về blend mode chính xác |
| Save/Done | `saveButtonPressed` ghép canvas thao tác vào canvas chính, tạo tên file theo pack/level, gọi `RenderTexture::saveToFile`, cập nhật thumbnail/last-saved state rồi đóng scene | VERIFIED bằng call-flow assembly + B08–B09 |
| Screenshot/camera | `screenshotButtonPressed`/`makeScreenshot`, sau đó quyền parental ở UI | VERIFIED đường parental gate B13; nội dung xuất cuối còn UNKNOWN |

## Nét bị giới hạn theo vùng bắt đầu

- **VERIFIED runtime:** một drag bắt đầu trên mặt mèo rồi kéo qua thân chỉ tô vùng bắt đầu (B15, `reports/runtime/27-cross-region.png`).
- **VERIFIED static:** `startDraw` nhận sprite index từ hit-test và chuyển index đó vào tool handler. Mỗi hình có nhiều image mask riêng trong plist.
- **INFERRED:** canvas nét được chuẩn bị/clip với mask tương ứng index ban đầu. Đây là mô hình cần tái tạo trên web bằng mask alpha của region.
- **UNKNOWN:** chính xác shader/blend/canvas clipping và hành vi tại pixel anti-alias, chạm đúng đường viền, start ngoài vùng rồi đi vào.

## Lưu trữ

- `ImageFileManager::getMainImageNameForSave(pack, level)` định dạng tên từ hai ID; `getMainImageNameForRead` thử tên tương ứng và kiểm tra file có tồn tại trước khi trả đường dẫn.
- `saveButtonPressed` lưu ảnh render cuối, không chỉ lưu bản đồ màu dạng JSON. Runtime chứng minh màu đã xác nhận tồn tại sau force-stop và offline (B09).
- Thoát trước khi Done/back và autosave khi bị kill chưa xác minh. Bản web phải giữ draft riêng nếu muốn tránh mất tiến độ, nhưng chỉ coi Done là save chính thức để bám hành vi đã biết.

## Định hướng tái tạo trên Web

- Picture ID: `pack-level`; render bằng outline PNG gốc và các region PNG đã raster từ mesh atlas (xem `ASSET_MAP.md`).
- Mỗi region có cùng ID với thứ tự frame plist. Fill là đổi màu region; nét và tẩy được render vào buffer riêng rồi clip theo vùng chạm đầu tiên. Giữ outline trên cùng.
- Undo là một stack chung của fill/stroke/erase, giới hạn chưa biết. IndexedDB giữ bản đã Done và draft để reload không làm mất việc đang tô.
- Công cụ nâng cao, reset và camera/export không thuộc bản đầu trước khi được xác minh đủ.

## Giới hạn tĩnh

REA phân tích APK và native symbols đã nhận diện, nhưng deep-analysis provider lỗi `provider_unavailable`: Ghidra chưa cấu hình, Hopper không có tại `/opt/hopper/bin/Hopper`, IDA/Kuna không cấu hình (Kuna cũng không hỗ trợ x86). Không tự cài thêm disassembler. Đã lưu 20 hàm native có symbol bằng `objdump -dC` tại `reports/game/core-logic.asm`; đây là bằng chứng đủ cho call-flow ở trên nhưng không chứng minh nhánh vtable chưa resolve hoặc state fields mang ý nghĩa cụ thể.

## Spine viewport correction (2026-11-09)

- Root cause: `SpineWidget.fitToCanvas` fitted setup bounds (offset about -729/-729, size 2614×1568), exposing deliberately offstage props and shifting the native origin.
- Evidence: `reports/game/intro-and-audio.asm`, `IntroScene::setupScene` uses Size(1438,1076), content scale = 1076 / visible short axis, parser scale = its reciprocal, and positions the skeleton at the viewport center. Earlier interpretation of the scale division was reversed.
- `web/src/introViewport.ts` keeps skeleton coordinates at scale 1 and applies the equivalent scale in the camera: centered origin, short axis 1076. DPR only affects framebuffer resolution. No bone, attachment position, or animation keyframe was edited for this fix.
- Regression: `cd web && npm test`. Both tests failed with the original vendor resize and passed after installing the native camera. Covers offstage hat/spare hands, centered origin, resize and DPR.
- Chrome MCP: 844×390 DPR 3 and 667×375 DPR 2. Frozen original animation checked at 1, 3.5, 5.5, 7, 7.8 seconds; actual React app plays intro with one canvas and transitions to drawing. Screenshot: `reports/runtime/spine-fixed-7.8s.png`.
- Browser console: no errors; pre-existing extension/EventEmitter warnings and deprecated mobile meta warning remain. Asset JSON/atlas requests succeed (304 on cached reload; development StrictMode loads twice).
- Diagnostic harness (development only): `/tests/intro.html?t=7.8`; add `&old` to reproduce the former auto-fit behavior. Excluded from production build.
- Limit: native APK was not rerun for a frame-by-frame visual comparison in this fix; this validates the reported web viewport defect and native transform mapping, not full app parity or audio playback on a physical iPhone.

## Main Menu & Gallery Implementation (2026-11-09)

- **Main Menu (`MainMenu.tsx`)**:
  - Ánh xạ 8 pack tương ứng 8 Spine skeleton/atlas trong `assets/res/main_menu/`: `zoo` (Pack 1 - Animals), `dolls` (Pack 2 - Dolls), `school` (Pack 3 - School), `music` (Pack 4 - Music), `cars` (Pack 5 - Cars), `food` (Pack 6 - Food), `halloween` (Pack 7 - Halloween), `christmas` (Pack 8 - Christmas).
  - Trích xuất ảnh bìa card gốc (`p1-bg` đến `p8-bg`) lưu tại `web/public/game-assets/main_menu/cards/`.
  - Hiển thị danh sách cuộn ngang theo phong cách Cocos2d-x gốc; có nút xem lại intro hoạt hình.
- **Gallery (`Gallery.tsx`)**:
  - Tái tạo giao diện lưới 2 hàng x 8 cột từ `Gallery::createScene()`.
  - Khung viền tranh dùng `gallery_icon_frame.png` (276×276 px), nền dùng `gallery_pattern.png` lặp tile với màu nền theo chủ đề từng pack (`#9676d9`, `#e8779b`, `#e89f41`, `#46a2dc`, `#d84742`, `#47b988`, `#6b3ba7`, `#3368a5`).
  - Hợp nhất toàn bộ 128 icon preview từ `gallery_icons1` và `gallery_icons2` vào `web/public/game-assets/ui/sprites/gallery_icons/`.
  - Nút quay lại dùng đúng `gallery-back-button.png`.
  - Đóng gói toàn bộ 128 tranh (`web/public/art/pack{1..8}/{1..16}`) với mask và outline.
- **IndexedDB & Thumbnail Persistence**:
  - Khi lưu tranh (`btn_ok.png`), canvas tạo ảnh thu nhỏ 264×264 px và lưu kèm `actions` vào IndexedDB với khóa `pack-picture`.
  - Gallery tự động đọc IndexedDB: nếu tranh đã tô, hiển thị thumbnail đã vẽ; nếu chưa, hiển thị preview gốc (khớp hành vi B08 & B09).
- **Sound Manager (`audio.ts`)**:
  - Tích hợp nhạc nền `bg_menu.mp3` cho Menu/Gallery và `bg_game.mp3` cho màn vẽ; phát hiệu ứng âm thanh click, fill, erase, star từ `game-assets/sounds/`.
