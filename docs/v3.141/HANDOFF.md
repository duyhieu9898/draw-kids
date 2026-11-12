# Bàn giao: danh sách tranh và dữ liệu 3.141

## Yêu cầu và phạm vi

Người dùng muốn web bám logic app gốc 3.141. Menu công cụ được cố ý tinh giản còn bút dạ, bút chì và đổ màu; bảng có 56 màu. Không cần cơ chế "Please rotate your device to landscape mode" vì web chỉ chạy 1 mode duy nhất. Người dùng tự kiểm tra trực quan và sẽ chỉ ra vị trí cần đối chiếu sâu. Không tự khẳng định giống 100% khi chưa có bằng chứng.

## Trạng thái web

- Các route: `/topics`, `/topics/:pack/pictures`, `/topics/:pack/pictures/:picture`. URL là nguồn trạng thái điều hướng; cuộn gallery cập nhật chủ đề trong route. URL query `?screen=...` cũ được chuyển sang route tương ứng.
- Đã gỡ bỏ notice thông báo xoay màn hình portrait và media query portrait.
- Gallery cuộn liên tục, đổi nền theo chủ đề và cuộn khi mở. Thời lượng và đích tween 3.141 có bằng chứng; cách lặp, khoảng chạy thực tế và easing còn phần mô phỏng. Xem [GALLERY_SCROLL_EVIDENCE.md](GALLERY_SCROLL_EVIDENCE.md).
- Tranh vẽ hiện tại:
  - Dữ liệu 3.101 cũ đang nằm tại `web/public/art/pack1` đến `pack8`.
  - Toàn bộ 8 nhóm tranh gốc 3.141 (Group 1 đến 8, 16 tranh/nhóm, tổng cộng 1.894 regions) đã được trích xuất hoàn chỉnh từ Unity `resources.assets` và đặt tại `web/public/art/v3141-pack1` đến `v3141-pack8`.
  - Phép chuyển đổi tọa độ và scale hình học 775×775 chuẩn PPU đã khớp tốt trên toàn bộ các nhóm tranh.

## Bằng chứng và dữ liệu đã chuẩn bị

- `reports/v3.141/gallery-art-mapping.json`: 12 sản phẩm menu và 160 ảnh xem trước ứng viên; kèm ID sprite, outline và vùng tô theo tên.
- `reports/v3.141/gallery-cross-version-similarity.json`: kết quả so sánh đối chiếu tương quan giữa các nhóm asset 3.141 và pack 3.101.
- Toàn bộ tranh Group 1–8 đã sẵn sàng tại:
  - Group 1 (Animals): 16 tranh, 202 regions
  - Group 2 (Dolls): 16 tranh, 378 regions
  - Group 3 (School): 16 tranh, 215 regions
  - Group 4 (Music): 16 tranh, 219 regions
  - Group 5 (Vehicles): 16 tranh, 235 regions
  - Group 6 (Food): 16 tranh, 201 regions
  - Group 7 (Halloween): 16 tranh, 198 regions
  - Group 8 (Christmas): 16 tranh, 226 regions
  - Group 9: 15 tranh, 126 regions (đang ở staging)
- Nhóm 10 (Dinosaurs) và các nhóm mở rộng còn lại chưa có đủ cặp outline/region được đặt tên theo quy tắc quét tự động.

## Việc tiếp theo

1. Chuyển mạch mapping trong `web/src/types.ts` để nạp dữ liệu từ `v3141-pack*`, cập nhật thumbnail mặc định của gallery sang outline mới.
2. Kiểm tra trực quan thao tác vẽ, tô màu và tẩy trên bộ tranh mới bằng browser.
3. Giải quyết khóa lưu trữ IndexedDB khi chuyển sang dữ liệu tranh 3.141 để tránh hiển thị sai vị trí nét vẽ của dữ liệu cũ.
