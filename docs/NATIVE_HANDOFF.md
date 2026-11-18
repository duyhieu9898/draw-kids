# Bàn giao ứng dụng native

Cập nhật theo trạng thái workspace ngày 2026-11-13. Đọc cùng [kế hoạch native](REACT_NATIVE_MIGRATION_PLAN.md), [sổ hành vi](NATIVE_BEHAVIOR_TRACKER.md) và [native/AGENTS.md](../native/AGENTS.md). Người dùng đã giao tiếp quản native; không tiếp tục phát triển PWA. Giữ PWA làm nguồn tham khảo và asset trong khi native chưa ổn định; người dùng dự định xóa PWA sau đó.

## Phạm vi và môi trường

- Mục tiêu: iPhone qua Expo Go, Ubuntu + Metro, Expo SDK 58, React Native và Skia. Người dùng không có Mac hoặc Apple Developer Program; Android không là điều kiện nghiệm thu. Không hứa app độc lập hoặc offline khi chưa kiểm tra.
- Luồng đang có: intro → menu 12 chủ đề → gallery → vẽ → lưu/mở lại. Catalog có 192 tranh và 2.552 vùng tô, gồm 4 chủ đề bổ sung; nguồn và giới hạn ở [THEME_DATA_GAP.md](THEME_DATA_GAP.md).
- Dùng tên chủ đề cho mã và khóa lưu. Theo yêu cầu người dùng, không migrate các khóa `pack2`–`pack8`; bản ghi cũ không xuất hiện trong app. Dữ liệu IndexedDB PWA tách biệt và không tự chuyển.
- Camera/export và parental gate ngoài phạm vi. Menu bút trước mắt gồm marker, pencil, fill; eraser là nút riêng. Chưa xác nhận chuyện khóa/mở 56 màu.
- Người dùng xác nhận asset giao diện PWA chuẩn app gốc; có thể lấy asset từ đó. Không suy mọi tương tác PWA đều đúng: hỏi người dùng về animation, hiệu ứng và các điểm mơ hồ.

## Tình trạng hiện tại

- Intro: animation Spine 3.8 qua WebView, âm thanh `Drawing_intro.wav` phát native bằng `expo-audio`; người dùng phản hồi hoạt động hoàn hảo. Không suy ra đã kiểm chứng riêng mọi trường hợp kill/relaunch, timeout hay đồng bộ trên thiết bị khác.
- Menu chủ đề: nền, thẻ và nhân vật tĩnh lấy từ asset PWA. **Toàn bộ chuyển động nhân vật và hiệu ứng thu nhỏ khi chọn đang tắt theo yêu cầu**, vì người dùng báo lỗi; chạm mở gallery ngay. Không tự bật lại trước khi điều tra. Sprite sheet animation đã tạo còn trong `native/assets/topics/`, hiện không được tham chiếu trong registry.
- Hành vi app gốc theo người dùng: khoảng 6 giây chọn ngẫu nhiên 3 nhân vật chuyển động, hết animation giữ ảnh tĩnh; khi chọn chủ đề menu thu nhỏ khoảng 10%. Thời lượng/easing chuyển cảnh chưa chốt.
- Gallery: `FlatList` ngang ảo hóa, hai hàng, ba chu kỳ để cuộn liên tục qua 12 chủ đề; nền đổi theo chủ đề. Cần kiểm tra trên iPhone: mở từ mỗi chủ đề, điểm đổi nền, cuộn chậm/nhanh qua ranh giới vòng lặp, chọn đúng tranh, vị trí sau Back, ảnh đã lưu và tải/bộ nhớ. Chưa có benchmark chứng minh nhanh hơn PWA.
- Vẽ: `PictureCanvas` dùng Skia và mask, có marker, pencil, fill, eraser, undo, xóa hai lần chạm trong 2 giây, Done và Back. Các sprite thanh công cụ lấy từ PWA; bảng bút/màu đóng khi chạm ngoài. Hiệu ứng sao khi thả tay được triển khai; bố cục, bảng chọn, hiệu ứng và thao tác sau khi đổi UI chưa được người dùng nghiệm thu trên máy.
- Lưu: SQLite lưu action theo khóa catalog, thumbnail PNG 264×264 trong thư mục riêng; khi ghi thumbnail lỗi có fallback base64. Done lưu, Back không lưu theo xác nhận trước đây của người dùng. Cần thử lại lưu/thumbnail/kill-relaunch sau đổi UI.
- Lần audit luồng vẽ cơ bản được người dùng báo OK trên iPhone là **trước khi** thêm 4 chủ đề và đổi giao diện; không dùng kết quả đó để khẳng định giao diện hiện tại đã đạt.

## Việc tiếp theo

1. Chạy bản hiện tại trên iPhone qua Expo Go; đối chiếu menu tĩnh, gallery liên tục, 12 chủ đề, nền và khung tranh với app gốc. Ghi từng lỗi và bước tái hiện trong tracker.
2. Thử màn vẽ mới: chọn 3 công cụ, chọn màu, chạm ngoài đóng bảng, tô/kéo/tẩy, hiệu ứng sao lúc thả, undo, xóa, Done, thumbnail, Back và khôi phục sau đóng app. Kiểm tra tranh nhỏ/chồng vùng và Ocean 4/8.
3. Đo thời gian mở tranh, độ mượt và bộ nhớ khi cuộn nhiều chủ đề, mở tranh nhiều vùng và vẽ lâu; kiểm tra background/resume. Các tiêu chí hiệu năng chỉ là mục tiêu cho tới khi có kết quả máy thật.
4. Khi người dùng muốn xử lý lại chuyển động menu, lấy chi tiết lỗi và tái hiện; xác định nguyên nhân, so giải pháp với app gốc, kiểm tra hiệu năng trước khi bật lại. Hiện không có mô tả lỗi cụ thể hoặc số đo.
5. Kiểm tra audio ngoài intro, trạng thái mạng/offline và các điểm chưa rõ với người dùng; cập nhật tracker theo bằng chứng.

## Kiểm tra và tệp chính

- `native/src/app/index.tsx`: menu tĩnh. `native/src/app/topics/[pack].tsx`: gallery liên tục. `native/src/app/draw/[pack]/[picture].tsx` và `native/src/components/DrawingShelf.tsx`: điều hướng, bảng và công cụ. `native/src/components/StarBurst.tsx`: hiệu ứng sau thả tay.
- `native/src/assets/catalog.generated.ts`: chạy `npm run catalog` sau khi thay asset tranh. `native/src/storage/pictures.ts`: lưu SQLite và thumbnail. `native/src/intro/IntroGate.tsx` và `native/scripts/generate-intro.mjs`: intro.
- Trong `native/`: `npm start` để chạy Metro; `npm test`, `npm run typecheck`, `npm run lint` để kiểm tra. Lần gần nhất sau khi tắt chuyển động: typecheck và lint đạt. Trước đó 11 test đạt và export iOS thành công; đó không phải kiểm thử tương tác trên iPhone.
- Workspace có nhiều thay đổi chưa commit, gồm cả web và tài liệu lịch sử; không reset hoặc ghi đè thay đổi sẵn có. Đọc `native/AGENTS.md` và tài liệu Expo đúng SDK trước khi sửa API liên quan.
