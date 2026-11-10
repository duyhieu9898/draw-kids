Với `drawing.apk` (15,8 MB), mục tiêu viết lại game tô màu cho trẻ 3–4 tuổi để chơi trên iPhone 12 Pro, mình đề xuất quy trình 10 bước, từ APK đến một PWA có thể chơi offline.

Nguyên tắc quan trọng nhất: không đưa APK cho AI rồi yêu cầu viết lại toàn bộ ngay lập tức. Phải có giai đoạn phân tích, xác minh hành vi và tạo đặc tả trước khi lập trình.

## Tổng quan quy trình

01

Inventory

Kiểm kê APK và xác định framework

02

Behavior Capture

Chơi game gốc, ghi lại hành vi

03

Reverse Engineering

Dùng REA truy vết logic

04

Asset Extraction

Trích xuất, phân loại tranh và âm thanh

05

Game Specification

Viết đặc tả dựa trên bằng chứng

06

Technical POC

Thử một tranh trên Safari iPhone

07

Implementation

Viết lại từng tính năng

08

Parity Testing

So sánh với Android gốc

09

PWA & Offline

Đóng gói và lưu dữ liệu

10

iPhone Release

Deploy, cài và kiểm thử thực tế

Ba cột mốc bắt buộc là: hoàn thành đặc tả, xác nhận công nghệ chạy tốt trên iPhone, và đạt kiểm thử tương đương trước khi phát hành bản chơi cá nhân.

## Giai đoạn A — Khôi phục hiểu biết về game gốc

### Step 1 — Inventory APK

Mục tiêu là biết chính xác APK chứa những gì, game dùng framework nào và tài nguyên nằm ở đâu.

Trên Linux, tạo workspace riêng:

```
mkdir -p drawing-rebuild/{original,reports,extracted,docs,web}
cp drawing.apk drawing-rebuild/original/
cd drawing-rebuild

sha256sum original/drawing.apk > reports/apk.sha256

unzip -Z1 original/drawing.apk > reports/files.txt

aapt dump badging original/drawing.apk \
  > reports/app-info.txt
```

Kiểm tra số file DEX, hình ảnh, âm thanh:

```
grep -Ei '\.dex$|\.png$|\.webp$|\.jpg$|\.svg$|\.mp3$|\.ogg$|\.json$' \
  reports/files.txt
```

Sau đó phân loại package của game, launcher Activity, các thư viện AndroidX và dấu hiệu framework.

Đầu ra: `reports/INVENTORY.md` — tổng hợp APK, SHA-256, công nghệ, cấu trúc và điểm chưa rõ.

### Step 2 — Quan sát hành vi game gốc

Bước này cực kỳ quan trọng vì dịch ngược code không tự động cho biết trải nghiệm thực tế.

Chạy game trên Android thật hoặc emulator, ghi hình từng luồng thao tác:

| Tình huống     | Cần quan sát                      |
| -------------- | --------------------------------- |
| Mở game        | Splash, màn hình chính, âm thanh  |
| Chọn tranh     | Danh mục, cách hiển thị thumbnail |
| Chọn màu       | Palette, màu mặc định             |
| Chạm vào tranh | Đổ màu vùng kín hay vẽ nét tự do  |
| Kéo ngón tay   | Nét liên tục, kích thước brush    |
| Tô sai         | Có undo, eraser, reset không      |
| Quay lại       | Lưu tự động hay hỏi xác nhận      |
| Mở tranh cũ    | Có khôi phục trạng thái không     |
| Tắt/mở game    | Tiến độ còn hay mất               |

Chỉ cần ghi lại các hành vi tồn tại thực sự. Không tự thêm chức năng vì nghĩ rằng game tô màu nào cũng có.

Đầu ra: video, ảnh chụp, `docs/BEHAVIOR.md`, danh sách test case.

### Step 3 — Reverse engineering bằng REA

Đây mới là lúc sử dụng `morluto/rea`.

Cài REA:

```
npx rea-agents@latest setup
```

