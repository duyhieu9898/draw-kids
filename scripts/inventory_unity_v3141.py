"""Inventory original Unity objects; export TextAssets without changing the web app.
Run with extracted/v3.141/unity-venv/bin/python. UnityPy==1.25.4.
Object IDs are scoped by source container and serialized file (never by name alone).
"""
from pathlib import Path
from collections import Counter
import hashlib
import json
import UnityPy

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'extracted/v3.141/base/assets'
OUT = ROOT / 'extracted/v3.141/unity-text'
REPORT = ROOT / 'reports/v3.141/unity-objects.json'
OUT.mkdir(parents=True, exist_ok=True)
sources = [BASE / 'bin/Data/data.unity3d', *sorted((BASE / 'aa/Android').glob('*.bundle'))]
report = {'parser': f'UnityPy {UnityPy.__version__}', 'sources': [], 'limitations': [
    'Static serialized object inventory does not prove runtime use or gameplay.',
    'Only packaged data.unity3d and Android .bundle files are inventoried.',
    'TextAsset bytes are exported; textures, audio, meshes and prefab dependencies need further extraction.',
]}
for source in sources:
    print('Reading', source.name, flush=True)
    entry = {'source': str(source.relative_to(BASE)), 'sha256': hashlib.sha256(source.read_bytes()).hexdigest(), 'objects': [], 'errors': []}
    try:
        env = UnityPy.load(str(source))
        for obj in env.objects:
            row = {'file': obj.assets_file.name, 'path_id': obj.path_id, 'type': obj.type.name}
            try:
                row['name'] = obj.peek_name()
                if obj.type.name == 'TextAsset':
                    data = obj.read()
                    raw = data.m_Script
                    if isinstance(raw, str):
                        raw = raw.encode('utf-8', errors='surrogateescape')
                    dest = OUT / source.name / obj.assets_file.name / f'{obj.path_id}.bytes'
                    dest.parent.mkdir(parents=True, exist_ok=True)
                    dest.write_bytes(raw)
                    row.update(export=str(dest.relative_to(ROOT)), bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest())
                    try:
                        doc = json.loads(raw)
                        if isinstance(doc, dict) and isinstance(doc.get('skeleton'), dict):
                            row['spine'] = doc['skeleton']
                            row['animations'] = list(doc.get('animations', {}))
                    except (ValueError, UnicodeError):
                        pass
            except Exception as exc:
                row['read_error'] = str(exc)
            entry['objects'].append(row)
        entry['versions'] = sorted({str(o.assets_file.unity_version) for o in env.objects})
        entry['counts'] = dict(Counter(r['type'] for r in entry['objects']))
        del env
    except Exception as exc:
        entry['errors'].append(str(exc))
    report['sources'].append(entry)
    REPORT.write_text(json.dumps(report, ensure_ascii=True, indent=2) + '\n')
    print('Objects',len(entry['objects']), 'errors',len(entry['errors']),flush=True)
print('Saved',REPORT,flush=True)
