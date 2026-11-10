# Quan sát hành vi Android

## Môi trường và phạm vi

Ubuntu, Android Emulator API 29, AVD rea-drawing-api29, serial emulator-5580. Game `com.bimiboo.drawing` 3.101; launcher Cocos2d-x. Ảnh gameplay 1920×1080. Emulator chạy không âm thanh; không xác minh âm thanh bằng nghe. Các đường dẫn ảnh dưới đây nằm trong `reports/runtime/`.

## VERIFIED — kịch bản đã chạy

| ID | Thao tác và kết quả quan sát | Bằng chứng |
| --- | --- | --- |
| B01 | drawing.apk mở trình tải Uptodown hướng tới Kids coloring & drawing games; tải và cài app Drawing | 01-launch.png, 05-download-state.png |
| B02 | Home có Animals; chạm mở thư viện tranh; chọn mèo mở canvas ngang | 07-game-home.png, 08-gallery.png, 09-cat-before.png |
| B03 | Marker đỏ mặc định; kéo (710,250) → (950,250) tạo nét dày trên trán và hiệu ứng sao | 10-stroke.png |
| B04 | Chạm Undo (1678,957) xóa toàn bộ nét vừa vẽ | 11-undo.png |
| B05 | Chọn công cụ mở menu gồm biểu tượng marker, pencil, brush, bucket, spray, glitter và pattern; chưa thử toàn bộ | 12-tools.png |
| B06 | Chọn bucket rồi chạm đầu mèo: đầu chuyển xanh lá, thân và mắt không đổi | 14-palette.png |
| B07 | Palette hiện 15 ô, có lớp khóa trên một số màu; chọn cyan rồi chạm thân: thân cyan, đầu xanh lá, đuôi trắng | 14-palette.png, 15-two-regions.png |
| B08 | Dấu tích (1680,123) quay về gallery; thumbnail cập nhật màu | 16-done.png |
| B09 | Force-stop; tắt wifi và mobile data; mở lại Animals → mèo: khôi phục đầu xanh lá/thân cyan. Toolbar trở về marker đỏ; Undo mờ | 18-offline-restored.png (gallery), 19-offline-cat.png (canvas) |
| B10 | Chọn tẩy (1745,770), kéo (740,220) → (910,220): đường tẩy trên đầu trở thành trắng | 20-eraser.png |
| B11 | Undo khôi phục màu xanh trên đường vừa tẩy | 21-undo-eraser.png |
| B12 | Chạm thùng rác sau B11, rồi thử lần nữa: phần đầu/thân đã lưu vẫn giữ màu. Không thấy hộp xác nhận | 22-reset.png, 23-reset-second-tap.png |
| B14 | Sau khi tẩy thêm một nét mới, chạm thùng rác vẫn thấy nét tẩy và màu đã lưu. Cần kiểm tra cách kích hoạt nút trước khi suy ra reset semantics | 25-reset-after-new-erase.png |
| B13 | Camera (1805,123) mở Parental control với câu hỏi phép cộng | 24-camera.png |

Có video `gameplay.mp4` cho một phần chuỗi B03–B09. `13-fill.png` chụp quá sớm trước khi hoàn tất hiệu ứng, không dùng làm bằng chứng fill thất bại. `18-offline-restored.png` là gallery, không phải canvas.

## UNKNOWN cần tiếp tục

- Nét kéo qua biên có bị giới hạn ở vùng bắt đầu không; chạm đường viền chọn vùng nào.
- Thùng rác xử lý nét mới so với ảnh đã lưu thế nào; có hoàn tác reset được không.
- Thoát bằng Back và force-stop trước dấu tích có giữ thay đổi không.
- Giới hạn lịch sử Undo, Undo fill, nhiều ngón tay, pointer bị hủy.
- Camera sau câu hỏi phụ huynh, quyền lưu và file xuất cuối cùng.
- Âm thanh thực nghe; công cụ nâng cao và nội dung khóa.

Không suy diễn rằng mọi thay đổi được autosave chỉ từ B09: B09 đã bấm dấu tích trước khi tắt app.

| B15 | Kéo marker từ mặt xuống thân; màu chỉ xuất hiện trên vùng mặt nơi bắt đầu nét | 27-cross-region.png |
| B16 | Chạm vùng đuôi bằng bucket: đuôi xanh lá; Undo trả vùng đuôi về trắng, giữ các vùng đã tô trước đó | 36-fill-tail.png, 37-undo-fill.png |

## Chrome POC — tái hiện hành vi đã xác minh

| Ca | Kết quả | Bằng chứng |
| --- | --- | --- |
| C01 | Fill vùng thân và mặt bằng mask gốc; hai vùng giữ màu riêng | Chrome DevTools, viewport 390×844 |
| C02 | Kéo nét từ mặt xuống thân; nét bị clip trong mask mặt, phù hợp B15 | Chrome DevTools screenshot trong lần kiểm tra |
| C03 | Undo gỡ nét gần nhất, giữ hai fill trước đó | Chrome DevTools screenshot sau Undo |
| C04 | Lưu qua IndexedDB; reload khôi phục hai vùng đã lưu | IndexedDB key `1-3`, reload Chrome |
| C05 | Service worker điều khiển trang; reload ở trạng thái offline vẫn mở app và assets | Chrome DevTools Network Offline |
| C06 | Bản POC trước đó: Portrait 390×844 và landscape 844×390 không tràn document | `scrollWidth/Height` bằng viewport; portrait đã thay bằng hướng dẫn xoay ngang ở bản hiện tại |
| C07 | Bản hiện tại mở intro Spine gốc, thấy mascot/đạo cụ chuyển động rồi tự vào màn tô | Chrome MCP 844×390 và 667×375; đã sửa camera native, kiểm tra các mốc 1/3.5/5.5/7/7.8s và chuyển sang màn tô; reports/runtime/spine-fixed-7.8s.png |
| C08 | Màn tô ngang dùng `tools_shelf.png`, các sprite nút gốc và tranh/outline mèo gốc; menu công cụ hiển thị sprite gốc | Chrome screenshot 844×390 |
| C09 | Portrait 390×844 hiển thị nhắc xoay ngang, không tràn document | Chrome mobile emulation; `scrollWidth/Height` = viewport |

Giới hạn: đây là Chrome mobile emulation, không thay thế kiểm thử trên iPhone. Bản hiện tại vẫn là POC: một tranh; marker/fill/eraser; các tool khác hiển thị nhưng chưa hoạt động; camera và xóa chưa map; chưa có luồng home/gallery. Autoplay nhạc phụ thuộc chính sách Chrome; cần xác minh thực tế âm thanh trong PWA đã cài.
