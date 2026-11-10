#!/usr/bin/env python3
"""Save bounded objdump listings for the game's symbolized coloring pipeline."""
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LIB = ROOT / "extracted/game/lib/x86/libMyGame.so"
OUT = ROOT / "reports/game/core-logic.asm"
FUNCTIONS = [
    "DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)",
    "DrawScene::onTouchMoved(cocos2d::Touch*, cocos2d::Event*)",
    "DrawScene::onTouchEnded(cocos2d::Touch*, cocos2d::Event*)",
    "DrawScene::onTouchCancelled(cocos2d::Touch*, cocos2d::Event*)",
    "DrawScene::getTouchedSprite(cocos2d::Vec2)",
    "DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)",
    "DrawScene::fillImage(int, cocos2d::Touch*)",
    "DrawScene::startDraw(int, cocos2d::Touch*)",
    "DrawScene::startDrawMarker(int, cocos2d::Touch*)",
    "DrawScene::continueDraw(cocos2d::Touch*)",
    "DrawScene::continueDrawMarker(cocos2d::Touch*)",
    "DrawScene::stopDraw(cocos2d::Touch*)",
    "DrawScene::completeDraw()",
    "DrawScene::undoButtonPressed()",
    "DrawScene::clearButtonPressed()",
    "DrawScene::clearAll()",
    "DrawScene::saveButtonPressed()",
    "DrawScene::makeScreenshot()",
    "ImageFileManager::getMainImageNameForSave(int, int)",
    "ImageFileManager::getMainImageNameForRead(int, int)",
]


def main() -> None:
    pieces = []
    for function in FUNCTIONS:
        result = subprocess.run(
            ["objdump", "-dC", f"--disassemble={function}", str(LIB)],
            check=True, capture_output=True, text=True,
        )
        section = result.stdout[result.stdout.find("Disassembly of section .text:"):]
        lines = section.splitlines()
        body = [line for line in lines if line.strip() and not line.startswith("extracted/")]
        if not any("<" + function in line for line in body):
            raise RuntimeError(f"objdump did not find {function}")
        pieces.append("\n".join(body))
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n\n".join(pieces) + "\n", encoding="utf-8")
    print(f"Wrote {len(FUNCTIONS)} symbolized native functions to {OUT}")


if __name__ == "__main__":
    main()
