"""Assemble reviewable original Spine bundles without rewriting skeletons/atlas."""
from pathlib import Path
import json,shutil
ROOT=Path(__file__).resolve().parents[1];report=json.loads((ROOT/'reports/v3.141/unity-objects.json').read_text());catalog=json.loads((ROOT/'reports/v3.141/unity-asset-catalog.json').read_text())['entries'];out=[]
for source in report['sources']:
 for obj in source['objects']:
  if 'spine' not in obj:continue
  name=obj['name'];row={'name':name,'container':Path(source['source']).name,'file':obj['file'],'path_id':obj['path_id'],'spine_version':obj['spine']['spine'],'errors':[]}
  dest=ROOT/'extracted/v3.141/spine-bundles'/row['container']/obj['file']/str(obj['path_id']);dest.mkdir(parents=True,exist_ok=True)
  shutil.copyfile(ROOT/obj['export'],dest/'skeleton.json')
  atlases=[x for x in source['objects'] if x['file']==obj['file'] and x['type']=='TextAsset' and x.get('name')==name+'.atlas']
  if len(atlases)!=1:row['errors'].append('Expected one exact-name atlas')
  else:
   atlas=ROOT/atlases[0]['export'];shutil.copyfile(atlas,dest/'skeleton.atlas');lines=atlas.read_text().splitlines();pages=[]
   for i,line in enumerate(lines):
    if line and not line.startswith((' ','\t')) and (i==0 or not lines[i-1]) and i+1<len(lines) and lines[i+1].startswith(('size:','format:','filter:')):pages.append(line)
   row['pages']=pages
   for page in pages:
    if Path(page).name!=page:row['errors'].append('Unsafe page name');continue
    candidates=[x for x in catalog if x['container']==row['container'] and x['serialized_file']==row['file'] and x['type']=='Texture2D' and x['name']==Path(page).stem]
    if len(candidates)!=1:row['errors'].append('Missing/ambiguous texture '+page);continue
    tex=candidates[0];p=ROOT/'extracted/v3.141/textures'/tex['container']/tex['serialized_file']/f"{tex['path_id']}.png"
    if p.exists():shutil.copyfile(p,dest/page)
    else:row['errors'].append('Texture decode not complete '+page)
  row['directory']=str(dest.relative_to(ROOT));out.append(row)
(ROOT/'reports/v3.141/spine-bundles.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
print('Bundled',len(out),'complete',sum(not x['errors'] for x in out));print([(x['name'],x['errors'])for x in out if x['errors']])
