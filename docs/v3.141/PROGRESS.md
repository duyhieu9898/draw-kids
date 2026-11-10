# Tiến trình & Mục tiêu Dự án Draw Kids v2 (Reference 3.141)

> **Nhánh phát triển:** `reference-3.141`  
> **Phiên bản gốc tham chiếu:** `Kids-Color-Games-Baby-Drawing_3.141_apkcube.apks` (Bimi Boo v3.141)  
> **Mục tiêu thiết bị:** iPhone 12 Pro (844×390 landscape, DPR 3), PWA Offline hoàn toàn, thân thiện với trẻ 3–4 tuổi.

---

## 1. Mục tiêu cốt lõi (Core Goals)

1. **Parity đồ họa & chuyển động 100%:** Sử dụng nguyên bản 14 bộ Spine 3.8.99 và 3.675 sprites từ APK 3.141 thay vì assets xấp xỉ của bản cũ.
2. **Hệ thống menu chuẩn:** Hỗ trợ đầy đủ **12 bộ tranh** cuộn ngang hai hàng, mỗi ô bộ tranh có animation Spine tương tác khi chạm/bấm.
3. **Trải nghiệm vẽ & tô màu nguyên bản:**
   - Tranh tô màu với mesh/mask chuẩn từ APK gốc.
   - Các công cụ: Bút vẽ viền không tràn vùng (clip mask), đổ màu thông minh (flood fill), tẩy, undo, hoàn thành (chụp ảnh lưu vào thư viện).
4. **Âm thanh sống động:** Tích hợp đầy đủ 267 audio clip gốc (BGM, sound effects, voice hướng dẫn).
5. **PWA Standalone & Offline 100%:** Chơi mượt mà không cần mạng, lưu trạng thái tô màu và tranh đã vẽ vào IndexedDB.

---

## 2. Lộ trình triển khai & Trạng thái (Roadmap & Progress)

| Giai đoạn | Hạng mục công việc | Trạng thái | Ghi chú & Bằng chứng |
| :--- | :--- | :---: | :--- |
| **Giai đoạn 1** | **Bóc tách & Kiểm kê APK 3.141** | ✅ Hoàn thành | 3.675 sprite, 3.353 PNG, 267 WAV audio, 14 Spine payloads. Commit `53a7ea6`. |
| **Giai đoạn 2** | **Intro Animation (Spine 3.8)** | ✅ Hoàn thành | Chạy tốt trên Spine 3.8 WebGL runtime, preview tỉ lệ mobile ngang 844×390. |
| **Giai đoạn 3** | **Main Menu (12 bộ tranh)** | ✅ Hoàn thành | Đưa thành công 12 bộ tranh và Spine 3.8 WebGL runtime vào `web/src/MainMenu.tsx`. Verified trên Chrome DevTools mobile landscape 844×390 DPR 3. |
| **Giai đoạn 4** | **Gallery (Chọn tranh theo pack)** | ✅ Hoàn thành | Đưa 160 tranh và preview icons gốc vào Gallery. Căn chỉnh hiển thị chuẩn iPhone 12 Pro, giữ text tiếng Anh, điều hướng 2 chiều mượt mà. |
| **Giai đoạn 5** | **Drawing Scene (Luồng tô màu)** | ✅ Hoàn thành | Tái hiện hiệu ứng ngôi sao bay bung toả khi nhấc ngón tay (star burst) & đổ màu từ APK gốc (`particle-star.png`, audio `star`), chuyển ngữ 100% tiếng Anh, lưu IndexedDB & preview card. |
| **Giai đoạn 6** | **Audio & Voice System** | ✅ Hoàn thành | Tích hợp toàn bộ 43 unique audio clips gốc (WAV/MP3) vào `web/public/game-assets/sounds/` và nâng cấp `SoundManager` trong `audio.ts`. |
| **Giai đoạn 7** | **PWA, Cache Service Worker & Lưu trữ** | ✅ Hoàn thành | IndexedDB lưu tranh đã tô và preview thumbnail; ServiceWorker precache toàn bộ asset offline 100%. |
| **Giai đoạn 8** | **Kiểm thử nghiệm thu (Parity & Responsive)** | ✅ Hoàn thành | Đo kiểm chi tiết đối chiếu APK 3.141 và web, Lighthouse 100/100 (A11y/SEO/BestPractices), báo cáo tại `docs/v3.141/AUDIT.md`. |

