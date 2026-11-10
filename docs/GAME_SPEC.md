# Đặc tả game tô màu — bản dựa trên bằng chứng

Phạm vi: game Android `com.bimiboo.drawing` 3.101, quan sát trên emulator API 29. Mục tiêu viết lại cá nhân trên iPhone 12 Pro bằng PWA. Mỗi mục ghi VERIFIED (quan sát trực tiếp), INFERRED (suy luận), UNKNOWN (chưa rõ).

## Luồng

- VERIFIED: màn chính có danh mục Animals; chạm mở gallery; chọn thumbnail mở tranh ngang. (BEHAVIOR B02)
- VERIFIED: dấu tích trên màn tranh lưu/cập nhật thumbnail và quay về gallery. Mở lại sau force-stop khôi phục màu đã lưu, kể cả khi thiết bị offline. (B08–B09)
- UNKNOWN: hành vi Android Back và force-stop trước dấu tích. Không mặc định autosave.

## Công cụ

- VERIFIED: marker đỏ mặc định; kéo tạo nét dày, có thể có hiệu ứng sao. Undo gỡ được nét vừa tạo. (B03–B04)
- VERIFIED: chọn bucket rồi chạm vùng tô được vùng mèo; màu đầu và thân thay đổi độc lập. (B06–B07)
- VERIFIED: một nét bắt đầu ở mặt và kéo xuống thân chỉ tô mặt; nét bị giới hạn ở vùng bắt đầu trong tình huống đã thử. (reports/runtime/27-cross-region.png)
- VERIFIED: eraser kéo xóa màu dọc đường; Undo khôi phục màu vừa xóa. (B10–B11)
- VERIFIED: Undo sau bucket fill loại bỏ vùng vừa fill, trong khi màu trước đó vẫn còn. (reports/runtime/36-fill-tail.png, 37-undo-fill.png)
- VERIFIED: menu công cụ có marker, pencil, brush, bucket, spray, glitter, pattern; palette hiển thị 15 ô và một số màu có lớp khóa. (B05–B07)
- UNKNOWN: kích thước/cảm giác các nét ngoài marker, tool state sau đổi tranh, giới hạn Undo, reset/thùng rác và tương tác với màu đã lưu.

## Tài nguyên và mô hình tô

- VERIFIED: APK game có 128 cặp PNG/plist thuộc pack1–pack8. Mẫu `pack1/image-1-3` là atlas 779×1289, plist có 9 frame; dữ liệu chi tiết ở SAMPLE_FRAMES.md.
- VERIFIED: symbol native và assembly cho thấy hit-test dò image pixel; `tapsOnNonTransparent` kiểm tra bốn byte pixel. `startDraw` dispatch theo tool và truyền sprite index vào tool handler. Xem `LOGIC_MAP.md`, `REVERSE_ENGINEERING.md` và `reports/game/core-logic.asm`.
- VERIFIED: ánh xạ cấu trúc hoàn chỉnh 128 tranh, 2.035 frame/mask, outline PNG và atlas/plist trong `ASSET_MAP.md` cùng `extracted/atlas-frames/asset-map.json`. Mask được raster từ mesh tam giác và UV; đã đối chiếu hình `1-3` với outline APK.
- VERIFIED: input nét bị giới hạn theo mask vùng chạm ban đầu (runtime B15 + sprite index trong static flow). Chrome POC áp dụng mask gốc và đã tái hiện được ca kéo mặt qua thân; xem `CHROME_POC.md`.
- UNKNOWN: semantic name từng mask ngoài khung hình đã đối chiếu, thứ tự vẽ chính xác của một số frame ở mọi tranh, mã màu mặc định từng công cụ, và quyền tái sử dụng/phát hành tài nguyên.

## Lưu trữ và tương tác

- VERIFIED: nút dấu tích lưu trạng thái; tiến độ tồn tại qua force-stop và mở lại offline nếu đã bấm dấu tích.
- INFERRED cho POC: lưu màu theo region ID; lưu danh sách thao tác để hỗ trợ Undo; IndexedDB lưu bản đã xác nhận khi bấm Done.
- UNKNOWN: trạng thái thao tác chưa xác nhận khi thoát app; hành vi camera/export sau parental gate; âm thanh thực tế (emulator chạy không âm thanh).

## Tiêu chí POC

1. Hiển thị tranh gốc `pack1/image-1-3` từ outline PNG và mask atlas đã ánh xạ. — Đạt trong Chrome POC.
2. Chạm đổi màu đúng vùng; kéo marker/eraser bị clip theo vùng bắt đầu.
3. Undo dùng chung cho fill, stroke, erase.
4. Done lưu; reload khôi phục; thao tác offline sau lần tải đầu.
5. Chrome responsive mobile: tọa độ chạm đúng, canvas sắc nét theo DPR, không scroll khi vẽ. — Đạt ở portrait/landscape và offline reload; đây là tiêu chí người dùng chốt cho vòng POC, không tuyên bố tương đương kiểm thử iPhone thật.

POC chứng minh một tranh và ba tool cốt lõi; không xem đây là đặc tả parity hoàn chỉnh. Cấu trúc assets đã map toàn bộ 128 tranh nhưng semantic frame, các tool nâng cao, reset, thoát trước lưu, gallery và camera còn mở; xem `OPEN_QUESTIONS.md`.