REA yêu cầu Node.js tương thích. Để phân tích Android DEX, cần JDK 17+ và `jadx-headless-mcp` cấu hình riêng; setup REA không tự cung cấp tất cả công cụ này. Làm theo [hướng dẫn Android của REA](https://github.com/morluto/rea/blob/main/docs/android-analysis.md?utm_source=chatgpt.com).&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub



Sau khi hoàn tất, dùng:

```
rea inspect-android-package \
  "$PWD/original/drawing.apk"
```

Tiếp theo tìm các class có liên quan:

```
rea search-android-classes \
  "$PWD/original/drawing.apk" Drawing
```

Một số từ khóa để agent thử: `Canvas`, `Paint`, `Color`, `Brush`, `Touch`, `Save`, `Activity`, `View`.

Khi tìm được class có thật, tiếp tục dùng `inspect-android-class`, `inspect-android-method` và `trace-android-references` để truy logic.

Đừng để AI chỉ đọc tên class rồi đoán. Yêu cầu nó trả về class/method cụ thể, vai trò, bằng chứng và những phần chưa xác minh.

Cũng cần lưu ý: APK có thể bị R8/ProGuard đổi tên class. Không tìm thấy `Drawing` không có nghĩa logic vẽ không tồn tại.

Đầu ra: `docs/REVERSE_ENGINEERING.md`, gồm bản đồ logic và nguồn bằng chứng.

### Step 4 — Trích xuất và phân loại assets

Trước hết dùng Apktool để lấy tài nguyên đã giải mã:

```
apktool d -s \
  original/drawing.apk \
  -o extracted/apktool
```

Hoặc sử dụng lệnh REA `decode-android-resources` để phân tích resource table, manifest và strings. Công cụ này không thay thế hoàn toàn việc trích xuất các file hình ảnh.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub



Phân loại thành tranh mẫu, thumbnail, icon, nền giao diện, âm thanh và dữ liệu cấu hình.

Với game tô màu, cần xác định tranh được lưu theo kiểu:

- SVG/vector hoặc đường vẽ được dựng từ code.
- PNG/WebP chứa các đường viền.
- Nhiều vùng riêng biệt với thông tin màu.
- Một bitmap duy nhất có vùng kín để flood fill.

Đây là yếu tố quyết định cách xây dựng lại công cụ tô màu. Nếu tranh đã có các vùng vector độc lập, chỉ cần đổi màu vùng. Nếu là ảnh raster, cần xác định vùng bằng thuật toán tô màu.

Đầu ra: `docs/ASSET_MANIFEST.md`, có ID, tên, loại, kích thước, công dụng và vị trí file. Chỉ dùng lại assets khi bạn có quyền sử dụng.

### Step 5 — Viết Game Specification

Tổng hợp kết quả của bốn bước trước thành `docs/GAME_SPEC.md`.

Tài liệu phải chỉ rõ luồng màn hình, thao tác, quy tắc tô màu, logic lưu và các trường hợp ngoại lệ.

Ví dụ:

```
Feature: Fill Color

Trigger:
  User taps a coloring region.

Preconditions:
  Picture is loaded.
  A color is selected.

Behavior:
  Fill the selected region.

Undo:
  To be determined from original behavior.

Persistence:
  To be determined from original behavior.

Evidence:
  Android recording + traced methods.

Status:
  Partially verified.
```

Mọi yêu cầu được chia thành ba trạng thái: `VERIFIED`, `INFERRED` và `UNKNOWN`.

Chỉ khi các chức năng cốt lõi đã được xác minh đủ để triển khai, mới chuyển sang bước viết lại. Không nhất thiết hiểu toàn bộ thư viện quảng cáo, analytics hay mã Uptodown nếu chúng không ảnh hưởng đến gameplay.

## Giai đoạn B — Xây dựng lại bằng Web Stack

### Step 6 — Proof of Concept trên iPhone 12 Pro

Không xây dựng toàn bộ game ngay. Chỉ làm một màn tô màu hoàn chỉnh với một bức tranh.

Chốt stack:

| Thành phần     | Công nghệ          |
| -------------- | ------------------ |
| UI             | React + TypeScript |
| Drawing        | Canvas 2D API      |
| Touch          | Pointer Events     |
| Lưu trạng thái | IndexedDB (`idb`)  |
| Offline        | `vite-plugin-pwa`  |
| Build          | Vite               |

Khởi tạo:

```
cd web
npm create vite@latest . -- --template react-ts

npm install
npm install idb
npm install -D vite-plugin-pwa

npm run dev
```

POC phải kiểm tra được các thao tác thực sự có trong game gốc, tối thiểu là chọn màu, tô bằng ngón tay và hiển thị tranh chính xác.

Đối với iPhone, cần xử lý `devicePixelRatio` để nét không bị mờ, chuyển đổi tọa độ chạm đúng theo canvas, và đặt `touch-action: none` trên vùng vẽ để tránh Safari cuộn trang khi đang tô. Pointer Events là giải pháp chuẩn cho input chạm hoặc chuột trên Canvas.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://developer.mozilla.org\&sz=32)

MDN



Đưa POC lên URL HTTPS để thử bằng Safari trên iPhone thật. Chưa cần làm chức năng PWA offline hoàn chỉnh ở bước này.

Điều kiện qua bước 6: một tranh tô hoạt động mượt, không lệch tọa độ, không cuộn màn hình ngoài ý muốn và không mất nét khi kéo ngón tay.

### Step 7 — Implement toàn bộ game

Khi POC đạt yêu cầu, mở rộng theo từng chức năng.

Mình đề xuất kiến trúc:

```
web/src/
├── screens/
│   ├── HomeScreen.tsx
│   ├── GalleryScreen.tsx
│   └── DrawingScreen.tsx
├── engine/
│   ├── CanvasRenderer.ts
│   ├── BrushEngine.ts
│   ├── FillEngine.ts
│   ├── InputController.ts
│   └── HistoryManager.ts
├── data/
│   ├── pictureCatalog.ts
│   └── drawingRepository.ts
├── components/
│   ├── ColorPalette.tsx
│   └── DrawingToolbar.tsx
└── assets/
    └── pictures/
```

Nên triển khai theo thứ tự: hiển thị danh sách tranh → mở tranh → chọn màu → tô màu → các chức năng có trong game gốc như xóa/undo → lưu và mở lại tranh → âm thanh và hiệu ứng.

Một quyết định kiến trúc quan trọng: không lưu tất cả tranh đang tô thành hình PNG sau mỗi thao tác.

Nếu tranh có các vùng tô riêng, hãy lưu màu theo `regionId`. Nếu dùng nét vẽ tự do, lưu danh sách stroke hoặc trạng thái raster phù hợp. Chỉ xuất PNG khi cần lưu ảnh thành phẩm.

Cách này giảm dung lượng lưu và giúp khôi phục tranh dễ dàng hơn.

### Step 8 — Parity Testing: so sánh với game Android

Đây là giai đoạn xác minh bản viết lại có giống game gốc hay không, không chỉ là kiểm tra ứng dụng có chạy được.

| Test            | Điều kiện đạt                     |
| --------------- | --------------------------------- |
| Chọn tranh      | Mở đúng hình                      |
| Chạm tô màu     | Tô đúng vùng hoặc nét             |
| Kéo ngón tay    | Không đứt nét bất thường          |
| Đổi màu         | Áp dụng đúng màu đã chọn          |
| Undo/Reset      | Hoạt động giống bản gốc           |
| Chuyển tranh    | Không mất trạng thái ngoài ý muốn |
| Tắt/mở ứng dụng | Khôi phục tranh đã lưu            |
| Nút quay lại    | Đúng hành vi đã ghi nhận          |
| Giao diện       | Không che mất các nút quan trọng  |

Với game cho trẻ nhỏ, nên kiểm tra thêm thao tác chạm liên tục, nhiều ngón tay, bấm nhanh các nút và thoát giữa lúc đang tô.

Khi có khác biệt, xác định đó là bug của bản web hay một hành vi gốc chưa được hiểu đầy đủ. Cập nhật `GAME_SPEC.md` trước khi sửa.

## Giai đoạn C — Đưa lên iPhone

### Step 9 — Đóng gói PWA, offline và lưu tranh

Cấu hình `vite-plugin-pwa` để sinh manifest và Service Worker, với biểu tượng, tên game và `display: standalone`. Plugin hỗ trợ sinh những thành phần PWA này từ cấu hình Vite.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub



Vì bạn có thể có hàng trăm hình mẫu, nên:

- Cache app shell, JS, CSS và tài nguyên thiết yếu.
- Tải tranh theo nhu cầu, tránh khởi tạo toàn bộ cùng lúc.
- Cho phép tải trước toàn bộ thư viện tranh nếu muốn chơi hoàn toàn offline.
- Lưu tiến độ tô trong IndexedDB.
- Có chức năng xuất tranh/backup vì dữ liệu lưu trong trình duyệt vẫn có nguy cơ bị xóa hoặc thu hồi.

Kiểm thử bắt buộc: mở game online một lần, bật Airplane Mode, mở lại game từ màn hình chính, chọn tranh đã tải và tô tiếp. Phải bảo đảm game không phụ thuộc vào API Android, backend không cần thiết hoặc tài nguyên trực tuyến chưa được cache.

### Step 10 — Deploy và cài lên iPhone

Build:

```
npm run build
```

Deploy thư mục `dist/` lên Cloudflare Pages hoặc nền tảng static hosting hỗ trợ HTTPS.

Trên iPhone 12 Pro, mở URL bằng Safari, chọn Share → Add to Home Screen, bật Open as Web App nếu tùy chọn xuất hiện, sau đó thêm vào màn hình chính.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://support.apple.com\&sz=32)

Apple Support



Cuối cùng, kiểm thử ở chế độ standalone và offline, không chỉ trong tab Safari. Sau khi ổn định, bản chơi cá nhân không cần App Store, MacBook hay jailbreak.

## Cách điều phối AI Agent đúng quy trình

Mình khuyên dùng một agent chính (Codex hoặc Claude Code) kết nối REA qua MCP, làm tuần tự theo từng phase, thay vì giao một prompt yêu cầu phục dựng toàn bộ game.

Đây là prompt đầu tiên bạn có thể đưa cho agent:

Prompt 01 — APK Reconnaissance

&#x20;Copy

Dùng sau khi cài REA/JADX và đặt APK vào `original/drawing.apk`.

```
You are reverse-engineering an Android coloring game
for an authorized private web reimplementation.

Target: ./original/drawing.apk
Platform: iPhone 12 Pro Safari/PWA
Stack: React + TypeScript + Canvas 2D

PHASE 1 ONLY — Do not implement application code.

Analyze the APK using REA:
- Identify the launcher and app architecture.
- Trace drawing, coloring, touch and persistence logic.
- Identify asset formats and location.
- Separate relevant gameplay code from SDK code.
- Cite evidence for technical conclusions.
- Mark findings VERIFIED, INFERRED or UNKNOWN.

Write:
- docs/INVENTORY.md
- docs/REVERSE_ENGINEERING.md
- docs/OPEN_QUESTIONS.md

Do not guess missing behavior.
Do not modify the original APK.
Stop after reporting the findings.
```

Sau đó mới giao prompt cho Phase 2 (Behavior + Assets), Phase 3 (Specification), Phase 4 (POC) và Phase 5 (Implementation + Tests).

Khuyến nghị bắt đầu: hoàn thành Step 1–3 trước, rồi gửi bản `INVENTORY.md` và `REVERSE_ENGINEERING.md` để kiểm tra xem agent đã tìm đúng logic tô màu chưa. Đây là điểm quyết định cách phục dựng phần quan trọng nhất của trò chơi.
