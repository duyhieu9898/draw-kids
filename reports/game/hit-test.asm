
extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .text:

00236be0 <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base>:
  236be0:	55                   	push   %ebp
  236be1:	89 e5                	mov    %esp,%ebp
  236be3:	53                   	push   %ebx
  236be4:	57                   	push   %edi
  236be5:	56                   	push   %esi
  236be6:	83 e4 f0             	and    $0xfffffff0,%esp
  236be9:	83 ec 30             	sub    $0x30,%esp
  236bec:	8b 75 10             	mov    0x10(%ebp),%esi
  236bef:	8b 45 0c             	mov    0xc(%ebp),%eax
  236bf2:	8b 7e 20             	mov    0x20(%esi),%edi
  236bf5:	8b 5e 24             	mov    0x24(%esi),%ebx
  236bf8:	f3 0f 10 00          	movss  (%eax),%xmm0
  236bfc:	f3 0f 11 44 24 10    	movss  %xmm0,0x10(%esp)
  236c02:	d9 44 24 10          	flds   0x10(%esp)
  236c06:	dd 4c 24 08          	fisttpll 0x8(%esp)
  236c0a:	31 d2                	xor    %edx,%edx
  236c0c:	8b 44 24 08          	mov    0x8(%esp),%eax
  236c10:	f7 f7                	div    %edi
  236c12:	89 d1                	mov    %edx,%ecx
  236c14:	0f 57 c0             	xorps  %xmm0,%xmm0
  236c17:	f3 0f 2a c3          	cvtsi2ss %ebx,%xmm0
  236c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  236c1e:	f3 0f 5c 40 04       	subss  0x4(%eax),%xmm0
  236c23:	f3 0f 11 44 24 20    	movss  %xmm0,0x20(%esp)
  236c29:	d9 44 24 20          	flds   0x20(%esp)
  236c2d:	dd 4c 24 18          	fisttpll 0x18(%esp)
  236c31:	31 d2                	xor    %edx,%edx
  236c33:	8b 44 24 18          	mov    0x18(%esp),%eax
  236c37:	f7 f3                	div    %ebx
  236c39:	89 f0                	mov    %esi,%eax
  236c3b:	89 d6                	mov    %edx,%esi
  236c3d:	0f af f7             	imul   %edi,%esi
  236c40:	01 ce                	add    %ecx,%esi
  236c42:	e8 00 00 00 00       	call   236c47 <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base+0x67>
  236c47:	5b                   	pop    %ebx
  236c48:	81 c3 4d a3 79 00    	add    $0x79a34d,%ebx
  236c4e:	3b 70 1c             	cmp    0x1c(%eax),%esi
  236c51:	72 5a                	jb     236cad <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base+0xcd>
  236c53:	83 ec 0c             	sub    $0xc,%esp
  236c56:	8d bb ae 14 e5 ff    	lea    -0x1aeb52(%ebx),%edi
  236c5c:	57                   	push   %edi
  236c5d:	e8 9e 7c fc ff       	call   1fe900 <cc_assert_script_compatible(char const*)@plt>
  236c62:	83 c4 10             	add    $0x10,%esp
  236c65:	84 c0                	test   %al,%al
  236c67:	75 13                	jne    236c7c <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base+0x9c>
  236c69:	83 ec 08             	sub    $0x8,%esp
  236c6c:	8d 83 cf 14 e5 ff    	lea    -0x1aeb31(%ebx),%eax
  236c72:	57                   	push   %edi
  236c73:	50                   	push   %eax
  236c74:	e8 47 78 fc ff       	call   1fe4c0 <cocos2d::log(char const*, ...)@plt>
  236c79:	83 c4 10             	add    $0x10,%esp
  236c7c:	83 ec 08             	sub    $0x8,%esp
  236c7f:	8d 83 62 15 e5 ff    	lea    -0x1aea9e(%ebx),%eax
  236c85:	8d 8b 09 15 e5 ff    	lea    -0x1aeaf7(%ebx),%ecx
  236c8b:	8d 93 f2 14 e5 ff    	lea    -0x1aeb0e(%ebx),%edx
  236c91:	8d bb e1 14 e5 ff    	lea    -0x1aeb1f(%ebx),%edi
  236c97:	68 c7 01 00 00       	push   $0x1c7
  236c9c:	50                   	push   %eax
  236c9d:	51                   	push   %ecx
  236c9e:	52                   	push   %edx
  236c9f:	57                   	push   %edi
  236ca0:	6a 06                	push   $0x6
  236ca2:	e8 b9 72 fc ff       	call   1fdf60 <__android_log_print@plt>
  236ca7:	83 c4 20             	add    $0x20,%esp
  236caa:	8b 45 10             	mov    0x10(%ebp),%eax
  236cad:	8b 48 18             	mov    0x18(%eax),%ecx
  236cb0:	b0 01                	mov    $0x1,%al
  236cb2:	80 3c b1 00          	cmpb   $0x0,(%ecx,%esi,4)
  236cb6:	75 16                	jne    236cce <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base+0xee>
  236cb8:	80 7c b1 01 00       	cmpb   $0x0,0x1(%ecx,%esi,4)
  236cbd:	75 0f                	jne    236cce <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base+0xee>
  236cbf:	80 7c b1 02 00       	cmpb   $0x0,0x2(%ecx,%esi,4)
  236cc4:	75 08                	jne    236cce <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@@Base+0xee>
  236cc6:	80 7c b1 03 00       	cmpb   $0x0,0x3(%ecx,%esi,4)
  236ccb:	0f 95 c0             	setne  %al
  236cce:	8d 65 f4             	lea    -0xc(%ebp),%esp
  236cd1:	5e                   	pop    %esi
  236cd2:	5f                   	pop    %edi
  236cd3:	5b                   	pop    %ebx
  236cd4:	5d                   	pop    %ebp
  236cd5:	c3                   	ret
  236cd6:	8d 76 00             	lea    0x0(%esi),%esi
  236cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00236ce0 <DrawScene::isZeroPixel(unsigned char*)@@Base>:
  236ce0:	55                   	push   %ebp
  236ce1:	89 e5                	mov    %esp,%ebp
  236ce3:	83 e4 fc             	and    $0xfffffffc,%esp
  236ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
  236ce9:	80 38 00             	cmpb   $0x0,(%eax)
  236cec:	75 0c                	jne    236cfa <DrawScene::isZeroPixel(unsigned char*)@@Base+0x1a>
  236cee:	80 78 01 00          	cmpb   $0x0,0x1(%eax)
  236cf2:	75 06                	jne    236cfa <DrawScene::isZeroPixel(unsigned char*)@@Base+0x1a>
  236cf4:	80 78 02 00          	cmpb   $0x0,0x2(%eax)
  236cf8:	74 06                	je     236d00 <DrawScene::isZeroPixel(unsigned char*)@@Base+0x20>
  236cfa:	31 c0                	xor    %eax,%eax
  236cfc:	89 ec                	mov    %ebp,%esp
  236cfe:	5d                   	pop    %ebp
  236cff:	c3                   	ret
  236d00:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
  236d04:	0f 94 c0             	sete   %al
  236d07:	eb f3                	jmp    236cfc <DrawScene::isZeroPixel(unsigned char*)@@Base+0x1c>
  236d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00236d10 <DrawScene::getTouchedSprite(cocos2d::Vec2)@@Base>:
  236d10:	55                   	push   %ebp
  236d11:	89 e5                	mov    %esp,%ebp
  236d13:	53                   	push   %ebx
  236d14:	57                   	push   %edi
  236d15:	56                   	push   %esi
  236d16:	83 e4 f0             	and    $0xfffffff0,%esp
  236d19:	83 ec 10             	sub    $0x10,%esp
  236d1c:	e8 00 00 00 00       	call   236d21 <DrawScene::getTouchedSprite(cocos2d::Vec2)@@Base+0x11>
  236d21:	5b                   	pop    %ebx
  236d22:	81 c3 73 a2 79 00    	add    $0x79a273,%ebx
  236d28:	8b 7d 08             	mov    0x8(%ebp),%edi
  236d2b:	8b 87 70 03 00 00    	mov    0x370(%edi),%eax
  236d31:	31 f6                	xor    %esi,%esi
  236d33:	39 87 74 03 00 00    	cmp    %eax,0x374(%edi)
  236d39:	74 58                	je     236d93 <DrawScene::getTouchedSprite(cocos2d::Vec2)@@Base+0x83>
  236d3b:	31 f6                	xor    %esi,%esi
  236d3d:	90                   	nop
  236d3e:	90                   	nop
  236d3f:	90                   	nop
  236d40:	f3 0f 10 87 64 03 00 	movss  0x364(%edi),%xmm0
  236d47:	00 
  236d48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  236d4b:	f3 0f 10 09          	movss  (%ecx),%xmm1
  236d4f:	f3 0f 59 c8          	mulss  %xmm0,%xmm1
  236d53:	f3 0f 59 41 04       	mulss  0x4(%ecx),%xmm0
  236d58:	f3 0f 11 0c 24       	movss  %xmm1,(%esp)
  236d5d:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  236d63:	83 ec 04             	sub    $0x4,%esp
  236d66:	ff 34 b0             	push   (%eax,%esi,4)
  236d69:	8d 44 24 08          	lea    0x8(%esp),%eax
  236d6d:	50                   	push   %eax
  236d6e:	57                   	push   %edi
  236d6f:	e8 9c 7b fc ff       	call   1fe910 <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@plt>
  236d74:	83 c4 10             	add    $0x10,%esp
  236d77:	84 c0                	test   %al,%al
  236d79:	75 18                	jne    236d93 <DrawScene::getTouchedSprite(cocos2d::Vec2)@@Base+0x83>
  236d7b:	46                   	inc    %esi
  236d7c:	8b 87 70 03 00 00    	mov    0x370(%edi),%eax
  236d82:	8b 8f 74 03 00 00    	mov    0x374(%edi),%ecx
  236d88:	29 c1                	sub    %eax,%ecx
  236d8a:	c1 f9 02             	sar    $0x2,%ecx
  236d8d:	39 ce                	cmp    %ecx,%esi
  236d8f:	72 af                	jb     236d40 <DrawScene::getTouchedSprite(cocos2d::Vec2)@@Base+0x30>
  236d91:	31 f6                	xor    %esi,%esi
  236d93:	89 f0                	mov    %esi,%eax
  236d95:	8d 65 f4             	lea    -0xc(%ebp),%esp
  236d98:	5e                   	pop    %esi
  236d99:	5f                   	pop    %edi
  236d9a:	5b                   	pop    %ebx
  236d9b:	5d                   	pop    %ebp
  236d9c:	c3                   	ret
  236d9d:	83 ec 0c             	sub    $0xc,%esp
  236da0:	50                   	push   %eax
  236da1:	e8 0d 16 5c 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  236da6:	83 c4 0c             	add    $0xc,%esp
  236da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
