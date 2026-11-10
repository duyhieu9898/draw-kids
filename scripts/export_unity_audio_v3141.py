"""Decode packaged Unity AudioClips; keep source identity and explicit failures."""
from pathlib import Path
import json,hashlib,gc
import UnityPy
import fmod_toolkit
from UnityPy.helpers.ResourceReader import get_resource_data
ROOT=Path(__file__).resolve().parents[1];BASE=ROOT/'extracted/v3.141/base/assets';out=[]
for source in [BASE/'bin/Data/data.unity3d',*sorted((BASE/'aa/Android').glob('*.bundle'))]:
 print(source.name,flush=True);env=UnityPy.load(str(source))
 for o in env.objects:
  if o.type.name!='AudioClip':continue
  r={'container':source.name,'file':o.assets_file.name,'path_id':o.path_id,'exports':[]}
  try:
   d=o.read();r['name']=d.m_Name
   resource=d.m_Resource
   external=source.parent/Path(resource.m_Source).name if resource else None
   if external and external.is_file():
    with external.open('rb') as f:f.seek(resource.m_Offset);raw=f.read(resource.m_Size)
   else:raw=bytes(d.m_AudioData) if d.m_AudioData else get_resource_data(resource.m_Source,o.assets_file,resource.m_Offset,resource.m_Size)
   rawdest=ROOT/'extracted/v3.141/audio'/source.name/o.assets_file.name/str(o.path_id)/'original.bytes';rawdest.parent.mkdir(parents=True,exist_ok=True);rawdest.write_bytes(raw)
   r['original']={'file':str(rawdest.relative_to(ROOT)),'magic_hex':raw[:8].hex(),'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest()}
   for i,(name,data) in enumerate(fmod_toolkit.raw_to_wav(raw,d.m_Name,d.m_Channels or 2,d.m_Frequency or 44100).items()):
    dest=ROOT/'extracted/v3.141/audio'/source.name/o.assets_file.name/str(o.path_id)/(str(i)+Path(name).suffix);dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data)
    r['exports'].append({'file':str(dest.relative_to(ROOT)),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()})
   if not r['exports']:r['error']='No decoded samples'
  except Exception as e:r['error']=str(e)
  out.append(r)
 del env;gc.collect()
 (ROOT/'reports/v3.141/audio-exports.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
print('Clips',len(out),'errors',sum('error'in x for x in out),flush=True)
