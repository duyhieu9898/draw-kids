#!/usr/bin/env python3
"""Prepare the APK's Spine 3.6 JSON for its matching web runtime."""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "extracted/original-assets/intro/intro.json"
TARGET = ROOT / "web/public/game-assets/intro/intro.json"


def main() -> None:
    data = json.loads(SOURCE.read_text(encoding="utf-8"))
    # Spine 3.6 Cocos resolves these two default mesh attachment names through
    # app-specific aliases; the exported atlas contains the corresponding pages.
    aliases = {
        ("head2", "head"): "head_f",
        ("mouth", "mouth"): "mouth_smile",
        ("nose", "nose"): "nose_f",
    }
    for (slot, attachment), atlas_region in aliases.items():
        data["skins"]["default"][slot][attachment]["path"] = atlas_region
    TARGET.write_text(json.dumps(data, separators=(",", ":")), encoding="utf-8")
    print(f"Prepared Spine JSON with {len(aliases)} atlas aliases: {TARGET}")


if __name__ == "__main__":
    main()
