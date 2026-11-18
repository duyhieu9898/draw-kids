# Kế hoạch chuyển game sang React Native + Expo + Skia

> **Bàn giao thực thi bắt buộc:** đọc cùng [PLAYBOOK và ma trận hành vi](REACT_NATIVE_EXECUTION_PLAYBOOK.md). Khi hai tài liệu khác nhau về độ chắc chắn của hành vi, playbook và bằng chứng cụ thể được ưu tiên; không suy diễn parity.

## Trạng thái và thứ tự ưu tiên hiện hành

Bàn giao chi tiết: [NATIVE_HANDOFF.md](NATIVE_HANDOFF.md). Native đã có 12 chủ đề, UI dùng asset PWA, gallery cuộn liên tục, engine vẽ và lưu. Người dùng xác nhận intro/âm thanh intro hoạt động tốt; audit luồng vẽ cũ diễn ra trước lần đổi giao diện và thêm bốn chủ đề. Gallery, bảng bút/màu, hiệu ứng sao và lưu/thumbnail trên UI mới vẫn cần thử trên iPhone.

1. Kiểm tra UI và 12 chủ đề trên iPhone: vị trí, gallery cuộn qua biên và đổi nền, chọn đúng tranh, Back và thumbnail; kiểm tra đặc biệt Ocean 4/8.
2. Kiểm tra bảng chọn, chạm ngoài, tô/vẽ/tẩy/undo/xóa, sao sau khi thả, Done, Back và mở lại sau tắt app; ghi sai lệch vào tracker.
3. Đo thời gian mở, bộ nhớ và độ mượt khi cuộn, vẽ lâu và chuyển qua nhiều tranh. Không kết luận ảo hóa nhanh hơn PWA nếu chưa đo.
4. **Chuyển động nhân vật và thu nhỏ menu đang tạm tắt vì lỗi theo yêu cầu người dùng.** Để nguyên cho đến khi điều tra và kiểm tra lại sau; app gốc theo người dùng chọn ngẫu nhiên 3 nhân vật khoảng mỗi 6 giây, nhấn thu nhỏ menu khoảng 10%.
5. Kiểm tra audio ngoài intro, background/resume và giới hạn offline trong Expo Go. Camera/export và parental gate ngoài phạm vi. Khi hiệu ứng hoặc hành vi còn mơ hồ, hỏi người dùng thay vì đoán.

## Mục tiêu và phạm vi

Xây dựng game cho iPhone bằng React Native, Expo và Skia, lấy PWA trong `web/` làm tài liệu tham khảo và nguồn logic/tài nguyên có thể tái sử dụng. Bản Expo trong `native/` đã có luồng chơi cơ bản và catalog 12 chủ đề; trạng thái kiểm chứng hiện hành ở [sổ hành vi native](NATIVE_BEHAVIOR_TRACKER.md). Sau nghiệm thu, native là sản phẩm chính. Không tiếp tục phát triển PWA hay yêu cầu hỗ trợ trình duyệt, service worker, manifest hoặc fullscreen PWA. Giữ `web/` làm tham chiếu trong khi chuyển đổi; chỉ dọn sau khi nghiệm thu và kiểm tra quyền sở hữu dữ liệu.

Ưu tiên chạy trên iPhone; giữ khả năng chạy Android nếu thuận tiện, không đặt Android làm điều kiện nghiệm thu. Mặc định landscape, ẩn status bar, bố trí vùng tương tác tránh notch và thanh hệ thống. Android xử lý system bars theo khả năng hệ điều hành; iOS không cam kết che được home indicator hoặc khóa hướng trong mọi chế độ cửa sổ. Thiết kế thích ứng các kích thước thực tế thay vì giả định luôn có đúng 16:9.

Người dùng xác nhận thứ tự luồng PWA intro → chọn chủ đề → chọn tranh → vẽ là đúng; Spine ở intro và chủ đề của PWA được người dùng đánh giá rất ổn, nhưng hành vi kích hoạt ở màn chủ đề còn sai: không kích hoạt animation bằng hover, thiếu hiệu ứng zoom out khi nhấn; chi tiết hiệu ứng phải đối chiếu app gốc. Màn chọn tranh khá giống nhưng chưa xác nhận hoàn toàn, và màn vẽ PWA bị crash trên máy thật. Nguyên nhân crash chưa rõ, cần kiểm tra trên native, không giả định tự hết. Người dùng xác nhận asset UI của PWA chuẩn app gốc; dùng asset đó cho native. Hành vi và animation cần đối chiếu riêng vì PWA có sai lệch. Lập danh sách sai lệch theo từng màn hình và xác minh bằng bằng chứng gốc hoặc phản hồi của người dùng trước khi chuyển. Phạm vi chức năng bao gồm: intro → menu chủ đề → gallery → tranh; chọn màu, marker, pencil, fill, eraser, undo, xóa, xác nhận/lưu, thumbnail, âm thanh và các điều khiển hiện có. Camera/export và parental gate nằm ngoài phạm vi theo quyết định của người dùng; không xem các báo cáo cũ là bằng chứng tất cả đã hoàn thiện. Theo handoff 3.141, menu bút được tinh giản và palette 56 màu; đối chiếu hành vi thực tế với bằng chứng và phản hồi người dùng trước khi chọn cách triển khai.

