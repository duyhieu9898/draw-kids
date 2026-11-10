#!/usr/bin/env python3
"""Extract frame crops and metadata from the coloring game's TexturePacker atlases."""
from __future__ import annotations

import json
import hashlib
import argparse
import plistlib
import re
import zipfile
from pathlib import Path

from PIL import Image, ImageChops, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
APK = ROOT / "original/kids-coloring-and-drawing-games-3-101.apk"
OUTPUT = ROOT / "extracted/atlas-frames"
PREFIX = "assets/res/pack"


def numbers(value: str) -> list[float]:
    return [float(n) for n in re.findall(r"-?\d+(?:\.\d+)?", value)]


def pair(value: str) -> list[float]:
    nums = numbers(value)
    return nums[:2]


def rect(value: str) -> list[int]:
    nums = numbers(value)
    return [int(x) for x in nums[:4]]


def render_mesh_region(atlas: Image.Image, frame: dict, output: Path) -> list[int]:
    vertices = list(zip(frame["vertices"][0::2], frame["vertices"][1::2]))
    uv = list(zip(frame["verticesUV"][0::2], frame["verticesUV"][1::2]))
    if len(vertices) != len(uv) or len(frame["triangles"]) % 3:
        raise ValueError(f"mesh vertices and indices do not align: {frame['name']}")
    left = max(0, int(min(x for x, _ in vertices)))
    top = max(0, int(min(y for _, y in vertices)))
    right = int(max(x for x, _ in vertices) + 1)
    bottom = int(max(y for _, y in vertices) + 1)
    result = Image.new("RGBA", (right - left, bottom - top), (0, 0, 0, 0))
    if frame["textureRotated"]:
        raise ValueError(f"rotated atlas frame needs explicit rotation handling: {frame['name']}")
    rect_x, rect_y, _, _ = frame["textureRect"]
    paste_x = round(vertices[0][0] - uv[0][0] + rect_x) - left
    paste_y = round(vertices[0][1] - uv[0][1] + rect_y) - top
    crop = atlas.crop((rect_x, rect_y, rect_x + frame["textureRect"][2], rect_y + frame["textureRect"][3]))
    result.alpha_composite(crop, (paste_x, paste_y))
    mesh = Image.new("L", result.size, 0)
    draw = ImageDraw.Draw(mesh)
    for i in range(0, len(frame["triangles"]), 3):
        ids = frame["triangles"][i:i + 3]
        draw.polygon([(vertices[j][0] - left, vertices[j][1] - top) for j in ids], fill=255)
    result.putalpha(ImageChops.multiply(result.getchannel("A"), mesh))

    result.save(output, optimize=True)
    return [left, top, right - left, bottom - top]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--only", help="limit extraction to an image ID, e.g. 1-3")
    args = parser.parse_args()
    OUTPUT.mkdir(parents=True, exist_ok=True)
    all_atlases: list[dict] = []
    with zipfile.ZipFile(APK) as apk:
        plist_paths = sorted(
            p for p in apk.namelist()
            if p.startswith(PREFIX) and p.endswith(".plist")
            and re.fullmatch(r"assets/res/pack\d+/image-\d+-\d+\.plist", p)
        )
        for plist_path in plist_paths:
            stem = Path(plist_path).stem
            if args.only and stem != f"image-{args.only}":
                continue
            png_path = plist_path[:-6] + ".png"
            pack = re.search(r"pack(\d+)", plist_path).group(1)
            out_dir = OUTPUT / f"pack{pack}" / stem
            out_dir.mkdir(parents=True, exist_ok=True)
            metadata = plistlib.loads(apk.read(plist_path))
            atlas = Image.open(apk.open(png_path)).convert("RGBA")
            frames: list[dict] = []
            crops: list[tuple[str, Image.Image]] = []
            for frame_name, frame in metadata["frames"].items():
                x, y, width, height = rect(frame["textureRect"])
                crop = atlas.crop((x, y, x + width, y + height))
                crop_name = Path(frame_name).stem + ".png"
                crop.save(out_dir / crop_name, optimize=True)
                data = {
                    "name": frame_name,
                    "crop": crop_name,
                    "textureRect": [x, y, width, height],
                    "textureRotated": bool(frame["textureRotated"]),
                    "spriteOffset": pair(frame["spriteOffset"]),
                    "spriteSize": pair(frame["spriteSize"]),
                    "spriteSourceSize": pair(frame["spriteSourceSize"]),
                    "vertices": [float(n) for n in numbers(frame["vertices"])],
                    "verticesUV": [float(n) for n in numbers(frame["verticesUV"])],
                    "triangles": [int(n) for n in numbers(frame["triangles"])],
                }
                region_name = Path(frame_name).stem + "-region.png"
                data["regionBounds"] = render_mesh_region(atlas, data, out_dir / region_name)
                data["region"] = region_name
                data = {
                    **data,
                    "cropAlphaBounds": list(crop.getchannel("A").getbbox() or (0, 0, 0, 0)),
                }
                frames.append(data)
                thumb = crop.copy()
                thumb.thumbnail((220, 220))
                crops.append((frame_name, thumb))

            # Contact sheets preserve the frame IDs and are visual indexes, not art reconstruction.
            cols = 3
            cell_w, cell_h = 260, 270
            rows = (len(crops) + cols - 1) // cols
            sheet = Image.new("RGB", (cols * cell_w, rows * cell_h), "#e8e8e8")
            draw = ImageDraw.Draw(sheet)
            for index, (name, thumb) in enumerate(crops):
                left = (index % cols) * cell_w
                top = (index // cols) * cell_h
                x = left + (cell_w - thumb.width) // 2
                y = top + 8 + (220 - thumb.height) // 2
                sheet.paste(thumb, (x, y), thumb)
                draw.text((left + 8, top + 235), name, fill="#111111")
            sheet.save(out_dir / "contact-sheet.jpg", quality=90)
            outline_path = f"assets/res/pack{pack}/img-{stem.removeprefix('image-')}-outline.png"
            if outline_path in apk.namelist():
                outline_bytes = apk.read(outline_path)
                (out_dir / "outline.png").write_bytes(outline_bytes)
                outline_size = list(Image.open(out_dir / "outline.png").size)
                outline_sha256 = hashlib.sha256(outline_bytes).hexdigest()
            else:
                outline_size = None
                outline_sha256 = None
            atlas_bytes = apk.read(png_path)
            atlas_data = {
                "atlas": png_path,
                "plist": plist_path,
                "atlasSize": list(atlas.size),
                "atlasSha256": hashlib.sha256(atlas_bytes).hexdigest(),
                "outline": outline_path if outline_size else None,
                "outlineSize": outline_size,
                "outlineSha256": outline_sha256,
                "frames": frames,
                "contactSheet": str((out_dir / "contact-sheet.jpg").relative_to(ROOT)),
            }
            (out_dir / "frames.json").write_text(json.dumps(atlas_data, indent=2), encoding="utf-8")
            all_atlases.append({
                "pack": int(pack),
                "imageId": stem.removeprefix("image-"),
                "atlas": png_path,
                "plist": plist_path,
                "atlasSize": list(atlas.size),
                "outlineSize": outline_size,
                "frameCount": len(frames),
                "frameIds": [f["name"] for f in frames],
                "contactSheet": atlas_data["contactSheet"],
            })
    (OUTPUT / "catalog.json").write_text(json.dumps({"atlasCount": len(all_atlases), "atlases": all_atlases}, indent=2), encoding="utf-8")
    print(f"Extracted {len(all_atlases)} atlases into {OUTPUT}")
    print(f"Total frames: {sum(a['frameCount'] for a in all_atlases)}")


if __name__ == "__main__":
    main()
