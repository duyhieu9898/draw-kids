# Plan tối ưu hiệu năng web 3.141 (mục tiêu: mượt trên iPhone 12 Pro)

Tài liệu này là checklist thực thi. Số liệu "đo" lấy từ `npm run build` và file trên đĩa ngày 2026-11-12; các ngân sách còn lại là mục tiêu cần đo lại trên máy thật.

## 0. Baseline đo được (trước khi sửa)

| Hạng mục | Hiện tại |
|---|---|
| JS / CSS | 260 KB (81 KB gzip) / 14 KB |
| Precache PWA | 5.171 file, 62,4 MB (gồm 23 MB `art/v3141-*` chưa dùng) |
| Art PNG | 4.037 file, 40 MB |
| Gallery DOM | 576 card, 1.152 `<img>` (12 pack × 16 × 3 vòng) |
| 1 tranh | outline 775×775 + tới 41 vùng mask |
| `maskSurface` mỗi vùng | 775×775×4 = **2,4 MB**, luôn cấp đủ khung → tranh 41 vùng ≈ 98 MB |
| Canvas vẽ (IP12 Pro) | 1170×2532 ≈ 11,8 MB, bị **cấp phát lại mỗi `pointermove`** |
| Menu | 12 skeleton Spine, WebGL 60fps không nghỉ |
| Âm thanh | 49 MB WAV (60 file), tải theo nhu cầu |

Ngân sách đích sau khi xong:

- Vuốt gallery: không có long task > 50 ms khi đang quán tính; cảm giác không "khựng tay".
- Vẽ: input → paint trong 1 frame; 60fps khi đã có 50 nét + 20 vùng tô.
- Mở tranh: < 1,5 s trên 4G, < 400 ms khi đã cache; RAM tab < 250 MB.
- Precache install ≤ 15 MB (art tải theo pack, cache vĩnh viễn sau lần đầu).
- Menu ở trạng thái tĩnh: gần 0% CPU/GPU.

## Nguyên tắc chung

1. **Không đổi công nghệ render**: 2D canvas là đúng cho bài toán mask + clip + nét bút. Không chuyển sang WebGL/Konva/Fabric — sẽ kéo theo bundle lớn và khó khớp pixel với app gốc.
2. **Không vẽ lại thứ không đổi**: mọi vòng lặp frame chỉ được tổng hợp các lớp đã cache, không dựng lại từ danh sách action.
3. **Không cấp phát trong hot path**: canvas/image tạo lúc mở tranh, không tạo trong `render()`.
4. **Không ghi scroll/state trong lúc ngón tay còn đang quán tính** trên iOS.

---

## Phase 1 — Gallery: hết giật khi vuốt (ưu tiên 1, rủi ro thấp)

**Vấn đề gốc:** `Gallery.handleScroll` chạy 2 lần `querySelectorAll` trên hơn 576 node mỗi event và **ghi `viewport.scrollLeft`** để cuộn vòng. Trên iOS Safari, ghi `scrollLeft` giữa lúc momentum làm đứt quán tính.

### Việc làm

1. **Tách wrap khỏi sự kiện scroll.**
   - Thêm helper thuần trong `src/galleryScroll.ts`: `shouldRecenter(position, cycleWidth)` trả về `-1 | 0 | 1`.
   - Chỉ recenter trong `scrollend`; nếu trình duyệt chưa có `scrollend` thì debounce 120 ms sau event scroll cuối.
   - Điều kiện recenter giữ nguyên biên hiện tại (`< 0.5×cycleWidth`, `>= 2.5×cycleWidth`) để không nhảy hình.