## Môi trường thực tế và cách chạy iPhone

Người dùng chỉ dùng cá nhân, có Ubuntu và iPhone; **không có Mac, không có tài khoản Apple Developer Program và không phát hành store**. Ưu tiên Expo Go trên iPhone, chạy Metro từ Ubuntu và chọn thư viện tương thích Expo Go; xác nhận Expo Go cài từ App Store có đúng SDK của dự án trước khi chốt version. Expo Go có Skia theo tài liệu Expo, nhưng module native tùy biến không được hỗ trợ. Spine native, cấu hình khóa landscape, system UI và offline phải được kiểm chứng trong chính Expo Go; `app.json` không tự thay đổi native host đã cài. Không hứa app độc lập, full screen hoặc offline sau khi đóng Metro khi chưa có bằng chứng. Nếu yêu cầu thiết yếu không khả thi trong Expo Go, ghi giới hạn, đề xuất phương án và hỏi người dùng trước khi đổi điều kiện hoặc công nghệ; build iOS qua EAS cho thiết bị đòi hỏi tài khoản Apple Developer. Không coi Android, App Store hay build release iOS là điều kiện bắt buộc trong phạm vi hiện tại.

## Kết quả thử nghiệm Expo Go

- Người dùng xác nhận khóa ngang hoạt động trên iPhone trong màn kiểm tra Expo Go. Chưa kết luận mọi phiên bản iOS hoặc môi trường đều tương tự.
- Người dùng xác nhận hiển thị toàn màn hình hoạt động rất tốt trong thử nghiệm nền màu trên iPhone với Expo Go. Đây là đánh giá trực quan, chưa có số đo hoặc xác minh cho các thiết bị/iOS khác.
- Khởi chạy lại offline: chưa được người dùng xác nhận; chưa đánh dấu đạt.

## Quy trình đối chiếu cùng người dùng

Người dùng có thể xem ứng dụng gốc và nhận xét trực tiếp. Kiểm tra khả năng chạy 3.141 trên giả lập hiện có; nếu chưa chạy được, tiếp tục dùng thiết bị gốc hoặc bằng chứng khác, không chặn công việc độc lập. Ghi phiên bản và môi trường của từng quan sát.

Lập danh sách sai lệch theo màn hình và thao tác, mô tả kết quả hiện tại, kết quả mong muốn, nguồn bằng chứng, mức ưu tiên và trạng thái (chưa xác minh / đã xác nhận / đang sửa / đã kiểm thử). Ưu tiên các luồng cốt lõi, sau đó trình bày từng nhóm để người dùng nhận xét và sửa dần. Không chuyển nguyên hành vi sai từ PWA sang native, không tự kết luận đã giống bản gốc khi thiếu bằng chứng.

## Kiểm kê và quyết định kỹ thuật

| Thành phần | Nguồn tham chiếu | Hướng chuyển |
| --- | --- | --- |
| Mô hình `Action`, ID tranh, danh mục | `web/src/types.ts` | Tái sử dụng kiểu và quy tắc sau khi tách khỏi URL asset web; version hóa dữ liệu. |
| Tọa độ, hit test | `web/src/regionGeometry.ts` | Chuyển hàm thuần và test; thay bước đọc alpha từ HTML canvas bằng dữ liệu mask native. |
| Nét, fill, eraser, undo, thumbnail | `web/src/DrawScene.tsx` | Chỉ tái sử dụng thuật toán sau khi kiểm chứng semantics; viết lại renderer và input bằng Skia/native. |
| Menu, gallery, điều hướng | `MainMenu.tsx`, `Gallery.tsx`, `routes.ts`, `galleryScroll.ts` | Viết lại view và tương tác bằng RN; giữ mô hình luồng, dữ liệu, toán cuộn khi phù hợp. URL browser không còn là nguồn trạng thái. |
| Lưu tranh | `DrawScene.tsx`, `Gallery.tsx` | Thay IndexedDB/Blob bằng SQLite và file thumbnail native; dữ liệu PWA không tự xuất hiện trong app native. |
| Intro và animation menu | `OriginalIntro.tsx`, `MainMenu.tsx`, Spine assets | Không thể mang trực tiếp WebGL widget/DOM; làm spike runtime native có phiên bản khớp skeleton, có phương án animation dựng sẵn nếu không khả thi. |
| Audio | `web/src/audio.ts` | Dùng danh sách và thời điểm phát làm ứng viên, đối chiếu với bản gốc; thay `HTMLAudioElement` bằng API audio Expo phù hợp, quản lý lifecycle. |
| Nội dung | `web/public/art`, `game-assets`, `v3.141` | Tạo catalog và registry asset tĩnh sinh tự động, kiểm tra liên kết và đóng gói offline; không copy toàn bộ vô điều kiện. |

