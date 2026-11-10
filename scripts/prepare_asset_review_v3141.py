"""Build a local review index of already decoded original assets."""
from pathlib import Path
import json,shutil
ROOT=Path(__file__).resolve().parents[1];out=[]
for kind,report in [('sprite','sprite-exports.json'),('texture','texture-exports.json')]:
 p=ROOT/'reports/v3.141'/report
 if not p.exists():continue
 for row in json.loads(p.read_text())['entries']:
  if 'export'in row:out.append({**{k:row[k]for k in ['name','file','path_id','pivot']if k in row},'kind':kind,'url':row['export'].removeprefix('extracted/v3.141/')})
for row in json.loads((ROOT/'reports/v3.141/audio-exports.json').read_text()):
 for export in row['exports']:out.append({'kind':'audio','name':row['name'],'file':row['file'],'path_id':row['path_id'],'url':export['file'].removeprefix('extracted/v3.141/')})
base=ROOT/'extracted/v3.141';(base/'asset-review-index.json').write_text(json.dumps(out,ensure_ascii=False)+'\n');shutil.copyfile(ROOT/'scripts/unity-asset-review-v3141.html',base/'review.html');print('Review index',len(out),'http://127.0.0.1:4181/review.html')
