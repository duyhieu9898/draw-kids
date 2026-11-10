# Phân tích tĩnh và đối chiếu runtime

## VERIFIED — định danh và kiến trúc

REA/JADX đã kiểm tra cả bộ cài lẫn game. Evidence game: `ev_40382244054b46b72db90935279274bf386737033b317ea242f9108e4bdc7e6b` (`reports/game/package-evidence.json`). Launcher `org.cocos2dx.cpp.AppActivity`, engine Cocos2d-x. Logic native phải được khảo sát ngoài DEX.

Bộ cài `com.uptodown.activities.MainActivity.onCreate` đã decompile tại `reverse-engineering/drawing-apk/MainActivity.onCreate.java`; đó là giao diện trình tải, không phải công cụ vẽ. Kết luận cũ chưa quan sát gameplay đã được thay thế bằng BEHAVIOR.md.

## VERIFIED — symbol native, chưa phải thuật toán đã truy vết

Nguồn: `extracted/game/lib/x86/libMyGame.so`, bảng `nm -D -C` tại `reports/game/native-symbols.txt`. Địa chỉ dưới đây thuộc bản x86 của APK game đã ghi hash trong INVENTORY.md.

| Nhóm | Symbol / địa chỉ |
| --- | --- |
| Input | DrawScene::onTouchBegan 0x23adf0; onTouchMoved 0x23aff0; onTouchEnded 0x23b060; onTouchCancelled 0x23b0f0 |
| Chọn vùng | getTouchedSprite 0x236d10; tapsOnNonTransparent 0x236be0 |
| Tô | fillImage 0x238650; startDraw 0x238c70; continueDraw 0x239900; stopDraw 0x23a640 |
| Nét | startDrawMarker 0x238d90; startDrawPencil 0x239010; startDrawBrush 0x239290; startDrawSpray 0x239510 |
| Undo / xóa | undoButtonPressed 0x236370; clearButtonPressed 0x2364f0; clearAll 0x23acb0; canUndo 0x236640 |
| Lưu / xuất | saveButtonPressed 0x2347c0; makeScreenshot 0x234e00; screenshotButtonPressed 0x2356c0 |
| Tên file | ImageFileManager::getMainImageNameForSave 0x240880; getMainImageNameForRead 0x2408c0 |
| Mask | drawWhiteMask 0x236db0; prepareCanvasToDraw 0x237170 |

`reports/game/clear-button.asm` là disassembly giới hạn đúng hàm clearButtonPressed. Có vòng lặp, lời gọi gián tiếp qua vtable và lời gọi ToolsLayer::setUndoButtonEnabled. Chưa giải được kiểu đối tượng và đích vtable, vì vậy không kết luận phạm vi xóa từ đoạn assembly này.

## VERIFIED — định dạng tài nguyên

`assets/res/pack1/image-1-3.plist` là TexturePacker format 3, metadata atlas 779×1289, 9 frames. Frame có textureRect, textureRotated, spriteOffset, spriteSourceSize và dữ liệu triangles/vertices/verticesUV. Đây là metadata sprite/mesh; chưa chứng minh mỗi frame tương ứng một vùng tô tương tác.

## INFERRED

Sprite atlas cùng symbol chọn pixel không trong suốt và mask gợi ý game tô theo vùng sprite. Cần đối chiếu hit-test/render trước khi quyết định dựng vùng hoặc flood-fill trong bản web. Không gọi đây là thuật toán flood-fill đã xác minh.

## UNKNOWN / bước truy vết tiếp

1. getTouchedSprite → tapsOnNonTransparent: chọn vùng, thứ tự lớp, alpha threshold.
2. onTouchBegan/Move/End → fillImage/startDraw: clipping và kết thúc một hành động.
3. undoButtonPressed/clearButtonPressed: lịch sử, nền đã lưu và phạm vi reset.
4. saveButtonPressed → ImageFileManager: thời điểm ghi, định dạng file, quan hệ thumbnail.

Bằng chứng runtime B03–B13 xác minh đầu ra một số thao tác, không tự chứng minh call graph hoặc thuật toán nội bộ. Step 3 còn một phần chưa hoàn tất.

## VERIFIED — truy vết hit-test bằng assembly

Bổ sung `reports/game/hit-test.asm` (objdump, khoảng 0x236be0–0x236db0):

- `getTouchedSprite` nhân tọa độ vào với một hệ số, duyệt danh sách image theo chỉ số tăng dần, gọi `tapsOnNonTransparent`; trả chỉ số đầu tiên có kết quả true. Hết danh sách không khớp trả 0. Ý nghĩa sprite 0 còn UNKNOWN.
- Tại 0x236cb2–0x236ccb, `tapsOnNonTransparent` kiểm tra lần lượt bốn byte của pixel, true nếu ít nhất một byte khác 0. Không phải chỉ kiểm tra byte alpha. Cần xác minh định dạng pixel và điều kiện đầu vào trước khi chuyển nguyên thuật toán sang web.
- Đây là bằng chứng tĩnh cho quan hệ gọi và phép kiểm tra byte; chưa xác minh danh sách image được dựng từ những atlas frame nào, cũng chưa chứng minh cách clipping nét.