Native đã tích hợp 12 × 16 tranh 3.141; bốn chủ đề bổ sung được tìm bằng các tham chiếu Unity, xem [dữ liệu 12 chủ đề](THEME_DATA_GAP.md). Các nhóm dùng slug theo tên chủ đề; khóa lưu cũ `pack2`–`pack8` không được chuyển đổi theo quyết định của người dùng, còn ID vùng không đổi. Chưa xác minh trên thiết bị từng tranh, thứ tự gallery và binding runtime; cần đối chiếu trước khi coi là hoàn tất parity. PWA cũ vẫn chỉ ánh xạ 8 nhóm và không được thay đổi trong lần tích hợp này.

## Kiểm chứng lựa chọn công nghệ sớm

React Native + Skia là lựa chọn hiện tại, chưa có benchmark chứng minh nó giải quyết crash hoặc đủ giống app gốc. Trước khi chuyển hàng loạt, dựng và đo trên iPhone thật hai thử nghiệm: (1) một tranh nhiều mask, kéo nét dài, fill, tẩy, undo và mở/lưu liên tục; (2) chuyển một skeleton Spine 3.8.99 đang chạy tốt trên web sang native và kiểm tra sự kiện kích hoạt cùng hiệu ứng zoom out theo app gốc. Ghi frame time, bộ nhớ, lỗi và độ tương đồng so với quan sát. Nếu một thử nghiệm thất bại, điều tra và tối ưu, rồi báo user bằng kết quả trước khi đề xuất đổi nền tảng; Unity có runtime Spine chính thức và là phương án cần đánh giá nếu animation game trở thành nút thắt. Không tự đổi stack.

## Kiến trúc đích

- `native/src/domain/`: kiểu tranh, action, màu/công cụ, phép biến đổi tọa độ, replay và quy tắc undo thuần TypeScript.
- `native/src/assets/`: catalog có version, registry sinh từ dữ liệu đã chọn, kiểm tra integrity và tên asset; quản lý hình/âm thanh và kiểm tra khả năng tải, lưu cache và mở offline thực tế trong Expo Go.
- `native/src/drawing/`: loader mask, hit test, Skia renderer, gestures, cache bề mặt và thumbnail; không phụ thuộc DOM.
- `native/src/storage/`: repository SQLite cho action/version và file thumbnail, giao diện tách khỏi UI; migration schema và xử lý ghi thất bại.
- `native/src/app/`: các route intro, menu, gallery, drawing bằng Expo Router; UI và logic không phải route đặt ngoài thư mục này theo `native/AGENTS.md`.
- `native/src/platform/`: âm thanh, orientation, system bars, app lifecycle và chia sẻ/xuất ảnh.

Chọn dependency tương thích Expo SDK bằng `expo install`; ghim lockfile, kiểm tra `expo-doctor`, ưu tiên thư viện tương thích Expo Go; nếu cần native module không có sẵn, ghi rõ trở ngại và trao đổi với user trước khi chuyển sang development build. Intro đã được người dùng chấp nhận chạy Spine trong WebView; không dùng WebView để bọc toàn bộ game. Dùng Skia cho canvas và đồ họa cần hiệu năng; RN cho layout, nút và danh sách. Kiểm tra thực tế trong Expo Go; cấu hình native của app riêng không thể suy ra từ cấu hình host.

## Thứ tự thực hiện và điều kiện hoàn thành

### 0. Chốt baseline và môi trường

