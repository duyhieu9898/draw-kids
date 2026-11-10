"""Resolve menu scene references instead of guessing assets from filenames.

The stripped Unity UI Image/Graphic prefix is decoded only for the observed
136-byte, zero-persistent-callback layout. All pointers are resolved by UnityPy.
MainMenuPack field order is corroborated by IL2CPP metadata fields 37452..37457.
"""
from pathlib import Path
import json
import shutil
import struct
import UnityPy
from UnityPy.classes import PPtr

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'extracted/v3.141/menu'
OUT.mkdir(parents=True, exist_ok=True)
env = UnityPy.load(str(ROOT / 'extracted/v3.141/base/assets/bin/Data/data.unity3d'))
objects = {o.path_id: o for o in env.objects if o.assets_file.name == 'level2'}
sprites = {(r['file'], r['path_id']): r for r in json.loads((ROOT / 'reports/v3.141/sprite-exports.json').read_text())['entries'] if r['container'] == 'data.unity3d'}
bundles = {r['name']: r for r in json.loads((ROOT / 'reports/v3.141/spine-bundles.json').read_text())}

def resolve(obj, offset):
    file_id, path_id = struct.unpack_from('<iq', obj.get_raw_data(), offset)
    if path_id == 0:
        return None
    return PPtr(m_FileID=file_id, m_PathID=path_id, assetsfile=obj.assets_file).deref()

def sprite_ref(obj, offset):
    target = resolve(obj, offset)
    if target is None:
        return None
    assert target.type.name == 'Sprite', (obj.path_id, offset, target.type)
    row = sprites[(target.assets_file.name, target.path_id)]
    name = f'{target.assets_file.name}-{target.path_id}.png'
    shutil.copyfile(ROOT / row['export'], OUT / name)
    return {'name': row['name'], 'file': row['file'], 'path_id': row['path_id'], 'url': name}

transforms = {}
components = {}
headers = {}
for obj in objects.values():
    if obj.type.name in {'RectTransform', 'Transform'}:
        transforms[obj.path_id] = obj.read_typetree()
    if obj.type.name != 'MonoBehaviour':
        continue
    data = obj.read(check_read=False)
    script = data.m_Script.read()
    headers[obj.path_id] = (data.m_GameObject.path_id, script.m_ClassName)
    raw = obj.get_raw_data()
    component = {'id': obj.path_id, 'class': script.m_ClassName}
    if script.m_ClassName == 'Image':
        assert len(raw) == 136 and struct.unpack_from('<i', raw, 84)[0] == 0
        component.update(sprite=sprite_ref(obj, 88), color=struct.unpack_from('<4f', raw, 44), image_type=struct.unpack_from('<i', raw, 100)[0])
    elif script.m_ClassName == 'TextMeshProUGUI':
        length = struct.unpack_from('<i', raw, 88)[0]
        assert 0 <= length <= len(raw) - 92
        component['text'] = raw[92:92 + length].decode('utf-8')
    elif script.m_ClassName == 'SkeletonGraphic':
        target = resolve(obj, 88)
        component['skeleton_data'] = {'file': target.assets_file.name, 'path_id': target.path_id, 'name': target.peek_name()}
    components.setdefault(data.m_GameObject.path_id, []).append(component)

def node(transform_id):
    transform = transforms[transform_id]
    game_id = transform['m_GameObject']['m_PathID']
    game = objects[game_id].read_typetree()
    return {'id': game_id, 'name': game['m_Name'], 'active': game['m_IsActive'], 'transform': transform, 'components': components.get(game_id, []), 'children': [node(c['m_PathID']) for c in transform['m_Children']]}

content = transforms[757]
packs = []
for child in content['m_Children']:
    root = node(child['m_PathID'])
    component = next(c for c in root['components'] if c['class'] == 'MainMenuPack')
    obj = objects[component['id']]
    product = struct.unpack_from('<i', obj.get_raw_data(), 32)[0]
    icon = next(c for c in root['components'] if c['class'] == 'PackAnimatedIcon')
    raw = objects[icon['id']].get_raw_data()
    skeleton_id = resolve(objects[icon['id']], 32).path_id
    text_target = resolve(obj, 48)
    text = next(c['text'] for c in components[headers[text_target.path_id][0]] if c['class'] == 'TextMeshProUGUI')
    skeleton_component = next(c for cs in components.values() for c in cs if c['id'] == skeleton_id)
    skeleton_name = skeleton_component['skeleton_data']['name'].removesuffix('_SkeletonData')
    bundle = bundles[skeleton_name]
    target = OUT / 'spine' / skeleton_name
    shutil.copytree(ROOT / bundle['directory'], target, dirs_exist_ok=True)
    packs.append({'product': product, 'name': root['name'], 'label': text, 'component_id': obj.path_id, 'static_frame': struct.unpack_from('<f', raw, 68)[0], 'spine': f'spine/{skeleton_name}/', 'node': root})

raw_grid = objects[1195].get_raw_data()
report = {
    'source': 'data.unity3d / level2',
    'grid': {'padding': struct.unpack_from('<4i', raw_grid, 32), 'alignment': struct.unpack_from('<i', raw_grid, 48)[0], 'start_corner': struct.unpack_from('<i', raw_grid, 52)[0], 'start_axis': struct.unpack_from('<i', raw_grid, 56)[0], 'cell': struct.unpack_from('<2f', raw_grid, 60), 'spacing': struct.unpack_from('<2f', raw_grid, 68), 'constraint': struct.unpack_from('<i', raw_grid, 76)[0], 'constraint_count': struct.unpack_from('<i', raw_grid, 80)[0]},
    'packs': packs,
    'background': node(743),
    'controls': [node(761), node(827)],
    'limitations': ['Serialized scene layout, not an observed native frame.', 'Product enum values are not picture asset prefixes.', 'HorizontalGridSizer changes padding at runtime; preview uses serialized padding.', 'Text uses a browser fallback until TMP font/localization binding is migrated.', 'Purchase/lock runtime visibility is not established.'],
}
(ROOT / 'reports/v3.141/menu-bindings.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
(OUT / 'menu.json').write_text(json.dumps(report, ensure_ascii=False) + '\n')
shutil.copyfile(ROOT / 'extracted/v3.141/preview/spine-webgl.js', OUT / 'spine-webgl.js')
shutil.copyfile(ROOT / 'extracted/v3.141/preview/LICENSE.spine', OUT / 'SPINE-LICENSE')
shutil.copyfile(ROOT / 'scripts/unity-menu-v3141.html', OUT / 'index.html')
print('Bound', len(packs), 'packs:', [(p['product'], p['name']) for p in packs])
