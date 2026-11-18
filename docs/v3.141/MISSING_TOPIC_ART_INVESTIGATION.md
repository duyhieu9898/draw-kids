# Truy tìm tranh của bốn chủ đề

> Đã nối 64 tranh mới vào catalog native, xem [trạng thái 12 chủ đề](../THEME_DATA_GAP.md). Các ghi chú chưa nối native bên dưới mô tả thời điểm điều tra trước tích hợp; PWA không thay đổi.

## Kiểm tra bổ sung: 64 tranh và collider

- Đã trích lại cả 16 tranh Dinosaurs bằng tham chiếu SpriteRenderer và con của từng GameObject, thay vì ghép theo tên sprite. Dữ liệu staging hiện có 64 tranh: Dinosaurs 148 vùng, Insects 131, Ocean 133, Magic 266, tổng 678 vùng đang hoạt động.
- Hai GameObject con của Ocean đang bị tắt trong dữ liệu đóng gói: tranh 8 sprite 5149 có alpha hoàn toàn bằng 0; tranh 4 sprite 4391 chỉ có alpha rất thấp (một phần tử nhỏ sau chuyển đổi). Script ghi lại chúng trong `inactiveSourceRegions` và không đưa vào danh sách vùng đang hoạt động. Trạng thái tĩnh không chứng minh runtime không bao giờ bật chúng.
- Đối chiếu 678 mask với PolygonCollider2D của chính GameObject con: sau khi raster hóa polygon trên cùng hệ tọa độ, mỗi mask có ít nhất 99,95% pixel alpha ≥128 nằm trong collider. Collider có thể lớn hơn mask, nên kết quả này xác nhận mức độ bao phủ hình học, không chứng minh hit-test hoặc thứ tự ưu tiên vùng lúc chạy. Chi tiết tại `extracted/v3.141/missing-topics-staging/collider-validation.json`; chạy lại bằng `scripts/validate_missing_topics_v3141.py`.
- Đã xem toàn bộ 64 ảnh tô thử, ở `extracted/v3.141/missing-topics-staging/review/`; không thấy sai lệch lớn giữa các vùng và outline ở kích thước bản xem. Đây không thay thế kiểm tra tương tác của từng vùng. Màu trong ảnh chỉ để phân biệt các vùng.
- GameObject gốc của mỗi tranh mang số 0–15; các outline Ocean và Insects có số trong tên tương ứng với số GameObject cộng một, và Dinosaurs cũng khớp. Thứ tự này được dùng làm thứ tự staging. Chưa chứng minh thứ tự gallery hoặc ánh xạ ProductTypes tại runtime, đặc biệt với Magic.

Các con số ở mục lịch sử bên dưới mô tả kết quả trước khi loại đối tượng tắt và trích đủ Dinosaurs.

## Cập nhật: đã tìm được vùng tô

Sau khi có đủ RAM, đã đọc lại các đối tượng `resources.assets`. Các GameObject gốc có `SpriteRenderer` trỏ tới outline, còn các Transform con trỏ tới từng `SpriteRenderer` vùng tô; nhiều vùng có `PolygonCollider2D`. Do tên sprite vùng thường chỉ là `image-1`, `image-2` hoặc tên tái sử dụng, thống kê theo tiền tố `img-*` ở phần cũ bên dưới đã bỏ sót chúng.

| Nhóm nhận diện bằng outline | Tranh được xuất trong lần này | Vùng có alpha | Ghi chú |
| --- | ---: | ---: | --- |
| Magic | 16/16 | 266 | Tên outline gồm `stroke`, `fairy-stroke-ingame`, `carriage-stroke-ingame`. |
| Ocean | 16/16 | 134 | Một sprite con bổ sung của tranh 8 (path ID 5149) có alpha hoàn toàn rỗng; chưa rõ vai trò runtime. |
| Insects | 16/16 | 131 | Outline có tên `img-preview-11-galery-* 1`, nhưng kích thước gốc 1076×1076 và được tham chiếu bởi SpriteRenderer gốc. |
| Dinosaurs | Tranh 16 | 7 | Root Transform 15155 trỏ tới outline 5411 và bảy sprite con; bổ sung 15 tranh nhóm 9 đã dựng trước. |

