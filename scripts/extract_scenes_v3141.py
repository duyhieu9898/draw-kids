"""Preserve scene transforms and component identity, including stripped scripts.

Partial MonoBehaviour reads recover only the built-in header; raw bytes are kept
locally for targeted decoding, never presented as decoded custom fields.
"""
from pathlib import Path
import json
import UnityPy

ROOT = Path(__file__).resolve().parents[1]
env = UnityPy.load(str(ROOT / 'extracted/v3.141/base/assets/bin/Data/data.unity3d'))
rows = []
for obj in env.objects:
    scene = obj.assets_file.name
    if scene not in {'level2', 'level4', 'level6'}:
        continue
    row = {'scene': scene, 'id': obj.path_id, 'type': obj.type.name}
    try:
        row['data'] = obj.read_typetree()
    except Exception as exc:
        row['parse_error'] = str(exc)
        if obj.type.name == 'MonoBehaviour':
            data = obj.read(check_read=False)
            script = data.m_Script.read()
            row['header'] = {
                'game_object': data.m_GameObject.path_id,
                'enabled': data.m_Enabled,
                'class': script.m_ClassName,
                'namespace': script.m_Namespace,
                'assembly': script.m_AssemblyName,
            }
            dest = ROOT / 'extracted/v3.141/scene-components' / scene / f'{obj.path_id}.bin'
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_bytes(obj.get_raw_data())
            row['raw'] = str(dest.relative_to(ROOT))
    rows.append(row)
dest = ROOT / 'reports/v3.141/scene-structure.json'
dest.write_text(json.dumps(rows, ensure_ascii=False, indent=2) + '\n')
print(f'{len(rows)} objects, {sum("parse_error" in r for r in rows)} partial reads')