- Kiểm kê các route, thao tác, nội dung và ảnh hưởng của từng nút từ code hiện tại; chụp/ghi lại baseline cho intro, menu, gallery và tranh đại diện. Phân biệt dữ liệu quan sát thực tế, giả định và chức năng còn thiếu.
- Ghi lại môi trường Node/Expo, sửa cài đặt scaffold chưa hoàn tất, đồng bộ lockfile, chọn bundle ID/package ID, kiểm tra SDK tương thích Expo Go cài trên iPhone; chạy Metro trên Ubuntu, mở trên iPhone thật và kiểm tra kết nối. Không yêu cầu dev build iOS hoặc Android trong điều kiện hiện tại.
- **Đạt:** app mở được trong Expo Go trên iPhone, kiểm tra landscape và điều khiển không bị che trong giới hạn host; các thay đổi PWA hiện có được bảo toàn.

### 1. Catalog và pipeline asset

- Viết script có thể chạy lại để sinh catalog, static `require` registry và kiểm tra mọi `picture.json`, outline, mask, thumbnail, UI sprite, audio. Không dùng đường dẫn `/...` hoặc `require` động không được Metro phân tích.
- Kiểm tra thứ tự vùng, bounds, logical size, số lượng và ảnh lỗi; xác định mapping sản phẩm/pack/tranh theo từng phiên bản. Chuẩn bị subset representative trước, sau đó mở rộng toàn bộ nội dung đã xác thực.
- Đo kích thước app, thời gian mở và bộ nhớ trước khi chọn nén/gộp atlas hoặc chia asset. Thử mở nội dung cơ bản offline trong Expo Go và ghi lại giới hạn; không dựa vào cache PWA.
- **Đạt:** kiểm tra catalog không có tham chiếu hỏng; mọi item hiển thị được mở đúng tranh, không báo nội dung chưa được xác minh là đã hoàn tất.

### 2. Vertical slice: một tranh end-to-end

- Tách domain types, hàm tọa độ và thứ tự xử lý action; xây dựng bộ nạp tranh/mask cho một ảnh có nhiều vùng. Tạo index alpha một lần, tránh pixel readback ở mỗi sự kiện chạm.
- Dùng Skia vẽ outline, fill và nét; phép biến đổi màn hình ↔ art space thống nhất. Xây dựng clip theo vùng đầu nét làm giả thuyết được quan sát ở 3.101; xác minh riêng cho 3.141. Xử lý tap, di chuyển, hủy và tương tác nhiều ngón.
- Thực hiện marker, pencil, fill, eraser, undo, clear và palette; tạo snapshot/thumbnail; thử nghiệm lưu khi xác nhận và mở lại như giả thuyết; xác minh riêng 3.141, bao gồm back và autosave.
- **Đạt:** chạy trên iPhone thật trong Expo Go, fill hai vùng độc lập, nét kéo qua biên không lem, undo fill/nét/tẩy, lưu → đóng → mở lại đúng tranh và thumbnail; thử offline và ghi rõ giới hạn Expo Go.

### 3. Hiệu năng engine

- Profile trên iPhone thật qua Expo Go từ vertical slice, ghi rõ môi trường và giới hạn đo: thời gian mở tranh, thời gian phản hồi chạm, frame time p50/p95/p99, số frame trễ và bộ nhớ khi vẽ liên tục, undo dài, chuyển qua nhiều tranh và background/foreground.
- Dùng cache theo vùng/ảnh, chỉ cập nhật vùng thay đổi; giới hạn hoặc checkpoint lịch sử theo kết quả đo, tránh replay toàn bộ mỗi lần di chuyển và tránh cập nhật React state cho từng điểm khi có giải pháp phù hợp. Quản lý vòng đời Skia image/surface để giải phóng bộ nhớ.
- Ngưỡng thử nghiệm ban đầu: 60 fps mục tiêu trên thiết bị tham chiếu, frame p95 ≤ 16,7 ms trong kịch bản vẽ và cuộn, không crash/OOM; đo trên thiết bị thực và điều chỉnh mục tiêu theo baseline thực tế, công bố điều kiện đo. Không khẳng định 60 fps trên mọi máy.
- **Đạt:** có báo cáo đo trước/sau và không suy giảm hành vi hoặc mất nét để đạt benchmark.

### 4. Điều hướng, menu và gallery

- Dựng intro → menu → gallery → drawing, back Android/iOS, trạng thái trở lại đúng chủ đề/vị trí cuộn, danh sách chủ đề và thumbnail đã lưu. Dùng virtualized list và preload có giới hạn khi có lợi.
- Chuyển sprites, nền, màu, bố cục và animation theo baseline; cân đối theo safe area, tỷ lệ màn hình và touch target.
- Spike animation Spine: kiểm tra phiên bản skeleton và runtime, native module, hiệu năng và điều kiện giấy phép. Nếu không đạt, đánh giá phương án animation render sẵn và nêu khác biệt cho người dùng trước khi chấp nhận thay thế; không ngầm dùng WebGL runtime trong RN.
- **Đạt:** đi hết luồng và quay lại trạng thái đã xác minh, gallery không mở sai tranh, animation ngoài màn hình được quản lý theo yêu cầu và hiệu năng; kiểm tra khả năng vận hành offline trong Expo Go.

