"""Decode original Unity Texture2D assets; preserve scoped IDs and payload hashes."""
from pathlib import Path
import gc,hashlib,json
import UnityPy
ROOT=Path(__file__).resolve().parents[1];BASE=ROOT/'extracted/v3.141/base/assets';OUT=ROOT/'extracted/v3.141/textures'
sources=[BASE/'bin/Data/data.unity3d',*sorted((BASE/'aa/Android').glob('*.bundle'))];rows=[]
for source in sources:
 print(source.name,flush=True);env=UnityPy.load(str(source))
 for obj in env.objects:
  if obj.type.name!='Texture2D':continue
  row={'container':source.name,'file':obj.assets_file.name,'path_id':obj.path_id}
  try:
   data=obj.read();row.update(name=data.m_Name,width=data.m_Width,height=data.m_Height)
   if data.m_Width==0 or data.m_Height==0:
    row['status']='empty-runtime-font-texture';rows.append(row);continue
   dest=OUT/source.name/obj.assets_file.name/f'{obj.path_id}.png';dest.parent.mkdir(parents=True,exist_ok=True)
   if not dest.exists():data.image.save(dest)
   row.update(export=str(dest.relative_to(ROOT)),sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
  except Exception as exc:row['error']=str(exc)
  rows.append(row)
 del env;gc.collect()
 (ROOT/'reports/v3.141/texture-exports.json').write_text(json.dumps({'parser':'UnityPy '+UnityPy.__version__,'entries':rows},ensure_ascii=False,indent=2)+'\n')
 print('Texture records',len(rows),'errors',sum('error'in r for r in rows),flush=True)
