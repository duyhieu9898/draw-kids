#!/usr/bin/env python3
"""Reconstruct numbered Unity 3.141 sprites into candidate canvas assets.

Run with the project's UnityPy/Pillow venv; --assets points to a selectively
extracted resources.assets with resources.assets.resS beside it. Output is
staging only: numeric groups are not yet verified topic IDs.
"""
import argparse
import json
from pathlib import Path
import UnityPy
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SIZE = 775

def full_sprite(data):
    rect = data.m_Rect
    texture = data.m_RD.textureRect
    offset = data.m_RD.textureRectOffset
    frame = Image.new('RGBA', (round(rect.width), round(rect.height)))
    frame.paste(data.image.convert('RGBA'), (round(offset.x), round(rect.height) - round(offset.y + texture.height)))
    return frame

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--assets', required=True, type=Path)
    parser.add_argument('--group', required=True, type=int)
    parser.add_argument('--output', required=True, type=Path)
    args = parser.parse_args()
    catalog = json.loads((ROOT / 'reports/v3.141/art-candidates.json').read_text())['groups']
    groups = [x for x in catalog if x['pack_candidate'] == args.group]
    if not groups:
        parser.error('unknown asset group')
    environment = UnityPy.load(str(args.assets))
    objects = {item.path_id: item for item in environment.objects if item.assets_file.name == 'resources.assets'}
    for item in groups:
        if len(item['outlines']) != 1 or not item['regions']:
            print(f"Skipping {args.group}-{item['picture_candidate']}: missing/ambiguous outline or regions")
            continue
        outline = objects[item['outlines'][0]['path_id']].read()
        if outline.m_Rect.width != outline.m_Rect.height:
            raise ValueError('Non-square outline needs separate layout analysis')
        target = args.output / f"group{args.group}" / str(item['picture_candidate'])
        target.mkdir(parents=True, exist_ok=True)
        full_sprite(outline).resize((SIZE, SIZE), Image.Resampling.LANCZOS).save(target / 'outline.png')
        regions = []
        for ref in sorted(item['regions'], key=lambda x: x['region_candidate']):
            data = objects[ref['path_id']].read()
            # Unity uses world units (sprite pixels / PPU); the outline determines
            # the world width represented by the square web drawing canvas.
            factor = SIZE / (outline.m_Rect.width / outline.m_PixelsToUnits * data.m_PixelsToUnits)
            source = full_sprite(data).getchannel('A')
            source = source.resize((round(source.width * factor), round(source.height * factor)), Image.Resampling.LANCZOS)
            canvas = Image.new('L', (SIZE, SIZE))
            canvas.paste(source, ((SIZE - source.width) // 2, (SIZE - source.height) // 2))
            bounds = canvas.getbbox()
            if bounds is None:
                continue
            left, top, right, bottom = bounds
            region_id = ref['region_candidate']
            name = f'region-{region_id}.png'
            mask = Image.new('RGBA', (right - left, bottom - top), 'white')
            mask.putalpha(canvas.crop(bounds))
            mask.save(target / name)
            regions.append({'regionId': region_id, 'frameIndex': region_id, 'frame': ref['name'], 'bounds': [left, top, right - left, bottom - top], 'mask': name})
        manifest = {'id': f"candidate-{args.group}-{item['picture_candidate']}", 'assetGroup': args.group, 'pictureNumber': item['picture_candidate'], 'source': 'com.bimiboo.drawing 3.141', 'outline': 'outline.png', 'logicalSize': [SIZE, SIZE], 'regions': regions}
        (target / 'picture.json').write_text(json.dumps(manifest, indent=2) + '\n')
        print(f"Staged {args.group}-{item['picture_candidate']}: {len(regions)} regions")

if __name__ == '__main__':
    main()
