# Dữ liệu 12 chủ đề 3.141

Native hiện có 12 chủ đề × 16 tranh: 192 tranh và 2552 vùng tô. Các chủ đề dùng slug theo tên: `animals`, `dolls`, `school`, `music`, `vehicles`, `food`, `halloween`, `christmas`, `insects`, `dinosaurs`, `ocean`, `magic`. Khóa lưu dùng slug chủ đề; dữ liệu trước đây dưới `pack2`…`pack8` không còn được mở. Catalog vẫn version 1 vì dữ liệu và ID vùng không thay đổi.

| Chủ đề mới | Tranh | Vùng đang hoạt động | Bằng chứng nhóm |
| --- | ---: | ---: | --- |
| Insects | 16 | 131 | Outline `img-preview-11-galery-* 1`, GameObject gốc 0–15 |
| Dinosaurs | 16 | 148 | Outline `img-9-*-outline`, GameObject gốc 0–15 |
| Ocean | 16 | 133 | Outline `img-preview-10-*`, GameObject gốc 0–15 |
| Magic | 16 | 266 | Outline `stroke` và các tên tranh tiên, lâu đài, kỳ lân; nhận diện theo hình |

Lần kiểm kê ban đầu chỉ tìm vùng theo tên `img-<nhóm>-<tranh>-*`, nên bỏ sót các vùng tên chung như `image-1` và đưa ra kết luận sai rằng APK không có dữ liệu bốn chủ đề. Phân tích tiếp theo lần theo GameObject, SpriteRenderer và PolygonCollider2D đã tìm thấy chúng ngay trong `resources.assets`. Chi tiết và nguồn xem [điều tra artwork](v3.141/MISSING_TOPIC_ART_INVESTIGATION.md).

Các tranh và mask được lưu tại `native/assets/pictures/<slug>/<số>/`; script `scripts/stage_missing_topics_v3141.py` tạo dữ liệu staging từ APK. ID vùng mới được cộng một khi chuyển vào native để khớp quy ước ID dương; file gốc và path ID Unity vẫn ghi trong metadata. Hai GameObject Ocean bị tắt trong bản đóng gói được ghi nhận trong metadata nhưng không được đưa vào vùng tô.

64 tranh mới đã được xem ở bản tô thử và 678 mask được so hình học với collider; chưa xác minh toàn bộ tương tác trên thiết bị, thứ tự gallery hoặc ProductTypes của app gốc, đặc biệt Magic. Người dùng cần kiểm tra bốn chủ đề trên iPhone, bao gồm tô vùng nhỏ, nền giấy, lưu/mở lại, thứ tự tranh và Ocean 4/8. PWA không được thay đổi khi tích hợp native.