### 5. Lưu trữ, audio và tương tác hệ thống

- Lưu danh sách action và phiên bản catalog theo khóa tranh ổn định trong SQLite; thumbnail trong file app-private với đường dẫn được quản lý. Đảm bảo ghi nhất quán, xử lý lỗi, recovery khi app bị gián đoạn, schema migration và cleanup file cũ. Undo sau mở lại cần xác minh theo bản gốc, không suy từ PWA.
- Mặc định bắt đầu dữ liệu native mới: không xóa dữ liệu PWA, không hứa tự chuyển IndexedDB giữa browser và app. Nếu cần giữ tranh cũ, bổ sung luồng export/import có version, xác minh mapping và thử khôi phục trước khi ngừng bản cũ.
- Chuyển nhạc/hiệu ứng sang audio native; xử lý mute, tạm dừng nền, interruptions và dừng vòng lặp khi rời màn. Camera/export và parental gate không thuộc phạm vi native.
- **Đạt:** test kill/relaunch, offline, thiếu dung lượng/ghi lỗi, cập nhật schema; không mất bản đã xác nhận, âm thanh không tiếp tục khi không nên phát.

### 6. Phủ nội dung và nghiệm thu

- Mở rộng toàn bộ catalog đã xác thực, kiểm tra tự động đủ file và chạy mẫu mỗi nhóm, gồm vùng nhỏ/chồng lấp, tranh nhiều vùng và các kích thước màn hình. Nội dung thiếu mapping được báo rõ trong catalog.
- Test đơn vị cho geometry, hit test, replay, undo, migration và mapping; test tích hợp cho storage và lifecycle; test thiết bị cho full flow, orientation, safe area, cử chỉ, back, audio, offline và khôi phục.
- So sánh ảnh/video với PWA để nhận diện thay đổi, đối chiếu hành vi với bằng chứng gốc và phản hồi của người dùng; ghi nhận từng sai lệch và trạng thái xử lý; không xem tài liệu 3.101 là bằng chứng parity 3.141. Kiểm tra lần đầu cài, nâng cấp và hoạt động sau khi tắt mạng.
- Kiểm tra trên iPhone thật trong Expo Go: crash, bộ nhớ, frame time, thời gian mở, khả năng khởi chạy lại và offline. Build release iOS/Android và phân phối store không thuộc phạm vi hiện tại. Chỉ coi mục tiêu cá nhân đạt khi cách mở app, giới hạn Expo Go và dữ liệu cần giữ đã được kiểm chứng.

## Rủi ro và điểm cần quyết định khi triển khai

1. **Dữ liệu 3.101/3.141:** cần mapping có chứng cứ, không ghép nhầm save. Các chủ đề thiếu tranh không được hiển thị như đã hoàn thành.
2. **Spine:** tài liệu runtime liệt kê iOS/Android và các runtime chung, không liệt kê runtime React Native chính thức; cần xác thực khả năng tích hợp và giấy phép. Dữ liệu intro 3.141 dùng phiên bản khác widget web cũ.
3. **Tài nguyên bên thứ ba:** assets trích xuất từ ứng dụng khác và Spine có điều kiện sử dụng riêng; kiểm tra quyền trước khi phân phối.
4. **Tính năng PWA và dữ liệu:** native không tự kế thừa IndexedDB hay service worker; cần quyết định import nếu tranh cũ có giá trị.
5. **Thiết bị:** hiệu năng, khóa hướng và system UI phải kiểm tra trên iPhone thực; Android kiểm tra khi có thiết bị và nhu cầu; môi trường Linux không tự build iOS local.

## Tài liệu tham khảo

- Expo asset bundling: https://docs.expo.dev/develop/user-interface/assets/
- Expo orientation: https://docs.expo.dev/versions/latest/sdk/screen-orientation/
- Expo development builds: https://docs.expo.dev/develop/development-builds/introduction/
- Spine runtimes và phiên bản: https://us.esotericsoftware.com/spine-runtimes và https://us.esotericsoftware.com/spine-runtime-architecture
- License Spine runtimes: https://en.esotericsoftware.com/spine-runtimes-license
