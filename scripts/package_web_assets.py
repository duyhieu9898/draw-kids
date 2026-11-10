#!/usr/bin/env python3
"""Copy selected source-derived picture masks into the Vite public asset tree."""
import argparse
import json
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAP = ROOT / "extracted/atlas-frames/asset-map.json"
DEST = ROOT / "web/public/art"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("pictures", nargs="+", help="picture IDs like 1-3; supports all")
    args = parser.parse_args()
    catalog = json.loads(MAP.read_text(encoding="utf-8"))
    selected = catalog["pictures"] if "all" in args.pictures else [p for p in catalog["pictures"] if p["id"] in args.pictures]
    missing = set(args.pictures) - {p["id"] for p in selected} - {"all"}
    if missing:
        parser.error("unknown picture ID(s): " + ", ".join(sorted(missing)))
    for picture in selected:
        target = DEST / f"pack{picture['pack']}" / str(picture["pictureNumber"])
        target.mkdir(parents=True, exist_ok=True)
        shutil.copy2(ROOT / picture["outline"], target / "outline.png")
        regions = []
        for region in picture["regions"]:
            if not region["hitTestEnabled"]:
                continue
            filename = f"region-{region['regionId']}.png"
            shutil.copy2(ROOT / region["mask"], target / filename)
            regions.append({
                key: region[key]
                for key in ("regionId", "frameIndex", "frame", "bounds", "spriteOffset", "spriteSize", "spriteSourceSize", "textureRect")
            } | {"mask": filename})
        entry = {
            "id": picture["id"],
            "pack": picture["pack"],
            "pictureNumber": picture["pictureNumber"],
            "source": "com.bimiboo.drawing 3.101",
            "outline": "outline.png",
            "logicalSize": [775, 775],
            "regions": regions,
        }
        (target / "picture.json").write_text(json.dumps(entry, indent=2), encoding="utf-8")
        print(f"Packaged {picture['id']}: {len(regions)} interactive masks -> {target.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
