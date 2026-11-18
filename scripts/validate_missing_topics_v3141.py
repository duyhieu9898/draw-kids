#!/usr/bin/env python3
"""Compare staged alpha masks with their serialized Unity polygon colliders.

This checks geometric containment, not actual runtime hit-testing. Multiple
polygon paths are rasterized with an even-odd fill. Run with UnityPy venv.
"""
import json
from pathlib import Path

import UnityPy
from PIL import Image, ImageChops, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
STAGING = ROOT / 'extracted/v3.141/missing-topics-staging'
SOURCE = ROOT / 'extracted/v3.141/base/assets/bin/Data/data.unity3d'
SIZE = 775


def pixel_count(image):
    return sum(image.histogram()[1:])


def main():
    env = UnityPy.load(str(SOURCE))
    objects = {o.path_id: o for o in env.objects if o.assets_file.name == 'resources.assets'}
    results = []
    for path in sorted(STAGING.glob('*/*/picture.json')):
        picture = json.loads(path.read_text())
        outline = objects[picture['outlineSpritePathId']].read()
        units_per_canvas = outline.m_Rect.width / outline.m_PixelsToUnits
        for region in picture['regions']:
            go = objects[region['gameObjectPathId']].read()
            colliders = [objects[p.component.m_PathID] for p in go.m_Component
                         if p.component.m_PathID in objects and objects[p.component.m_PathID].type.name == 'PolygonCollider2D']
            if len(colliders) != 1:
                raise ValueError(f'Expected one collider: {path} {region["spritePathId"]}')
            collider = colliders[0].read()
            polygon = Image.new('1', (SIZE, SIZE))
            for points in collider.m_Points.m_Paths:
                layer = Image.new('1', (SIZE, SIZE))
                vertices = [(SIZE / 2 + (v.x + collider.m_Offset.x) * SIZE / units_per_canvas,
                             SIZE / 2 - (v.y + collider.m_Offset.y) * SIZE / units_per_canvas)
                            for v in points]
                if len(vertices) >= 3:
                    ImageDraw.Draw(layer).polygon(vertices, fill=1)
                    polygon = ImageChops.logical_xor(polygon, layer)
            alpha = Image.open(path.parent / region['mask']).getchannel('A')
            binary = alpha.point(lambda value: 255 if value >= 128 else 0).convert('1')
            mask = Image.new('1', (SIZE, SIZE))
            mask.paste(binary, tuple(region['bounds'][:2]))
            intersection = pixel_count(ImageChops.logical_and(mask, polygon))
            union = pixel_count(ImageChops.logical_or(mask, polygon))
            mask_pixels = pixel_count(mask)
            if not mask_pixels:
                raise ValueError(f'No alpha >= 128: {path} {region["spritePathId"]}')
            results.append({'topic': path.parent.parent.name, 'picture': picture['pictureNumber'],
                            'spritePathId': region['spritePathId'], 'colliderPathId': colliders[0].path_id,
                            'colliderEnabled': bool(collider.m_Enabled), 'maskPixels': mask_pixels,
                            'colliderPixels': pixel_count(polygon), 'intersectionPixels': intersection,
                            'maskCoverage': intersection / mask_pixels,
                            'intersectionOverUnion': intersection / union if union else None})
    (STAGING / 'collider-validation.json').write_text(json.dumps(results, indent=2) + '\n')
    print(f'{len(results)} regions; minimum mask coverage {min(r["maskCoverage"] for r in results):.6f}')


if __name__ == '__main__':
    main()
