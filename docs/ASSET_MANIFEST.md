# Kiểm kê Tài nguyên APK (Asset Manifest)

Tài liệu này ghi lại kết quả kiểm tra tĩnh tệp APK gốc bằng thư viện chuẩn Python (không giải nén toàn bộ tài nguyên, không sử dụng công cụ ngoài).

---

## 1. Thông tin APK & Mã băm (Hash)

- **VERIFIED** — Đường dẫn tệp: `original/kids-coloring-and-drawing-games-3-101.apk`
- **VERIFIED** — Kích thước: `71,241,323` bytes
- **VERIFIED** — SHA-256: `e89e7d3e05751cc9b9240ee38e101b0f4bc3a637029b64842dd3a67c8ad83d15`
- **VERIFIED** — Tổng số mục trong archive APK: `2,619` mục (đều là tệp)
- **UNKNOWN** — Quyền sở hữu và bản quyền (Rights): Chưa xác minh quyền tái sử dụng hoặc phát hành các tài nguyên; việc kiểm kê không xác lập giấy phép.

---

## 2. Thống kê tài nguyên theo định dạng mở rộng (Extension)

### Trong thư mục `assets/` (Tổng cộng 2,192 tệp)

- **VERIFIED** — Thống kê số lượng tệp theo phần mở rộng:
  - `.png`: 1,924 tệp
  - `.plist`: 135 tệp
  - `.strings`: 63 tệp
  - `.mp3`: 29 tệp
  - `.atlas`: 11 tệp
  - `.json`: 11 tệp
  - `.ttf`: 10 tệp
  - `.wav`: 5 tệp
  - `.txt`: 2 tệp
  - `.zip`: 1 tệp (`assets/compressable/compressed.zip`)
  - `.ccbi`: 1 tệp

### Toàn bộ tệp trong APK (2,619 tệp; không có entry thư mục)

- **VERIFIED** — Thống kê toàn archive APK:
  - `.png`: 2,178
  - `.xml`: 154
  - `.plist`: 135
  - `.strings`: 63
  - `.mp3`: 29
  - `.version`: 11
  - `.atlas`: 11
  - `.json`: 11
  - `.ttf`: 10
  - `.wav`: 5
  - `.so`: 3
  - `.txt`: 2
  - `.rsa`: 1
  - `.sf`: 1
  - `.mf`: 1
  - `.zip`: 1
  - `.ccbi`: 1
  - `.dex`: 1
  - `.arsc`: 1

- **INFERRED** — Mục đích sử dụng tài nguyên:
  - `.png`, `.plist`: Texture atlas và spritesheet phục vụ hiển thị đồ họa game (Cocos2d-x).
  - `.mp3`, `.wav`: Âm thanh nền, lồng tiếng và hiệu ứng tương tác (sound effects).
  - `.ttf`: Phông chữ giao diện.
  - `.strings`: Tệp bản địa hóa ngôn ngữ.
  - `.atlas`, `.json`: Dữ liệu hoạt ảnh (Spine / Skeletal animation).
  - `.ccbi`: Giao diện / cảnh xây dựng từ CocosBuilder.

---

## 3. Ghép cặp `assets/res/pack*/image-*.png` và `.plist`

- **VERIFIED** — Quy tắc đường dẫn: `assets/res/pack{1..8}/image-{1..8}-{1..16}.{png,plist}`
- **VERIFIED** — Số lượng thư mục pack: 8 thư mục (`pack1` đến `pack8`)
- **VERIFIED** — Số lượng tệp PNG theo mẫu: 128 tệp
- **VERIFIED** — Số lượng tệp PLIST theo mẫu: 128 tệp
- **VERIFIED** — Số cặp `image-*.png` và `image-*.plist` khớp nhau: **128 cặp** (mỗi pack có đúng 16 cặp hoàn chỉnh, không có tệp lẻ/mồ côi)
- **INFERRED** — Mục đích: Mỗi cặp bao gồm một spritesheet lớn (PNG) đi kèm với tệp định nghĩa tọa độ các khung hình (PLIST TexturePacker format 3) cho các gói vẽ / tô màu theo chủ đề.

---

## 4. Chi tiết mẫu: `pack1/image-1-3`

- **VERIFIED** — Đường dẫn hình ảnh: `assets/res/pack1/image-1-3.png`
  - Kích thước đọc trực tiếp từ IHDR header: **779 × 1,289** px (chiều rộng: 779 px, chiều cao: 1,289 px)
- **VERIFIED** — Đường dẫn plist: `assets/res/pack1/image-1-3.plist`
  - Định dạng: Cocos2d-x TexturePacker dictionary format 3
  - Số lượng frame: **9 frames** (`img-1-3-1.png` đến `img-1-3-9.png`)
  - Thuộc tính `size` ghi trong metadata: `{779,1289}` (khớp hoàn toàn với IHDR header)
- **INFERRED** — Mục đích: Chứa các bộ phận/nét vẽ phân mảnh cấu thành bài vẽ số 3 thuộc gói chủ đề 1.

---

## 5. Tệp nén lồng nhau: `compressed.zip`

- **VERIFIED** — Đường dẫn trong APK: `assets/compressable/compressed.zip`
- **VERIFIED** — Kích thước file ZIP lồng: 1,333,287 bytes; kích thước entry sau nén trong APK: 1,331,416 bytes
- **VERIFIED** — Tổng số mục bên trong `compressed.zip`: **26 mục** (2 thư mục con và 24 tệp âm thanh `.wav`)
- **VERIFIED** — Danh mục chi tiết:
  - Thư mục: `sounds/`, `sounds/intro/`
  - Hiệu ứng âm thanh chung (`sounds/`):
    - `mm-scroll.wav`
    - `mm_scroll_long.wav`
    - `mm_scroll_short.wav`
    - `mm_transition_in.wav`
    - `screenshot.wav`
    - `draw-erase.wav`
    - `click-color.wav`
    - `parental-wrong.wav`
    - `parental-right.wav`
    - `tip.wav`
    - `star.wav`
    - `draw-color-select.wav`
    - `click.wav`
    - `fill.wav`
    - `game-particle.wav`
  - Âm thanh màn hình chào (`sounds/intro/`):
    - `ball1.wav`
    - `ball2.wav`
    - `bimiboo.wav`
    - `end.wav`
    - `hat.wav`
    - `palette.wav`
    - `appear.wav`
    - `brush.wav`
    - `kick.wav`
- **INFERRED** — Mục đích: Gói tài nguyên âm thanh giao diện và hiệu ứng khởi động, được đóng gói riêng để tải hoặc giải nén theo nhu cầu khi ứng dụng khởi chạy.

## Review

Agy lập manifest; agent chính đối chiếu độc lập số lượng assets, 128 cặp, mẫu PNG/plist và ZIP lồng với APK. Đây là kiểm kê; chưa có bộ asset đã tách vùng đủ dùng cho engine web.

Review đã sửa số tệp toàn APK (2.619, không phải 2.604) và kích thước ZIP lồng theo ZipInfo.
