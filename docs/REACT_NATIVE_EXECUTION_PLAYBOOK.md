# Playbook thực thi: chuyển đổi và đối chiếu game gốc 3.141

Tài liệu này bổ sung [kế hoạch tổng thể](REACT_NATIVE_MIGRATION_PLAN.md). Đối tượng đọc là agent thực thi mới, chưa có lịch sử hội thoại. Mục tiêu là game React Native + Expo + Skia chơi ngang trên iPhone; Android không là điều kiện nghiệm thu. Người dùng xác nhận asset UI PWA chuẩn app gốc; hành vi PWA vẫn cần đối chiếu riêng. **Chưa có cơ sở khẳng định parity 100% hoặc coi mọi hành vi PWA là đúng.** Người dùng có thể chạy game gốc trên thiết bị, cung cấp mô tả, ảnh hoặc video; agent liệt kê sai lệch rồi sửa dần. Giả lập là lựa chọn hỗ trợ, không phải điều kiện bắt đầu. Môi trường: Ubuntu + iPhone, không Mac, không Apple Developer Program, chỉ dùng cá nhân và không public store. Ưu tiên Expo Go tương thích SDK, không mặc định có dev build iOS, native module tùy chỉnh, app độc lập hay offline.

## 1. Quy tắc ra quyết định và bằng chứng

- Phiên bản mục tiêu: app gốc `com.bimiboo.drawing` 3.141. Các quan sát 3.101 chỉ là giả thuyết cho 3.141, không tự nâng thành bằng chứng của 3.141. Người dùng đã quyết định giữ 3 công cụ trước mắt và không làm camera/export hay parental gate; 56 màu mở hết vẫn cần xác nhận. Khi có xung đột quan trọng với mục tiêu đúng app gốc, ghi ra và hỏi người dùng bằng một nhóm câu hỏi ngắn.
- Thứ tự áp dụng: chỉ đạo hiện hành của người dùng → quan sát thực tế game 3.141 có phiên bản/kịch bản → dữ liệu serialized/call flow gốc trong phạm vi chứng minh → mô tả của người dùng → PWA như tham khảo. Nếu người dùng trực tiếp mô tả hành vi mong muốn thì ghi nhận là yêu cầu; nếu mô tả quan sát gốc, ghi nguồn là người dùng, kèm phiên bản và điều kiện nếu biết. Không phủ nhận phản hồi chỉ vì PWA khác.
- Nhãn từng mục: `quan sát-3.141`, `user-confirmed`, `static-3.141`, `quan sát-3.101`, `PWA`, `suy luận`, `chưa biết`. Static chứng minh dữ liệu/call flow trong phạm vi cụ thể, không tự chứng minh kết quả runtime. Ảnh tĩnh không chứng minh animation, âm thanh hoặc thứ tự sự kiện.
- Hành vi chưa biết được phép có bản tạm để phát triển, nhưng phải đánh dấu `chưa xác minh`, có kịch bản đối chiếu và không đánh dấu nghiệm thu. Không tuyên bố toàn app đúng gốc khi còn chức năng chưa xác minh. Kết quả của browser, unit test, video render hoặc giả lập không thay thế quan sát thiết bị thực.
- `web/` có thay đổi chưa commit của người dùng; không reset, xóa hay ghi đè. `native/` đã có luồng chơi và catalog 12 chủ đề nhưng chưa nghiệm thu giao diện hiện tại; `docs/v3.141/PROGRESS.md` và `AUDIT.md` là báo cáo lịch sử có tuyên bố không đáng tin. Đọc `native/AGENTS.md` và các chỉ dẫn repository hiện hành trước khi sửa; tuân thủ Expo Router, docs đúng SDK, lint/typecheck. Không tái dùng WebView để bọc PWA.
- Thực hiện độc lập các việc không phụ thuộc người dùng, hỏi theo từng cụm ngắn khi một quyết định gameplay thực sự cần quan sát. Không chặn toàn dự án chỉ vì chưa có giả lập hoặc một hành vi còn mơ hồ.

## Thông tin người dùng đã xác nhận

