"""Prepare the development reference preview using hash-checked official runtime."""
from pathlib import Path
import hashlib,json,shutil,urllib.request
ROOT=Path(__file__).resolve().parents[1];dest=ROOT/'extracted/v3.141/preview';dest.mkdir(parents=True,exist_ok=True)
r=json.loads((ROOT/'reports/v3.141/spine-runtime-origin.json').read_text())
for name,url in [('spine-webgl.js',r['source']),('LICENSE.spine',r['license'])]:
 p=dest/name
 if not p.exists():p.write_bytes(urllib.request.urlopen(url,timeout=30).read())
 if name=='spine-webgl.js' and hashlib.sha256(p.read_bytes()).hexdigest()!=r['sha256']:raise ValueError('Runtime digest differs from reviewed preview')
shutil.copyfile(ROOT/'scripts/spine-preview-v3141.html',dest/'index.html')
shutil.copyfile(ROOT/'reports/v3.141/spine-bundles.json',ROOT/'extracted/v3.141/spine-bundles/manifest.json')
print('python3 -m http.server 4181 --bind 127.0.0.1 --directory extracted/v3.141')
print('http://127.0.0.1:4181/preview/?t=6.5')
