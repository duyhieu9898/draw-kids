"""Extract original intro payload and scene evidence, without altering web assets."""
from pathlib import Path
import json
import UnityPy
ROOT=Path(__file__).resolve().parents[1]
source=ROOT/'extracted/v3.141/base/assets/bin/Data/data.unity3d'
out=ROOT/'extracted/v3.141/intro'; out.mkdir(parents=True,exist_ok=True)
env=UnityPy.load(str(source))
rows=[]
for o in env.objects:
    file=o.assets_file.name
    if file=='sharedassets1.assets' and o.path_id in [2,6,8,9,24,25]:
        row={'file':file,'id':o.path_id,'type':o.type.name}
        try:
            d=o.read()
            if o.type.name=='Texture2D':
                dest=out/'intro-drawing.png'; d.image.save(dest)
                row.update(width=d.m_Width,height=d.m_Height,export=str(dest.relative_to(ROOT)))
            elif o.type.name=='TextAsset':
                raw=d.m_Script
                if isinstance(raw,str):raw=raw.encode('utf-8',errors='surrogateescape')
                dest=out/('intro-drawing.atlas' if o.path_id==8 else 'intro-drawing.json')
                dest.write_bytes(raw);row['export']=str(dest.relative_to(ROOT))
            else:row['data']=o.read_typetree()
        except Exception as exc:row['error']=str(exc)
        rows.append(row)
    if file=='level1' or o.type.name=='BuildSettings':
        row={'file':file,'id':o.path_id,'type':o.type.name}
        try:
            tree=o.read_typetree()
            row['data']={k:tree[k] for k in ['scenes','m_Version'] if k in tree} if o.type.name=='BuildSettings' else tree
        except Exception as exc:row['error']=str(exc)
        rows.append(row)
p=ROOT/'reports/v3.141/intro-scene.json';p.write_text(json.dumps(rows,indent=2)+'\n')
print('Exported intro and',len(rows),'scene evidence objects; errors',sum('error'in r for r in rows))