- PWA có **thứ tự luồng mở đầu đúng**: intro → màn chọn chủ đề → chọn tranh → màn vẽ. Đây là xác nhận về thứ tự màn hình, không đồng nghĩa từng animation, tương tác hay nhánh first-run đã đúng.
- Spine intro và Spine trên các chủ đề trong PWA hiện chạy và được người dùng đánh giá rất ổn; dùng animation và asset này làm tham chiếu. Theo người dùng, app gốc chọn ngẫu nhiên 3 nhân vật khoảng mỗi 6 giây và thu nhỏ menu khoảng 10% khi chọn. Bản native đã tạm tắt toàn bộ chuyển động menu vì lỗi theo yêu cầu; cần điều tra sau và không tự bật lại. Việc Spine chạy tốt trên web chưa chứng minh đã tích hợp được trên native.
- Người dùng xác nhận gallery gốc vuốt liên tục qua các chủ đề và đổi nền; bản native mới cần được đối chiếu và đo trên iPhone.
- PWA bị crash tại màn vẽ trên máy thật. Nguyên nhân chưa xác định; chuyển sang native **không bảo đảm** tự hết. Ghi lại thiết bị, OS, bước tái hiện, log và bộ nhớ nếu có; kiểm tra riêng bản native trên thiết bị thật và xử lý nguyên nhân nếu tái diễn. Lỗi này ưu tiên P0.

## 2. Điểm xuất phát đã biết

| ID | Bằng chứng | Sử dụng đúng phạm vi | Còn cần xác minh |
| --- | --- | --- | --- |
| E01 | [STATUS 3.141](v3.141/STATUS.md) | APK có bản 3.141; lần chạy emulator trước vào Unity rồi `SIGILL`, chưa ghi gameplay. | Không kết luận mọi emulator đều lỗi. |
| E02 | [Logic 3.141](v3.141/LOGIC_MAP.md) | Trash so thời gian 2 giây trước lời gọi ClearAll; Undo gọi PaintIn3D; `OnSaveButtonUp` no-op; intro có callback khi animation complete. | Hành vi thực tế trash/lưu/undo, thứ tự scene và first run. Tên hàm không chứng minh kết quả UI. |
| E03 | [Gallery evidence](v3.141/GALLERY_SCROLL_EVIDENCE.md) | Static có tween nền 0,75 giây và chuyển local X 1 giây theo panel. | Easing, offset bắt đầu, order và loop thực tế; cài đặt DOTween có thể ảnh hưởng. |
| E04 | [Particle evidence](v3.141/DRAWING_PARTICLES_EVIDENCE.md) | Hai bảng 56 màu và phép nhân màu có bằng chứng static; cấu hình màu xảy ra khi press. | Trigger, số lượng, vật lý, âm thanh; hạt PWA là xấp xỉ. |
| E05 | [Handoff asset](v3.141/HANDOFF.md) | Tài liệu gốc ghi 8 group 3.141 và thiếu dữ liệu; sau đó 4 chủ đề bổ sung đã được trích xuất vào native, xem NATIVE_HANDOFF và THEME_DATA_GAP. | Từng hình, region, thumbnail và mapping product; so sánh hình không đủ chứng minh ID. |
| E06 | [Quan sát 3.101](BEHAVIOR.md) | Đã quan sát clip nét ở vùng đầu, fill, undo, xác nhận lưu và mở lại offline trong 3.101. | Mọi điều tương ứng ở 3.141; không coi hành vi tẩy/reset/back đã được xác định đầy đủ. |

Các số liệu asset trong các tài liệu lịch sử có phạm vi khác nhau: 160 preview ứng viên không đồng nghĩa 160 tranh có đủ region, 12 card không đồng nghĩa 192 tranh hoạt động. Thực hiện manifest/file validation thực tế và ghi riêng `tồn tại`, `geometry đã kiểm`, `mapping đã xác minh`, `đã mở được`.

## 3. Sổ sai lệch: sản phẩm bàn giao bắt buộc

Tạo `docs/NATIVE_BEHAVIOR_TRACKER.md` khi bắt đầu thực thi, có một hàng cho mỗi tình huống. Các trường: ID ổn định; màn hình; thao tác/điều kiện đầu; phiên bản, thiết bị và nguồn bằng chứng; kết quả gốc; kết quả PWA/native; sai lệch; ưu tiên P0/P1/P2; trạng thái; test/evidence/commit; câu hỏi còn mở. Đừng tạo hàng đã xác nhận nếu chưa có bằng chứng. Các trạng thái tách biệt: `chưa quan sát`, `cần người dùng`, `đã xác nhận`, `đang sửa`, `đã kiểm thử kỹ thuật`, `người dùng đã đối chiếu`. Lưu ảnh/video trong nơi người dùng và agent có thể tham chiếu nếu được cung cấp; không bịa artifact hay đường dẫn.

Ưu tiên P0: crash màn vẽ trên thiết bị thật, mở app/điều hướng chính, đúng tranh, input, fill/stroke/eraser, không mất dữ liệu. P1: tool/palette, undo/reset, thumbnail, gallery, âm thanh, animation. P2: chi tiết hạt, timing, xuất/chia sẻ và các góc cạnh khác, trừ khi người dùng nâng ưu tiên. Một issue có thể ở trạng thái kỹ thuật đạt nhưng chưa được người dùng đối chiếu.

