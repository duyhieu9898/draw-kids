#!/usr/bin/env python3
"""Generate 264px WebP gallery thumbnails next to each picture outline.

The gallery used the full 775px outline PNG as a 264px thumbnail, which cost
2.4 MB of decoded memory per card. The drawing screen keeps using outline.png.

Usage: python3 scripts/build_gallery_thumbs.py
"""

import re
import sys
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent / "web" / "public" / "art"
SIZE = 264
PACK_PATTERN = re.compile(r"^pack\d+$")


def build_thumb(outline: Path) -> tuple[int, int]:
    target = outline.with_name("thumb.webp")
    with Image.open(outline) as source:
        image = source.convert("RGBA")
        scale = min(SIZE / image.width, SIZE / image.height, 1.0)
        if scale < 1.0:
            image = image.resize(
                (max(1, round(image.width * scale)), max(1, round(image.height * scale))),
                Image.LANCZOS,
            )
        image.save(target, "WEBP", quality=88, method=6)
    return outline.stat().st_size, target.stat().st_size


def main() -> int:
    if not ROOT.is_dir():
        print(f"art directory not found: {ROOT}", file=sys.stderr)
        return 1

    written = 0
    source_bytes = 0
    thumb_bytes = 0
    for pack_dir in sorted(ROOT.iterdir()):
        if not pack_dir.is_dir() or not PACK_PATTERN.match(pack_dir.name):
            continue
        for picture_dir in sorted(pack_dir.iterdir()):
            if not picture_dir.is_dir():
                continue
            outline = picture_dir / "outline.png"
            if not outline.is_file():
                continue
            before, after = build_thumb(outline)
            written += 1
            source_bytes += before
            thumb_bytes += after

    print(f"thumbnails: {written}")
    print(f"outline bytes: {source_bytes / 1024:.0f} KB")
    print(f"thumb bytes:   {thumb_bytes / 1024:.0f} KB")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
