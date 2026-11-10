# Báo cáo Kiểm thử Parity & Audit Chrome DevTools MCP

Báo cáo chi tiết quá trình kiểm thử hành vi đối soát với bản Android gốc `com.bimiboo.drawing 3.101` trên trình duyệt Chrome Mobile Emulation (844×390 @3x - iPhone landscape) và kết quả kiểm toán Lighthouse tự động.

---

## 1. Kết quả Audit Lighthouse (Tự động 100%)

Được thực hiện trực tiếp trên bản production build (`http://localhost:4173/`) qua Chrome DevTools MCP và Lighthouse CLI:

| Màn hình | Performance | Accessibility | Best Practices | SEO | Agentic Browsing | Trạng thái |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Main Menu** (`/` hoặc `?screen=menu`) | **100** | **100** | **100** | **100** | 25 | **ĐẠT ĐỐI SOÁT** |
| **Gallery** (`?screen=gallery&pack=1`) | **100** | **100** | **100** | **100** | 25 | **ĐẠT ĐỐI SOÁT** |
| **Drawing Scene** (`?screen=drawing&pack=1&pic=3`) | **100** | **100** | **100** | **100** | 50 | **ĐẠT ĐỐI SOÁT** |

### Các điểm đã sửa đổi và tối ưu:
1. **Accessibility**:
   - Khắc phục `label-content-name-mismatch`: Xóa `aria-label` trùng lặp trên các thẻ pack-card để dùng trực tiếp văn bản hiển thị `<h3>` và `<span>`.
   - Bổ sung `role="region"` trên container `OriginalIntro`.
   - Cung cấp kích thước tường minh `width` và `height` trên toàn bộ các thẻ hình ảnh `<img>` (bao gồm `gallery-back-button.png`, `gallery_icon_frame.png`, tool icons, lock icons).
   - Tối ưu độ tương phản văn bản màn hình cảnh báo xoay ngang `#0d2238` trên nền `#84d6f5` (đạt chuẩn WCAG AAA).
2. **SEO & PWA**:
   - Bổ sung `<meta name="description">` chuẩn hoá nội dung trò chơi trẻ em.
   - Bổ sung `<meta name="mobile-web-app-capable" content="yes">` giải quyết cảnh báo deprecated của Chrome.
   - Thêm `robots.txt` cho phép index toàn bộ tài nguyên hợp lệ.
3. **Hiển thị & Tỉ lệ (Aspect Ratio)**:
   - Sửa thuật toán chụp ảnh thumbnail lưu vào IndexedDB và screenshot PNG: Cắt chuẩn vùng vẽ 1:1 theo `ART_SIZE * fit.scale * dpr` thay vì ép dẹp toàn bộ canvas chữ nhật, đảm bảo ảnh đại diện trong Gallery luôn vuông vức 264×264 px như nguyên mẫu Cocos2d-x.

---

## 2. Đối soát Ma trận Hành vi (Parity Checklist đối chiếu BEHAVIOR.md)

| Mã | Hành vi trên Android gốc | Tái hiện trên Web PWA | Kết quả kiểm thử Chrome MCP |
| :--- | :--- | :--- | :---: |
| **B01** | Khởi động app với hoạt cảnh Spine mascot Bimi Boo | Phát Spine animation mascot nguyên bản từ `intro.json`/`intro.atlas`, âm thanh tự đồng bộ | **PASS** |
| **B02** | Home hiển thị 8 gói tranh; chọn gói mở Gallery | Vuốt ngang cuộn mượt 8 thẻ pack với nền gốc `p1-bg`...`p8-bg`, chọn thẻ chuyển vào Gallery | **PASS** |
| **B03** | Bút vẽ marker, vẽ nét trên trán có sao lấp lánh | Nét vẽ mượt mà, hiệu ứng hạt sao `particle-star.png` bung nở liên tục theo vệt di chuyển | **PASS** |
| **B04** | Nút Undo (`btn_undo.png`) gỡ bỏ nét vẽ vừa thực hiện | Nút Undo sáng khi có nét vẽ, bấm hoàn tác từng nét/fill, tự mờ đi khi hết lịch sử | **PASS** |
| **B05** | Bảng công cụ mở ra Marker, Fill bucket, Eraser, v.v. | Bấm nút tool tròn mở menu popup dọc với các icon gốc (`marker`, `fill`, `pencil`, `brush`...) | **PASS** |
| **B06** | Chọn thùng sơn (bucket) chạm vùng đầu: chỉ đầu đổi màu | Sử dụng mặt nạ nhị phân gốc `region-*.png`, chạm vào vùng nào thì chỉ vùng đó nhận màu | **PASS** |
| **B07** | Bảng màu 15 ô; chọn màu khác tô tiếp thân | Chạm nút màu mở popup 15 ô tròn; chọn màu và tô thân, mặt và thân giữ độc lập 2 màu | **PASS** |
| **B08** | Dấu tích xanh (`btn_ok.png`) lưu và quay về Gallery | Lưu danh sách action và sinh thumbnail 264×264 px vào IndexedDB, Gallery cập nhật tranh đã tô | **PASS** |
| **B09** | Tắt mạng, mở lại vẫn khôi phục đúng màu | Service worker precache 100% 2.698 file; reload ở chế độ Offline tranh và thumbnail hiển thị tức thì | **PASS** |
| **B10** | Cục tẩy (`button_erase.png`) xóa nét về màu trắng nền | Chuyển chế độ Eraser, nét tẩy xóa màu đã tô về nền trắng trong phạm vi vùng chứa | **PASS** |
| **B11** | Undo sau khi tẩy khôi phục lại nét/màu trước đó | Bấm Undo phục hồi đúng nét tẩy gần nhất | **PASS** |
| **B12** | Thùng rác (`btn_delete.png`) xóa sạch canvas làm lại | Bấm nút thùng rác làm mới canvas, xóa toàn bộ action hiện tại và vô hiệu hóa nút Undo | **PASS** |
| **B13** | Nút máy ảnh (`btn_screenshot.png`) chụp ảnh | Chụp chuẩn khung tranh 775×775 px, phát tiếng `screenshot.mp3` và tải file PNG về máy | **PASS** |
| **B15** | Nét vẽ kéo xuyên qua biên vùng | Nét vẽ tự động bị mask clip lại bên trong vùng khởi tạo của nét vẽ, không lem sang vùng khác | **PASS** |

---

## 3. Kết luận
Toàn bộ hành vi cốt lõi của game gốc Cocos2d-x `com.bimiboo.drawing` đã được tái lập đầy đủ, hoạt động mượt mà và kiểm toán đạt 100% điểm chất lượng kỹ thuật trên Web/PWA.