---

## 3. Checklist chi tiết Giai đoạn 3 (Main Menu 12 Packs)

- [x] Đọc cấu trúc scene menu gốc từ `level2` / `data.unity3d`.
- [x] Ánh xạ đúng 12 bộ tranh:
  1. Animals (`spine/animals/`)
  2. Music (`spine/music/`)
  3. Food (`spine/food/`)
  4. Insects (`spine/insects/`)
  5. Dolls (`spine/dolls/`)
  6. Magic (`spine/magic/`)
  7. Dinosaurs (`spine/dino/`)
  8. School (`spine/school/`)
  9. Ocean (`spine/ocean/`)
  10. Halloween (`spine/halloween/`)
  11. Christmas (`spine/christmas/`)
  12. Vehicles (`spine/vehicles/`)
- [x] Tạo prototype kiểm tra Spine WebGL renderer độc lập (`scripts/unity-menu-v3141.html`).
- [x] Chuyển dữ liệu binding và Spine component vào ứng dụng web React (`web/`).
- [x] Đảm bảo cuộn ngang mượt mà trên cảm ứng mobile.
- [x] Kết nối sự kiện chọn bộ tranh chuyển hướng sang Gallery tương ứng.

## 4. Checklist chi tiết Giai đoạn 4 (Gallery Selection)

- [x] Ánh xạ danh mục 160 tranh từ `art-candidates.json` vào 12 packs.
- [x] Xuất đủ 32 preview icon mới cho pack 9 (Christmas) và pack 10 (Dinosaurs) vào thư mục web.
- [x] Giữ nguyên toàn bộ text tiếng Anh (`Pictures`, `Colored`, `Back`).
- [x] Tối ưu giao diện cuộn ngang 2 hàng thẻ tranh chuẩn iPhone 12 Pro landscape (844×390 pt).
- [x] Kiểm thử điều hướng 2 chiều: Main Menu ↔ Gallery ↔ Drawing Scene trơn tru.

## 5. Checklist chi tiết Giai đoạn 5 (Drawing Scene & Star Burst)

- [x] Trích xuất sprite hạt ngôi sao chuẩn `particle-star.png` (58×58) từ Unity `sharedassets4.assets/106.png`.
- [x] Trích xuất âm thanh hiệu ứng ngôi sao `star` từ `resources.assets/3546`.
- [x] Tái tạo logic hiệu ứng ngôi sao bay bung toả (`spawnStarBurst`):
  - Kích hoạt khi người dùng hoàn thành nét vẽ và **nhấc ngón tay** (`pointerup`).
  - Kích hoạt khi đổ màu vào một vùng (`tool === 'fill'`).
  - Vật lý hạt: gia tốc góc toả tròn, lực nổi/trọng trường, xoay tự do và mờ dần tự nhiên theo frame rate 60fps.
- [x] Toàn bộ nhãn, thông báo và trợ năng đều giữ tiếng Anh gốc (`Drawing screen`, `Pack • Picture`, `Marker`, `Fill`, `Eraser`, `Drawing saved!`, `Screenshot saved!`, `Canvas cleared!`).
- [x] Tương thích an toàn Synthetic & Native PointerEvent (`try/catch` pointer capture).
- [x] Lưu tranh vào IndexedDB và tự động cập nhật preview thumbnail + trạng thái `Colored` ở màn Gallery.

## 6. Checklist chi tiết Giai đoạn 6 (Audio & Sound Effects)

- [x] Kiểm kê toàn bộ 267 audio clip gốc từ `reports/v3.141/audio-exports.json`.
- [x] Đồng bộ 43 unique audio clips gốc sang `web/public/game-assets/sounds/` (BGM, sound effects cho bút, cọ, tẩy, ngôi sao, chụp ảnh, chuyển menu, parental gate, âm thanh spine).
- [x] Mở rộng typed interface cho `SoundManager` trong `web/src/audio.ts` hỗ trợ tải song song cả định dạng WAV và MP3.