2. **Cache metric layout.** Tính `cycleWidth`, `offsetLeft`/center của từng `.gallery-pack-section` một lần sau mount và mỗi lần `ResizeObserver` báo đổi (font/ảnh load xong). Handler scroll chỉ dùng mảng đã cache, throttle bằng `requestAnimationFrame`, không query DOM.
3. **Giảm DOM mỗi card từ 2 ảnh còn 1.** Khung `.gallery-frame-border` chuyển thành `background-image` + `background-size: contain` trên `.gallery-frame-wrapper`; chỉ còn `<img>` thumbnail (576 thay vì 1.152 node, giữ nguyên hình).
4. **Bật lazy render của trình duyệt:** `content-visibility: auto` + `contain-intrinsic-size` cho `.gallery-pack-section`; `contain: layout paint style` cho `.gallery-picture-card`; `img { decoding: 'async' }`.
5. **Thumbnail 264px sinh sẵn.** Script build (Python/Pillow hoặc `sharp` devDependency) xuất `art/pack{N}/{M}/thumb.webp` cạnh `outline.png`. Kỳ vọng: ~100 KB PNG → ~10 KB WebP; decode 2,4 MB → 0,28 MB mỗi ảnh. Gallery dùng `thumb.webp`, màn vẽ vẫn dùng `outline.png`.
6. **Auto-scroll tới pack đang mở** bằng `scrollTo({ behavior: 'smooth' })` thay cho tween tự ghi `scrollLeft`, hoặc giữ tween nhưng dừng ngay khi có `pointerdown/wheel/scrollend`.
7. **Thumbnail đã tô lưu dạng Blob** (bỏ base64 dataURL): tiết kiệm 33% dung lượng, không encode base64 trên main thread khi bấm Done. Đọc ra bằng `URL.createObjectURL`, revoke khi unmount. Cần key phiên bản cho dữ liệu cũ (xem Phase 5).

### Nghiệm thu
- Vuốt liên tục 10 vòng qua hết 8 pack: không có frame > 32 ms trong Performance timeline; cuộn vòng không nhảy hình.
- Số node `<img>` trong gallery < 700; thời gian mở gallery < 300 ms sau khi cache.

---

## Phase 2 — DrawScene: kiến trúc layer + cache (ưu tiên 1)

**Vấn đề gốc:** `render()` gán lại `canvas.width/height` mỗi lần gọi, tạo canvas tint mới cho từng fill mỗi frame, và vẽ lại toàn bộ nét của mọi vùng. Mỗi `pointermove` = 1 setState + full redraw 11,8 MB buffer.

### Kiến trúc mới (thay cho "redraw từ actions")

Bốn lớp, tất cả tạo **một lần** khi mở tranh:

| Lớp | Kích thước | Nội dung | Khi nào đổi |
|---|---|---|---|
| `fillLayer[regionId]` | đúng `bounds` | màu tô (tint từ mask) | chỉ khi vùng đó được tô |
| `strokeLayer[regionId]` | đúng `bounds` | nét bút/erase đã commit | chỉ khi commit nét vào vùng đó |
| `compositeLayer[regionId]` | đúng `bounds` | `fill` + `stroke` đã clip bằng mask | khi fill/stroke của vùng đổi |
| canvas hiển thị | viewport × DPR | composite các vùng + outline + nét đang vẽ + particle | mỗi frame khi có tương tác |

Luồng một nét:
1. `pointerdown`: hit-test, tạo `draft` trong **ref** (không setState), vẽ điểm đầu lên `strokeLayer` tạm.
2. `pointermove`: nối đoạn mới vào vùng tạm + đánh dấu dirty; **một** rAF vẽ lại canvas hiển thị (3–5 `drawImage`, không cấp phát).
3. `pointerup`: clip vùng tạm bằng mask của vùng (`destination-in`, chỉ trong `bounds`), đẩy action vào state, cập nhật `compositeLayer[regionId]`, clear vùng tạm.

Chi tiết kỹ thuật:

