#!/usr/bin/env python3
"""Stage original outlines and paint regions using serialized Unity references.

Output is research data, not a verified runtime topic binding. Run with the
project's UnityPy venv. Numeric IDs refer to resources.assets in 3.141 only.
"""
import json
from pathlib import Path

import UnityPy
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extracted/v3.141/base/assets/bin/Data/data.unity3d'
OUTPUT = ROOT / 'extracted/v3.141/missing-topics-staging'
SIZE = 775
MAGIC = {12747, 12750, 12754, 12755, 12756, 12758, 12759, 12761,
         12764, 12765, 12768, 12769, 12771, 12772, 12775, 12776}
OCEAN = set(range(12745, 12778)) - MAGIC - {12766}
INSECTS = set(range(12993, 13009))
DINOSAURS = {13191, 13594, 13758, 14562, 14607, 14655, 14781, 14801,
             14811, 14841, 14875, 15155, 15247, 15258, 15319, 15388}
GROUPS = {'magic': MAGIC, 'ocean': OCEAN, 'insects': INSECTS, 'dinosaurs': DINOSAURS}


def full_sprite(sprite):
    rect, tex, offset = sprite.m_Rect, sprite.m_RD.textureRect, sprite.m_RD.textureRectOffset
    frame = Image.new('RGBA', (round(rect.width), round(rect.height)))
    frame.paste(sprite.image.convert('RGBA'),
                (round(offset.x), round(rect.height - offset.y - tex.height)))
    return frame


def main():
    env = UnityPy.load(str(SOURCE))
    objects = {o.path_id: o for o in env.objects if o.assets_file.name == 'resources.assets'}

    def component(go, kind):
        found = [objects[p.component.m_PathID] for p in go.m_Component
                 if p.component.m_PathID in objects and objects[p.component.m_PathID].type.name == kind]
        if len(found) != 1:
            raise ValueError(f'Expected one {kind} on {go.m_Name}; found {len(found)}')
        return found[0].read()

    report = []
    for topic, roots in GROUPS.items():
        for root_id in sorted(roots):
            root = objects[root_id].read()
            go = objects[root.m_GameObject.m_PathID].read()
            number = int(go.m_Name) + 1
            outline_id = component(go, 'SpriteRenderer').m_Sprite.m_PathID
            outline = objects[outline_id].read()
            target = OUTPUT / topic / str(number)
            target.mkdir(parents=True, exist_ok=True)
            full_sprite(outline).resize((SIZE, SIZE), Image.Resampling.LANCZOS).save(target / 'outline.png')
            regions, empty_regions, inactive_regions = [], [], []
            for index, pointer in enumerate(root.m_Children):
                child = objects[pointer.m_PathID].read()
                pos, scale, rot = child.m_LocalPosition, child.m_LocalScale, child.m_LocalRotation
                if any(abs(x) > 1e-5 for x in (pos.x, pos.y, pos.z, rot.x, rot.y, rot.z)) or any(abs(x - 1) > 1e-5 for x in (scale.x, scale.y, scale.z, abs(rot.w))):
                    raise ValueError(f'Unaccounted child transform: {topic}/{number}/{pointer.m_PathID}')
                child_go = objects[child.m_GameObject.m_PathID].read()
                sprite_id = component(child_go, 'SpriteRenderer').m_Sprite.m_PathID
                sprite = objects[sprite_id].read()
                if not child_go.m_IsActive:
                    inactive_regions.append({'spritePathId': sprite_id, 'name': sprite.m_Name,
                                             'gameObjectPathId': child.m_GameObject.m_PathID,
                                             'sourceAlphaExtrema': list(sprite.image.getchannel('A').getextrema())})
                    print('Inactive source object:', topic, number, sprite_id, flush=True)
                    continue
                factor = SIZE / ((outline.m_Rect.width / outline.m_PixelsToUnits) * sprite.m_PixelsToUnits)
                alpha = full_sprite(sprite).getchannel('A')
                alpha = alpha.resize((round(alpha.width * factor), round(alpha.height * factor)), Image.Resampling.LANCZOS)
                canvas = Image.new('L', (SIZE, SIZE))
                canvas.paste(alpha, ((SIZE - alpha.width) // 2, (SIZE - alpha.height) // 2))
                bounds = canvas.getbbox()
                if not bounds:
                    empty_regions.append({'spritePathId': sprite_id, 'name': sprite.m_Name,
                                          'gameObjectPathId': child.m_GameObject.m_PathID})
                    print('Empty source mask:', topic, number, sprite_id, flush=True)
                    continue
                left, top, right, bottom = bounds
                mask = Image.new('RGBA', (right - left, bottom - top), 'white')
                mask.putalpha(canvas.crop(bounds))
                name = f'region-{index}.png'
                mask.save(target / name)
                regions.append({'regionId': index, 'frameIndex': index, 'frame': sprite.m_Name,
                                'spritePathId': sprite_id, 'gameObjectPathId': child.m_GameObject.m_PathID,
                                'bounds': [left, top, right - left, bottom - top], 'mask': name})
            meta = {'id': f'candidate-{topic}-{number}', 'pictureNumber': number,
                    'source': 'com.bimiboo.drawing 3.141 resources.assets',
                    'rootTransformPathId': root_id, 'outlineSpritePathId': outline_id,
                    'outline': 'outline.png', 'logicalSize': [SIZE, SIZE], 'regions': regions,
                    'emptySourceRegions': empty_regions, 'inactiveSourceRegions': inactive_regions}
            (target / 'picture.json').write_text(json.dumps(meta, indent=2) + '\n')
            report.append({'topic': topic, 'picture': number, 'root': root_id,
                           'outline': outline_id, 'regions': len(regions), 'empty': empty_regions,
                           'inactive': inactive_regions})
            print(topic, number, 'regions', len(regions), flush=True)
    (OUTPUT / 'inventory.json').write_text(json.dumps(report, indent=2) + '\n')


if __name__ == '__main__':
    main()
