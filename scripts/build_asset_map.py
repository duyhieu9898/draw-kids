#!/usr/bin/env python3
"""Build a complete picture/frame index from the extracted APK asset catalog."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "extracted/atlas-frames"
CATALOG = DATA / "catalog.json"
PACKS = {
    1: "Animals",
    2: "People / princesses",
    3: "School",
    4: "Music",
    5: "Vehicles",
    6: "Food",
    7: "Halloween",
    8: "Christmas",
}


def main() -> None:
    source = json.loads(CATALOG.read_text(encoding="utf-8"))
    rows = []
    for atlas in source["atlases"]:
        folder = DATA / f"pack{atlas['pack']}" / f"image-{atlas['imageId']}"
        data = json.loads((folder / "frames.json").read_text(encoding="utf-8"))
        regions = []
        for index, frame in enumerate(data["frames"]):
            regions.append({
                "frameIndex": index + 1,
                "regionId": (index - 1) if index else None,
                "hitTestEnabled": index > 0,
                "role": "interactive-mask" if index else "inverse-base-mask",
                "frame": frame["name"],
                "mask": str((folder / frame["region"]).relative_to(ROOT)),
                "bounds": frame["regionBounds"],
                "spriteOffset": frame["spriteOffset"],
                "spriteSize": frame["spriteSize"],
                "spriteSourceSize": frame["spriteSourceSize"],
                "textureRect": frame["textureRect"],
                "vertices": frame["vertices"],
                "verticesUV": frame["verticesUV"],
                "triangles": frame["triangles"],
            })
        rows.append({
            "id": f"{atlas['pack']}-{atlas['imageId'].split('-')[1]}",
            "pack": atlas["pack"],
            "packLabel": PACKS[atlas["pack"]],
            "pictureNumber": int(atlas["imageId"].split("-")[1]),
            "outline": str((folder / "outline.png").relative_to(ROOT)),
            "outlineSize": atlas["outlineSize"],
            "atlas": data["atlas"],
            "plist": data["plist"],
            "atlasSize": data["atlasSize"],
            "atlasSha256": data["atlasSha256"],
            "outlineSha256": data["outlineSha256"],
            "regions": regions,
        })

    rows.sort(key=lambda row: (row["pack"], row["pictureNumber"]))
    out = {
        "sourceApk": "original/kids-coloring-and-drawing-games-3-101.apk",
        "pictureCount": len(rows),
        "regionFrameCount": sum(len(row["regions"]) for row in rows),
        "packs": [{"id": n, "label": PACKS[n], "pictureCount": sum(row["pack"] == n for row in rows)} for n in PACKS],
        "pictures": rows,
    }
    out_path = DATA / "asset-map.json"
    out_path.write_text(json.dumps(out, ensure_ascii=False, indent=2), encoding="utf-8")

    lines = [
        "# Bản đồ asset của game gốc",
        "",
        "Nguồn: APK game `com.bimiboo.drawing` 3.101, không phải bộ cài Uptodown. Bản đồ được sinh bởi `scripts/build_asset_map.py` từ `catalog.json` và plist đi kèm từng atlas.",
        "",
        f"- **VERIFIED:** {out['pictureCount']} tranh, {out['regionFrameCount']} frame/mask thuộc {len(PACKS)} pack.",
        "- **VERIFIED:** Mỗi tranh ghép theo ID `pack-picture` (`image-PACK-PICTURE`): outline PNG riêng, atlas PNG và plist TexturePacker.",
        "- **VERIFIED:** Frame mask được dựng theo mesh tam giác và UV trong plist; crop chữ nhật đơn thuần không đủ vì chứa pixel ngoài mesh.",
        "- **INFERRED:** Tên pack theo chủ đề suy từ contact sheet hình outline; đây là nhãn nội bộ cho bản web, chưa xác minh bằng chuỗi UI gốc.",
        "- **UNKNOWN:** Quyền tái sử dụng/phát hành các asset chưa được xác minh. Không deploy public trước khi làm rõ quyền.",
        "",
        "## Nhóm và toàn bộ tranh",
        "",
        "| Pack | Chủ đề suy từ hình | ID tranh | Outline | Atlas / plist | Số frame vùng |",
        "| --- | --- | --- | --- | --- | ---: |",
    ]
    for row in rows:
        lines.append(
            f"| {row['pack']} | {row['packLabel']} | {row['id']} | `{row['outline']}` | "
            f"`{row['atlas']}` / `{row['plist']}` | {len(row['regions'])} |"
        )
    lines += [
        "",
        "## Dữ liệu chi tiết và cách tái tạo",
        "",
        "`extracted/atlas-frames/asset-map.json` là catalog máy đọc đầy đủ: từng tranh có kích thước/hash, outline, atlas, plist, và từng region có frame ID, `textureRect`, `spriteOffset`, `spriteSize`, `spriteSourceSize`, `vertices`, `verticesUV`, `triangles`, bounding box và đường dẫn mask PNG đã raster hóa.",
        "",
        "Mỗi ảnh `*-region.png` chỉ giữ alpha của mesh tương ứng, sau khi ánh xạ UV về tọa độ tranh. Để vẽ: tô màu qua alpha mask theo `regionId`, xếp lớp theo danh sách frame, rồi vẽ outline PNG ở trên cùng. `regionId` ổn định theo thứ tự frame trong plist; không đổi thứ tự khi cần khôi phục màu đã lưu.",
        "",
        "Tái tạo các file đã trích từ APK:",
        "",
        "```sh",
        "python3 scripts/extract_atlas_frames.py",
        "python3 scripts/build_asset_map.py",
        "```",
        "",
        "Mỗi `contact-sheet.jpg` là chỉ mục thị giác của các frame atlas; `packN-outlines.jpg` là chỉ mục thị giác của 16 tranh trong pack N.",
        "",
    ]
    (ROOT / "docs/ASSET_MAP.md").write_text("\n".join(lines), encoding="utf-8")
    print(f"Mapped {len(rows)} pictures and {out['regionFrameCount']} region masks")


if __name__ == "__main__":
    main()