1. **Kích thước mask theo `bounds`.** Bỏ `maskSurface` 775×775; mỗi vùng giữ `maskSurface` = `width × height` và offset `(left, top)`. Khi ghép lên canvas hiển thị, `drawImage` tại `fit.x + left*scale`. Với 41 vùng, bộ nhớ mask giảm từ ~98 MB xuống ~2–3 MB.
2. **Hit-test bằng `Uint8Array`.** Lúc load, đọc alpha của mask một lần (dùng `createImageBitmap` + `imageBitmap.close()` sau khi trích) và lưu `Uint8Array` alpha cỡ `bounds`. Bỏ hoàn toàn `hitCanvas` + `getImageData` mỗi lần chạm (đây là sync readback, tốn ms trên iOS).
3. **Canvas hiển thị:** `ResizeObserver` + chỉ gán `width/height` khi kích thước thực đổi. Tạo context `getContext('2d', { alpha: false, desynchronized: true })` (opaque → bỏ được `fillRect` trắng mỗi frame, compositor nhanh hơn).
4. **Một vòng rAF duy nhất, chạy theo nhu cầu.** Thay 2 vòng (render effect + particle loop) bằng `requestAnimationFrame` scheduler có `dirty` flag; dừng hẳn khi không dirty; pause khi `document.hidden`.
5. **Bút mượt, ít điểm rác.** Dùng `event.getCoalescedEvents()` khi có, lấy mẫu theo khoảng cách tối thiểu ~1,2 px trong toạ độ art, giữ smoothing quadratic hiện tại. `points` là mảng mutable trong ref, chỉ copy khi commit.
6. **Fill không dựng canvas mới.** Cache tint theo `regionId:color` dưới dạng canvas cỡ `bounds`, tái sử dụng; fill chỉ `drawImage` mask đã tint vào `fillLayer`.
7. **Particle:** pool sẵn canvas tint theo màu (đã có `tintedStarsRef`), không gọi full render; hoặc vẽ particle lên một canvas overlay nhỏ phủ viewport. Tổng particle tối đa ~120.
8. **Giải phóng bộ nhớ:** khi rời màn vẽ, đóng bitmap, bỏ reference canvas theo vùng; mở tranh khác không giữ canvas tranh cũ.
9. **Lưu trữ:** đóng gói `actions` với toạ độ làm tròn 1 chữ số thập phân; thumbnail lưu Blob; `updatedAt` giữ nguyên schema.

### Nghiệm thu
- Vẽ 60 giây liên tục trên `pack2/1` (41 vùng): không frame nào > 24 ms; không có GC spike do cấp phát canvas.
- Sau 50 nét + 20 fill: frame time không tăng theo số action (đo trước/sau bằng cùng thao tác).
- Mở tranh: `performance.measure` từ route change tới frame đầu < 400 ms ở cache nóng.
- Bộ nhớ canvas của tranh: đo bằng `performance.memory`/Safari memory < 20 MB.

---

## Phase 3 — Main menu: bỏ vòng lặp vô ích

1. **Event-driven render.** Giữ `requestAnimationFrame` nhưng chỉ chạy `renderer` khi có lý do: pack được hover/tap (trong suốt thời lượng animation `action`), đang cuộn, vừa resize, hoặc ảnh/skeleton load xong. Trạng thái tĩnh dùng `static_frame` (đã có) → CPU/GPU gần 0.
2. **Pause khi tab ẩn** (`visibilitychange`) và `pagehide`.
3. **Lazy-load Spine theo vùng nhìn.** Hiện load cả 12 skeleton (3,8 MB) ngay; chuyển sang `IntersectionObserver`: nạp skeleton của pack sắp vào viewport (visible ± 1 pack). Dùng `assets.loadText/loadTextureAtlas` theo nhu cầu, giữ 1 `ManagedWebGLRenderingContext`.
4. **Cache `getBoundingClientRect` theo frame**, không đọc per-slot per-frame khi không cần.

### Nghiệm thu
- Menu đứng yên: sau 2 s không tương tác, không còn GPU/CPU work (kiểm tra Performance: không có draw call lặp).
- Cuộn menu 12 pack: không giật, texture chỉ tải cho pack gần viewport.

---

## Phase 4 — Tải và phân phối asset

1. **Thu hẹp precache Workbox** trong `vite.config.ts`:
   - `globIgnores: ['art/v3141-*/**']` (bộ 3.141 chưa nối vào mapping, 23 MB) — bỏ ignore này khi chuyển dữ liệu.
   - Chỉ precache: `index.html`, JS/CSS, icon, `game-assets/ui/**` cần cho shell, intro, menu.
   - Thêm `runtimeCaching` cho `/art/**`, `/game-assets/sounds/**`, `/v3.141/**`: `CacheFirst`, 30 ngày, để vẫn offline sau lần chơi đầu.
   - Mục tiêu: install ≤ 15 MB, mỗi pack art tải khi mở (1,5–4 MB), giữ nguyên offline theo pack.
