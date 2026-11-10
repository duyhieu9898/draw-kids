"""Bounded ARM64 disassembly for selected metadata-mapped entry points."""
from pathlib import Path
import json
from capstone import Cs,CS_ARCH_ARM64,CS_MODE_ARM
from elftools.elf.elffile import ELFFile
ROOT=Path(__file__).resolve().parents[1];src=ROOT/'extracted/v3.141/libil2cpp.so'
# End points are separately observed next-code addresses, not inferred source boundaries.
entries=[('PaintIn3D.ClearAll',0x1fcad0c,0x1fcaf38),('PaintIn3D.TextureUndo',0x1ff0768,0x1ff0fc0),('DrawingPage.OnSaveButtonUp',0x153c0dc,0x153c0e0),('DrawingPage.OnButtonTrash',0x153c18c,0x153c430),('PaintablesController.Undo',0x153dbd0,0x153dd24),('SaveImage.OnSave',0x15613fc,0x156150c),('IntroSceneDRA.PlaySpine',0x1584abc,0x1584c9c),('IntroSceneDRA.OnEndSpineAction',0x1584c9c,0x1584cb0),('IntroSceneDRA.LoadNextScene',0x1584d30,0x1584db0)]
md=Cs(CS_ARCH_ARM64,CS_MODE_ARM);md.detail=False;lines=[];targets=set()
with src.open('rb') as f:
 elf=ELFFile(f);segs=[s for s in elf.iter_segments() if s['p_type']=='PT_LOAD']
 for name,start,end in entries:
  seg=next(s for s in segs if s['p_vaddr']<=start< s['p_vaddr']+s['p_filesz']);f.seek(seg['p_offset']+start-seg['p_vaddr']);data=f.read(end-start)
  lines+=['',f'; {name} [{hex(start)}, {hex(end)})']
  for i in md.disasm(data,start):
   lines.append(f'{i.address:#x}: {i.mnemonic:8} {i.op_str}')
   if i.mnemonic in {'bl','b'} and i.op_str.startswith('#0x'):targets.add(i.op_str[1:])
(ROOT/'reports/v3.141/core-entrypoints.asm').write_text('\n'.join(lines)+'\n')
(ROOT/'reports/v3.141/direct-branch-targets.json').write_text(json.dumps(sorted(targets),indent=2)+'\n')
print('Direct targets',sorted(targets))
