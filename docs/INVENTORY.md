# Kiểm kê Kids-Color-Games-Baby-Drawing_3.141_apkcube.apks

## Nguồn gốc file

- File duy nhất: `Kids-Color-Games-Baby-Drawing_3.141_apkcube.apks`; 107,917,759 bytes.
- Định dạng: Split APK (ZIP) gồm `base.apk`, `split_config.arm64_v8a.apk` và `APKCube.txt`.
- Package: `com.bimiboo.drawing`; version 3.141 (chuỗi `3.141` xác nhận trong binary AndroidManifest).
- Engine: Unity 6 (`6000.3.24f1`), scripting backend IL2CPP.
- ABI: arm64-v8a.
- Phân tích chi tiết: [docs/v3.141/PACKAGE_INVENTORY.md](v3.141/PACKAGE_INVENTORY.md).

> **Lưu ý lịch sử:** Trước đây workspace có thêm `drawing.apk` (15.8 MB) — đây là bộ cài Uptodown App Store,
> không phải game. File đó đã bị xóa cùng thư mục phân tích `reverse-engineering/drawing-apk/`.
> Tài liệu `v3.141/PACKAGE_INVENTORY.md` giữ ghi chú so sánh với Cocos2d-x engine của version cũ hơn (3.101).

## VERIFIED — runtime bổ sung (phiên bản cũ 3.101 — dùng để tham chiếu hành vi)

- File tham chiếu: `original/kids-coloring-and-drawing-games-3-101.apk`; 71,241,323 bytes.
- Package `com.bimiboo.drawing`, version 3.101 (101), launcher `org.cocos2dx.cpp.AppActivity`.
- Engine Cocos2d-x; gameplay native trong `libMyGame.so`.
- Đã mở Animals → thư viện → tranh mèo trên Ubuntu Android Emulator, xem `reports/runtime/07-game-home.png` đến `19-offline-cat.png`.

## Phạm vi báo cáo

`reports/game/` mô tả gameplay quan sát từ bản 3.101. Hành vi game 3.141 chưa được quan sát trực tiếp; dùng [docs/BEHAVIOR.md](BEHAVIOR.md) làm nguồn hành vi đã xác nhận.