## 4. Bộ kịch bản yêu cầu quan sát gốc

Mỗi scenario ghi điều kiện ban đầu, thao tác, kết quả, thiết bị/OS, app version, thời gian hoặc video khi cần. Gom 3–5 câu hỏi liên quan mỗi vòng; dùng video cho cử chỉ/animation, ảnh cho bố cục/màu. Không yêu cầu user quay lại mọi thứ nếu đã có bằng chứng đủ tin cậy.

| Nhóm | Kịch bản phải kiểm tra | Trường hợp cần mô tả/ghi lại |
| --- | --- | --- |
| Khởi động | Cài/mở lần đầu; mở lại; bỏ qua intro; background lúc intro | Thứ tự intro → chủ đề → chọn tranh → vẽ đã được user xác nhận; kiểm tra riêng onboarding, thời lượng, skip, nhạc và first-run. |
| Menu | Thứ tự card, cuộn đến hai đầu, nhấn/thả card, animation trước/sau và zoom out khi nhấn | Bố cục, quán tính, giới hạn/lặp, trigger, thời lượng/easing và chuyển màn; không kích hoạt animation bằng hover. |
| Gallery | Mở từ nhiều chủ đề; cuộn chậm/nhanh/qua biên; chọn tranh; back; quay lại | Thứ tự, loop thực tế, nền/tween, label, số lượng, giữ vị trí, pack/picture được mở. |
| Tranh | Chạm đường viền/vùng trắng; vẽ một điểm và kéo qua 2 vùng; ra khỏi canvas và vào lại | Vùng được chọn, clip, hit test, nét, độ dày, smoothing, hủy và feedback. |
| Tools | Marker, pencil, bucket, eraser; mở/đóng popup; chọn màu; kéo palette | Số tool thực tế và lựa chọn có chủ ý của người dùng, trạng thái giữ/đổi, độ rộng, màu mặc định, âm thanh, tẩy và phục hồi tool. |
| Fill và history | Tô hai vùng; tô lại; vẽ trên vùng đã tô; tẩy; undo từng bước; mở lại | Thứ tự lớp, undo fill/stroke/erase, giới hạn, có giữ undo sau mở lại hay không. |
| Xóa | Nhấn thùng rác một lần, chờ >2 giây; nhấn hai lần nhanh; undo; lưu và mở lại | Thời gian xác nhận, feedback, ảnh hưởng draft/save và undo; E02 chỉ là static. |
| Save/back | Xác nhận; back chưa lưu; force-stop trước/sau xác nhận; mở lại offline | Lúc nào ghi, gallery thumbnail, hành vi trở lại, trạng thái lỗi và dữ liệu. |
| Camera/share | Ngoài phạm vi native theo quyết định người dùng | Không triển khai camera/export hoặc parental gate. |
| Hiệu ứng/âm thanh | Chạm, di chuyển, nhấc, fill, chọn màu, chuyển màn; tắt âm/đưa xuống nền | Trigger, màu/số hạt, animation, loại âm, có chồng âm hay dừng. |
| Thiết bị | Cầm ngang trái/phải, notch, Android back/system UI, background/resume | Orientation, safe area, hiển thị thanh hệ thống, sai khác platform. |

Quan sát gốc cùng video không đồng nghĩa phải copy các hành vi vô tình lỗi hoặc hạn chế thương mại: nếu xung đột với các tùy biến đã yêu cầu trước đây, agent nêu rõ sự khác biệt và hỏi trước khi quyết định. Ghi rõ lựa chọn đã chốt trong tracker.

## 5. Lộ trình giao việc theo lát cắt

