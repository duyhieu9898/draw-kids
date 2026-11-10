# Kiểm kê drawing.apk

## VERIFIED — bằng chứng tĩnh

- File: `drawing.apk`; 15,790,385 bytes.
- SHA-256: `8f8a7b2416d84d64d418dc4e194cd8ab6f4394d51651bf2e1aac47207503fd92`.
- REA Evidence: `ev_65ab157ccf3ebb9f21d4f2795e183f7c5f02db42d96cd7c4842e6d7d124862cf`.
- Package: `com.uptodown`; version `7.44` (744).
- Application class: `com.uptodown.UptodownApp`.
- Launcher: `com.uptodown.activities.MainActivity`.
- Icon trong manifest: `@mipmap/ic_launcher_uptodown`.
- minSdk 23; targetSdk 36.
- JADX ghi nhận 14.237 classes và 2.230 resources.
- Archive chứa 4 DEX, 16 thư viện .so, 253 PNG, 10 WebP và 4 OGG; các số lượng này chưa xác định vai trò gameplay.
- Thư viện native có ABI arm64-v8a, armeabi-v7a, x86 và x86_64.
- Không có file có đuôi `.apk` lồng trong archive.
- Kiểm tra lại hash: khớp báo cáo phân tích trước đó.

## VERIFIED — runtime bổ sung

Đã cài và mở APK trên Android Emulator API 29. Màn hình khởi động ghi “The Kids coloring & drawing games download is about to start” cùng nút “ACCEPT AND DOWNLOAD” và thương hiệu Uptodown App Store. Sau khi chấp nhận tải, ứng dụng mở trang Kids coloring & drawing games, kích thước tải hiển thị 67.94 MB.

**Đính chính:** drawing.apk là bộ cài Uptodown dẫn tới game tô màu cụ thể; không thể kết luận rằng file không liên quan đến game. APK tải tiếp hiện đã được lấy và phân tích bên dưới.

Bằng chứng: `reports/runtime/01-launch.png`, `reports/runtime/03-next.png`.

## INFERRED

Các khai báo package, application, launcher và icon nhất quán với ứng dụng Uptodown. Trước khi chạy chỉ có bằng chứng tĩnh; không dùng tên file drawing.apk làm bằng chứng gameplay.

## VERIFIED — APK game đã tải và chạy

- File: `original/kids-coloring-and-drawing-games-3-101.apk`; 71,241,323 bytes; ZIP CRC hợp lệ.
- SHA-256: `e89e7d3e05751cc9b9240ee38e101b0f4bc3a637029b64842dd3a67c8ad83d15`.
- Package `com.bimiboo.drawing`, version 3.101 (101), launcher `org.cocos2dx.cpp.AppActivity`.
- minSdk 16, targetSdk 28; native ABI arm64-v8a, armeabi-v7a, x86.
- Engine Cocos2d-x; gameplay native trong `libMyGame.so`; không chỉ nằm trong DEX.
- REA Evidence `ev_40382244054b46b72db90935279274bf386737033b317ea242f9108e4bdc7e6b` tại `reports/game/package-evidence.json`.
- Đã mở Animals → thư viện → tranh mèo trên Ubuntu Android Emulator, xem `reports/runtime/07-game-home.png` đến `19-offline-cat.png`.

## Phạm vi báo cáo

`reports/apk-files.txt`, `reports/AndroidManifest.decoded.xml` và `reverse-engineering/drawing-apk/` mô tả bộ cài Uptodown. `reports/game/` mô tả game thực tế. Không trộn số lượng tài nguyên giữa hai APK.

Step 1 đã xác định đúng game. Step 2 đã quan sát gameplay cốt lõi; Step 3 mới xác định entry points native, chưa truy hết thuật toán. Xem BEHAVIOR.md và REVERSE_ENGINEERING.md.
