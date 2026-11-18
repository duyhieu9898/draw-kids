# Kế hoạch dự án

Kế hoạch hiện hành là [chuyển ứng dụng sang React Native + Expo + Skia](REACT_NATIVE_MIGRATION_PLAN.md). Mục tiêu là ứng dụng iOS và Android chạy ngang, có thể dùng offline, lấy mã và tài nguyên PWA làm tham khảo. `native/` hiện chỉ là scaffold; chưa phải bản game hoàn chỉnh.

Thứ tự chính: kiểm kê hành vi và tài nguyên → xây dựng một tranh end-to-end với Skia → đo hiệu năng → chuyển menu/gallery/animation → lưu trữ và âm thanh native → mở rộng nội dung và nghiệm thu trên thiết bị.

PWA còn nhiều hành vi sai và không phải đặc tả chuẩn; cần xác minh từng hành vi bằng bằng chứng gốc hoặc phản hồi của người dùng. Các tài liệu cũ về PWA, Chrome và APK được giữ làm hồ sơ lịch sử và bằng chứng. Kết quả trình duyệt không xác nhận parity hay hiệu năng của bản native. Bằng chứng gameplay 3.101 và dữ liệu 3.141 cần được phân biệt; [trạng thái tham chiếu 3.141](v3.141/STATUS.md) ghi các giới hạn đã biết.