2. **Chuyển art sang WebP alpha** ở bước staging (script Python/Pillow hoặc `sharp`), giữ PNG gốc trong `original/`/pipeline. Kỳ vọng 40 MB → ~12 MB, decode nhanh hơn. Chỉ đổi đuôi sau khi so pixel với bản PNG (ngưỡng lệch ≤ 1/255 trên alpha và RGB).
3. **Âm thanh:** 49 MB WAV là dư thừa. Convert effect dùng nhiều (`brush`, `star`, `fill`, `click*`) sang m4a/mp3; chỉ preload 4–6 effect (< 1,5 MB); BGM đã là mp3.
4. **Preload có chủ đích:** `<link rel="preload">` cho atlas intro + menu đầu tiên; khi vào gallery, preload outline/thumb của pack đang mở; khi vào màn vẽ, preload trước ảnh 1 tranh kế cận (dùng `new Image()` idle callback) — tránh waterfall lúc bấm.
5. **HTTP cache headers**: art, sounds, v3.141 đặt `Cache-Control: public, max-age=31536000, immutable` (asset có hash hoặc tĩnh theo phiên bản).

### Nghiệm thu
- `npm run build`: precache entries/bytes giảm còn ≤ 15 MB.
- Lần đầu mở trên 4G (throttle Fast 3G): gallery hiện khung < 2 s; mở 1 tranh < 1,5 s.
- Offline: mở lại pack đã chơi vẫn vẽ được, đủ ảnh.

---

## Phase 5 — Chống hồi quy và dữ liệu cũ

1. **Test thuần (node, không cần browser)** cho logic mới:
   - `galleryScroll.test.mjs`: `shouldRecenter`, `nearestSection` với mảng offset cache.
   - `regionGeometry.test.mjs`: map `bounds` → toạ độ viewport, clip bounds cho nét, sample `Uint8Array` hit-test.
   - Giữ `routes.test.mjs`, `particleColors.test.mjs`, `introViewport.test.mjs`.
2. **Kiểm tra pixel parity** cho màn vẽ: fixture action cố định + 1 tranh nhỏ, render ra PNG ở cả bản cũ/mới, so lệch ≤ 1%. Chạy bằng Chrome headless (đã có) hoặc script Node + canvas; không thêm dependency runtime.
3. **Version hoá storage.** Đổi schema lưu tranh (`savedVersion: 2`, thumbnail Blob, key kèm phiên bản dữ liệu tranh). Đọc được dữ liệu v1 (actions mảng hoặc object cũ) và migrate lười; xử lý luôn mục 3 trong `HANDOFF.md` (khoá IndexedDB khi chuyển sang dữ liệu 3.141).
4. **Đo trên máy thật trước khi chốt:** Safari iOS + Web Inspector → Timeline: (a) vuốt gallery 10 vòng, (b) vẽ 60 s trên tranh 41 vùng, (c) mở menu để yên 30 s. Ghi frame time, memory, long task vào `reports/v3.141/perf-baseline.json`.

---

## Thứ tự thực hiện và ước lượng

| Bước | Nội dung | Ước lượng | Rủi ro |
|---|---|---|---|
| 1 | Phase 1 (gallery scroll + DOM + thumb WebP) | 0,5–1 ngày | Thấp |
| 2 | Phase 2 (layer cache + hit-test + input) | 1,5–2 ngày | Trung bình (phải khớp pixel) |
| 3 | Phase 4.1 (precache + runtime cache) | 0,5 ngày | Thấp (kiểm tra offline) |
| 4 | Phase 3 (menu event-driven) | 0,5 ngày | Thấp |
| 5 | Phase 4.2–4.3 (WebP art, audio) | 0,5–1 ngày | Trung bình (pixel/âm thanh) |
| 6 | Phase 5 (test + đo máy thật) | 0,5 ngày | Thấp |

Làm Phase 1 + 2 + 4.1 là đã giải quyết ~90% cảm giác lag. Phase 3 và WebP/audio là tối ưu pin, dung lượng và lần mở đầu.

## Không làm (đã cân nhắc và loại)

- Chuyển màn vẽ sang WebGL/regl: bài toán là 2D mask + nét, WebGL không nhanh hơn đáng kể nhưng tăng độ phức tạp và khó giữ pixel parity.
- Dùng `OffscreenCanvas` + worker cho nét bút: Safari iOS chưa ổn định cho đường đi này, và chi phí postMessage mỗi điểm lớn hơn lợi ích.
- Ảo hoá gallery bằng thư viện: `content-visibility` + giảm node là đủ, tránh thêm dependency.
- Giữ nguyên `drawTintedRegion` gọi mỗi frame: đây chính là nguồn GC churn, phải bỏ.
