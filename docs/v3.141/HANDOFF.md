# Bàn giao: danh sách tranh và dữ liệu 3.141

## Yêu cầu và phạm vi

Người dùng muốn web bám logic app gốc 3.141. Menu công cụ được cố ý tinh giản còn bút dạ, bút chì và đổ màu; bảng có 56 màu. Người dùng tự kiểm tra trực quan và sẽ chỉ ra vị trí cần đối chiếu sâu. Không tự khẳng định giống 100% khi chưa có bằng chứng.

Đang thực hiện kế hoạch lập ánh xạ chủ đề → tranh gốc, trích xuất tranh và vùng tô, nối cùng route/lưu trữ, rồi đối chiếu tiếp cơ chế cuộn. Công việc này **chưa hoàn tất**.

## Trạng thái web

- Các route: `/topics`, `/topics/:pack/pictures`, `/topics/:pack/pictures/:picture`. URL là nguồn trạng thái điều hướng; cuộn gallery cập nhật chủ đề trong route. URL query `?screen=...` cũ được chuyển sang route tương ứng.
- Gallery cuộn liên tục, đổi nền theo chủ đề và cuộn khi mở. Thời lượng và đích tween 3.141 có bằng chứng; cách lặp, khoảng chạy thực tế và easing còn phần mô phỏng. Xem [GALLERY_SCROLL_EVIDENCE.md](GALLERY_SCROLL_EVIDENCE.md).
- Tranh vẽ đang dùng dữ liệu **3.101**, không phải bộ đã phục hồi từ 3.141. `web/src/types.ts` là nơi ánh xạ chủ đề sang bộ dữ liệu và tạo khóa lưu. Ảnh xem trước của chủ đề có dữ liệu lấy từ chính outline sẽ mở.
- Các chủ đề Insects, Dinosaurs, Ocean, Magic hiện bị vô hiệu hóa vì chưa có liên kết bộ tranh đáng tin cậy. Không xóa khóa này chỉ dựa trên số thứ tự tên file.
- Halloween và Christmas dùng khóa lưu `mapped-v2:` vì trước đây cùng ID chủ đề có thể trỏ tới bộ khác. Dữ liệu cũ vẫn trong IndexedDB nhưng không tự áp lên bộ mới; tránh ghi đè hoặc di chuyển khi chưa xác minh.
- Trạng thái làm việc gồm nhiều thay đổi chưa commit, trong đó có thay đổi từ phiên/agent trước. Giữ nguyên chúng; không reset tùy tiện.

## Bằng chứng và dữ liệu đã chuẩn bị

- `reports/v3.141/gallery-art-mapping.json`: 12 sản phẩm menu và 160 ảnh xem trước ứng viên; kèm ID sprite, outline và vùng tô theo tên. Số nhóm asset **chưa** chứng minh là ID chủ đề runtime.
- `reports/v3.141/gallery-cross-version-similarity.json`: kết quả so sánh ảnh tự động, chỉ là heuristic. Tái tạo bằng `extracted/v3.141/unity-venv/bin/python scripts/compare_gallery_versions_v3141.py`; tạo lại bảng tên bằng `python3 scripts/build_gallery_mapping_v3141.py`.
- Nhóm asset 9 có 16 outline, 15 bộ vùng tô theo quy tắc tên; tranh 9-16 chưa thấy vùng tô tương ứng. Nhóm 10 có 16 preview nhưng chưa thấy outline/vùng tô theo quy tắc tên đã quét. Đây là kết quả tìm kiếm có phạm vi, không chứng minh asset không tồn tại ở nơi khác.
- Phép quy đổi Unity pixels-per-unit đã khớp tốt trên mẫu nhóm 1 tranh 1, chưa được xác minh toàn bộ. `scripts/stage_art_v3141.py` đã tạo 15 tranh ứng viên nhóm 9 và 126 vùng tô tại `extracted/v3.141/art-staging/group9`; thư mục `extracted/` bị gitignore và **không phải dữ liệu đã tích hợp web**.
- Các file tạm `/tmp/draw-v3141-assets/resources.assets` và `resources.assets.resS` chiếm khoảng 3 GB, có thể bị hệ thống dọn; chúng được trích chọn từ `extracted/v3.141/base/assets/bin/Data/data.unity3d`. Script stage cần cả hai file nằm cạnh nhau và UnityPy/Pillow trong `extracted/v3.141/unity-venv`.

## Việc tiếp theo

1. Lần code 3.141 từ lựa chọn `MainMenuPack`/`ProductTypes` qua `GalleryMenu`, `PacksList`, `LoadIcons` và `LoadImage` để chứng minh chủ đề ↔ nhóm asset và thứ tự tranh. Metadata đã xác định các lớp và địa chỉ trong [GALLERY_SCROLL_EVIDENCE.md](GALLERY_SCROLL_EVIDENCE.md); enum `ProductTypes` không được suy ra bằng vị trí danh sách.
2. Kiểm tra phép dựng outline/mask trên thêm nhiều tranh, bao gồm điều kiện vùng phủ và thứ tự vùng. Tìm vùng tô tranh 9-16 và dữ liệu nhóm 10 bằng các tên/tài nguyên ngoài quy tắc đã quét.
3. Chỉ khi liên kết và dữ liệu đủ tin cậy, đưa asset tương ứng vào web, cập nhật ánh xạ tập trung, ảnh xem trước và lưu trữ; kiểm tra route, quay lại và reload. Không dùng fallback âm thầm sang tranh khác.
4. Đối chiếu vị trí bắt đầu, chiều rộng panel, quán tính và thay nền của gallery gốc; người dùng kiểm tra kết quả trực quan.

Các tài liệu cũ như `AUDIT.md` và `PROGRESS.md` có tuyên bố 100% hoặc hoàn tất không còn đáng tin; ưu tiên bằng chứng và giới hạn trong tài liệu này và các báo cáo mới. Lần kiểm tra gần nhất: build thành công, 8 test `npm --prefix web test` đạt.
