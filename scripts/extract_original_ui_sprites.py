#!/usr/bin/env python3
"""Crop the shipped Cocos UI atlas frames without redrawing them."""
from __future__ import annotations

import plistlib
import re
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "extracted/original-assets/res"
OUT = ROOT / "web/public/game-assets/ui/sprites"
ATLAS_NAMES = ("main_shelf", "popup_tools", "popup_palette", "gallery_icons1", "gallery_icons2")


def tuple_from(value: str) -> tuple[int, int]:
    nums = [int(n) for n in re.findall(r"-?\d+", value)]
    return nums[0], nums[1]


def rect_from(value: str) -> tuple[int, int, int, int]:
    nums = [int(n) for n in re.findall(r"-?\d+", value)]
    return nums[0], nums[1], nums[2], nums[3]


def main() -> None:
    count = 0
    for atlas_name in ATLAS_NAMES:
        metadata = plistlib.loads((SOURCE / f"{atlas_name}.plist").read_bytes())
        atlas = Image.open(SOURCE / f"{atlas_name}.png").convert("RGBA")
        for frame_name, frame in metadata["frames"].items():
            x, y, width, height = rect_from(frame["textureRect"])
            sprite = atlas.crop((x, y, x + width, y + height))
            if frame.get("textureRotated"):
                sprite = sprite.rotate(90, expand=True)
            source_width, source_height = tuple_from(frame["spriteSourceSize"])
            sprite_width, sprite_height = tuple_from(frame["spriteSize"])
            offset_x, offset_y = tuple_from(frame["spriteOffset"])
            canvas = Image.new("RGBA", (source_width, source_height))
            paste_x = (source_width - sprite_width) // 2 + offset_x
            paste_y = (source_height - sprite_height) // 2 - offset_y
            canvas.alpha_composite(sprite, (paste_x, paste_y))
            target = OUT / atlas_name / Path(frame_name).with_suffix("")
            target = target.with_suffix(".png")
            target.parent.mkdir(parents=True, exist_ok=True)
            canvas.save(target)
            count += 1
    print(f"Extracted {count} original UI sprites to {OUT}")


if __name__ == "__main__":
    main()
