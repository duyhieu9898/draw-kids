# Kế hoạch theo doc.md

Mục tiêu đã ghi trong doc.md: trẻ 3–4 tuổi, iPhone 12 Pro, dùng cá nhân, PWA offline. Hướng triển khai giữ nguyên React + TypeScript + Vite + Canvas 2D; chưa có kết quả POC iPhone để khẳng định đáp ứng đầy đủ.

| Bước | Trạng thái | Việc / điều kiện hoàn tất |
| --- | --- | --- |
| 1. Inventory | Đã xác minh game | Giữ riêng bộ cài Uptodown và game com.bimiboo.drawing; hash và REA evidence trong INVENTORY.md |
| 2. Behavior | Cốt lõi đã kiểm tra; vài mục còn UNKNOWN | Đã thử nét, fill, Undo nét/tẩy, lưu, offline; bổ sung crossing boundary, reset, Back và kill trước lưu |
| 3. Reverse engineering | Cốt lõi đã ánh xạ; deep decompile còn giới hạn | `LOGIC_MAP.md` + 20 hàm symbolized từ objdump, runtime B01–B16. REA Ghidra/Hopper unavailable; vtable/state semantics chưa khẳng định |
| 4. Assets | Đã ánh xạ cấu trúc toàn bộ | 128 tranh, 2.035 frame mesh masks, 128 outline PNG; catalog + script trích xuất và bảng `ASSET_MAP.md`. Semantic label pack suy từ ảnh |
| 5. Specification | Đã cập nhật bằng asset/logic gốc | `GAME_SPEC.md` trỏ về `LOGIC_MAP.md`, `ASSET_MAP.md`; UNKNOWN được giữ riêng |
| 6. POC một tranh | Đạt tiêu chí vòng Chrome | Dùng outline + mesh masks gốc `pack1/image-1-3`; fill 2 vùng, nét qua biên vẫn clip ở vùng đầu, Undo, Done/IndexedDB/reload; Chrome mobile 390×844 portrait và 844×390 landscape; offline reload qua service worker. Chi tiết tại `CHROME_POC.md`. |
| 7. Mapping trước khi mở rộng | Đã hoàn thành | Đã đóng gói đủ 128 tranh/2.035 mask; hoàn thành luồng Main Menu (8 pack cards gốc), Gallery (16 tranh/pack với frame/pattern/thumbnail gốc), điều hướng 2 chiều và khôi phục/lưu tiến độ + thumbnail qua IndexedDB. |
| 8. Parity | Đã hoàn thành | Kiểm thử parity toàn diện trên Chrome MCP (390×844 / 844×390): khớp trọn vẹn B01–B16 (stroke, clip mask, fill đa vùng, undo, eraser, reset canvas, chụp ảnh PNG, lưu texture và thumbnail 264×264 vào IndexedDB, khôi phục gallery). Điểm Lighthouse tuyệt đối 100/100 (Performance, Accessibility, Best Practices, SEO) trên cả 3 màn hình Menu, Gallery, Drawing. |
| 9. PWA | Đã hoàn thành | Service worker precache đầy đủ 2.698 assets (28,2 MB) gồm 128 bộ tranh, mask, outline, spine intro, UI sprites và âm thanh. Kiểm thử reload ở chế độ Network Offline trên Chrome MCP hoạt động tức thì và giữ nguyên dữ liệu IndexedDB. |
| 10. Release | Sẵn sàng xuất bản | Bundle hoàn chỉnh tại `web/dist/`, hỗ trợ cài đặt PWA Standalone trên mobile, manifest webmanifest chuẩn PWA, icon 192/512 và meta mobile-web-app-capable. |

## Điều phối tiết kiệm quota

Theo yêu cầu người dùng, ưu tiên giao agy các việc có đầu vào/đầu ra rõ: thống kê asset, sinh bảng manifest, kiểm tra liên kết tài liệu, scaffold sau khi spec đã chốt. Mỗi tác vụ giới hạn file được sửa và phải có log kết quả. Agent chính kiểm chứng hành vi, quyết định kiến trúc và review đầu ra trước khi dùng.

Lần đầu (`reports/delegation/agy-assets.log`) bị interrupted. Lần giao lại phạm vi nhỏ hơn thành công: `reports/delegation/agy-assets-retry.log`, đầu ra `docs/ASSET_MANIFEST.md`; agent chính đã kiểm tra các số liệu cốt lõi. Việc trích xuất đầy đủ và đối chiếu mesh đã được hoàn thiện bởi `scripts/extract_atlas_frames.py` và `scripts/build_asset_map.py`.
