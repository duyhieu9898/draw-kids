"""Group exact original numeric sprite names, retaining ambiguous/missing bindings."""
from pathlib import Path
from collections import Counter
import json,re
ROOT=Path(__file__).resolve().parents[1];rows=json.loads((ROOT/'reports/v3.141/sprite-exports.json').read_text())['entries'];groups={}
for row in rows:
 name=row.get('name','');m=re.fullmatch(r'img-(\d+)-(\d+)-(\d+)',name);o=re.fullmatch(r'img-(\d+)-(\d+)-outline',name);p=re.fullmatch(r'img-preview-(\d+)-(\d+)',name)
 if not(m or o or p):continue
 match=m or o or p;pack,picture=map(int,match.group(1,2));g=groups.setdefault((pack,picture),{'pack_candidate':pack,'picture_candidate':picture,'regions':[],'outlines':[],'previews':[]})
 ref={k:row[k]for k in ['name','container','file','path_id','rect','pivot','pixels_to_units','export']if k in row}
 if m:ref['region_candidate']=int(m[3]);g['regions'].append(ref)
 elif o:g['outlines'].append(ref)
 else:g['previews'].append(ref)
report={'basis':'Exact img-pack-picture-region / img-pack-picture-outline / img-preview-pack-picture naming only. No runtime catalog order, availability, or transform parity claim.','groups':[groups[k]for k in sorted(groups)],'counts':{'groups':len(groups),'with_regions':sum(bool(g['regions'])for g in groups.values()),'with_outline':sum(bool(g['outlines'])for g in groups.values()),'with_preview':sum(bool(g['previews'])for g in groups.values())}}
(ROOT/'reports/v3.141/art-candidates.json').write_text(json.dumps(report,indent=2)+'\n');print(report['counts'])
