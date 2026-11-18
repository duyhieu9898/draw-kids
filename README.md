# Draw Kids

Ứng dụng tô màu cho trẻ em trên iOS và Android, viết bằng React Native (Expo Router + Skia), tái hiện game gốc phiên bản 3.141.

## Trong repo

- `native/` — toàn bộ ứng dụng: menu 12 chủ đề, thư viện tranh, màn tô màu, intro, âm thanh và lưu bài vẽ.
- `docs/` — kế hoạch, trạng thái và ghi chú đối soát với bản gốc.

## Chạy

```sh
cd native
npm ci
npm start
```

Kiểm tra: `npm run typecheck`, `npm run lint`, `npm test`.

Kiến trúc, dữ liệu tranh và cách thêm tranh mới: [native/README.md](native/README.md).

## Cài trên iPhone

Workflow `iOS unsigned IPA` build bản `.ipa` chưa ký trên macOS runner của GitHub Actions. Đẩy một tag `ios-*` để chạy:

```sh
git tag ios-1.0.0
git push origin ios-1.0.0
```

Tải artifact `ios-unsigned-ipa`, rồi ký bằng Apple ID free (iLoader, SideStore, Sideloadly) để cài lên máy. Bản ký free hết hạn sau 7 ngày và cần cài lại; TestFlight/App Store cần Apple Developer Program.

## Tài liệu

- [Bàn giao native](docs/NATIVE_HANDOFF.md)
- [Kế hoạch chuyển đổi](docs/REACT_NATIVE_MIGRATION_PLAN.md)
- [Đối soát hành vi](docs/NATIVE_BEHAVIOR_TRACKER.md)
- [Dữ liệu 12 chủ đề](docs/THEME_DATA_GAP.md)
