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
| **Giai đoạn 3** | **Main Menu (12 bộ tranh)** | 🔄 Đang làm | Đã trích xuất cấu trúc scene Unity (`menu-bindings.json`), test preview Spine WebGL (`scripts/unity-menu-v3141.html`). Cần đưa vào React `web/src/MainMenu.tsx`. |
| **Giai đoạn 4** | **Gallery (Chọn tranh theo pack)** | ⏳ Chờ làm | Ánh xạ ID tranh từ catalog v3.141 sang từng pack trong 12 bộ. |
| **Giai đoạn 5** | **Drawing Scene (Luồng tô màu)** | ⏳ Chờ làm | Đồng bộ công cụ vẽ, bảng màu và clipping mask cho tập tranh 3.141. |
| **Giai đoạn 6** | **Audio & Voice System** | ⏳ Chờ làm | Tích hợp 267 file WAV đã decode vào `audio.ts`. |
| **Giai đoạn 7** | **PWA, Cache Service Worker & Lưu trữ** | ⏳ Chờ làm | IndexedDB lưu tranh đã tô, service worker precache offline. |
| **Giai đoạn 8** | **Kiểm thử nghiệm thu (Parity & Responsive)** | ⏳ Chờ làm | Kiểm thử Chrome DevTools kích thước 844×390 / DPR 3, test offline. |

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
- [ ] Chuyển dữ liệu binding và Spine component vào ứng dụng web React (`web/`).
- [ ] Đảm bảo cuộn ngang mượt mà trên cảm ứng mobile.
- [ ] Kết nối sự kiện chọn bộ tranh chuyển hướng sang Gallery tương ứng.

---

## 4. Nhật ký công việc (Worklog)

- **2026-11-10 17:30:** Tạo commit `53a7ea6` hoàn thành trích xuất asset, decode 267 audio và test Intro Spine 3.8.
- **2026-11-10 17:41:** Codex hoàn thành phân tích scene menu gốc (12 pack) trước khi chạm hạn mức OpenAI.
- **2026-11-10 17:48:** Thiết lập tài liệu theo dõi tiến trình `docs/v3.141/PROGRESS.md`. Tiếp tục triển khai đưa Menu 12 packs và Spine runtime vào Web App.