1. **Audit và chuẩn bị:** kiểm tra `git status`, package/SDK và `AGENTS.md`, cài dependency phù hợp, xác minh app scaffold. Viết tracker từ ma trận trên với trạng thái `chưa quan sát`; chỉ điền dữ kiện thực có nguồn. Đo các asset hiện có bằng script; lập manifest không commit file build hoặc dữ liệu bí mật.
2. **Nội dung và một tranh đại diện:** chọn một tranh thực có outline và vùng; xác minh topic ID và thứ tự region. Sinh catalog/build registry, kiểm tra hình thiếu, duplicate, bounds và kích thước. Giữ phiên bản asset trong save. Nếu chưa chứng minh mapping, đặt ảnh đó trong development fixture, không bán như catalog gốc hoàn chỉnh.
3. **Đường đi dọc:** có thể mở fixture → vẽ → undo → lưu → mở lại; PWA/3.101 chỉ gợi ý phép tính. Phép biến đổi art-to-view và inverse dùng cùng hệ tọa độ, test điểm biên và tỷ lệ. Hit test/tẩy/clip theo điều đã xác nhận; các điểm khác đánh dấu giả thuyết. Hỗ trợ lifecycle, touch cancel, an toàn đồng bộ nét với save. So sánh cùng user sớm.
4. **Mở rộng giao diện:** dựng intro/menu/gallery/drawing theo bằng chứng và tracker. Expo Router giữ route/params có validation; native back, trả đúng vị trí theo kết quả quan sát. Chuẩn bị test từng luồng, không để list ảo mở nhầm asset. Giữ placeholder/ẩn item chưa xác minh theo quyết định UI được ghi lại.
5. **Tái hiện từng hành vi:** xử lý theo ưu tiên tracker, mỗi thay đổi có kịch bản tái hiện, kiểm thử và đối chiếu. Spine: đánh giá runtime tương thích 3.8.99, texture/atlas, native build và điều kiện sử dụng; nếu cần fallback dựng sẵn thì báo khác biệt và hỏi người dùng trước khi chấp nhận, không coi là hoàn thành animation gốc. Audio: đo trigger/lifecycle, không mặc định PWA đúng.
6. **Persistence/offline:** SQLite và thumbnail file theo version; test ghi lỗi, ứng dụng bị kill, restore, thumbnail, migration và không ghi sai tranh. Xác minh semantics lưu với người dùng trước khi chốt. Kiểm tra khả năng mở và dùng offline trong Expo Go; ghi rõ giới hạn, không hứa tương đương app độc lập. PWA IndexedDB nằm riêng; import chỉ khi có yêu cầu, có mapping và kiểm chứng.
7. **Mở rộng và nghiệm thu:** xác minh mỗi product/ảnh trong catalog, tự động kiểm tra tài nguyên, chọn mẫu mỗi nhóm và các region chồng/lỗ/nhỏ để đối chiếu trực tiếp. Chạy lint/typecheck/test cần thiết, `expo-doctor` và test trên iPhone thật qua Expo Go; không yêu cầu iOS development build trong điều kiện hiện tại. Kiểm tra hiệu năng trên iPhone qua Expo Go theo kế hoạch tổng thể, đồng thời hoàn thiện tracker. Chỉ gọi hoàn thành từng hành vi khi có test kỹ thuật và bằng chứng/nhận xét gốc tương ứng.

## 6. Kiểm thử, hiệu năng và báo cáo

- Unit test các hàm chuyển tọa độ, hit-test, action ordering, asset mapping, serialization/migration; integration test storage và save failure. Test có fixture độc lập và expected result từ bằng chứng; tránh test chỉ lặp lại code.
- Kịch bản thiết bị: portrait khi mở app rồi xoay, hai hướng landscape, màn hình notch, back khi có trên nền tảng cần kiểm tra, trạng thái background/kill, mất mạng, nhiều nét, nhiều tranh, resume, lưu. Đo frame time, latency, bộ nhớ và mở tranh trên iPhone qua Expo Go, ghi rõ host và cấu hình; ghi model, OS, phiên bản, cảnh/kịch bản và phương pháp. Mục tiêu 60 fps là mục tiêu thử nghiệm, không phải kết quả đã đạt.
- Mỗi vòng báo cáo: đã làm gì; hành vi gốc nào đã đối chiếu; hành vi còn giả thuyết; lỗi và test/build đã chạy; link tracker; yêu cầu user xác minh tối đa vài mục đang chặn. Không quy đổi Lighthouse thành fidelity hoặc ghi 100% khi chưa đủ bằng chứng.
- Không xóa PWA, dữ liệu cũ hoặc bỏ chức năng chưa được đánh giá trong quá trình chuyển đổi. Không triển khai/phát hành thay người dùng nếu chưa được yêu cầu; quyền dùng asset và Spine cần được kiểm tra trước phân phối.

## 7. Thứ tự đọc cho agent

1. [Bàn giao native](NATIVE_HANDOFF.md), [kế hoạch tổng thể](REACT_NATIVE_MIGRATION_PLAN.md), tài liệu này, `native/AGENTS.md`, `native/package.json`.
2. [Trạng thái 3.141](v3.141/STATUS.md), [logic 3.141](v3.141/LOGIC_MAP.md), [gallery](v3.141/GALLERY_SCROLL_EVIDENCE.md), [particles](v3.141/DRAWING_PARTICLES_EVIDENCE.md), [handoff asset](v3.141/HANDOFF.md).
3. `web/src/types.ts`, `regionGeometry.ts`, `DrawScene.tsx`, `Gallery.tsx`, `MainMenu.tsx`, `OriginalIntro.tsx`, `audio.ts` để xác định những phần có thể tận dụng, không coi là oracle.
4. [Quan sát 3.101](BEHAVIOR.md) chỉ để tạo giả thuyết và kịch bản. Không kế thừa kết luận parity từ các audit PWA.
