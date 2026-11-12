from PIL import Image,ImageChops,ImageStat
import json

def load(p):
 i=Image.open(p).convert('RGBA'); bg=Image.new('RGBA',i.size,'white'); bg.alpha_composite(i);return bg.convert('L').resize((96,96),Image.Resampling.LANCZOS)
assets=[(i,j,load(f'web/public/art/pack{i}/{j}/outline.png')) for i in range(1,9) for j in range(1,17)];results=[]
for pack in range(1,11):
 group=[]
 for pic in range(1,17):
  a=load(f'web/public/game-assets/ui/sprites/gallery_icons/img-preview-{pack}-{pic}.png');scores=sorted((ImageStat.Stat(ImageChops.difference(a,b)).mean[0],i,j) for i,j,b in assets);score,i,j=scores[0];same=next((s for s,x,y in scores if x==pack and y==pic),None);group.append({'picture':pic,'best_pack':i,'best_picture':j,'score':round(score,2),'runner_up':round(scores[1][0],2),'same_number_score':round(same,2) if same is not None else None})
 confident=[x for x in group if x['score']<15 and x['runner_up']-x['score']>8];print(pack,'confident',len(confident),'by-pack', {p:sum(x['best_pack']==p for x in confident) for p in range(1,9) if any(x['best_pack']==p for x in confident)},'same-index',sum(x['best_pack']==pack and x['best_picture']==x['picture'] for x in confident),flush=True);results.append({'group':pack,'matches':group})
with open('reports/v3.141/gallery-cross-version-similarity.json', 'w') as f: json.dump({'basis': '96x96 grayscale mean absolute difference, transparent pixels over white; heuristic only, not proof of runtime identity', 'groups': results}, f, indent=2)
