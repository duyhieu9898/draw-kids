"""Create bounded texture/sprite/audio catalog and export text assets from v3.141."""
from pathlib import Path
import collections,hashlib,json
import UnityPy
ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'extracted/v3.141/base/assets'
SOURCES=[BASE/'bin/Data/data.unity3d',*sorted((BASE/'aa/Android').glob('*.bundle'))]
out=[]
for source in SOURCES:
 print(source.name,flush=True)
 env=UnityPy.load(str(source))
 for obj in env.objects:
  if obj.type.name not in {'Texture2D','Sprite','AudioClip','TextAsset','MonoBehaviour','AnimationClip','AnimatorController'}: continue
  row={'container':source.name,'serialized_file':obj.assets_file.name,'path_id':obj.path_id,'type':obj.type.name}
  try:
   row['name']=obj.peek_name()
   if obj.type.name=='Texture2D':
    d=obj.read();row.update(width=d.m_Width,height=d.m_Height,format=str(d.m_TextureFormat))
   elif obj.type.name=='AudioClip':
    d=obj.read();row.update(channels=getattr(d,'m_Channels',None),frequency=getattr(d,'m_Frequency',None),duration_seconds=getattr(d,'m_Length',None))
   elif obj.type.name=='TextAsset':
    d=obj.read();raw=d.m_Script.encode('utf-8',errors='surrogateescape') if isinstance(d.m_Script,str) else d.m_Script
    if row['name'] and row['name'].lower().endswith(('.json','.atlas','.txt')):
     dest=ROOT/'extracted/v3.141/unity-text-addressables'/source.name/str(obj.path_id)
     dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(raw)
     row.update(bytes=len(raw),sha256=hashlib.sha256(raw).hexdigest(),export=str(dest.relative_to(ROOT)))
  except Exception as e:row['parse_error']=str(e)
  out.append(row)
 del env
p=ROOT/'reports/v3.141/unity-asset-catalog.json';p.write_text(json.dumps({'unitypy':UnityPy.__version__,'sources':len(SOURCES),'entries':out,'counts_by_type':dict(collections.Counter(x['type'] for x in out)),'limitations':['Catalog is a static Unity serialized-object inventory; runtime loading, visibility, locks, and user flow remain unknown.','Texture and audio payloads are indexed but not bulk-exported in this pass.']},ensure_ascii=False,indent=2)+'\n')
print('Saved',p,len(out),flush=True)
