# Kế hoạch đối chiếu ba nút màn hình vẽ

Phạm vi: giữ menu ba công cụ theo chủ ý và bảng 56 màu. Đối chiếu với APK 3.141 bằng dữ liệu Unity và code IL2CPP; người dùng kiểm tra hình ảnh.

- [x] Đối chiếu sprite, thứ tự lớp, màu và kích thước cơ bản của ba nút và popup; lưu chứng cứ trong DRAWING_SPRITE_EVIDENCE.md.
- [x] Kiểm tra các handler của ba nút, trạng thái nhấn và phục hồi công cụ trước khi tẩy.
- [x] Đối chiếu lựa chọn màu/công cụ, pointer và chuyển popup trong phạm vi bằng chứng hiện có; callback và hit-test gốc chưa giải mã đầy đủ được ghi riêng.
- [x] Đối chiếu chuyển động popup và thời lượng; áp dụng pivot, 250 ms và ghi rõ easing chưa xác minh.
- [x] Đối chiếu lại màu/mask và scale các thành phần với sprite, giá trị serialized và xử lý code runtime; giữ menu ba công cụ.
- [x] Kiểm tra tự động các chuyển trạng thái trên trình duyệt, thử kéo màu bằng con trỏ, chạy build và test.
- [x] Tổng hợp các điểm chưa xác định để người dùng kiểm tra và phản hồi trực quan trong DRAWING_SPRITE_EVIDENCE.md.
