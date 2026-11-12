#!/usr/bin/env python3
"""Index 3.141 sprite-name candidates without inventing product bindings."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]
candidates = json.loads((ROOT / 'reports/v3.141/art-candidates.json').read_text())['groups']
menu = json.loads((ROOT / 'web/public/v3.141/menu/menu.json').read_text())
output = {
    'source': 'Unity 3.141 resource Sprite names and serialized MainMenuPack product values',
    'limitations': [
        'A numeric image prefix is a candidate asset group, not a proven ProductTypes binding.',
        'Matching filenames do not establish runtime item ordering, transforms, unlock state, or whether all artwork was extracted.',
    ],
    'menu_products': [{'product': p['product'], 'name': p['name'], 'web_topic_id': p['product'] + 1} for p in menu['packs']],
    'groups': [],
}
for pack in sorted({g['pack_candidate'] for g in candidates}):
    rows = [g for g in candidates if g['pack_candidate'] == pack]
    output['groups'].append({
        'asset_group': pack,
        'topic_binding': None,
        'pictures': [{
            'number': row['picture_candidate'],
            'outline': [{'file': x['file'], 'path_id': x['path_id']} for x in row['outlines']],
            'preview': [{'file': x['file'], 'path_id': x['path_id']} for x in row['previews']],
            'regions': sorted([{'number': x['region_candidate'], 'file': x['file'], 'path_id': x['path_id']} for x in row['regions']], key=lambda x: x['number']),
        } for row in rows],
    })
out = ROOT / 'reports/v3.141/gallery-art-mapping.json'
out.write_text(json.dumps(output, ensure_ascii=False, indent=2) + '\n')
print(f"Wrote {len(output['menu_products'])} menu products and {sum(len(g['pictures']) for g in output['groups'])} picture candidates to {out.relative_to(ROOT)}")
