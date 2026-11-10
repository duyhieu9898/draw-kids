# Câu hỏi còn mở

Đã giải quyết: đúng game được tải từ drawing.apk; chạy được trên Ubuntu; vừa vẽ nét vừa fill; có tẩy và Undo; dấu tích lưu và khôi phục được offline. Xem BEHAVIOR.md.

## Mapping logic còn tiếp tục

1. Các pack/gallery lấy thứ tự tranh, trạng thái khóa và thumbnail từ dữ liệu nào? Cần map runtime/native, không chỉ đoán từ thư mục.
2. Với từng tranh, phân loại vai trò của 2.035 frame (hit mask, outline, highlight/decorative) và liên kết frame với thứ tự vẽ. Asset geometry đã trích đầy đủ, nhưng tên semantic của phần lớn frame chưa được xác minh.
3. Thùng rác xóa phần nào? Trên tranh đã lưu thử hiện tại chưa thấy xóa màu nền.
4. Undo fill, Undo reset và lịch sử giữa các lần mở tranh hoạt động thế nào?
5. Thoát trước dấu tích có lưu không? Hiện chỉ chứng minh lưu sau dấu tích.
6. Pencil, brush, spray, glitter, pattern và các tool khác có thông số/logic nào; cần thao tác và map riêng.

## Cần giải trước khi phát hành

- Quyền sử dụng bộ tranh/âm thanh nào cho bản cá nhân; chưa đưa assets trích xuất lên hosting.
- Camera/export sau parental gate, âm thanh và công cụ nâng cao.
- POC thực tế trên Safari iPhone 12 Pro: tọa độ, mượt, standalone, offline và khôi phục dữ liệu. User đã chốt Chrome responsive mobile là đủ cho vòng POC hiện tại; mục iPhone chỉ còn cho phát hành cuối nếu vẫn nhắm thiết bị đó.

Nét clip theo vùng bắt đầu đã được xác minh (B15) và POC Chrome tái hiện được; mask mesh/outline đã được trích và catalog đủ 128 tranh. Chưa tuyên bố hoàn thành mapping gameplay hoặc parity toàn bộ app; tiếp tục giải các mục trên trước khi mở rộng sản phẩm.