`scripts/stage_missing_topics_v3141.py` lưu kết quả tại `extracted/v3.141/missing-topics-staging/`, gồm outline, mask, metadata có path ID gốc và `inventory.json`. Script xác minh Transform con không có dịch chuyển, xoay hoặc scale chưa xử lý; dùng pixel-per-unit và kích thước outline để đưa vùng vào canvas 775×775. Đã kiểm tra 49 metadata, kích thước outline, kích thước mask/bounds và alpha không rỗng. Mẫu Magic 7, Ocean 2 và 8, Insects 1, Dinosaurs 16 được tô nhiều màu và đối chiếu trực quan với outline: vùng nhìn khớp. Điều này chưa xác minh đầy đủ mọi vùng, hit-test collider hay thứ tự/lựa chọn chủ đề ở runtime. Nhãn chủ đề dựa trên hình và tên sprite, không khẳng định binding runtime.

**Các nhận định về dữ liệu thiếu trong phần lịch sử bên dưới đã được cập nhật bởi kết quả này.** Sprite Ocean 8 path ID 5149 vẫn là ngoại lệ cần điều tra; không khẳng định nó biểu thị một vùng cần tô. Dữ liệu chỉ mới ở staging, chưa nối vào ứng dụng.

## Kết quả điều tra ban đầu

Kiểm tra ngày 2026-11-13 trên APK 3.141. REA kiểm kê `extracted/v3.141/apks/base.apk`, SHA-256 `a98b03b080d913dd7131c964196910c675a48dc5e261c752c8d1305acc26d0f0`, evidence `ev_96fa4071bebd83f3e437dcc0cd105f4c04d265c5d974653a8b1644234ff407fb`. REA kiểm kê container, không quan sát gameplay. Kiểm kê sprite bên dưới dựa trên `reports/v3.141/unity-objects.json` và `sprite-exports.json`; ảnh đã xuất được đối chiếu bằng mắt.

| Chủ đề | Kết quả | Giới hạn |
| --- | --- | --- |
| Dinosaurs | 16 ảnh xem trước `img-preview-9-*` đều thể hiện khủng long. Nhóm 9 có 16 outline và 126 sprite vùng tô cho 15 tranh; bản dựng thử nằm tại `extracted/v3.141/art-staging/group9/`. | Tranh 16 chưa tìm thấy sprite vùng theo quy tắc `img-9-16-*`; chưa xác minh runtime hoặc độ chính xác mọi vùng. Liên hệ với chủ đề là nhận diện bằng hình ảnh, không phải binding runtime. |
| Ocean | 16 ảnh xem trước `img-preview-10-*` thể hiện sinh vật biển. | Chưa tìm thấy outline/vùng theo quy tắc `img-10-*`; preview không phải bộ mask tô. |
| Insects | 16 ảnh xem trước trong `web/public/game-assets/ui/sprites/gallery_icons/img-preview-11-*` thể hiện côn trùng. Sprite gốc có tên `img-preview-11-galery-*` trong `resources.assets`, mỗi tranh có hai sprite được ghi nhận. | Kiểm kê cũ bỏ sót do mẫu tên có thêm `galery`; chưa tìm thấy outline/vùng theo quy tắc `img-11-*`. |
| Magic | `resources.assets` có các Sprite như `stroke-fairy6` (3951), `stroke-unicorn6` (6461), `stroke-mermaid-gallery2` (6570), `stroke_castle_gallery6` (6817), `stroke-dragon-gallery8` (4484), và `fairy-stroke-ingame` (6636, 1076×1076). | Đây là ứng viên artwork có tên khác quy tắc số; chưa xác định đủ tranh, các vùng tô, hay binding runtime. Không thể coi toàn bộ là preview hoặc gameplay chỉ dựa vào tên. |

Tên `img-preview-11-galery-*` và các sprite Magic chứng minh tìm theo `img-<group>-<picture>-*` không bao phủ toàn bộ artwork. Vì vậy không kết luận dữ liệu tranh không có trong APK hoặc app tải dữ liệu từ mạng. Cần lần tham chiếu Unity từ các sprite và scene/prefab, kiểm tra ảnh không theo quy tắc, và so sánh với runtime thực tế. Lần thử Android 3.141 trước đó bị SIGILL trong giả lập x86_64 (xem `STATUS.md`), chưa quan sát được gameplay. Một lần thử tải lại toàn bộ UnityFS để xuất các sprite Magic bị hệ điều hành dừng với exit 137; chưa xác minh hình các ứng viên đó bằng mắt trong lượt này.

Phát hiện này sửa các nhận định trước rằng nhóm 9 chưa có dấu hiệu chủ đề và nhóm 11 không có tài nguyên; không thay thế việc xác minh binding gốc. PWA và native chưa được thay đổi trong lần điều tra này.