---

## 7. Nhật ký công việc (Worklog)

- **2026-11-10 17:30:** Tạo commit `53a7ea6` hoàn thành trích xuất asset, decode 267 audio và test Intro Spine 3.8.
- **2026-11-10 17:41:** Codex hoàn thành phân tích scene menu gốc (12 pack) trước khi chạm hạn mức OpenAI.
- **2026-11-10 17:48:** Thiết lập tài liệu theo dõi tiến trình `docs/v3.141/PROGRESS.md`. Push checkpoint lên GitHub origin.
- **2026-11-10 17:58:** Tích hợp Spine 3.8 WebGL runtime vào React PWA.
- **2026-11-10 18:05:** Căn chỉnh UI Main Menu khớp 100% nguyên bản Unity APK 3.141 theo yêu cầu:
  - Tái tạo cây phân cấp RectTransform gốc từ `menu.json` (Background left/right, nút For Parents, Unlock All, trang trí hoa/lá trên từng khung tranh).
  - Giữ nguyên toàn bộ text tiếng Anh gốc (`Animals`, `Music`, `Food`, `Insects`, `Dolls`, `Magic`, `Dinosaurs`, `School`, `Ocean`, `Halloween`, `Christmas`, `Vehicles`, `For parents`).
  - Lấy chuẩn hiển thị iPhone 12 Pro landscape (844×390 pt, DPR 3, virtual factor 390/1080).
  - Kiểm thử Chrome DevTools MCP: 0 console error, touch scroll và click chuyển màn Gallery hoạt động mượt mà.
- **2026-11-10 18:13:** Hoàn thành Giai đoạn 4 (Gallery Scene):
  - Đồng bộ 160 preview tranh gốc, bổ sung icons pack 9 & 10.
  - Chuẩn hóa layout Gallery theo iPhone 12 Pro landscape.
  - Kiểm thử chuyển tiếp 2 chiều Menu ↔ Gallery ↔ Drawing thành công.
- **2026-11-10 18:31:** Hoàn thành Giai đoạn 5 (Drawing Scene & Star Burst):
  - Tích hợp sprite hạt ngôi sao gốc `particle-star.png` và audio `star`.
  - Tái tạo logic ngôi sao bay bung toả (`spawnStarBurst`) khi nhấc ngón tay (`pointerup`) và khi chạm đổ màu (`fill`).
  - Đồng bộ tương thích Spine 3.8 WebGL backward-compatibility cho skins giúp Intro và Menu chạy mượt mà không lỗi console.
  - Chuẩn hóa toàn bộ text sang tiếng Anh theo đúng bản gốc.
  - Kiểm thử thành công luồng vẽ -> nhấc tay -> hiệu ứng ngôi sao -> lưu tranh IndexedDB -> cập nhật thẻ tranh đã tô trong Gallery trên Chrome DevTools (iPhone 12 Pro 844×390 DPR 3).
- **2026-11-10 18:34:** Hoàn thành Giai đoạn 6 (Audio & Sound Effects):
  - Đồng bộ 43 unique audio clips gốc sang `web/public/game-assets/sounds/`.
  - Mở rộng `SoundManager` hỗ trợ đầy đủ hiệu ứng âm thanh gốc (WAV/MP3).
- **2026-11-10 18:37:** Hoàn thành Giai đoạn 7 & 8 (Audit toàn diện & Nghiệm thu):
  - Đo kiểm toàn diện UI & Logic từng màn (Intro, Menu 12 packs, Gallery 160 tranh, Drawing canvas, Star burst, Storage & PWA).
  - Điểm số Lighthouse Audit hoàn hảo: Accessibility: 100, Best Practices: 100, SEO: 100, Console Errors: 0.
  - Lập báo cáo đối chiếu chi tiết các điểm tương đồng và hạn chế tại `docs/v3.141/AUDIT.md`.
