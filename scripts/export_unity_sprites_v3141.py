"""Reconstruct Unity Sprite images including packed atlas rotation/trim via UnityPy."""
from pathlib import Path
import gc,hashlib,json
import UnityPy
ROOT=Path(__file__).resolve().parents[1];BASE=ROOT/'extracted/v3.141/base/assets';rows=[]
for source in [BASE/'bin/Data/data.unity3d',*sorted((BASE/'aa/Android').glob('*.bundle'))]:
 print(source.name,flush=True);env=UnityPy.load(str(source))
 for obj in env.objects:
  if obj.type.name!='Sprite':continue
  row={'container':source.name,'file':obj.assets_file.name,'path_id':obj.path_id}
  try:
   data=obj.read();row['name']=data.m_Name
   rect=data.m_Rect;row['rect']={k:getattr(rect,k)for k in ['x','y','width','height']};pivot=data.m_Pivot;row['pivot']={'x':pivot.x,'y':pivot.y};row['pixels_to_units']=data.m_PixelsToUnits
   dest=ROOT/'extracted/v3.141/sprites'/source.name/obj.assets_file.name/f'{obj.path_id}.png';dest.parent.mkdir(parents=True,exist_ok=True)
   if not dest.exists():data.image.save(dest)
   row.update(export=str(dest.relative_to(ROOT)),sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
  except Exception as exc:row['error']=str(exc)
  rows.append(row)
  if len(rows)%16==0:
   obj.assets_file._cache.clear();gc.collect()
 del env;gc.collect()
 (ROOT/'reports/v3.141/sprite-exports.json').write_text(json.dumps({'parser':'UnityPy '+UnityPy.__version__,'entries':rows},ensure_ascii=False,indent=2)+'\n')
 print('Sprite records',len(rows),'errors',sum('error'in r for r in rows),flush=True)
