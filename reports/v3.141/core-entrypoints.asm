
; PaintIn3D.ClearAll [0x1fcad0c, 0x1fcaf38)
0x1fcad0c: sub      sp, sp, #0x70
0x1fcad10: stp      x30, x23, [sp, #0x40]
0x1fcad14: stp      x22, x21, [sp, #0x50]
0x1fcad18: stp      x20, x19, [sp, #0x60]
0x1fcad1c: adrp     x21, #0x3032000
0x1fcad20: adrp     x20, #0x2d13000
0x1fcad24: mov      x19, x0
0x1fcad28: ldrb     w8, [x21, #0x48b]
0x1fcad2c: ldr      x20, [x20, #0x960]
0x1fcad30: tbnz     w8, #0, #0x1fcad78
0x1fcad34: adrp     x0, #0x2d13000
0x1fcad38: ldr      x0, [x0, #0x968]
0x1fcad3c: bl       #0x13f5940
0x1fcad40: adrp     x0, #0x2d13000
0x1fcad44: ldr      x0, [x0, #0x970]
0x1fcad48: bl       #0x13f5940
0x1fcad4c: adrp     x0, #0x2d13000
0x1fcad50: ldr      x0, [x0, #0x978]
0x1fcad54: bl       #0x13f5940
0x1fcad58: adrp     x0, #0x2d13000
0x1fcad5c: ldr      x0, [x0, #0x980]
0x1fcad60: bl       #0x13f5940
0x1fcad64: adrp     x0, #0x2d13000
0x1fcad68: ldr      x0, [x0, #0x960]
0x1fcad6c: bl       #0x13f5940
0x1fcad70: mov      w8, #1
0x1fcad74: strb     w8, [x21, #0x48b]
0x1fcad78: movi     v0.2d, #0000000000000000
0x1fcad7c: ldr      x0, [x20]
0x1fcad80: str      xzr, [sp, #0x30]
0x1fcad84: ldr      w8, [x0, #0xe4]
0x1fcad88: stp      q0, q0, [sp, #0x10]
0x1fcad8c: cbnz     w8, #0x1fcad94
0x1fcad90: bl       #0x13f5a78
0x1fcad94: adrp     x21, #0x3032000
0x1fcad98: ldrb     w8, [x21, #0x501]
0x1fcad9c: cbnz     w8, #0x1fcadb4
0x1fcada0: adrp     x0, #0x2d13000
0x1fcada4: ldr      x0, [x0, #0x960]
0x1fcada8: bl       #0x13f5940
0x1fcadac: mov      w8, #1
0x1fcadb0: strb     w8, [x21, #0x501]
0x1fcadb4: ldr      x0, [x20]
0x1fcadb8: ldr      w8, [x0, #0xe4]
0x1fcadbc: cbnz     w8, #0x1fcadc8
0x1fcadc0: bl       #0x13f5a78
0x1fcadc4: ldr      x0, [x20]
0x1fcadc8: ldr      x8, [x0, #0xb8]
0x1fcadcc: ldr      x0, [x8, #0x20]
0x1fcadd0: cbz      x0, #0x1fcaed4
0x1fcadd4: adrp     x8, #0x2d13000
0x1fcadd8: adrp     x22, #0x2d13000
0x1fcaddc: adrp     x23, #0x2d13000
0x1fcade0: ldr      x8, [x8, #0x980]
0x1fcade4: adrp     x21, #0x2d13000
0x1fcade8: ldr      x22, [x22, #0x970]
0x1fcadec: ldr      x23, [x23, #0x978]
0x1fcadf0: ldr      x21, [x21, #0x968]
0x1fcadf4: add      x1, sp, #0x10
0x1fcadf8: ldr      x2, [x8]
0x1fcadfc: add      x20, sp, #0x10
0x1fcae00: bl       #0x1c076ec
0x1fcae04: stp      xzr, x20, [sp]
0x1fcae08: ldr      x1, [x22]
0x1fcae0c: add      x0, sp, #0x10
0x1fcae10: bl       #0x1bc1ca0
0x1fcae14: tbz      w0, #0, #0x1fcaeb0
0x1fcae18: ldr      x20, [x23]
0x1fcae1c: ldr      x0, [x20, #0x20]
0x1fcae20: add      x8, x0, #0x135
0x1fcae24: ldrh     w9, [x8]
0x1fcae28: tbnz     w9, #0, #0x1fcae44
0x1fcae2c: bl       #0x142f600
0x1fcae30: mov      x8, x0
0x1fcae34: ldr      x0, [x20, #0x20]
0x1fcae38: add      x9, x0, #0x135
0x1fcae3c: ldrh     w9, [x9]
0x1fcae40: b        #0x1fcae48
0x1fcae44: mov      x8, x0
0x1fcae48: ldr      x8, [x8, #0xc0]
0x1fcae4c: ldr      x8, [x8, #0x18]
0x1fcae50: ldr      w20, [x8, #0xfc]
0x1fcae54: tbnz     w9, #0, #0x1fcae5c
0x1fcae58: bl       #0x142f600
0x1fcae5c: ldr      x8, [x0, #0xc0]
0x1fcae60: ldr      x8, [x8, #8]
0x1fcae64: ldr      x8, [x8, #0x80]
0x1fcae68: add      x0, sp, #0x10
0x1fcae6c: add      x1, x8, #0x60
0x1fcae70: bl       #0x13f5968
0x1fcae74: mov      x1, x0
0x1fcae78: add      x0, sp, #0x38
0x1fcae7c: mov      x2, x20
0x1fcae80: bl       #0x2b17600
0x1fcae84: ldr      x20, [sp, #0x38]
0x1fcae88: cbz      x20, #0x1fcaed0
0x1fcae8c: mov      x0, x20
0x1fcae90: mov      x1, xzr
0x1fcae94: bl       #0x1ff17b0
0x1fcae98: ldrb     w8, [x19, #0x20]
0x1fcae9c: cbz      w8, #0x1fcae08
0x1fcaea0: mov      x0, x20
0x1fcaea4: mov      x1, xzr
0x1fcaea8: bl       #0x1ff0208
0x1fcaeac: b        #0x1fcae08
0x1fcaeb0: ldr      x1, [x21]
0x1fcaeb4: add      x0, sp, #0x10
0x1fcaeb8: bl       #0x1bc2330
0x1fcaebc: ldp      x20, x19, [sp, #0x60]
0x1fcaec0: ldp      x22, x21, [sp, #0x50]
0x1fcaec4: ldp      x30, x23, [sp, #0x40]
0x1fcaec8: add      sp, sp, #0x70
0x1fcaecc: ret      
0x1fcaed0: bl       #0x13f5ba4
0x1fcaed4: bl       #0x13f5ba4
0x1fcaed8: b        #0x1fcaee8
0x1fcaedc: b        #0x1fcaee8
0x1fcaee0: b        #0x1fcaee8
0x1fcaee4: b        #0x1fcaee8
0x1fcaee8: mov      x19, x0
0x1fcaeec: cmp      w1, #1
0x1fcaef0: b.ne     #0x1fcaf24
0x1fcaef4: mov      x0, x19
0x1fcaef8: bl       #0x2b17650
0x1fcaefc: ldr      x19, [x0]
0x1fcaf00: str      x19, [sp]
0x1fcaf04: bl       #0x2b17660
0x1fcaf08: ldr      x0, [sp, #8]
0x1fcaf0c: ldr      x1, [x21]
0x1fcaf10: bl       #0x1bc2330
0x1fcaf14: cbz      x19, #0x1fcaebc
0x1fcaf18: mov      x0, x19
0x1fcaf1c: bl       #0x13f5b9c
0x1fcaf20: mov      x19, x0
0x1fcaf24: mov      x0, sp
0x1fcaf28: bl       #0x139b35c
0x1fcaf2c: mov      x0, x19
0x1fcaf30: bl       #0x14e5bec
0x1fcaf34: bl       #0x12c4864

; PaintIn3D.TextureUndo [0x1ff0768, 0x1ff0fc0)
0x1ff0768: sub      sp, sp, #0x30
0x1ff076c: str      x30, [sp, #0x10]
0x1ff0770: stp      x20, x19, [sp, #0x20]
0x1ff0774: adrp     x20, #0x3032000
0x1ff0778: mov      x19, x0
0x1ff077c: ldrb     w8, [x20, #0x602]
0x1ff0780: tbnz     w8, #0, #0x1ff07a4
0x1ff0784: adrp     x0, #0x2d14000
0x1ff0788: ldr      x0, [x0, #0xcc8]
0x1ff078c: bl       #0x13f5940
0x1ff0790: adrp     x0, #0x2d14000
0x1ff0794: ldr      x0, [x0, #0xcd8]
0x1ff0798: bl       #0x13f5940
0x1ff079c: mov      w8, #1
0x1ff07a0: strb     w8, [x20, #0x602]
0x1ff07a4: ldr      w8, [x19, #0x38]
0x1ff07a8: cbz      w8, #0x1ff0868
0x1ff07ac: ldr      w8, [x19, #0xe8]
0x1ff07b0: cmp      w8, #1
0x1ff07b4: b.lt     #0x1ff0868
0x1ff07b8: ldr      x9, [x19, #0xe0]
0x1ff07bc: cbz      x9, #0x1ff0878
0x1ff07c0: ldr      w9, [x9, #0x18]
0x1ff07c4: cmp      w8, w9
0x1ff07c8: b.ne     #0x1ff07d4
0x1ff07cc: mov      x0, x19
0x1ff07d0: bl       #0x1ff052c
0x1ff07d4: mov      x0, x19
0x1ff07d8: bl       #0x1ff087c
0x1ff07dc: ldr      w9, [x19, #0xe8]
0x1ff07e0: ldr      w8, [x19, #0x38]
0x1ff07e4: sub      w1, w9, #1
0x1ff07e8: cmp      w8, #2
0x1ff07ec: str      w1, [x19, #0xe8]
0x1ff07f0: b.eq     #0x1ff0840
0x1ff07f4: cmp      w8, #1
0x1ff07f8: b.ne     #0x1ff0848
0x1ff07fc: ldr      x0, [x19, #0xe0]
0x1ff0800: cbz      x0, #0x1ff0878
0x1ff0804: adrp     x8, #0x2d14000
0x1ff0808: add      x2, sp, #8
0x1ff080c: ldr      x8, [x8, #0xcd8]
0x1ff0810: ldr      x3, [x8]
0x1ff0814: bl       #0x1c0c608
0x1ff0818: ldr      x8, [sp, #8]
0x1ff081c: cbz      x8, #0x1ff0878
0x1ff0820: fmov     s0, #1.00000000
0x1ff0824: fmov     s1, #1.00000000
0x1ff0828: ldr      x1, [x8, #0x10]
0x1ff082c: fmov     s2, #1.00000000
0x1ff0830: fmov     s3, #1.00000000
0x1ff0834: mov      x0, x19
0x1ff0838: bl       #0x1ff0ad0
0x1ff083c: b        #0x1ff0848
0x1ff0840: mov      x0, x19
0x1ff0844: bl       #0x1ff0bc8
0x1ff0848: ldr      x8, [x19, #0xc0]
0x1ff084c: cbz      x8, #0x1ff0868
0x1ff0850: ldr      x9, [x8, #0x18]
0x1ff0854: ldr      x0, [x8, #0x40]
0x1ff0858: add      x1, sp, #0x1c
0x1ff085c: ldr      x2, [x8, #0x28]
0x1ff0860: strb     wzr, [sp, #0x1c]
0x1ff0864: blr      x9
0x1ff0868: ldp      x20, x19, [sp, #0x20]
0x1ff086c: ldr      x30, [sp, #0x10]
0x1ff0870: add      sp, sp, #0x30
0x1ff0874: ret      
0x1ff0878: bl       #0x13f5ba4
0x1ff087c: sub      sp, sp, #0x40
0x1ff0880: stp      x30, x23, [sp, #0x10]
0x1ff0884: stp      x22, x21, [sp, #0x20]
0x1ff0888: stp      x20, x19, [sp, #0x30]
0x1ff088c: adrp     x20, #0x3032000
0x1ff0890: mov      x19, x0
0x1ff0894: ldrb     w8, [x20, #0x620]
0x1ff0898: tbnz     w8, #0, #0x1ff08c8
0x1ff089c: adrp     x0, #0x2d14000
0x1ff08a0: ldr      x0, [x0, #0xc90]
0x1ff08a4: bl       #0x13f5940
0x1ff08a8: adrp     x0, #0x2d14000
0x1ff08ac: ldr      x0, [x0, #0xc18]
0x1ff08b0: bl       #0x13f5940
0x1ff08b4: adrp     x0, #0x2d14000
0x1ff08b8: ldr      x0, [x0, #0xc98]
0x1ff08bc: bl       #0x13f5940
0x1ff08c0: mov      w8, #1
0x1ff08c4: strb     w8, [x20, #0x620]
0x1ff08c8: ldr      x23, [x19, #0x120]
0x1ff08cc: cbz      x23, #0x1ff0acc
0x1ff08d0: ldr      w20, [x23, #0x18]
0x1ff08d4: adrp     x21, #0x2d14000
0x1ff08d8: ldr      x21, [x21, #0xc98]
0x1ff08dc: cmp      w20, #1
0x1ff08e0: b.mi     #0x1ff0924
0x1ff08e4: ldr      x0, [x19, #0x120]
0x1ff08e8: cbz      x0, #0x1ff0acc
0x1ff08ec: ldr      x3, [x21]
0x1ff08f0: sub      w20, w20, #1
0x1ff08f4: add      x2, sp, #8
0x1ff08f8: mov      w1, w20
0x1ff08fc: bl       #0x1c0c608
0x1ff0900: ldr      x0, [sp, #8]
0x1ff0904: cbz      x0, #0x1ff0acc
0x1ff0908: ldr      x8, [x0]
0x1ff090c: ldp      x9, x1, [x8, #0x198]
0x1ff0910: blr      x9
0x1ff0914: cmp      w20, #0
0x1ff0918: b.gt     #0x1ff08e4
0x1ff091c: ldr      x23, [x19, #0x120]
0x1ff0920: cbz      x23, #0x1ff0acc
0x1ff0924: adrp     x22, #0x2d14000
0x1ff0928: ldr      x22, [x22, #0xc90]
0x1ff092c: ldr      w8, [x23, #0x1c]
0x1ff0930: ldr      x9, [x22]
0x1ff0934: add      w8, w8, #1
0x1ff0938: str      w8, [x23, #0x1c]
0x1ff093c: ldr      x8, [x9, #0x20]
0x1ff0940: ldr      x8, [x8, #0xc0]
0x1ff0944: ldr      x0, [x8, #0xc8]
0x1ff0948: bl       #0x13f6698
0x1ff094c: tbz      w0, #0, #0x1ff0974
0x1ff0950: ldr      w2, [x23, #0x18]
0x1ff0954: str      wzr, [x23, #0x18]
0x1ff0958: cmp      w2, #1
0x1ff095c: b.lt     #0x1ff0978
0x1ff0960: ldr      x0, [x23, #0x10]
0x1ff0964: mov      w1, wzr
0x1ff0968: mov      x3, xzr
0x1ff096c: bl       #0x1efb59c
0x1ff0970: b        #0x1ff0978
0x1ff0974: str      wzr, [x23, #0x18]
0x1ff0978: ldr      x23, [x19, #0x118]
0x1ff097c: cbz      x23, #0x1ff0acc
0x1ff0980: ldr      w20, [x23, #0x18]
0x1ff0984: cmp      w20, #1
0x1ff0988: b.mi     #0x1ff09cc
0x1ff098c: ldr      x0, [x19, #0x118]
0x1ff0990: cbz      x0, #0x1ff0acc
0x1ff0994: ldr      x3, [x21]
0x1ff0998: sub      w20, w20, #1
0x1ff099c: add      x2, sp, #8
0x1ff09a0: mov      w1, w20
0x1ff09a4: bl       #0x1c0c608
0x1ff09a8: ldr      x0, [sp, #8]
0x1ff09ac: cbz      x0, #0x1ff0acc
0x1ff09b0: ldr      x8, [x0]
0x1ff09b4: ldp      x9, x1, [x8, #0x198]
0x1ff09b8: blr      x9
0x1ff09bc: cmp      w20, #0
0x1ff09c0: b.gt     #0x1ff098c
0x1ff09c4: ldr      x23, [x19, #0x118]
0x1ff09c8: cbz      x23, #0x1ff0acc
0x1ff09cc: ldr      w8, [x23, #0x1c]
0x1ff09d0: ldr      x9, [x22]
0x1ff09d4: add      w8, w8, #1
0x1ff09d8: str      w8, [x23, #0x1c]
0x1ff09dc: ldr      x8, [x9, #0x20]
0x1ff09e0: ldr      x8, [x8, #0xc0]
0x1ff09e4: ldr      x0, [x8, #0xc8]
0x1ff09e8: bl       #0x13f6698
0x1ff09ec: tbz      w0, #0, #0x1ff0a14
0x1ff09f0: ldr      w2, [x23, #0x18]
0x1ff09f4: str      wzr, [x23, #0x18]
0x1ff09f8: cmp      w2, #1
0x1ff09fc: b.lt     #0x1ff0a18
0x1ff0a00: ldr      x0, [x23, #0x10]
0x1ff0a04: mov      w1, wzr
0x1ff0a08: mov      x3, xzr
0x1ff0a0c: bl       #0x1efb59c
0x1ff0a10: b        #0x1ff0a18
0x1ff0a14: str      wzr, [x23, #0x18]
0x1ff0a18: ldr      x23, [x19, #0x128]
0x1ff0a1c: cbz      x23, #0x1ff0acc
0x1ff0a20: ldr      w20, [x23, #0x18]
0x1ff0a24: cmp      w20, #1
0x1ff0a28: b.mi     #0x1ff0a6c
0x1ff0a2c: ldr      x0, [x19, #0x128]
0x1ff0a30: cbz      x0, #0x1ff0acc
0x1ff0a34: ldr      x3, [x21]
0x1ff0a38: sub      w20, w20, #1
0x1ff0a3c: add      x2, sp, #8
0x1ff0a40: mov      w1, w20
0x1ff0a44: bl       #0x1c0c608
0x1ff0a48: ldr      x0, [sp, #8]
0x1ff0a4c: cbz      x0, #0x1ff0acc
0x1ff0a50: ldr      x8, [x0]
0x1ff0a54: ldp      x9, x1, [x8, #0x198]
0x1ff0a58: blr      x9
0x1ff0a5c: cmp      w20, #0
0x1ff0a60: b.gt     #0x1ff0a2c
0x1ff0a64: ldr      x23, [x19, #0x128]
0x1ff0a68: cbz      x23, #0x1ff0acc
0x1ff0a6c: ldr      w8, [x23, #0x1c]
0x1ff0a70: ldr      x9, [x22]
0x1ff0a74: add      w8, w8, #1
0x1ff0a78: str      w8, [x23, #0x1c]
0x1ff0a7c: ldr      x8, [x9, #0x20]
0x1ff0a80: ldr      x8, [x8, #0xc0]
0x1ff0a84: ldr      x0, [x8, #0xc8]
0x1ff0a88: bl       #0x13f6698
0x1ff0a8c: tbz      w0, #0, #0x1ff0ab4
0x1ff0a90: ldr      w2, [x23, #0x18]
0x1ff0a94: str      wzr, [x23, #0x18]
0x1ff0a98: cmp      w2, #1
0x1ff0a9c: b.lt     #0x1ff0ab8
0x1ff0aa0: ldr      x0, [x23, #0x10]
0x1ff0aa4: mov      w1, wzr
0x1ff0aa8: mov      x3, xzr
0x1ff0aac: bl       #0x1efb59c
0x1ff0ab0: b        #0x1ff0ab8
0x1ff0ab4: str      wzr, [x23, #0x18]
0x1ff0ab8: ldp      x20, x19, [sp, #0x30]
0x1ff0abc: ldp      x22, x21, [sp, #0x20]
0x1ff0ac0: ldp      x30, x23, [sp, #0x10]
0x1ff0ac4: add      sp, sp, #0x40
0x1ff0ac8: ret      
0x1ff0acc: bl       #0x13f5ba4
0x1ff0ad0: stp      d11, d10, [sp, #-0x50]!
0x1ff0ad4: stp      d9, d8, [sp, #0x10]
0x1ff0ad8: str      x30, [sp, #0x20]
0x1ff0adc: stp      x22, x21, [sp, #0x30]
0x1ff0ae0: stp      x20, x19, [sp, #0x40]
0x1ff0ae4: fmov     s8, s3
0x1ff0ae8: fmov     s9, s2
0x1ff0aec: adrp     x21, #0x3032000
0x1ff0af0: fmov     s10, s1
0x1ff0af4: fmov     s11, s0
0x1ff0af8: adrp     x22, #0x2cdb000
0x1ff0afc: ldrb     w8, [x21, #0x60e]
0x1ff0b00: ldr      x22, [x22, #0xe08]
0x1ff0b04: mov      x19, x1
0x1ff0b08: mov      x20, x0
0x1ff0b0c: tbnz     w8, #0, #0x1ff0b24
0x1ff0b10: adrp     x0, #0x2cdb000
0x1ff0b14: ldr      x0, [x0, #0xe08]
0x1ff0b18: bl       #0x13f5940
0x1ff0b1c: mov      w8, #1
0x1ff0b20: strb     w8, [x21, #0x60e]
0x1ff0b24: ldr      x0, [x22]
0x1ff0b28: ldr      w8, [x0, #0xe4]
0x1ff0b2c: cbnz     w8, #0x1ff0b34
0x1ff0b30: bl       #0x13f5a78
0x1ff0b34: mov      x0, x19
0x1ff0b38: mov      x1, xzr
0x1ff0b3c: mov      x2, xzr
0x1ff0b40: bl       #0x270b30c
0x1ff0b44: tbz      w0, #0, #0x1ff0b80
0x1ff0b48: cbz      x19, #0x1ff0bc4
0x1ff0b4c: ldr      x8, [x19]
0x1ff0b50: mov      x0, x19
0x1ff0b54: ldp      x9, x1, [x8, #0x188]
0x1ff0b58: blr      x9
0x1ff0b5c: ldr      x8, [x19]
0x1ff0b60: mov      w21, w0
0x1ff0b64: mov      x0, x19
0x1ff0b68: ldp      x9, x1, [x8, #0x1a8]
0x1ff0b6c: blr      x9
0x1ff0b70: mov      w2, w0
0x1ff0b74: mov      x0, x20
0x1ff0b78: mov      w1, w21
0x1ff0b7c: b        #0x1ff0b88
0x1ff0b80: ldp      w1, w2, [x20, #0x50]
0x1ff0b84: mov      x0, x20
0x1ff0b88: mov      w3, wzr
0x1ff0b8c: bl       #0x1ff17d4
0x1ff0b90: mov      x0, x20
0x1ff0b94: mov      x1, x19
0x1ff0b98: fmov     s2, s9
0x1ff0b9c: fmov     s3, s8
0x1ff0ba0: ldp      x20, x19, [sp, #0x40]
0x1ff0ba4: ldp      x22, x21, [sp, #0x30]
0x1ff0ba8: ldr      x30, [sp, #0x20]
0x1ff0bac: ldp      d9, d8, [sp, #0x10]
0x1ff0bb0: fmov     s0, s11
0x1ff0bb4: fmov     s1, s10
0x1ff0bb8: mov      w2, #1
0x1ff0bbc: ldp      d11, d10, [sp], #0x50
0x1ff0bc0: b        #0x1fed82c
0x1ff0bc4: bl       #0x13f5ba4
0x1ff0bc8: sub      sp, sp, #0x180
0x1ff0bcc: stp      d15, d14, [sp, #0xe0]
0x1ff0bd0: stp      d13, d12, [sp, #0xf0]
0x1ff0bd4: stp      d11, d10, [sp, #0x100]
0x1ff0bd8: stp      d9, d8, [sp, #0x110]
0x1ff0bdc: stp      x29, x30, [sp, #0x120]
0x1ff0be0: stp      x28, x27, [sp, #0x130]
0x1ff0be4: stp      x26, x25, [sp, #0x140]
0x1ff0be8: stp      x24, x23, [sp, #0x150]
0x1ff0bec: stp      x22, x21, [sp, #0x160]
0x1ff0bf0: stp      x20, x19, [sp, #0x170]
0x1ff0bf4: adrp     x20, #0x3032000
0x1ff0bf8: mov      x19, x0
0x1ff0bfc: ldrb     w8, [x20, #0x606]
0x1ff0c00: tbnz     w8, #0, #0x1ff0c6c
0x1ff0c04: adrp     x0, #0x2d14000
0x1ff0c08: ldr      x0, [x0, #0xc40]
0x1ff0c0c: bl       #0x13f5940
0x1ff0c10: adrp     x0, #0x2d14000
0x1ff0c14: ldr      x0, [x0, #0xc10]
0x1ff0c18: bl       #0x13f5940
0x1ff0c1c: adrp     x0, #0x2d14000
0x1ff0c20: ldr      x0, [x0, #0xc48]
0x1ff0c24: bl       #0x13f5940
0x1ff0c28: adrp     x0, #0x2d14000
0x1ff0c2c: ldr      x0, [x0, #0xc18]
0x1ff0c30: bl       #0x13f5940
0x1ff0c34: adrp     x0, #0x2d14000
0x1ff0c38: ldr      x0, [x0, #0xcd8]
0x1ff0c3c: bl       #0x13f5940
0x1ff0c40: adrp     x0, #0x2d14000
0x1ff0c44: ldr      x0, [x0, #0xc98]
0x1ff0c48: bl       #0x13f5940
0x1ff0c4c: adrp     x0, #0x2cdb000
0x1ff0c50: ldr      x0, [x0, #0xe08]
0x1ff0c54: bl       #0x13f5940
0x1ff0c58: adrp     x0, #0x2d14000
0x1ff0c5c: ldr      x0, [x0, #0xc50]
0x1ff0c60: bl       #0x13f5940
0x1ff0c64: mov      w8, #1
0x1ff0c68: strb     w8, [x20, #0x606]
0x1ff0c6c: movi     v0.2d, #0000000000000000
0x1ff0c70: mov      x0, x19
0x1ff0c74: str      wzr, [sp, #0x5c]
0x1ff0c78: stp      q0, q0, [sp, #0x10]
0x1ff0c7c: stp      q0, q0, [sp, #0x30]
0x1ff0c80: bl       #0x1ff1130
0x1ff0c84: tbz      w0, #0, #0x1ff0f24
0x1ff0c88: add      x1, sp, #0x5c
0x1ff0c8c: mov      x0, x19
0x1ff0c90: str      wzr, [sp, #0x5c]
0x1ff0c94: bl       #0x1ff1248
0x1ff0c98: tbz      w0, #0, #0x1ff0cb4
0x1ff0c9c: ldp      s0, s1, [x19, #0x60]
0x1ff0ca0: mov      x0, x19
0x1ff0ca4: ldp      s2, s3, [x19, #0x68]
0x1ff0ca8: mov      w2, wzr
0x1ff0cac: ldr      x1, [x19, #0x58]
0x1ff0cb0: bl       #0x1fed82c
0x1ff0cb4: mov      x0, x19
0x1ff0cb8: mov      x1, xzr
0x1ff0cbc: bl       #0x2711618
0x1ff0cc0: cbz      x0, #0x1ff0f8c
0x1ff0cc4: add      x8, sp, #0xa0
0x1ff0cc8: mov      x1, xzr
0x1ff0ccc: bl       #0x2731f60
0x1ff0cd0: ldp      q0, q1, [sp, #0xa0]
0x1ff0cd4: add      x0, sp, #0x10
0x1ff0cd8: mov      x1, xzr
0x1ff0cdc: stp      q0, q1, [sp, #0x10]
0x1ff0ce0: ldp      q0, q2, [sp, #0xc0]
0x1ff0ce4: stp      q0, q2, [sp, #0x30]
0x1ff0ce8: bl       #0x26f1ba0
0x1ff0cec: ldr      w20, [sp, #0x5c]
0x1ff0cf0: ldr      w8, [x19, #0xe8]
0x1ff0cf4: cmp      w20, w8
0x1ff0cf8: b.gt     #0x1ff0f10
0x1ff0cfc: fadd     s4, s0, s0
0x1ff0d00: fadd     s5, s1, s1
0x1ff0d04: adrp     x24, #0x2cdb000
0x1ff0d08: fadd     s6, s2, s2
0x1ff0d0c: ldr      x24, [x24, #0xe08]
0x1ff0d10: adrp     x28, #0x2d14000
0x1ff0d14: adrp     x29, #0x2d14000
0x1ff0d18: add      x25, sp, #0x60
0x1ff0d1c: mov      w26, #0x3f800000
0x1ff0d20: fmul     s7, s0, s4
0x1ff0d24: fmul     s16, s1, s5
0x1ff0d28: fmul     s2, s2, s6
0x1ff0d2c: fmul     s17, s0, s5
0x1ff0d30: fmul     s18, s3, s6
0x1ff0d34: fmul     s0, s0, s6
0x1ff0d38: fmul     s5, s3, s5
0x1ff0d3c: fmul     s1, s1, s6
0x1ff0d40: fmul     s3, s3, s4
0x1ff0d44: fmov     s4, #1.00000000
0x1ff0d48: fadd     s6, s16, s2
0x1ff0d4c: fadd     s2, s7, s2
0x1ff0d50: fadd     s7, s7, s16
0x1ff0d54: fadd     s16, s17, s18
0x1ff0d58: fsub     s10, s17, s18
0x1ff0d5c: fsub     s9, s0, s5
0x1ff0d60: fadd     s12, s0, s5
0x1ff0d64: fadd     s11, s1, s3
0x1ff0d68: fsub     s13, s1, s3
0x1ff0d6c: fsub     s14, s4, s6
0x1ff0d70: fsub     s15, s4, s2
0x1ff0d74: fsub     s8, s4, s7
0x1ff0d78: str      s16, [sp, #0xc]
0x1ff0d7c: ldr      x28, [x28, #0xc98]
0x1ff0d80: ldr      x29, [x29, #0xc10]
0x1ff0d84: ldr      x0, [x19, #0xe0]
0x1ff0d88: cbz      x0, #0x1ff0f8c
0x1ff0d8c: adrp     x8, #0x2d14000
0x1ff0d90: add      x2, sp, #0xa0
0x1ff0d94: mov      w1, w20
0x1ff0d98: ldr      x8, [x8, #0xcd8]
0x1ff0d9c: ldr      x3, [x8]
0x1ff0da0: bl       #0x1c0c608
0x1ff0da4: ldr      x27, [sp, #0xa0]
0x1ff0da8: cbz      x27, #0x1ff0f8c
0x1ff0dac: ldr      x0, [x24]
0x1ff0db0: ldr      x21, [x27, #0x10]
0x1ff0db4: ldr      w8, [x0, #0xe4]
0x1ff0db8: cbnz     w8, #0x1ff0dc0
0x1ff0dbc: bl       #0x13f5a78
0x1ff0dc0: mov      x0, x21
0x1ff0dc4: mov      x1, xzr
0x1ff0dc8: mov      x2, xzr
0x1ff0dcc: bl       #0x270b30c
0x1ff0dd0: tbz      w0, #0, #0x1ff0df8
0x1ff0dd4: fmov     s0, #1.00000000
0x1ff0dd8: fmov     s1, #1.00000000
0x1ff0ddc: ldr      x1, [x27, #0x10]
0x1ff0de0: fmov     s2, #1.00000000
0x1ff0de4: fmov     s3, #1.00000000
0x1ff0de8: mov      x0, x19
0x1ff0dec: mov      w2, wzr
0x1ff0df0: bl       #0x1fed82c
0x1ff0df4: b        #0x1ff0f00
0x1ff0df8: ldr      x21, [x27, #0x18]
0x1ff0dfc: cbz      x21, #0x1ff0f8c
0x1ff0e00: ldr      w23, [x21, #0x18]
0x1ff0e04: cmp      w23, #1
0x1ff0e08: b.lt     #0x1ff0f00
0x1ff0e0c: adrp     x8, #0x2d14000
0x1ff0e10: ldr      x8, [x8, #0xc40]
0x1ff0e14: ldr      x0, [x8]
0x1ff0e18: bl       #0x13f5b94
0x1ff0e1c: adrp     x8, #0x2d14000
0x1ff0e20: mov      x1, xzr
0x1ff0e24: mov      x3, xzr
0x1ff0e28: ldr      x8, [x8, #0xc50]
0x1ff0e2c: mov      x22, x0
0x1ff0e30: ldr      x2, [x8]
0x1ff0e34: bl       #0x1b8ed9c
0x1ff0e38: adrp     x8, #0x2d14000
0x1ff0e3c: mov      x0, x21
0x1ff0e40: mov      x1, x22
0x1ff0e44: ldr      x8, [x8, #0xc48]
0x1ff0e48: ldr      x2, [x8]
0x1ff0e4c: bl       #0x1c0f86c
0x1ff0e50: mov      w21, wzr
0x1ff0e54: ldr      x0, [x27, #0x18]
0x1ff0e58: cbz      x0, #0x1ff0f8c
0x1ff0e5c: ldr      x3, [x28]
0x1ff0e60: add      x2, sp, #0xa0
0x1ff0e64: mov      w1, w21
0x1ff0e68: bl       #0x1c0c608
0x1ff0e6c: ldr      x0, [sp, #0xa0]
0x1ff0e70: cbz      x0, #0x1ff0f8c
0x1ff0e74: ldr      x8, [x0]
0x1ff0e78: ldp      x9, x1, [x8, #0x1b8]
0x1ff0e7c: blr      x9
0x1ff0e80: cbz      x0, #0x1ff0f8c
0x1ff0e84: ldp      q0, q1, [sp, #0x10]
0x1ff0e88: add      x1, sp, #0xa0
0x1ff0e8c: ldr      x8, [x0]
0x1ff0e90: add      x2, sp, #0x60
0x1ff0e94: mov      x22, x0
0x1ff0e98: ldr      x9, [x8, #0x1a8]
0x1ff0e9c: stp      q0, q1, [sp, #0xa0]
0x1ff0ea0: ldp      q2, q0, [sp, #0x30]
0x1ff0ea4: str      s9, [sp, #0x68]
0x1ff0ea8: str      wzr, [sp, #0x6c]
0x1ff0eac: stp      s10, s15, [sp, #0x70]
0x1ff0eb0: stp      q2, q0, [sp, #0xc0]
0x1ff0eb4: ldr      s0, [sp, #0xc]
0x1ff0eb8: str      s11, [sp, #0x78]
0x1ff0ebc: stp      s14, s0, [sp, #0x60]
0x1ff0ec0: str      wzr, [sp, #0x7c]
0x1ff0ec4: stp      s12, s13, [sp, #0x80]
0x1ff0ec8: str      s8, [sp, #0x88]
0x1ff0ecc: stur     xzr, [x25, #0x34]
0x1ff0ed0: stur     xzr, [x25, #0x2c]
0x1ff0ed4: str      w26, [sp, #0x9c]
0x1ff0ed8: ldr      x3, [x8, #0x1b0]
0x1ff0edc: blr      x9
0x1ff0ee0: ldr      x0, [x19, #0x118]
0x1ff0ee4: cbz      x0, #0x1ff0f8c
0x1ff0ee8: ldr      x2, [x29]
0x1ff0eec: mov      x1, x22
0x1ff0ef0: bl       #0x14fd2ac
0x1ff0ef4: add      w21, w21, #1
0x1ff0ef8: cmp      w23, w21
0x1ff0efc: b.ne     #0x1ff0e54
0x1ff0f00: ldr      w8, [x19, #0xe8]
0x1ff0f04: add      w20, w20, #1
0x1ff0f08: cmp      w20, w8
0x1ff0f0c: b.le     #0x1ff0d84
0x1ff0f10: mov      x0, x19
0x1ff0f14: mov      w1, wzr
0x1ff0f18: mov      w2, wzr
0x1ff0f1c: bl       #0x1fef010
0x1ff0f20: b        #0x1ff0f3c
0x1ff0f24: ldp      s0, s1, [x19, #0x60]
0x1ff0f28: mov      x0, x19
0x1ff0f2c: ldp      s2, s3, [x19, #0x68]
0x1ff0f30: mov      w2, #1
0x1ff0f34: ldr      x1, [x19, #0x58]
0x1ff0f38: bl       #0x1fed82c
0x1ff0f3c: ldr      x8, [x19, #0xc0]
0x1ff0f40: cbz      x8, #0x1ff0f5c
0x1ff0f44: ldr      x9, [x8, #0x18]
0x1ff0f48: ldr      x0, [x8, #0x40]
0x1ff0f4c: add      x1, sp, #0xa0
0x1ff0f50: ldr      x2, [x8, #0x28]
0x1ff0f54: strb     wzr, [sp, #0xa0]
0x1ff0f58: blr      x9
0x1ff0f5c: ldp      x20, x19, [sp, #0x170]
0x1ff0f60: ldp      x22, x21, [sp, #0x160]
0x1ff0f64: ldp      x24, x23, [sp, #0x150]
0x1ff0f68: ldp      x26, x25, [sp, #0x140]
0x1ff0f6c: ldp      x28, x27, [sp, #0x130]
0x1ff0f70: ldp      x29, x30, [sp, #0x120]
0x1ff0f74: ldp      d9, d8, [sp, #0x110]
0x1ff0f78: ldp      d11, d10, [sp, #0x100]
0x1ff0f7c: ldp      d13, d12, [sp, #0xf0]
0x1ff0f80: ldp      d15, d14, [sp, #0xe0]
0x1ff0f84: add      sp, sp, #0x180
0x1ff0f88: ret      
0x1ff0f8c: bl       #0x13f5ba4
0x1ff0f90: ldr      x8, [x0, #0xc0]
0x1ff0f94: cbz      x8, #0x1ff0fbc
0x1ff0f98: str      x30, [sp, #-0x10]!
0x1ff0f9c: ldr      x10, [x8, #0x18]
0x1ff0fa0: ldr      x0, [x8, #0x40]
0x1ff0fa4: and      w9, w1, #1
0x1ff0fa8: ldr      x2, [x8, #0x28]
0x1ff0fac: add      x1, sp, #0xc
0x1ff0fb0: strb     w9, [sp, #0xc]
0x1ff0fb4: blr      x10
0x1ff0fb8: ldr      x30, [sp], #0x10
0x1ff0fbc: ret      

; DrawingPage.OnSaveButtonUp [0x153c0dc, 0x153c0e0)
0x153c0dc: ret      

; DrawingPage.OnButtonTrash [0x153c18c, 0x153c430)
0x153c18c: str      d8, [sp, #-0x30]!
0x153c190: stp      x30, x21, [sp, #0x10]
0x153c194: stp      x20, x19, [sp, #0x20]
0x153c198: adrp     x20, #0x302d000
0x153c19c: mov      x19, x0
0x153c1a0: ldrb     w8, [x20, #0x457]
0x153c1a4: tbnz     w8, #0, #0x153c204
0x153c1a8: adrp     x0, #0x2cdc000
0x153c1ac: ldr      x0, [x0, #0x948]
0x153c1b0: bl       #0x13f5940
0x153c1b4: adrp     x0, #0x2cdb000
0x153c1b8: ldr      x0, [x0, #0xe10]
0x153c1bc: bl       #0x13f5940
0x153c1c0: adrp     x0, #0x2cdd000
0x153c1c4: ldr      x0, [x0, #0xe38]
0x153c1c8: bl       #0x13f5940
0x153c1cc: adrp     x0, #0x2cdd000
0x153c1d0: ldr      x0, [x0, #0xe40]
0x153c1d4: bl       #0x13f5940
0x153c1d8: adrp     x0, #0x2cdd000
0x153c1dc: ldr      x0, [x0, #0xe48]
0x153c1e0: bl       #0x13f5940
0x153c1e4: adrp     x0, #0x2cdd000
0x153c1e8: ldr      x0, [x0, #0xe50]
0x153c1ec: bl       #0x13f5940
0x153c1f0: adrp     x0, #0x2cdd000
0x153c1f4: ldr      x0, [x0, #0xbc0]
0x153c1f8: bl       #0x13f5940
0x153c1fc: mov      w8, #1
0x153c200: strb     w8, [x20, #0x457]
0x153c204: adrp     x21, #0x2cdd000
0x153c208: adrp     x20, #0x2cdb000
0x153c20c: mov      x0, xzr
0x153c210: ldr      x21, [x21, #0xbc0]
0x153c214: ldr      x20, [x20, #0xe10]
0x153c218: bl       #0x272c998
0x153c21c: ldr      s1, [x19, #0x90]
0x153c220: mov      x0, xzr
0x153c224: fsub     s8, s0, s1
0x153c228: bl       #0x272c998
0x153c22c: fmov     s1, #2.00000000
0x153c230: fcmp     s8, s1
0x153c234: b.ls     #0x153c32c
0x153c238: ldr      x0, [x21]
0x153c23c: str      s0, [x19, #0x90]
0x153c240: ldr      w8, [x0, #0xe4]
0x153c244: cbnz     w8, #0x153c24c
0x153c248: bl       #0x13f5a78
0x153c24c: mov      x0, xzr
0x153c250: bl       #0x15cd838
0x153c254: ldr      x8, [x20]
0x153c258: mov      x20, x0
0x153c25c: ldr      w9, [x8, #0xe4]
0x153c260: cbnz     w9, #0x153c26c
0x153c264: mov      x0, x8
0x153c268: bl       #0x13f5a78
0x153c26c: mov      x0, x20
0x153c270: mov      x1, xzr
0x153c274: bl       #0x2614cc8
0x153c278: ldr      x0, [x19, #0x50]
0x153c27c: cbz      x0, #0x153c42c
0x153c280: adrp     x8, #0x2cdc000
0x153c284: add      x1, sp, #8
0x153c288: ldr      x8, [x8, #0x948]
0x153c28c: ldr      x2, [x8]
0x153c290: bl       #0x197dd4c
0x153c294: ldr      x0, [sp, #8]
0x153c298: cbz      x0, #0x153c42c
0x153c29c: ldr      x8, [x0]
0x153c2a0: fmov     s0, #1.00000000
0x153c2a4: fmov     s1, #1.00000000
0x153c2a8: fmov     s2, #1.00000000
0x153c2ac: fmov     s3, #1.00000000
0x153c2b0: ldr      x9, [x8, #0x2a8]
0x153c2b4: ldr      x1, [x8, #0x2b0]
0x153c2b8: blr      x9
0x153c2bc: mov      x0, x19
0x153c2c0: mov      x1, xzr
0x153c2c4: bl       #0x2711618
0x153c2c8: movi     d0, #0000000000000000
0x153c2cc: fmov     s1, #2.00000000
0x153c2d0: mov      w1, wzr
0x153c2d4: mov      x2, xzr
0x153c2d8: bl       #0x191c118
0x153c2dc: adrp     x8, #0x2cdd000
0x153c2e0: mov      x20, x0
0x153c2e4: ldr      x8, [x8, #0xe48]
0x153c2e8: ldr      x8, [x8]
0x153c2ec: mov      x0, x8
0x153c2f0: bl       #0x13f5b94
0x153c2f4: adrp     x8, #0x2cdd000
0x153c2f8: mov      x1, x19
0x153c2fc: mov      x3, xzr
0x153c300: ldr      x8, [x8, #0xe38]
0x153c304: mov      x21, x0
0x153c308: ldr      x2, [x8]
0x153c30c: bl       #0x1917e30
0x153c310: adrp     x8, #0x2cdd000
0x153c314: mov      x0, x20
0x153c318: mov      x1, x21
0x153c31c: ldr      x8, [x8, #0xe50]
0x153c320: ldr      x2, [x8]
0x153c324: bl       #0x1a3a678
0x153c328: b        #0x153c41c
0x153c32c: fmov     s1, #-3.00000000
0x153c330: ldr      x0, [x21]
0x153c334: fadd     s0, s0, s1
0x153c338: str      s0, [x19, #0x90]
0x153c33c: ldr      w8, [x0, #0xe4]
0x153c340: cbnz     w8, #0x153c348
0x153c344: bl       #0x13f5a78
0x153c348: mov      x0, xzr
0x153c34c: bl       #0x15cd798
0x153c350: ldr      x8, [x20]
0x153c354: mov      x20, x0
0x153c358: ldr      w9, [x8, #0xe4]
0x153c35c: cbnz     w9, #0x153c368
0x153c360: mov      x0, x8
0x153c364: bl       #0x13f5a78
0x153c368: mov      x0, x20
0x153c36c: mov      x1, xzr
0x153c370: bl       #0x2614cc8
0x153c374: ldr      x0, [x19, #0x50]
0x153c378: mov      w1, wzr
0x153c37c: mov      x2, xzr
0x153c380: bl       #0x191d910
0x153c384: ldr      x8, [x19, #0x60]
0x153c388: cbz      x8, #0x153c42c
0x153c38c: adrp     x9, #0x2cdd000
0x153c390: ldr      x9, [x9, #0xe40]
0x153c394: ldr      x20, [x8, #0x30]
0x153c398: ldr      x0, [x9]
0x153c39c: ldr      w9, [x0, #0xe4]
0x153c3a0: cbnz     w9, #0x153c3a8
0x153c3a4: bl       #0x13f5a78
0x153c3a8: mov      x0, x20
0x153c3ac: mov      x1, xzr
0x153c3b0: bl       #0x19368b4
0x153c3b4: ldr      x0, [x19, #0x70]
0x153c3b8: cbz      x0, #0x153c42c
0x153c3bc: mov      x1, xzr
0x153c3c0: bl       #0x1fcad0c
0x153c3c4: ldr      x0, [x19, #0x50]
0x153c3c8: cbz      x0, #0x153c42c
0x153c3cc: adrp     x8, #0x2cdc000
0x153c3d0: add      x1, sp, #8
0x153c3d4: ldr      x8, [x8, #0x948]
0x153c3d8: ldr      x2, [x8]
0x153c3dc: bl       #0x197dd4c
0x153c3e0: ldr      x0, [sp, #8]
0x153c3e4: cbz      x0, #0x153c42c
0x153c3e8: ldr      x8, [x0]
0x153c3ec: fmov     s0, #1.00000000
0x153c3f0: fmov     s1, #1.00000000
0x153c3f4: fmov     s2, #1.00000000
0x153c3f8: fmov     s3, #0.50000000
0x153c3fc: ldr      x9, [x8, #0x2a8]
0x153c400: ldr      x1, [x8, #0x2b0]
0x153c404: blr      x9
0x153c408: ldr      x0, [x19, #0x78]
0x153c40c: cbz      x0, #0x153c42c
0x153c410: mov      x1, xzr
0x153c414: mov      x2, xzr
0x153c418: bl       #0x25f4f58
0x153c41c: ldp      x20, x19, [sp, #0x20]
0x153c420: ldp      x30, x21, [sp, #0x10]
0x153c424: ldr      d8, [sp], #0x30
0x153c428: ret      
0x153c42c: bl       #0x13f5ba4

; PaintablesController.Undo [0x153dbd0, 0x153dd24)
0x153dbd0: str      x30, [sp, #-0x40]!
0x153dbd4: stp      x24, x23, [sp, #0x10]
0x153dbd8: stp      x22, x21, [sp, #0x20]
0x153dbdc: stp      x20, x19, [sp, #0x30]
0x153dbe0: adrp     x20, #0x302d000
0x153dbe4: adrp     x22, #0x2cdd000
0x153dbe8: mov      x19, x0
0x153dbec: ldrb     w8, [x20, #0x467]
0x153dbf0: ldr      x22, [x22, #0xbc0]
0x153dbf4: tbnz     w8, #0, #0x153dc30
0x153dbf8: adrp     x0, #0x2cdb000
0x153dbfc: ldr      x0, [x0, #0xe10]
0x153dc00: bl       #0x13f5940
0x153dc04: adrp     x0, #0x2cdd000
0x153dc08: ldr      x0, [x0, #0xef8]
0x153dc0c: bl       #0x13f5940
0x153dc10: adrp     x0, #0x2cdd000
0x153dc14: ldr      x0, [x0, #0xf00]
0x153dc18: bl       #0x13f5940
0x153dc1c: adrp     x0, #0x2cdd000
0x153dc20: ldr      x0, [x0, #0xbc0]
0x153dc24: bl       #0x13f5940
0x153dc28: mov      w8, #1
0x153dc2c: strb     w8, [x20, #0x467]
0x153dc30: ldr      x0, [x22]
0x153dc34: adrp     x23, #0x2cdb000
0x153dc38: ldr      w8, [x0, #0xe4]
0x153dc3c: ldr      x23, [x23, #0xe10]
0x153dc40: cbnz     w8, #0x153dc48
0x153dc44: bl       #0x13f5a78
0x153dc48: mov      x0, xzr
0x153dc4c: bl       #0x15cd8d8
0x153dc50: ldr      x8, [x23]
0x153dc54: mov      x20, x0
0x153dc58: ldr      w9, [x8, #0xe4]
0x153dc5c: cbnz     w9, #0x153dc68
0x153dc60: mov      x0, x8
0x153dc64: bl       #0x13f5a78
0x153dc68: mov      x0, x20
0x153dc6c: mov      x1, xzr
0x153dc70: bl       #0x2614cc8
0x153dc74: ldr      x8, [x19, #0x28]
0x153dc78: cbz      x8, #0x153dd0c
0x153dc7c: adrp     x24, #0x2cdd000
0x153dc80: mov      w20, wzr
0x153dc84: ldr      x24, [x24, #0xf00]
0x153dc88: ldr      w8, [x8, #0x18]
0x153dc8c: cmp      w20, w8
0x153dc90: b.ge     #0x153dd10
0x153dc94: ldr      x0, [x22]
0x153dc98: ldr      w8, [x0, #0xe4]
0x153dc9c: cbnz     w8, #0x153dca4
0x153dca0: bl       #0x13f5a78
0x153dca4: mov      x0, xzr
0x153dca8: bl       #0x15cd978
0x153dcac: ldr      x8, [x23]
0x153dcb0: mov      x21, x0
0x153dcb4: ldr      w9, [x8, #0xe4]
0x153dcb8: cbnz     w9, #0x153dcc4
0x153dcbc: mov      x0, x8
0x153dcc0: bl       #0x13f5a78
0x153dcc4: mov      x0, x21
0x153dcc8: mov      x1, xzr
0x153dccc: bl       #0x2614cc8
0x153dcd0: ldr      x0, [x19, #0x28]
0x153dcd4: cbz      x0, #0x153dd0c
0x153dcd8: ldr      x3, [x24]
0x153dcdc: add      x2, sp, #8
0x153dce0: mov      w1, w20
0x153dce4: bl       #0x1c0c608
0x153dce8: ldr      x8, [sp, #8]
0x153dcec: cbz      x8, #0x153dd0c
0x153dcf0: ldr      x0, [x8, #0x20]
0x153dcf4: cbz      x0, #0x153dd0c
0x153dcf8: mov      x1, xzr
0x153dcfc: bl       #0x1ff0768
0x153dd00: ldr      x8, [x19, #0x28]
0x153dd04: add      w20, w20, #1
0x153dd08: cbnz     x8, #0x153dc88
0x153dd0c: bl       #0x13f5ba4
0x153dd10: ldp      x20, x19, [sp, #0x30]
0x153dd14: ldp      x22, x21, [sp, #0x20]
0x153dd18: ldp      x24, x23, [sp, #0x10]
0x153dd1c: ldr      x30, [sp], #0x40
0x153dd20: ret      

; SaveImage.OnSave [0x15613fc, 0x156150c)
0x15613fc: stp      x30, x21, [sp, #-0x20]!
0x1561400: stp      x20, x19, [sp, #0x10]
0x1561404: adrp     x20, #0x302d000
0x1561408: mov      x19, x0
0x156140c: ldrb     w8, [x20, #0x5b7]
0x1561410: tbnz     w8, #0, #0x1561434
0x1561414: adrp     x0, #0x2cdb000
0x1561418: ldr      x0, [x0, #0xf18]
0x156141c: bl       #0x13f5940
0x1561420: adrp     x0, #0x2cde000
0x1561424: ldr      x0, [x0, #0x690]
0x1561428: bl       #0x13f5940
0x156142c: mov      w8, #1
0x1561430: strb     w8, [x20, #0x5b7]
0x1561434: ldr      x0, [x19, #0xa0]
0x1561438: cbz      x0, #0x1561508
0x156143c: mov      w1, #1
0x1561440: mov      x2, xzr
0x1561444: mov      w20, #1
0x1561448: bl       #0x2716e14
0x156144c: adrp     x21, #0x302d000
0x1561450: ldrb     w8, [x21, #0x51c]
0x1561454: cbnz     w8, #0x1561468
0x1561458: adrp     x0, #0x2cdd000
0x156145c: ldr      x0, [x0, #0xed8]
0x1561460: bl       #0x13f5940
0x1561464: strb     w20, [x21, #0x51c]
0x1561468: adrp     x8, #0x2cdd000
0x156146c: adrp     x20, #0x2cdb000
0x1561470: ldr      x8, [x8, #0xed8]
0x1561474: ldr      x8, [x8]
0x1561478: ldr      x8, [x8, #0xb8]
0x156147c: ldr      x8, [x8]
0x1561480: ldr      x20, [x20, #0xf18]
0x1561484: cbz      x8, #0x1561498
0x1561488: ldr      x9, [x8, #0x18]
0x156148c: ldr      x0, [x8, #0x40]
0x1561490: ldr      x1, [x8, #0x28]
0x1561494: blr      x9
0x1561498: ldr      x0, [x20]
0x156149c: ldr      w8, [x0, #0xe4]
0x15614a0: cbnz     w8, #0x15614a8
0x15614a4: bl       #0x13f5a78
0x15614a8: mov      x0, xzr
0x15614ac: bl       #0x25fda7c
0x15614b0: cmp      w0, #8
0x15614b4: b.eq     #0x15614dc
0x15614b8: adrp     x8, #0x2cde000
0x15614bc: ldr      x8, [x8, #0x690]
0x15614c0: ldr      x8, [x8]
0x15614c4: ldr      x8, [x8, #0xb8]
0x15614c8: ldr      x0, [x8]
0x15614cc: cbz      x0, #0x15614dc
0x15614d0: mov      w1, #1
0x15614d4: mov      x2, xzr
0x15614d8: bl       #0x18562fc
0x15614dc: mov      x0, x19
0x15614e0: mov      w1, wzr
0x15614e4: bl       #0x156150c
0x15614e8: mov      x0, x19
0x15614ec: bl       #0x15615b4
0x15614f0: mov      x1, x0
0x15614f4: mov      x0, x19
0x15614f8: mov      x2, xzr
0x15614fc: ldp      x20, x19, [sp, #0x10]
0x1561500: ldp      x30, x21, [sp], #0x20
0x1561504: b        #0x2719f20
0x1561508: bl       #0x13f5ba4

; IntroSceneDRA.PlaySpine [0x1584abc, 0x1584c9c)
0x1584abc: str      x30, [sp, #-0x30]!
0x1584ac0: stp      x22, x21, [sp, #0x10]
0x1584ac4: stp      x20, x19, [sp, #0x20]
0x1584ac8: adrp     x20, #0x302d000
0x1584acc: mov      x19, x0
0x1584ad0: ldrb     w8, [x20, #0x72a]
0x1584ad4: tbnz     w8, #0, #0x1584b40
0x1584ad8: adrp     x0, #0x2cdd000
0x1584adc: ldr      x0, [x0, #0xe40]
0x1584ae0: bl       #0x13f5940
0x1584ae4: adrp     x0, #0x2cdf000
0x1584ae8: ldr      x0, [x0, #0x7d0]
0x1584aec: bl       #0x13f5940
0x1584af0: adrp     x0, #0x2cdf000
0x1584af4: ldr      x0, [x0, #0x7d8]
0x1584af8: bl       #0x13f5940
0x1584afc: adrp     x0, #0x2cdb000
0x1584b00: ldr      x0, [x0, #0xe08]
0x1584b04: bl       #0x13f5940
0x1584b08: adrp     x0, #0x2cdf000
0x1584b0c: ldr      x0, [x0, #0x7e0]
0x1584b10: bl       #0x13f5940
0x1584b14: adrp     x0, #0x2cdf000
0x1584b18: ldr      x0, [x0, #0x7e8]
0x1584b1c: bl       #0x13f5940
0x1584b20: adrp     x0, #0x2cdf000
0x1584b24: ldr      x0, [x0, #0x7f0]
0x1584b28: bl       #0x13f5940
0x1584b2c: adrp     x0, #0x2cdf000
0x1584b30: ldr      x0, [x0, #0x7f8]
0x1584b34: bl       #0x13f5940
0x1584b38: mov      w8, #1
0x1584b3c: strb     w8, [x20, #0x72a]
0x1584b40: ldr      x0, [x19, #0x40]
0x1584b44: cbz      x0, #0x1584c98
0x1584b48: adrp     x20, #0x2cdf000
0x1584b4c: adrp     x21, #0x2cdf000
0x1584b50: mov      x1, xzr
0x1584b54: ldr      x20, [x20, #0x7e8]
0x1584b58: ldr      x21, [x21, #0x7d0]
0x1584b5c: bl       #0x204e5e0
0x1584b60: ldr      x8, [x20]
0x1584b64: mov      x20, x0
0x1584b68: mov      x0, x8
0x1584b6c: bl       #0x13f5b94
0x1584b70: ldr      x2, [x21]
0x1584b74: mov      x1, x19
0x1584b78: mov      x3, xzr
0x1584b7c: mov      x21, x0
0x1584b80: bl       #0x2023750
0x1584b84: cbz      x20, #0x1584c98
0x1584b88: adrp     x22, #0x2cdf000
0x1584b8c: mov      x0, x20
0x1584b90: mov      x1, x21
0x1584b94: ldr      x22, [x22, #0x7f8]
0x1584b98: mov      x2, xzr
0x1584b9c: bl       #0x201fe08
0x1584ba0: ldr      x0, [x22]
0x1584ba4: ldr      x19, [x19, #0x28]
0x1584ba8: ldr      w8, [x0, #0xe4]
0x1584bac: cbnz     w8, #0x1584bb8
0x1584bb0: bl       #0x13f5a78
0x1584bb4: ldr      x0, [x22]
0x1584bb8: ldr      x8, [x0, #0xb8]
0x1584bbc: ldr      x20, [x8, #8]
0x1584bc0: cbnz     x20, #0x1584c14
0x1584bc4: ldr      w9, [x0, #0xe4]
0x1584bc8: cbnz     w9, #0x1584bd8
0x1584bcc: bl       #0x13f5a78
0x1584bd0: ldr      x8, [x22]
0x1584bd4: ldr      x8, [x8, #0xb8]
0x1584bd8: adrp     x9, #0x2cdf000
0x1584bdc: ldr      x9, [x9, #0x7e0]
0x1584be0: ldr      x21, [x8]
0x1584be4: ldr      x0, [x9]
0x1584be8: bl       #0x13f5b94
0x1584bec: adrp     x8, #0x2cdf000
0x1584bf0: mov      x1, x21
0x1584bf4: mov      x3, xzr
0x1584bf8: ldr      x8, [x8, #0x7f0]
0x1584bfc: mov      x20, x0
0x1584c00: ldr      x2, [x8]
0x1584c04: bl       #0x1c418bc
0x1584c08: ldr      x8, [x22]
0x1584c0c: ldr      x8, [x8, #0xb8]
0x1584c10: str      x20, [x8, #8]
0x1584c14: cbz      x19, #0x1584c98
0x1584c18: adrp     x8, #0x2cdf000
0x1584c1c: adrp     x21, #0x2cdb000
0x1584c20: add      x2, sp, #8
0x1584c24: ldr      x8, [x8, #0x7d8]
0x1584c28: ldr      x21, [x21, #0xe08]
0x1584c2c: mov      x0, x19
0x1584c30: mov      x1, x20
0x1584c34: ldr      x3, [x8]
0x1584c38: bl       #0x1c0d82c
0x1584c3c: ldr      x0, [x21]
0x1584c40: ldr      x19, [sp, #8]
0x1584c44: ldr      w8, [x0, #0xe4]
0x1584c48: cbnz     w8, #0x1584c50
0x1584c4c: bl       #0x13f5a78
0x1584c50: mov      x0, x19
0x1584c54: mov      x1, xzr
0x1584c58: mov      x2, xzr
0x1584c5c: bl       #0x270b30c
0x1584c60: tbz      w0, #0, #0x1584c88
0x1584c64: adrp     x8, #0x2cdd000
0x1584c68: ldr      x8, [x8, #0xe40]
0x1584c6c: ldr      x0, [x8]
0x1584c70: ldr      w8, [x0, #0xe4]
0x1584c74: cbnz     w8, #0x1584c7c
0x1584c78: bl       #0x13f5a78
0x1584c7c: mov      x0, x19
0x1584c80: mov      x1, xzr
0x1584c84: bl       #0x19368b4
0x1584c88: ldp      x20, x19, [sp, #0x20]
0x1584c8c: ldp      x22, x21, [sp, #0x10]
0x1584c90: ldr      x30, [sp], #0x30
0x1584c94: ret      
0x1584c98: bl       #0x13f5ba4

; IntroSceneDRA.OnEndSpineAction [0x1584c9c, 0x1584cb0)
0x1584c9c: str      x30, [sp, #-0x10]!
0x1584ca0: bl       #0x1584cb0
0x1584ca4: mov      x2, xzr
0x1584ca8: ldr      x30, [sp], #0x10
0x1584cac: b        #0x24cb73c

; IntroSceneDRA.LoadNextScene [0x1584d30, 0x1584db0)
0x1584d30: sub      sp, sp, #0x60
0x1584d34: stp      x30, x21, [sp, #0x40]
0x1584d38: stp      x20, x19, [sp, #0x50]
0x1584d3c: adrp     x21, #0x302d000
0x1584d40: adrp     x20, #0x2cdf000
0x1584d44: mov      x19, x0
0x1584d48: ldrb     w8, [x21, #0x72d]
0x1584d4c: ldr      x20, [x20, #0x808]
0x1584d50: tbnz     w8, #0, #0x1584d68
0x1584d54: adrp     x0, #0x2cdf000
0x1584d58: ldr      x0, [x0, #0x808]
0x1584d5c: bl       #0x13f5940
0x1584d60: mov      w8, #1
0x1584d64: strb     w8, [x21, #0x72d]
0x1584d68: movi     v0.2d, #0000000000000000
0x1584d6c: ldr      x2, [x20]
0x1584d70: mov      w8, #-1
0x1584d74: mov      x1, sp
0x1584d78: stp      q0, q0, [sp]
0x1584d7c: str      x19, [sp, #0x18]
0x1584d80: mov      x19, sp
0x1584d84: orr      x0, x19, #8
0x1584d88: stp      q0, q0, [sp, #0x20]
0x1584d8c: str      w8, [sp]
0x1584d90: bl       #0x154e36c
0x1584d94: orr      x0, x19, #8
0x1584d98: mov      x1, xzr
0x1584d9c: bl       #0x154e274
0x1584da0: ldp      x20, x19, [sp, #0x50]
0x1584da4: ldp      x30, x21, [sp, #0x40]
0x1584da8: add      sp, sp, #0x60
0x1584dac: ret      
