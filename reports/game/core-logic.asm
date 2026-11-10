Disassembly of section .text:
0023adf0 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base>:
  23adf0:	55                   	push   %ebp
  23adf1:	89 e5                	mov    %esp,%ebp
  23adf3:	53                   	push   %ebx
  23adf4:	57                   	push   %edi
  23adf5:	56                   	push   %esi
  23adf6:	83 e4 f0             	and    $0xfffffff0,%esp
  23adf9:	83 ec 50             	sub    $0x50,%esp
  23adfc:	e8 00 00 00 00       	call   23ae01 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x11>
  23ae01:	5b                   	pop    %ebx
  23ae02:	81 c3 93 61 79 00    	add    $0x796193,%ebx
  23ae08:	8b 45 0c             	mov    0xc(%ebp),%eax
  23ae0b:	8b 75 08             	mov    0x8(%ebp),%esi
  23ae0e:	89 44 24 04          	mov    %eax,0x4(%esp)
  23ae12:	8d 7c 24 40          	lea    0x40(%esp),%edi
  23ae16:	89 3c 24             	mov    %edi,(%esp)
  23ae19:	e8 12 3c fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23ae1e:	83 ec 04             	sub    $0x4,%esp
  23ae21:	89 7c 24 04          	mov    %edi,0x4(%esp)
  23ae25:	89 34 24             	mov    %esi,(%esp)
  23ae28:	e8 83 3d fc ff       	call   1febb0 <DrawScene::isPermissionPopupTouched(cocos2d::Vec2)@plt>
  23ae2d:	84 c0                	test   %al,%al
  23ae2f:	74 17                	je     23ae48 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x58>
  23ae31:	89 34 24             	mov    %esi,(%esp)
  23ae34:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  23ae3b:	00 
  23ae3c:	e8 7f 3d fc ff       	call   1febc0 <DrawScene::hidePermissionPopup(bool)@plt>
  23ae41:	31 c0                	xor    %eax,%eax
  23ae43:	e9 ac 00 00 00       	jmp    23aef4 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x104>
  23ae48:	8b be f0 02 00 00    	mov    0x2f0(%esi),%edi
  23ae4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  23ae51:	89 44 24 04          	mov    %eax,0x4(%esp)
  23ae55:	8d 74 24 38          	lea    0x38(%esp),%esi
  23ae59:	89 34 24             	mov    %esi,(%esp)
  23ae5c:	e8 cf 3b fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23ae61:	83 ec 04             	sub    $0x4,%esp
  23ae64:	89 74 24 04          	mov    %esi,0x4(%esp)
  23ae68:	89 3c 24             	mov    %edi,(%esp)
  23ae6b:	e8 60 3d fc ff       	call   1febd0 <ToolsLayer::isToolSelftTouched(cocos2d::Vec2)@plt>
  23ae70:	84 c0                	test   %al,%al
  23ae72:	74 2f                	je     23aea3 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0xb3>
  23ae74:	8b 45 08             	mov    0x8(%ebp),%eax
  23ae77:	8b b0 f0 02 00 00    	mov    0x2f0(%eax),%esi
  23ae7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  23ae80:	89 44 24 04          	mov    %eax,0x4(%esp)
  23ae84:	8d 7c 24 30          	lea    0x30(%esp),%edi
  23ae88:	89 3c 24             	mov    %edi,(%esp)
  23ae8b:	e8 a0 3b fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23ae90:	83 ec 04             	sub    $0x4,%esp
  23ae93:	89 7c 24 04          	mov    %edi,0x4(%esp)
  23ae97:	89 34 24             	mov    %esi,(%esp)
  23ae9a:	e8 41 3d fc ff       	call   1febe0 <ToolsLayer::touchBegan(cocos2d::Vec2)@plt>
  23ae9f:	b0 01                	mov    $0x1,%al
  23aea1:	eb 51                	jmp    23aef4 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x104>
  23aea3:	8b 45 08             	mov    0x8(%ebp),%eax
  23aea6:	80 b8 e8 02 00 00 00 	cmpb   $0x0,0x2e8(%eax)
  23aead:	74 43                	je     23aef2 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x102>
  23aeaf:	80 b8 78 02 00 00 00 	cmpb   $0x0,0x278(%eax)
  23aeb6:	75 3a                	jne    23aef2 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x102>
  23aeb8:	8b b0 f0 02 00 00    	mov    0x2f0(%eax),%esi
  23aebe:	8b 45 0c             	mov    0xc(%ebp),%eax
  23aec1:	89 44 24 04          	mov    %eax,0x4(%esp)
  23aec5:	8d 7c 24 28          	lea    0x28(%esp),%edi
  23aec9:	89 3c 24             	mov    %edi,(%esp)
  23aecc:	e8 5f 3b fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23aed1:	83 ec 04             	sub    $0x4,%esp
  23aed4:	89 7c 24 04          	mov    %edi,0x4(%esp)
  23aed8:	89 34 24             	mov    %esi,(%esp)
  23aedb:	e8 f0 3c fc ff       	call   1febd0 <ToolsLayer::isToolSelftTouched(cocos2d::Vec2)@plt>
  23aee0:	84 c0                	test   %al,%al
  23aee2:	75 0e                	jne    23aef2 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x102>
  23aee4:	e8 f7 30 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23aee9:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  23aef0:	74 0a                	je     23aefc <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x10c>
  23aef2:	31 c0                	xor    %eax,%eax
  23aef4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  23aef7:	5e                   	pop    %esi
  23aef8:	5f                   	pop    %edi
  23aef9:	5b                   	pop    %ebx
  23aefa:	5d                   	pop    %ebp
  23aefb:	c3                   	ret
  23aefc:	8b 45 0c             	mov    0xc(%ebp),%eax
  23aeff:	89 44 24 04          	mov    %eax,0x4(%esp)
  23af03:	8d 44 24 18          	lea    0x18(%esp),%eax
  23af07:	89 04 24             	mov    %eax,(%esp)
  23af0a:	e8 21 3b fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23af0f:	83 ec 04             	sub    $0x4,%esp
  23af12:	8b 75 08             	mov    0x8(%ebp),%esi
  23af15:	8b 86 70 03 00 00    	mov    0x370(%esi),%eax
  23af1b:	39 86 74 03 00 00    	cmp    %eax,0x374(%esi)
  23af21:	74 57                	je     23af7a <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x18a>
  23af23:	31 ff                	xor    %edi,%edi
  23af25:	f3 0f 10 86 64 03 00 	movss  0x364(%esi),%xmm0
  23af2c:	00 
  23af2d:	f3 0f 10 4c 24 18    	movss  0x18(%esp),%xmm1
  23af33:	f3 0f 59 c8          	mulss  %xmm0,%xmm1
  23af37:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%esp)
  23af3d:	f3 0f 59 44 24 1c    	mulss  0x1c(%esp),%xmm0
  23af43:	f3 0f 11 44 24 24    	movss  %xmm0,0x24(%esp)
  23af49:	8b 04 b8             	mov    (%eax,%edi,4),%eax
  23af4c:	89 44 24 08          	mov    %eax,0x8(%esp)
  23af50:	8d 44 24 20          	lea    0x20(%esp),%eax
  23af54:	89 44 24 04          	mov    %eax,0x4(%esp)
  23af58:	89 34 24             	mov    %esi,(%esp)
  23af5b:	e8 b0 39 fc ff       	call   1fe910 <DrawScene::tapsOnNonTransparent(cocos2d::Vec2 const&, cocos2d::Image*)@plt>
  23af60:	84 c0                	test   %al,%al
  23af62:	75 55                	jne    23afb9 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x1c9>
  23af64:	47                   	inc    %edi
  23af65:	8b 86 70 03 00 00    	mov    0x370(%esi),%eax
  23af6b:	8b 8e 74 03 00 00    	mov    0x374(%esi),%ecx
  23af71:	29 c1                	sub    %eax,%ecx
  23af73:	c1 f9 02             	sar    $0x2,%ecx
  23af76:	39 cf                	cmp    %ecx,%edi
  23af78:	72 ab                	jb     23af25 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x135>
  23af7a:	c6 86 78 02 00 00 01 	movb   $0x1,0x278(%esi)
  23af81:	8b 86 f0 02 00 00    	mov    0x2f0(%esi),%eax
  23af87:	89 04 24             	mov    %eax,(%esp)
  23af8a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  23af91:	00 
  23af92:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  23af99:	00 
  23af9a:	e8 c1 3a fc ff       	call   1fea60 <ToolsLayer::setShelfVisible(bool, bool)@plt>
  23af9f:	31 ff                	xor    %edi,%edi
  23afa1:	8b 45 0c             	mov    0xc(%ebp),%eax
  23afa4:	89 44 24 08          	mov    %eax,0x8(%esp)
  23afa8:	89 7c 24 04          	mov    %edi,0x4(%esp)
  23afac:	89 34 24             	mov    %esi,(%esp)
  23afaf:	e8 3c 3c fc ff       	call   1febf0 <DrawScene::startDraw(int, cocos2d::Touch*)@plt>
  23afb4:	e9 3b ff ff ff       	jmp    23aef4 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x104>
  23afb9:	c6 86 78 02 00 00 01 	movb   $0x1,0x278(%esi)
  23afc0:	85 ff                	test   %edi,%edi
  23afc2:	8b 86 f0 02 00 00    	mov    0x2f0(%esi),%eax
  23afc8:	74 bd                	je     23af87 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x197>
  23afca:	89 04 24             	mov    %eax,(%esp)
  23afcd:	e8 2e 3c fc ff       	call   1fec00 <ToolsLayer::releaseShelf()@plt>
  23afd2:	eb cd                	jmp    23afa1 <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x1b1>
  23afd4:	eb 06                	jmp    23afdc <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x1ec>
  23afd6:	eb 04                	jmp    23afdc <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x1ec>
  23afd8:	eb 02                	jmp    23afdc <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x1ec>
  23afda:	eb 00                	jmp    23afdc <DrawScene::onTouchBegan(cocos2d::Touch*, cocos2d::Event*)@@Base+0x1ec>
  23afdc:	89 04 24             	mov    %eax,(%esp)
  23afdf:	e8 cf d3 5b 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  23afe4:	83 ec 04             	sub    $0x4,%esp

Disassembly of section .text:
0023aff0 <DrawScene::onTouchMoved(cocos2d::Touch*, cocos2d::Event*)@@Base>:
  23aff0:	55                   	push   %ebp
  23aff1:	89 e5                	mov    %esp,%ebp
  23aff3:	53                   	push   %ebx
  23aff4:	57                   	push   %edi
  23aff5:	56                   	push   %esi
  23aff6:	83 e4 f0             	and    $0xfffffff0,%esp
  23aff9:	83 ec 10             	sub    $0x10,%esp
  23affc:	e8 00 00 00 00       	call   23b001 <DrawScene::onTouchMoved(cocos2d::Touch*, cocos2d::Event*)@@Base+0x11>
  23b001:	5b                   	pop    %ebx
  23b002:	81 c3 93 5f 79 00    	add    $0x795f93,%ebx
  23b008:	8b 45 0c             	mov    0xc(%ebp),%eax
  23b00b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  23b00e:	8b b1 f0 02 00 00    	mov    0x2f0(%ecx),%esi
  23b014:	80 be 64 02 00 00 00 	cmpb   $0x0,0x264(%esi)
  23b01b:	74 1a                	je     23b037 <DrawScene::onTouchMoved(cocos2d::Touch*, cocos2d::Event*)@@Base+0x47>
  23b01d:	83 ec 08             	sub    $0x8,%esp
  23b020:	8d 7c 24 08          	lea    0x8(%esp),%edi
  23b024:	50                   	push   %eax
  23b025:	57                   	push   %edi
  23b026:	e8 05 3a fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23b02b:	83 c4 04             	add    $0x4,%esp
  23b02e:	57                   	push   %edi
  23b02f:	56                   	push   %esi
  23b030:	e8 db 3b fc ff       	call   1fec10 <ToolsLayer::touchMoved(cocos2d::Vec2)@plt>
  23b035:	eb 13                	jmp    23b04a <DrawScene::onTouchMoved(cocos2d::Touch*, cocos2d::Event*)@@Base+0x5a>
  23b037:	80 b9 78 02 00 00 00 	cmpb   $0x0,0x278(%ecx)
  23b03e:	74 0d                	je     23b04d <DrawScene::onTouchMoved(cocos2d::Touch*, cocos2d::Event*)@@Base+0x5d>
  23b040:	83 ec 08             	sub    $0x8,%esp
  23b043:	50                   	push   %eax
  23b044:	51                   	push   %ecx
  23b045:	e8 d6 3b fc ff       	call   1fec20 <DrawScene::continueDraw(cocos2d::Touch*)@plt>
  23b04a:	83 c4 10             	add    $0x10,%esp
  23b04d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  23b050:	5e                   	pop    %esi
  23b051:	5f                   	pop    %edi
  23b052:	5b                   	pop    %ebx
  23b053:	5d                   	pop    %ebp
  23b054:	c3                   	ret

Disassembly of section .text:
0023b060 <DrawScene::onTouchEnded(cocos2d::Touch*, cocos2d::Event*)@@Base>:
  23b060:	55                   	push   %ebp
  23b061:	89 e5                	mov    %esp,%ebp
  23b063:	53                   	push   %ebx
  23b064:	57                   	push   %edi
  23b065:	56                   	push   %esi
  23b066:	83 e4 f0             	and    $0xfffffff0,%esp
  23b069:	83 ec 20             	sub    $0x20,%esp
  23b06c:	e8 00 00 00 00       	call   23b071 <DrawScene::onTouchEnded(cocos2d::Touch*, cocos2d::Event*)@@Base+0x11>
  23b071:	5b                   	pop    %ebx
  23b072:	81 c3 23 5f 79 00    	add    $0x795f23,%ebx
  23b078:	8b 45 0c             	mov    0xc(%ebp),%eax
  23b07b:	8b 75 08             	mov    0x8(%ebp),%esi
  23b07e:	8b be f0 02 00 00    	mov    0x2f0(%esi),%edi
  23b084:	80 bf 64 02 00 00 00 	cmpb   $0x0,0x264(%edi)
  23b08b:	74 22                	je     23b0af <DrawScene::onTouchEnded(cocos2d::Touch*, cocos2d::Event*)@@Base+0x4f>
  23b08d:	83 ec 08             	sub    $0x8,%esp
  23b090:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  23b094:	50                   	push   %eax
  23b095:	51                   	push   %ecx
  23b096:	e8 95 39 fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23b09b:	83 c4 04             	add    $0x4,%esp
  23b09e:	8d 44 24 10          	lea    0x10(%esp),%eax
  23b0a2:	50                   	push   %eax
  23b0a3:	57                   	push   %edi
  23b0a4:	e8 87 3b fc ff       	call   1fec30 <ToolsLayer::touchEnded(cocos2d::Vec2)@plt>
  23b0a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  23b0ac:	83 c4 10             	add    $0x10,%esp
  23b0af:	80 be 78 02 00 00 00 	cmpb   $0x0,0x278(%esi)
  23b0b6:	74 30                	je     23b0e8 <DrawScene::onTouchEnded(cocos2d::Touch*, cocos2d::Event*)@@Base+0x88>
  23b0b8:	83 ec 08             	sub    $0x8,%esp
  23b0bb:	50                   	push   %eax
  23b0bc:	56                   	push   %esi
  23b0bd:	89 c7                	mov    %eax,%edi
  23b0bf:	e8 7c 3b fc ff       	call   1fec40 <DrawScene::stopDraw(cocos2d::Touch*)@plt>
  23b0c4:	83 c4 08             	add    $0x8,%esp
  23b0c7:	8d 44 24 18          	lea    0x18(%esp),%eax
  23b0cb:	57                   	push   %edi
  23b0cc:	50                   	push   %eax
  23b0cd:	89 c7                	mov    %eax,%edi
  23b0cf:	e8 5c 39 fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23b0d4:	83 c4 04             	add    $0x4,%esp
  23b0d7:	57                   	push   %edi
  23b0d8:	56                   	push   %esi
  23b0d9:	e8 62 39 fc ff       	call   1fea40 <DrawScene::playParticle(cocos2d::Vec2)@plt>
  23b0de:	83 c4 10             	add    $0x10,%esp
  23b0e1:	c6 86 78 02 00 00 00 	movb   $0x0,0x278(%esi)
  23b0e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  23b0eb:	5e                   	pop    %esi
  23b0ec:	5f                   	pop    %edi
  23b0ed:	5b                   	pop    %ebx
  23b0ee:	5d                   	pop    %ebp
  23b0ef:	c3                   	ret

Disassembly of section .text:
0023b0f0 <DrawScene::onTouchCancelled(cocos2d::Touch*, cocos2d::Event*)@@Base>:
  23b0f0:	55                   	push   %ebp
  23b0f1:	89 e5                	mov    %esp,%ebp
  23b0f3:	53                   	push   %ebx
  23b0f4:	56                   	push   %esi
  23b0f5:	83 e4 f0             	and    $0xfffffff0,%esp
  23b0f8:	e8 00 00 00 00       	call   23b0fd <DrawScene::onTouchCancelled(cocos2d::Touch*, cocos2d::Event*)@@Base+0xd>
  23b0fd:	5b                   	pop    %ebx
  23b0fe:	81 c3 97 5e 79 00    	add    $0x795e97,%ebx
  23b104:	8b 75 08             	mov    0x8(%ebp),%esi
  23b107:	e8 d4 2e fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23b10c:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  23b113:	74 0b                	je     23b120 <DrawScene::onTouchCancelled(cocos2d::Touch*, cocos2d::Event*)@@Base+0x30>
  23b115:	83 ec 0c             	sub    $0xc,%esp
  23b118:	56                   	push   %esi
  23b119:	e8 32 3b fc ff       	call   1fec50 <DrawScene::cancelDraw()@plt>
  23b11e:	eb 12                	jmp    23b132 <DrawScene::onTouchCancelled(cocos2d::Touch*, cocos2d::Event*)@@Base+0x42>
  23b120:	8b 06                	mov    (%esi),%eax
  23b122:	83 ec 04             	sub    $0x4,%esp
  23b125:	ff 75 10             	push   0x10(%ebp)
  23b128:	ff 75 0c             	push   0xc(%ebp)
  23b12b:	56                   	push   %esi
  23b12c:	ff 90 bc 02 00 00    	call   *0x2bc(%eax)
  23b132:	83 c4 10             	add    $0x10,%esp
  23b135:	8d 65 f8             	lea    -0x8(%ebp),%esp
  23b138:	5e                   	pop    %esi
  23b139:	5b                   	pop    %ebx
  23b13a:	5d                   	pop    %ebp
  23b13b:	c3                   	ret

Disassembly of section .text:
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

Disassembly of section .text:
00238650 <DrawScene::fillImage(int, cocos2d::Touch*)@@Base>:
  238650:	55                   	push   %ebp
  238651:	89 e5                	mov    %esp,%ebp
  238653:	53                   	push   %ebx
  238654:	57                   	push   %edi
  238655:	56                   	push   %esi
  238656:	83 e4 f0             	and    $0xfffffff0,%esp
  238659:	83 ec 40             	sub    $0x40,%esp
  23865c:	e8 00 00 00 00       	call   238661 <DrawScene::fillImage(int, cocos2d::Touch*)@@Base+0x11>
  238661:	5b                   	pop    %ebx
  238662:	81 c3 33 89 79 00    	add    $0x798933,%ebx
  238668:	8b 75 10             	mov    0x10(%ebp),%esi
  23866b:	8b 7d 08             	mov    0x8(%ebp),%edi
  23866e:	89 3c 24             	mov    %edi,(%esp)
  238671:	e8 5a 63 fc ff       	call   1fe9d0 <DrawScene::getCleanCanvas()@plt>
  238676:	89 87 6c 02 00 00    	mov    %eax,0x26c(%edi)
  23867c:	89 3c 24             	mov    %edi,(%esp)
  23867f:	c7 44 24 04 0f 27 00 	movl   $0x270f,0x4(%esp)
  238686:	00 
  238687:	e8 64 62 fc ff       	call   1fe8f0 <cocos2d::Node::stopActionByTag(int)@plt>
  23868c:	c6 87 e8 02 00 00 00 	movb   $0x0,0x2e8(%edi)
  238693:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  238699:	85 c0                	test   %eax,%eax
  23869b:	0f 84 ec 00 00 00    	je     23878d <DrawScene::fillImage(int, cocos2d::Touch*)@@Base+0x13d>
  2386a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  2386a4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  2386a8:	89 44 24 04          	mov    %eax,0x4(%esp)
  2386ac:	89 3c 24             	mov    %edi,(%esp)
  2386af:	e8 2c 63 fc ff       	call   1fe9e0 <DrawScene::prepareCanvasToDraw(cocos2d::RenderTexture*, int)@plt>
  2386b4:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  2386ba:	8b 08                	mov    (%eax),%ecx
  2386bc:	89 04 24             	mov    %eax,(%esp)
  2386bf:	ff 91 94 02 00 00    	call   *0x294(%ecx)
  2386c5:	8b 87 f0 02 00 00    	mov    0x2f0(%edi),%eax
  2386cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  2386cf:	8d 74 24 28          	lea    0x28(%esp),%esi
  2386d3:	89 34 24             	mov    %esi,(%esp)
  2386d6:	e8 15 63 fc ff       	call   1fe9f0 <ToolsLayer::getCurrentColor()@plt>
  2386db:	83 ec 04             	sub    $0x4,%esp
  2386de:	89 74 24 04          	mov    %esi,0x4(%esp)
  2386e2:	8d 44 24 18          	lea    0x18(%esp),%eax
  2386e6:	89 04 24             	mov    %eax,(%esp)
  2386e9:	c7 44 24 08 ff 00 00 	movl   $0xff,0x8(%esp)
  2386f0:	00 
  2386f1:	e8 0a 63 fc ff       	call   1fea00 <cocos2d::Color4B::Color4B(cocos2d::Color3B const&, unsigned char)@plt>
  2386f6:	e8 e5 58 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2386fb:	89 44 24 04          	mov    %eax,0x4(%esp)
  2386ff:	8d 74 24 20          	lea    0x20(%esp),%esi
  238703:	89 34 24             	mov    %esi,(%esp)
  238706:	e8 75 5d fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  23870b:	83 ec 04             	sub    $0x4,%esp
  23870e:	f3 0f 10 44 24 20    	movss  0x20(%esp),%xmm0
  238714:	f3 0f 11 44 24 1c    	movss  %xmm0,0x1c(%esp)
  23871a:	e8 c1 58 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23871f:	89 44 24 04          	mov    %eax,0x4(%esp)
  238723:	89 34 24             	mov    %esi,(%esp)
  238726:	e8 55 5d fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  23872b:	83 ec 04             	sub    $0x4,%esp
  23872e:	f3 0f 10 44 24 24    	movss  0x24(%esp),%xmm0
  238734:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  23873a:	f3 0f 10 44 24 1c    	movss  0x1c(%esp),%xmm0
  238740:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  238746:	8d 44 24 18          	lea    0x18(%esp),%eax
  23874a:	89 04 24             	mov    %eax,(%esp)
  23874d:	e8 be 62 fc ff       	call   1fea10 <cocos2d::LayerColor::create(cocos2d::Color4B const&, float, float)@plt>
  238752:	89 c6                	mov    %eax,%esi
  238754:	8d 87 48 03 00 00    	lea    0x348(%edi),%eax
  23875a:	8b 0e                	mov    (%esi),%ecx
  23875c:	89 44 24 04          	mov    %eax,0x4(%esp)
  238760:	89 34 24             	mov    %esi,(%esp)
  238763:	ff 91 28 03 00 00    	call   *0x328(%ecx)
  238769:	89 34 24             	mov    %esi,(%esp)
  23876c:	8b 75 10             	mov    0x10(%ebp),%esi
  23876f:	e8 1c 5e fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  238774:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  23877a:	8b 08                	mov    (%eax),%ecx
  23877c:	89 04 24             	mov    %eax,(%esp)
  23877f:	ff 91 a4 02 00 00    	call   *0x2a4(%ecx)
  238785:	89 3c 24             	mov    %edi,(%esp)
  238788:	e8 93 62 fc ff       	call   1fea20 <DrawScene::completeDraw()@plt>
  23878d:	8b 87 d8 02 00 00    	mov    0x2d8(%edi),%eax
  238793:	8b 8f dc 02 00 00    	mov    0x2dc(%edi),%ecx
  238799:	89 8f e4 02 00 00    	mov    %ecx,0x2e4(%edi)
  23879f:	89 87 e0 02 00 00    	mov    %eax,0x2e0(%edi)
  2387a5:	8b 87 58 03 00 00    	mov    0x358(%edi),%eax
  2387ab:	89 87 5c 03 00 00    	mov    %eax,0x35c(%edi)
  2387b1:	c6 87 78 02 00 00 00 	movb   $0x0,0x278(%edi)
  2387b8:	89 74 24 04          	mov    %esi,0x4(%esp)
  2387bc:	8d 74 24 30          	lea    0x30(%esp),%esi
  2387c0:	89 34 24             	mov    %esi,(%esp)
  2387c3:	e8 68 62 fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  2387c8:	83 ec 04             	sub    $0x4,%esp
  2387cb:	89 74 24 04          	mov    %esi,0x4(%esp)
  2387cf:	89 3c 24             	mov    %edi,(%esp)
  2387d2:	e8 69 62 fc ff       	call   1fea40 <DrawScene::playParticle(cocos2d::Vec2)@plt>
  2387d7:	89 3c 24             	mov    %edi,(%esp)
  2387da:	e8 71 62 fc ff       	call   1fea50 <DrawScene::enableDraw()@plt>
  2387df:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2387e2:	5e                   	pop    %esi
  2387e3:	5f                   	pop    %edi
  2387e4:	5b                   	pop    %ebx
  2387e5:	5d                   	pop    %ebp
  2387e6:	c3                   	ret

Disassembly of section .text:
00238c70 <DrawScene::startDraw(int, cocos2d::Touch*)@@Base>:
  238c70:	55                   	push   %ebp
  238c71:	89 e5                	mov    %esp,%ebp
  238c73:	53                   	push   %ebx
  238c74:	57                   	push   %edi
  238c75:	56                   	push   %esi
  238c76:	83 e4 f0             	and    $0xfffffff0,%esp
  238c79:	83 ec 20             	sub    $0x20,%esp
  238c7c:	e8 00 00 00 00       	call   238c81 <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0x11>
  238c81:	5b                   	pop    %ebx
  238c82:	81 c3 13 83 79 00    	add    $0x798313,%ebx
  238c88:	8b 75 10             	mov    0x10(%ebp),%esi
  238c8b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  238c8e:	8b 81 58 03 00 00    	mov    0x358(%ecx),%eax
  238c94:	89 81 5c 03 00 00    	mov    %eax,0x35c(%ecx)
  238c9a:	83 ec 08             	sub    $0x8,%esp
  238c9d:	8d 44 24 08          	lea    0x8(%esp),%eax
  238ca1:	56                   	push   %esi
  238ca2:	50                   	push   %eax
  238ca3:	e8 88 5d fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  238ca8:	83 c4 0c             	add    $0xc,%esp
  238cab:	8d 44 24 08          	lea    0x8(%esp),%eax
  238caf:	83 ec 08             	sub    $0x8,%esp
  238cb2:	56                   	push   %esi
  238cb3:	50                   	push   %eax
  238cb4:	e8 77 5d fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  238cb9:	83 c4 0c             	add    $0xc,%esp
  238cbc:	8d 44 24 10          	lea    0x10(%esp),%eax
  238cc0:	83 ec 08             	sub    $0x8,%esp
  238cc3:	56                   	push   %esi
  238cc4:	50                   	push   %eax
  238cc5:	e8 66 5d fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  238cca:	83 c4 0c             	add    $0xc,%esp
  238ccd:	8b 7d 08             	mov    0x8(%ebp),%edi
  238cd0:	8d 87 58 03 00 00    	lea    0x358(%edi),%eax
  238cd6:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  238cda:	83 ec 04             	sub    $0x4,%esp
  238cdd:	51                   	push   %ecx
  238cde:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  238ce2:	51                   	push   %ecx
  238ce3:	50                   	push   %eax
  238ce4:	e8 d7 5d fc ff       	call   1feac0 <std::__ndk1::enable_if<__is_forward_iterator<cocos2d::Vec2 const*>::value&&is_constructible<cocos2d::Vec2, std::__ndk1::iterator_traits<cocos2d::Vec2 const*>::reference>::value, void>::type std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::assign<cocos2d::Vec2 const*>(cocos2d::Vec2 const*, cocos2d::Vec2 const*)@plt>
  238ce9:	83 c4 10             	add    $0x10,%esp
  238cec:	83 ec 0c             	sub    $0xc,%esp
  238cef:	ff b7 f0 02 00 00    	push   0x2f0(%edi)
  238cf5:	e8 76 5d fc ff       	call   1fea70 <ToolsLayer::getCurrentTool()@plt>
  238cfa:	83 c4 10             	add    $0x10,%esp
  238cfd:	83 f8 06             	cmp    $0x6,%eax
  238d00:	77 0d                	ja     238d0f <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0x9f>
  238d02:	8b 84 83 04 55 e7 ff 	mov    -0x18aafc(%ebx,%eax,4),%eax
  238d09:	01 d8                	add    %ebx,%eax
  238d0b:	ff e0                	jmp    *%eax
  238d0d:	eb 00                	jmp    238d0f <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0x9f>
  238d0f:	83 ec 04             	sub    $0x4,%esp
  238d12:	56                   	push   %esi
  238d13:	ff 75 0c             	push   0xc(%ebp)
  238d16:	57                   	push   %edi
  238d17:	e8 b4 5d fc ff       	call   1fead0 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@plt>
  238d1c:	eb 50                	jmp    238d6e <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0xfe>
  238d1e:	83 ec 04             	sub    $0x4,%esp
  238d21:	56                   	push   %esi
  238d22:	ff 75 0c             	push   0xc(%ebp)
  238d25:	57                   	push   %edi
  238d26:	e8 b5 5d fc ff       	call   1feae0 <DrawScene::startDrawBrush(int, cocos2d::Touch*)@plt>
  238d2b:	eb 41                	jmp    238d6e <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0xfe>
  238d2d:	83 ec 04             	sub    $0x4,%esp
  238d30:	56                   	push   %esi
  238d31:	ff 75 0c             	push   0xc(%ebp)
  238d34:	57                   	push   %edi
  238d35:	e8 b6 5d fc ff       	call   1feaf0 <DrawScene::startDrawSpray(int, cocos2d::Touch*)@plt>
  238d3a:	eb 32                	jmp    238d6e <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0xfe>
  238d3c:	83 ec 04             	sub    $0x4,%esp
  238d3f:	56                   	push   %esi
  238d40:	ff 75 0c             	push   0xc(%ebp)
  238d43:	57                   	push   %edi
  238d44:	e8 b7 5d fc ff       	call   1feb00 <DrawScene::fillImage(int, cocos2d::Touch*)@plt>
  238d49:	83 c4 10             	add    $0x10,%esp
  238d4c:	31 c0                	xor    %eax,%eax
  238d4e:	eb 23                	jmp    238d73 <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0x103>
  238d50:	83 ec 04             	sub    $0x4,%esp
  238d53:	56                   	push   %esi
  238d54:	ff 75 0c             	push   0xc(%ebp)
  238d57:	57                   	push   %edi
  238d58:	e8 b3 5d fc ff       	call   1feb10 <DrawScene::startDrawPencil(int, cocos2d::Touch*)@plt>
  238d5d:	eb 0f                	jmp    238d6e <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0xfe>
  238d5f:	eb 00                	jmp    238d61 <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0xf1>
  238d61:	83 ec 04             	sub    $0x4,%esp
  238d64:	56                   	push   %esi
  238d65:	ff 75 0c             	push   0xc(%ebp)
  238d68:	57                   	push   %edi
  238d69:	e8 b2 5d fc ff       	call   1feb20 <DrawScene::startDrawPattern(int, cocos2d::Touch*)@plt>
  238d6e:	83 c4 10             	add    $0x10,%esp
  238d71:	b0 01                	mov    $0x1,%al
  238d73:	8d 65 f4             	lea    -0xc(%ebp),%esp
  238d76:	5e                   	pop    %esi
  238d77:	5f                   	pop    %edi
  238d78:	5b                   	pop    %ebx
  238d79:	5d                   	pop    %ebp
  238d7a:	c3                   	ret
  238d7b:	eb 02                	jmp    238d7f <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0x10f>
  238d7d:	eb 00                	jmp    238d7f <DrawScene::startDraw(int, cocos2d::Touch*)@@Base+0x10f>
  238d7f:	83 ec 0c             	sub    $0xc,%esp
  238d82:	50                   	push   %eax
  238d83:	e8 2b f6 5b 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  238d88:	83 c4 0c             	add    $0xc,%esp

Disassembly of section .text:
00238d90 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base>:
  238d90:	55                   	push   %ebp
  238d91:	89 e5                	mov    %esp,%ebp
  238d93:	53                   	push   %ebx
  238d94:	57                   	push   %edi
  238d95:	56                   	push   %esi
  238d96:	83 e4 f0             	and    $0xfffffff0,%esp
  238d99:	83 ec 60             	sub    $0x60,%esp
  238d9c:	e8 00 00 00 00       	call   238da1 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x11>
  238da1:	5b                   	pop    %ebx
  238da2:	81 c3 f3 81 79 00    	add    $0x7981f3,%ebx
  238da8:	8b 7d 08             	mov    0x8(%ebp),%edi
  238dab:	89 3c 24             	mov    %edi,(%esp)
  238dae:	e8 1d 5c fc ff       	call   1fe9d0 <DrawScene::getCleanCanvas()@plt>
  238db3:	89 87 6c 02 00 00    	mov    %eax,0x26c(%edi)
  238db9:	8b 87 48 03 00 00    	mov    0x348(%edi),%eax
  238dbf:	8b 8f 4c 03 00 00    	mov    0x34c(%edi),%ecx
  238dc5:	89 8f c4 02 00 00    	mov    %ecx,0x2c4(%edi)
  238dcb:	89 87 c0 02 00 00    	mov    %eax,0x2c0(%edi)
  238dd1:	8d b7 c8 02 00 00    	lea    0x2c8(%edi),%esi
  238dd7:	8a 8f 80 02 00 00    	mov    0x280(%edi),%cl
  238ddd:	f6 c1 01             	test   $0x1,%cl
  238de0:	74 0e                	je     238df0 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x60>
  238de2:	8b 87 88 02 00 00    	mov    0x288(%edi),%eax
  238de8:	8b 8f 84 02 00 00    	mov    0x284(%edi),%ecx
  238dee:	eb 0b                	jmp    238dfb <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x6b>
  238df0:	8d 87 81 02 00 00    	lea    0x281(%edi),%eax
  238df6:	d0 e9                	shr    $1,%cl
  238df8:	0f b6 c9             	movzbl %cl,%ecx
  238dfb:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  238dff:	89 44 24 04          	mov    %eax,0x4(%esp)
  238e03:	89 34 24             	mov    %esi,(%esp)
  238e06:	e8 25 5d fc ff       	call   1feb30 <std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >::assign(char const*, unsigned int)@plt>
  238e0b:	8b 87 f0 02 00 00    	mov    0x2f0(%edi),%eax
  238e11:	89 44 24 04          	mov    %eax,0x4(%esp)
  238e15:	8d 44 24 38          	lea    0x38(%esp),%eax
  238e19:	89 04 24             	mov    %eax,(%esp)
  238e1c:	e8 cf 5b fc ff       	call   1fe9f0 <ToolsLayer::getCurrentColor()@plt>
  238e21:	83 ec 04             	sub    $0x4,%esp
  238e24:	8a 44 24 3a          	mov    0x3a(%esp),%al
  238e28:	88 87 d6 02 00 00    	mov    %al,0x2d6(%edi)
  238e2e:	0f b7 44 24 38       	movzwl 0x38(%esp),%eax
  238e33:	66 89 87 d4 02 00 00 	mov    %ax,0x2d4(%edi)
  238e3a:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  238e40:	85 c0                	test   %eax,%eax
  238e42:	0f 84 8d 01 00 00    	je     238fd5 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x245>
  238e48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  238e4b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  238e4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  238e53:	89 3c 24             	mov    %edi,(%esp)
  238e56:	e8 85 5b fc ff       	call   1fe9e0 <DrawScene::prepareCanvasToDraw(cocos2d::RenderTexture*, int)@plt>
  238e5b:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  238e61:	8b 08                	mov    (%eax),%ecx
  238e63:	89 04 24             	mov    %eax,(%esp)
  238e66:	ff 91 94 02 00 00    	call   *0x294(%ecx)
  238e6c:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  238e73:	00 
  238e74:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  238e7b:	00 
  238e7c:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  238e83:	00 
  238e84:	f6 87 c8 02 00 00 01 	testb  $0x1,0x2c8(%edi)
  238e8b:	75 13                	jne    238ea0 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x110>
  238e8d:	8b 46 08             	mov    0x8(%esi),%eax
  238e90:	89 44 24 30          	mov    %eax,0x30(%esp)
  238e94:	f2 0f 10 06          	movsd  (%esi),%xmm0
  238e98:	f2 0f 11 44 24 28    	movsd  %xmm0,0x28(%esp)
  238e9e:	eb 75                	jmp    238f15 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x185>
  238ea0:	8b 8f cc 02 00 00    	mov    0x2cc(%edi),%ecx
  238ea6:	83 f9 f0             	cmp    $0xfffffff0,%ecx
  238ea9:	0f 83 2e 01 00 00    	jae    238fdd <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x24d>
  238eaf:	8b 97 d0 02 00 00    	mov    0x2d0(%edi),%edx
  238eb5:	83 f9 0b             	cmp    $0xb,%ecx
  238eb8:	89 4c 24 40          	mov    %ecx,0x40(%esp)
  238ebc:	73 12                	jae    238ed0 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x140>
  238ebe:	89 c8                	mov    %ecx,%eax
  238ec0:	00 c8                	add    %cl,%al
  238ec2:	88 44 24 28          	mov    %al,0x28(%esp)
  238ec6:	8d 44 24 29          	lea    0x29(%esp),%eax
  238eca:	85 c9                	test   %ecx,%ecx
  238ecc:	75 2b                	jne    238ef9 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x169>
  238ece:	eb 41                	jmp    238f11 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x181>
  238ed0:	8d 71 10             	lea    0x10(%ecx),%esi
  238ed3:	83 e6 f0             	and    $0xfffffff0,%esi
  238ed6:	89 34 24             	mov    %esi,(%esp)
  238ed9:	89 54 24 44          	mov    %edx,0x44(%esp)
  238edd:	e8 8e 50 fc ff       	call   1fdf70 <operator new(unsigned int)@plt>
  238ee2:	8b 54 24 44          	mov    0x44(%esp),%edx
  238ee6:	8b 4c 24 40          	mov    0x40(%esp),%ecx
  238eea:	89 44 24 30          	mov    %eax,0x30(%esp)
  238eee:	83 ce 01             	or     $0x1,%esi
  238ef1:	89 74 24 28          	mov    %esi,0x28(%esp)
  238ef5:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
  238ef9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  238efd:	89 54 24 04          	mov    %edx,0x4(%esp)
  238f01:	89 04 24             	mov    %eax,(%esp)
  238f04:	89 c6                	mov    %eax,%esi
  238f06:	e8 95 53 fc ff       	call   1fe2a0 <memcpy@plt>
  238f0b:	89 f0                	mov    %esi,%eax
  238f0d:	8b 4c 24 40          	mov    0x40(%esp),%ecx
  238f11:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
  238f15:	8b 45 10             	mov    0x10(%ebp),%eax
  238f18:	8d 8f d4 02 00 00    	lea    0x2d4(%edi),%ecx
  238f1e:	8a 51 02             	mov    0x2(%ecx),%dl
  238f21:	88 54 24 22          	mov    %dl,0x22(%esp)
  238f25:	0f b7 09             	movzwl (%ecx),%ecx
  238f28:	66 89 4c 24 20       	mov    %cx,0x20(%esp)
  238f2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  238f31:	8d 74 24 50          	lea    0x50(%esp),%esi
  238f35:	89 34 24             	mov    %esi,(%esp)
  238f38:	e8 f3 5a fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  238f3d:	83 ec 04             	sub    $0x4,%esp
  238f40:	f2 0f 10 87 c0 02 00 	movsd  0x2c0(%edi),%xmm0
  238f47:	00 
  238f48:	f2 0f 11 44 24 48    	movsd  %xmm0,0x48(%esp)
  238f4e:	f2 0f 10 44 24 48    	movsd  0x48(%esp),%xmm0
  238f54:	f2 0f 11 44 24 10    	movsd  %xmm0,0x10(%esp)
  238f5a:	8a 44 24 22          	mov    0x22(%esp),%al
  238f5e:	88 44 24 0a          	mov    %al,0xa(%esp)
  238f62:	0f b7 44 24 20       	movzwl 0x20(%esp),%eax
  238f67:	66 89 44 24 08       	mov    %ax,0x8(%esp)
  238f6c:	89 74 24 0c          	mov    %esi,0xc(%esp)
  238f70:	8d 44 24 28          	lea    0x28(%esp),%eax
  238f74:	89 44 24 04          	mov    %eax,0x4(%esp)
  238f78:	89 3c 24             	mov    %edi,(%esp)
  238f7b:	c7 44 24 1c ff 00 00 	movl   $0xff,0x1c(%esp)
  238f82:	00 
  238f83:	c7 44 24 18 00 00 80 	movl   $0x3f800000,0x18(%esp)
  238f8a:	3f 
  238f8b:	e8 e0 59 fc ff       	call   1fe970 <DrawScene::drawSpriteOnActiveCanvas(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Color3B, cocos2d::Vec2, cocos2d::BlendFunc, float, int)@plt>
  238f90:	f6 44 24 28 01       	testb  $0x1,0x28(%esp)
  238f95:	74 0c                	je     238fa3 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x213>
  238f97:	8b 44 24 30          	mov    0x30(%esp),%eax
  238f9b:	89 04 24             	mov    %eax,(%esp)
  238f9e:	e8 ed 4f fc ff       	call   1fdf90 <operator delete(void*)@plt>
  238fa3:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  238fa9:	8b 08                	mov    (%eax),%ecx
  238fab:	89 04 24             	mov    %eax,(%esp)
  238fae:	ff 91 a4 02 00 00    	call   *0x2a4(%ecx)
  238fb4:	e8 27 50 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  238fb9:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  238fc0:	75 13                	jne    238fd5 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x245>
  238fc2:	e8 19 50 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  238fc7:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  238fcd:	89 04 24             	mov    %eax,(%esp)
  238fd0:	e8 cb 55 fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  238fd5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  238fd8:	5e                   	pop    %esi
  238fd9:	5f                   	pop    %edi
  238fda:	5b                   	pop    %ebx
  238fdb:	5d                   	pop    %ebp
  238fdc:	c3                   	ret
  238fdd:	8d 44 24 28          	lea    0x28(%esp),%eax
  238fe1:	89 04 24             	mov    %eax,(%esp)
  238fe4:	e8 f7 52 fc ff       	call   1fe2e0 <std::__ndk1::__basic_string_common<true>::__throw_length_error() const@plt>
  238fe9:	83 ec 04             	sub    $0x4,%esp
  238fec:	eb 00                	jmp    238fee <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x25e>
  238fee:	89 c6                	mov    %eax,%esi
  238ff0:	f6 44 24 28 01       	testb  $0x1,0x28(%esp)
  238ff5:	74 0c                	je     239003 <DrawScene::startDrawMarker(int, cocos2d::Touch*)@@Base+0x273>
  238ff7:	8b 44 24 30          	mov    0x30(%esp),%eax
  238ffb:	89 04 24             	mov    %eax,(%esp)
  238ffe:	e8 8d 4f fc ff       	call   1fdf90 <operator delete(void*)@plt>
  239003:	89 34 24             	mov    %esi,(%esp)
  239006:	e8 a8 f3 5b 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  23900b:	83 ec 04             	sub    $0x4,%esp

Disassembly of section .text:
00239900 <DrawScene::continueDraw(cocos2d::Touch*)@@Base>:
  239900:	55                   	push   %ebp
  239901:	89 e5                	mov    %esp,%ebp
  239903:	53                   	push   %ebx
  239904:	57                   	push   %edi
  239905:	56                   	push   %esi
  239906:	83 e4 f0             	and    $0xfffffff0,%esp
  239909:	83 ec 30             	sub    $0x30,%esp
  23990c:	e8 00 00 00 00       	call   239911 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x11>
  239911:	5b                   	pop    %ebx
  239912:	81 c3 83 76 79 00    	add    $0x797683,%ebx
  239918:	8b 75 08             	mov    0x8(%ebp),%esi
  23991b:	83 be 6c 02 00 00 00 	cmpl   $0x0,0x26c(%esi)
  239922:	0f 84 29 03 00 00    	je     239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239928:	8b 7d 0c             	mov    0xc(%ebp),%edi
  23992b:	8b 86 f0 02 00 00    	mov    0x2f0(%esi),%eax
  239931:	89 04 24             	mov    %eax,(%esp)
  239934:	e8 37 51 fc ff       	call   1fea70 <ToolsLayer::getCurrentTool()@plt>
  239939:	83 f8 06             	cmp    $0x6,%eax
  23993c:	0f 87 1d 01 00 00    	ja     239a5f <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x15f>
  239942:	8b 84 83 20 55 e7 ff 	mov    -0x18aae0(%ebx,%eax,4),%eax
  239949:	01 d8                	add    %ebx,%eax
  23994b:	ff e0                	jmp    *%eax
  23994d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239951:	8d 7c 24 10          	lea    0x10(%esp),%edi
  239955:	89 3c 24             	mov    %edi,(%esp)
  239958:	e8 d3 50 fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  23995d:	83 ec 04             	sub    $0x4,%esp
  239960:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239966:	3b 86 58 03 00 00    	cmp    0x358(%esi),%eax
  23996c:	0f 84 df 02 00 00    	je     239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239972:	83 c0 f8             	add    $0xfffffff8,%eax
  239975:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239979:	89 04 24             	mov    %eax,(%esp)
  23997c:	e8 3f 50 fc ff       	call   1fe9c0 <cocos2d::Vec2::distance(cocos2d::Vec2 const&) const@plt>
  239981:	d9 5c 24 1c          	fstps  0x1c(%esp)
  239985:	f3 0f 10 44 24 1c    	movss  0x1c(%esp),%xmm0
  23998b:	0f 2e 83 1c 46 e7 ff 	ucomiss -0x18b9e4(%ebx),%xmm0
  239992:	0f 86 b9 02 00 00    	jbe    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239998:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  23999e:	3b 86 60 03 00 00    	cmp    0x360(%esi),%eax
  2399a4:	0f 84 1d 02 00 00    	je     239bc7 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x2c7>
  2399aa:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  2399ae:	89 08                	mov    %ecx,(%eax)
  2399b0:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  2399b4:	89 48 04             	mov    %ecx,0x4(%eax)
  2399b7:	83 c0 08             	add    $0x8,%eax
  2399ba:	89 86 5c 03 00 00    	mov    %eax,0x35c(%esi)
  2399c0:	e9 14 02 00 00       	jmp    239bd9 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x2d9>
  2399c5:	89 7c 24 04          	mov    %edi,0x4(%esp)
  2399c9:	8d 7c 24 10          	lea    0x10(%esp),%edi
  2399cd:	89 3c 24             	mov    %edi,(%esp)
  2399d0:	e8 5b 50 fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  2399d5:	83 ec 04             	sub    $0x4,%esp
  2399d8:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  2399de:	3b 86 58 03 00 00    	cmp    0x358(%esi),%eax
  2399e4:	0f 84 67 02 00 00    	je     239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  2399ea:	83 c0 f8             	add    $0xfffffff8,%eax
  2399ed:	89 7c 24 04          	mov    %edi,0x4(%esp)
  2399f1:	89 04 24             	mov    %eax,(%esp)
  2399f4:	e8 c7 4f fc ff       	call   1fe9c0 <cocos2d::Vec2::distance(cocos2d::Vec2 const&) const@plt>
  2399f9:	d9 5c 24 20          	fstps  0x20(%esp)
  2399fd:	f3 0f 10 44 24 20    	movss  0x20(%esp),%xmm0
  239a03:	0f 2e 83 1c 46 e7 ff 	ucomiss -0x18b9e4(%ebx),%xmm0
  239a0a:	0f 86 41 02 00 00    	jbe    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239a10:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239a16:	3b 86 60 03 00 00    	cmp    0x360(%esi),%eax
  239a1c:	0f 84 c1 01 00 00    	je     239be3 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x2e3>
  239a22:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  239a26:	89 08                	mov    %ecx,(%eax)
  239a28:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  239a2c:	89 48 04             	mov    %ecx,0x4(%eax)
  239a2f:	83 c0 08             	add    $0x8,%eax
  239a32:	89 86 5c 03 00 00    	mov    %eax,0x35c(%esi)
  239a38:	e9 b8 01 00 00       	jmp    239bf5 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x2f5>
  239a3d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239a41:	89 34 24             	mov    %esi,(%esp)
  239a44:	e8 27 51 fc ff       	call   1feb70 <DrawScene::continueDrawBrush(cocos2d::Touch*)@plt>
  239a49:	e9 03 02 00 00       	jmp    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239a4e:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239a52:	89 34 24             	mov    %esi,(%esp)
  239a55:	e8 26 51 fc ff       	call   1feb80 <DrawScene::continueDrawSpray(cocos2d::Touch*)@plt>
  239a5a:	e9 f2 01 00 00       	jmp    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239a5f:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239a63:	8d 7c 24 10          	lea    0x10(%esp),%edi
  239a67:	89 3c 24             	mov    %edi,(%esp)
  239a6a:	e8 c1 4f fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  239a6f:	83 ec 04             	sub    $0x4,%esp
  239a72:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239a78:	3b 86 58 03 00 00    	cmp    0x358(%esi),%eax
  239a7e:	0f 84 cd 01 00 00    	je     239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239a84:	83 c0 f8             	add    $0xfffffff8,%eax
  239a87:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239a8b:	89 04 24             	mov    %eax,(%esp)
  239a8e:	e8 2d 4f fc ff       	call   1fe9c0 <cocos2d::Vec2::distance(cocos2d::Vec2 const&) const@plt>
  239a93:	d9 5c 24 18          	fstps  0x18(%esp)
  239a97:	f3 0f 10 44 24 18    	movss  0x18(%esp),%xmm0
  239a9d:	0f 2e 83 1c 46 e7 ff 	ucomiss -0x18b9e4(%ebx),%xmm0
  239aa4:	0f 86 a7 01 00 00    	jbe    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239aaa:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239ab0:	3b 86 60 03 00 00    	cmp    0x360(%esi),%eax
  239ab6:	0f 84 43 01 00 00    	je     239bff <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x2ff>
  239abc:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  239ac0:	89 08                	mov    %ecx,(%eax)
  239ac2:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  239ac6:	89 48 04             	mov    %ecx,0x4(%eax)
  239ac9:	83 c0 08             	add    $0x8,%eax
  239acc:	89 86 5c 03 00 00    	mov    %eax,0x35c(%esi)
  239ad2:	e9 3a 01 00 00       	jmp    239c11 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x311>
  239ad7:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239adb:	8d 7c 24 10          	lea    0x10(%esp),%edi
  239adf:	89 3c 24             	mov    %edi,(%esp)
  239ae2:	e8 49 4f fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  239ae7:	83 ec 04             	sub    $0x4,%esp
  239aea:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239af0:	3b 86 58 03 00 00    	cmp    0x358(%esi),%eax
  239af6:	0f 84 55 01 00 00    	je     239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239afc:	83 c0 f8             	add    $0xfffffff8,%eax
  239aff:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239b03:	89 04 24             	mov    %eax,(%esp)
  239b06:	e8 b5 4e fc ff       	call   1fe9c0 <cocos2d::Vec2::distance(cocos2d::Vec2 const&) const@plt>
  239b0b:	d9 5c 24 24          	fstps  0x24(%esp)
  239b0f:	f3 0f 10 44 24 24    	movss  0x24(%esp),%xmm0
  239b15:	0f 2e 83 1c 46 e7 ff 	ucomiss -0x18b9e4(%ebx),%xmm0
  239b1c:	0f 86 2f 01 00 00    	jbe    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239b22:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239b28:	3b 86 60 03 00 00    	cmp    0x360(%esi),%eax
  239b2e:	0f 84 e7 00 00 00    	je     239c1b <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x31b>
  239b34:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  239b38:	89 08                	mov    %ecx,(%eax)
  239b3a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  239b3e:	89 48 04             	mov    %ecx,0x4(%eax)
  239b41:	83 c0 08             	add    $0x8,%eax
  239b44:	89 86 5c 03 00 00    	mov    %eax,0x35c(%esi)
  239b4a:	e9 de 00 00 00       	jmp    239c2d <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x32d>
  239b4f:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239b53:	8d 7c 24 10          	lea    0x10(%esp),%edi
  239b57:	89 3c 24             	mov    %edi,(%esp)
  239b5a:	e8 d1 4e fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  239b5f:	83 ec 04             	sub    $0x4,%esp
  239b62:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239b68:	3b 86 58 03 00 00    	cmp    0x358(%esi),%eax
  239b6e:	0f 84 dd 00 00 00    	je     239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239b74:	83 c0 f8             	add    $0xfffffff8,%eax
  239b77:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239b7b:	89 04 24             	mov    %eax,(%esp)
  239b7e:	e8 3d 4e fc ff       	call   1fe9c0 <cocos2d::Vec2::distance(cocos2d::Vec2 const&) const@plt>
  239b83:	d9 5c 24 28          	fstps  0x28(%esp)
  239b87:	f3 0f 10 44 24 28    	movss  0x28(%esp),%xmm0
  239b8d:	0f 2e 83 1c 46 e7 ff 	ucomiss -0x18b9e4(%ebx),%xmm0
  239b94:	0f 86 b7 00 00 00    	jbe    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239b9a:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239ba0:	3b 86 60 03 00 00    	cmp    0x360(%esi),%eax
  239ba6:	0f 84 8b 00 00 00    	je     239c37 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x337>
  239bac:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  239bb0:	89 08                	mov    %ecx,(%eax)
  239bb2:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  239bb6:	89 48 04             	mov    %ecx,0x4(%eax)
  239bb9:	83 c0 08             	add    $0x8,%eax
  239bbc:	89 86 5c 03 00 00    	mov    %eax,0x35c(%esi)
  239bc2:	e9 82 00 00 00       	jmp    239c49 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x349>
  239bc7:	8d 86 58 03 00 00    	lea    0x358(%esi),%eax
  239bcd:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239bd1:	89 04 24             	mov    %eax,(%esp)
  239bd4:	e8 b7 4d fc ff       	call   1fe990 <void std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::__push_back_slow_path<cocos2d::Vec2 const&>(cocos2d::Vec2 const&)@plt>
  239bd9:	89 34 24             	mov    %esi,(%esp)
  239bdc:	e8 af 4f fc ff       	call   1feb90 <DrawScene::drawSmoothLines()@plt>
  239be1:	eb 6e                	jmp    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239be3:	8d 86 58 03 00 00    	lea    0x358(%esi),%eax
  239be9:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239bed:	89 04 24             	mov    %eax,(%esp)
  239bf0:	e8 9b 4d fc ff       	call   1fe990 <void std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::__push_back_slow_path<cocos2d::Vec2 const&>(cocos2d::Vec2 const&)@plt>
  239bf5:	89 34 24             	mov    %esi,(%esp)
  239bf8:	e8 93 4f fc ff       	call   1feb90 <DrawScene::drawSmoothLines()@plt>
  239bfd:	eb 52                	jmp    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239bff:	8d 86 58 03 00 00    	lea    0x358(%esi),%eax
  239c05:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239c09:	89 04 24             	mov    %eax,(%esp)
  239c0c:	e8 7f 4d fc ff       	call   1fe990 <void std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::__push_back_slow_path<cocos2d::Vec2 const&>(cocos2d::Vec2 const&)@plt>
  239c11:	89 34 24             	mov    %esi,(%esp)
  239c14:	e8 77 4f fc ff       	call   1feb90 <DrawScene::drawSmoothLines()@plt>
  239c19:	eb 36                	jmp    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239c1b:	8d 86 58 03 00 00    	lea    0x358(%esi),%eax
  239c21:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239c25:	89 04 24             	mov    %eax,(%esp)
  239c28:	e8 63 4d fc ff       	call   1fe990 <void std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::__push_back_slow_path<cocos2d::Vec2 const&>(cocos2d::Vec2 const&)@plt>
  239c2d:	89 34 24             	mov    %esi,(%esp)
  239c30:	e8 5b 4f fc ff       	call   1feb90 <DrawScene::drawSmoothLines()@plt>
  239c35:	eb 1a                	jmp    239c51 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x351>
  239c37:	8d 86 58 03 00 00    	lea    0x358(%esi),%eax
  239c3d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239c41:	89 04 24             	mov    %eax,(%esp)
  239c44:	e8 47 4d fc ff       	call   1fe990 <void std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::__push_back_slow_path<cocos2d::Vec2 const&>(cocos2d::Vec2 const&)@plt>
  239c49:	89 34 24             	mov    %esi,(%esp)
  239c4c:	e8 3f 4f fc ff       	call   1feb90 <DrawScene::drawSmoothLines()@plt>
  239c51:	8d 65 f4             	lea    -0xc(%ebp),%esp
  239c54:	5e                   	pop    %esi
  239c55:	5f                   	pop    %edi
  239c56:	5b                   	pop    %ebx
  239c57:	5d                   	pop    %ebp
  239c58:	c3                   	ret
  239c59:	eb 06                	jmp    239c61 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x361>
  239c5b:	eb 04                	jmp    239c61 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x361>
  239c5d:	eb 02                	jmp    239c61 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x361>
  239c5f:	eb 00                	jmp    239c61 <DrawScene::continueDraw(cocos2d::Touch*)@@Base+0x361>
  239c61:	89 04 24             	mov    %eax,(%esp)
  239c64:	e8 4a e7 5b 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  239c69:	83 ec 04             	sub    $0x4,%esp

Disassembly of section .text:
00239c70 <DrawScene::continueDrawMarker(cocos2d::Touch*)@@Base>:
  239c70:	55                   	push   %ebp
  239c71:	89 e5                	mov    %esp,%ebp
  239c73:	53                   	push   %ebx
  239c74:	57                   	push   %edi
  239c75:	56                   	push   %esi
  239c76:	83 e4 f0             	and    $0xfffffff0,%esp
  239c79:	83 ec 20             	sub    $0x20,%esp
  239c7c:	e8 00 00 00 00       	call   239c81 <DrawScene::continueDrawMarker(cocos2d::Touch*)@@Base+0x11>
  239c81:	5b                   	pop    %ebx
  239c82:	81 c3 13 73 79 00    	add    $0x797313,%ebx
  239c88:	8b 75 08             	mov    0x8(%ebp),%esi
  239c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  239c8e:	89 44 24 04          	mov    %eax,0x4(%esp)
  239c92:	8d 7c 24 10          	lea    0x10(%esp),%edi
  239c96:	89 3c 24             	mov    %edi,(%esp)
  239c99:	e8 92 4d fc ff       	call   1fea30 <cocos2d::Touch::getLocation() const@plt>
  239c9e:	83 ec 04             	sub    $0x4,%esp
  239ca1:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239ca7:	3b 86 58 03 00 00    	cmp    0x358(%esi),%eax
  239cad:	74 62                	je     239d11 <DrawScene::continueDrawMarker(cocos2d::Touch*)@@Base+0xa1>
  239caf:	83 c0 f8             	add    $0xfffffff8,%eax
  239cb2:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239cb6:	89 04 24             	mov    %eax,(%esp)
  239cb9:	e8 02 4d fc ff       	call   1fe9c0 <cocos2d::Vec2::distance(cocos2d::Vec2 const&) const@plt>
  239cbe:	d9 5c 24 0c          	fstps  0xc(%esp)
  239cc2:	f3 0f 10 44 24 0c    	movss  0xc(%esp),%xmm0
  239cc8:	0f 2e 83 1c 46 e7 ff 	ucomiss -0x18b9e4(%ebx),%xmm0
  239ccf:	76 40                	jbe    239d11 <DrawScene::continueDrawMarker(cocos2d::Touch*)@@Base+0xa1>
  239cd1:	8b 86 5c 03 00 00    	mov    0x35c(%esi),%eax
  239cd7:	3b 86 60 03 00 00    	cmp    0x360(%esi),%eax
  239cdd:	74 18                	je     239cf7 <DrawScene::continueDrawMarker(cocos2d::Touch*)@@Base+0x87>
  239cdf:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  239ce3:	89 08                	mov    %ecx,(%eax)
  239ce5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  239ce9:	89 48 04             	mov    %ecx,0x4(%eax)
  239cec:	83 c0 08             	add    $0x8,%eax
  239cef:	89 86 5c 03 00 00    	mov    %eax,0x35c(%esi)
  239cf5:	eb 12                	jmp    239d09 <DrawScene::continueDrawMarker(cocos2d::Touch*)@@Base+0x99>
  239cf7:	8d 86 58 03 00 00    	lea    0x358(%esi),%eax
  239cfd:	89 7c 24 04          	mov    %edi,0x4(%esp)
  239d01:	89 04 24             	mov    %eax,(%esp)
  239d04:	e8 87 4c fc ff       	call   1fe990 <void std::__ndk1::vector<cocos2d::Vec2, std::__ndk1::allocator<cocos2d::Vec2> >::__push_back_slow_path<cocos2d::Vec2 const&>(cocos2d::Vec2 const&)@plt>
  239d09:	89 34 24             	mov    %esi,(%esp)
  239d0c:	e8 7f 4e fc ff       	call   1feb90 <DrawScene::drawSmoothLines()@plt>
  239d11:	8d 65 f4             	lea    -0xc(%ebp),%esp
  239d14:	5e                   	pop    %esi
  239d15:	5f                   	pop    %edi
  239d16:	5b                   	pop    %ebx
  239d17:	5d                   	pop    %ebp
  239d18:	c3                   	ret
  239d19:	89 04 24             	mov    %eax,(%esp)
  239d1c:	e8 92 e6 5b 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  239d21:	83 ec 04             	sub    $0x4,%esp

Disassembly of section .text:
0023a640 <DrawScene::stopDraw(cocos2d::Touch*)@@Base>:
  23a640:	55                   	push   %ebp
  23a641:	89 e5                	mov    %esp,%ebp
  23a643:	53                   	push   %ebx
  23a644:	56                   	push   %esi
  23a645:	83 e4 f0             	and    $0xfffffff0,%esp
  23a648:	83 ec 10             	sub    $0x10,%esp
  23a64b:	e8 00 00 00 00       	call   23a650 <DrawScene::stopDraw(cocos2d::Touch*)@@Base+0x10>
  23a650:	5b                   	pop    %ebx
  23a651:	81 c3 44 69 79 00    	add    $0x796944,%ebx
  23a657:	8b 75 08             	mov    0x8(%ebp),%esi
  23a65a:	89 34 24             	mov    %esi,(%esp)
  23a65d:	c7 44 24 04 0f 27 00 	movl   $0x270f,0x4(%esp)
  23a664:	00 
  23a665:	e8 86 42 fc ff       	call   1fe8f0 <cocos2d::Node::stopActionByTag(int)@plt>
  23a66a:	c6 86 e8 02 00 00 00 	movb   $0x0,0x2e8(%esi)
  23a671:	8b 86 f0 02 00 00    	mov    0x2f0(%esi),%eax
  23a677:	89 04 24             	mov    %eax,(%esp)
  23a67a:	e8 f1 43 fc ff       	call   1fea70 <ToolsLayer::getCurrentTool()@plt>
  23a67f:	83 f8 06             	cmp    $0x6,%eax
  23a682:	77 0b                	ja     23a68f <DrawScene::stopDraw(cocos2d::Touch*)@@Base+0x4f>
  23a684:	8b 84 83 3c 55 e7 ff 	mov    -0x18aac4(%ebx,%eax,4),%eax
  23a68b:	01 d8                	add    %ebx,%eax
  23a68d:	ff e0                	jmp    *%eax
  23a68f:	89 34 24             	mov    %esi,(%esp)
  23a692:	e8 89 43 fc ff       	call   1fea20 <DrawScene::completeDraw()@plt>
  23a697:	eb 08                	jmp    23a6a1 <DrawScene::stopDraw(cocos2d::Touch*)@@Base+0x61>
  23a699:	89 34 24             	mov    %esi,(%esp)
  23a69c:	e8 ff 44 fc ff       	call   1feba0 <DrawScene::stopDrawPattern(cocos2d::Touch*)@plt>
  23a6a1:	89 34 24             	mov    %esi,(%esp)
  23a6a4:	e8 a7 43 fc ff       	call   1fea50 <DrawScene::enableDraw()@plt>
  23a6a9:	8b 86 d8 02 00 00    	mov    0x2d8(%esi),%eax
  23a6af:	8b 8e dc 02 00 00    	mov    0x2dc(%esi),%ecx
  23a6b5:	89 8e e4 02 00 00    	mov    %ecx,0x2e4(%esi)
  23a6bb:	89 86 e0 02 00 00    	mov    %eax,0x2e0(%esi)
  23a6c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  23a6c4:	5e                   	pop    %esi
  23a6c5:	5b                   	pop    %ebx
  23a6c6:	5d                   	pop    %ebp
  23a6c7:	c3                   	ret

Disassembly of section .text:
002387f0 <DrawScene::completeDraw()@@Base>:
  2387f0:	55                   	push   %ebp
  2387f1:	89 e5                	mov    %esp,%ebp
  2387f3:	53                   	push   %ebx
  2387f4:	57                   	push   %edi
  2387f5:	56                   	push   %esi
  2387f6:	83 e4 f0             	and    $0xfffffff0,%esp
  2387f9:	83 ec 10             	sub    $0x10,%esp
  2387fc:	e8 00 00 00 00       	call   238801 <DrawScene::completeDraw()@@Base+0x11>
  238801:	5b                   	pop    %ebx
  238802:	81 c3 93 87 79 00    	add    $0x798793,%ebx
  238808:	8b 75 08             	mov    0x8(%ebp),%esi
  23880b:	8b 86 6c 02 00 00    	mov    0x26c(%esi),%eax
  238811:	85 c0                	test   %eax,%eax
  238813:	0f 84 85 00 00 00    	je     23889e <DrawScene::completeDraw()@@Base+0xae>
  238819:	8d be 6c 02 00 00    	lea    0x26c(%esi),%edi
  23881f:	8d 96 50 02 00 00    	lea    0x250(%esi),%edx
  238825:	8b 8e 54 02 00 00    	mov    0x254(%esi),%ecx
  23882b:	3b 8e 58 02 00 00    	cmp    0x258(%esi),%ecx
  238831:	74 13                	je     238846 <DrawScene::completeDraw()@@Base+0x56>
  238833:	89 01                	mov    %eax,(%ecx)
  238835:	8b 8e 54 02 00 00    	mov    0x254(%esi),%ecx
  23883b:	83 c1 04             	add    $0x4,%ecx
  23883e:	89 8e 54 02 00 00    	mov    %ecx,0x254(%esi)
  238844:	eb 1b                	jmp    238861 <DrawScene::completeDraw()@@Base+0x71>
  238846:	83 ec 08             	sub    $0x8,%esp
  238849:	57                   	push   %edi
  23884a:	52                   	push   %edx
  23884b:	89 54 24 18          	mov    %edx,0x18(%esp)
  23884f:	e8 7c 5d fc ff       	call   1fe5d0 <void std::__ndk1::vector<cocos2d::RenderTexture*, std::__ndk1::allocator<cocos2d::RenderTexture*> >::__push_back_slow_path<cocos2d::RenderTexture* const&>(cocos2d::RenderTexture* const&)@plt>
  238854:	8b 54 24 18          	mov    0x18(%esp),%edx
  238858:	83 c4 10             	add    $0x10,%esp
  23885b:	8b 8e 54 02 00 00    	mov    0x254(%esi),%ecx
  238861:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  238867:	8b 02                	mov    (%edx),%eax
  238869:	39 c1                	cmp    %eax,%ecx
  23886b:	74 31                	je     23889e <DrawScene::completeDraw()@@Base+0xae>
  23886d:	31 ff                	xor    %edi,%edi
  23886f:	90                   	nop
  238870:	8b 04 b8             	mov    (%eax,%edi,4),%eax
  238873:	8b 8e 28 03 00 00    	mov    0x328(%esi),%ecx
  238879:	01 f9                	add    %edi,%ecx
  23887b:	8b 10                	mov    (%eax),%edx
  23887d:	83 ec 08             	sub    $0x8,%esp
  238880:	51                   	push   %ecx
  238881:	50                   	push   %eax
  238882:	ff 52 0c             	call   *0xc(%edx)
  238885:	83 c4 10             	add    $0x10,%esp
  238888:	47                   	inc    %edi
  238889:	8b 86 50 02 00 00    	mov    0x250(%esi),%eax
  23888f:	8b 8e 54 02 00 00    	mov    0x254(%esi),%ecx
  238895:	29 c1                	sub    %eax,%ecx
  238897:	c1 f9 02             	sar    $0x2,%ecx
  23889a:	39 cf                	cmp    %ecx,%edi
  23889c:	72 d2                	jb     238870 <DrawScene::completeDraw()@@Base+0x80>
  23889e:	83 ec 04             	sub    $0x4,%esp
  2388a1:	6a 01                	push   $0x1
  2388a3:	6a 01                	push   $0x1
  2388a5:	ff b6 f0 02 00 00    	push   0x2f0(%esi)
  2388ab:	e8 b0 61 fc ff       	call   1fea60 <ToolsLayer::setShelfVisible(bool, bool)@plt>
  2388b0:	83 c4 04             	add    $0x4,%esp
  2388b3:	ff b6 f0 02 00 00    	push   0x2f0(%esi)
  2388b9:	e8 92 5f fc ff       	call   1fe850 <ToolsLayer::setUndoButtonEnabled()@plt>
  2388be:	83 c4 10             	add    $0x10,%esp
  2388c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2388c4:	5e                   	pop    %esi
  2388c5:	5f                   	pop    %edi
  2388c6:	5b                   	pop    %ebx
  2388c7:	5d                   	pop    %ebp
  2388c8:	c3                   	ret

Disassembly of section .text:
00236370 <DrawScene::undoButtonPressed()@@Base>:
  236370:	55                   	push   %ebp
  236371:	89 e5                	mov    %esp,%ebp
  236373:	53                   	push   %ebx
  236374:	57                   	push   %edi
  236375:	56                   	push   %esi
  236376:	83 e4 f0             	and    $0xfffffff0,%esp
  236379:	83 ec 10             	sub    $0x10,%esp
  23637c:	e8 00 00 00 00       	call   236381 <DrawScene::undoButtonPressed()@@Base+0x11>
  236381:	5b                   	pop    %ebx
  236382:	81 c3 13 ac 79 00    	add    $0x79ac13,%ebx
  236388:	8b 75 08             	mov    0x8(%ebp),%esi
  23638b:	8b 86 50 02 00 00    	mov    0x250(%esi),%eax
  236391:	8b 8e 54 02 00 00    	mov    0x254(%esi),%ecx
  236397:	29 c1                	sub    %eax,%ecx
  236399:	0f 84 8b 00 00 00    	je     23642a <DrawScene::undoButtonPressed()@@Base+0xba>
  23639f:	8b 7c 08 fc          	mov    -0x4(%eax,%ecx,1),%edi
  2363a3:	85 ff                	test   %edi,%edi
  2363a5:	74 70                	je     236417 <DrawScene::undoButtonPressed()@@Base+0xa7>
  2363a7:	8b 07                	mov    (%edi),%eax
  2363a9:	83 ec 08             	sub    $0x8,%esp
  2363ac:	ff b6 40 03 00 00    	push   0x340(%esi)
  2363b2:	57                   	push   %edi
  2363b3:	ff 90 60 01 00 00    	call   *0x160(%eax)
  2363b9:	83 c4 10             	add    $0x10,%esp
  2363bc:	8b 07                	mov    (%edi),%eax
  2363be:	83 ec 0c             	sub    $0xc,%esp
  2363c1:	6a 00                	push   $0x0
  2363c3:	6a 00                	push   $0x0
  2363c5:	6a 00                	push   $0x0
  2363c7:	6a 00                	push   $0x0
  2363c9:	57                   	push   %edi
  2363ca:	ff 90 98 02 00 00    	call   *0x298(%eax)
  2363d0:	83 c4 20             	add    $0x20,%esp
  2363d3:	8b 07                	mov    (%edi),%eax
  2363d5:	83 ec 0c             	sub    $0xc,%esp
  2363d8:	57                   	push   %edi
  2363d9:	ff 90 a4 02 00 00    	call   *0x2a4(%eax)
  2363df:	83 c4 10             	add    $0x10,%esp
  2363e2:	8b 07                	mov    (%edi),%eax
  2363e4:	83 ec 08             	sub    $0x8,%esp
  2363e7:	6a 00                	push   $0x0
  2363e9:	57                   	push   %edi
  2363ea:	ff 90 b8 00 00 00    	call   *0xb8(%eax)
  2363f0:	83 c4 10             	add    $0x10,%esp
  2363f3:	e8 e8 7b fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2363f8:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  2363ff:	75 16                	jne    236417 <DrawScene::undoButtonPressed()@@Base+0xa7>
  236401:	e8 da 7b fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  236406:	83 ec 0c             	sub    $0xc,%esp
  236409:	ff b0 fc 00 00 00    	push   0xfc(%eax)
  23640f:	e8 8c 81 fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  236414:	83 c4 10             	add    $0x10,%esp
  236417:	8b 86 54 02 00 00    	mov    0x254(%esi),%eax
  23641d:	83 c0 fc             	add    $0xfffffffc,%eax
  236420:	b1 01                	mov    $0x1,%cl
  236422:	84 c9                	test   %cl,%cl
  236424:	89 86 54 02 00 00    	mov    %eax,0x254(%esi)
  23642a:	83 ec 0c             	sub    $0xc,%esp
  23642d:	ff b6 f0 02 00 00    	push   0x2f0(%esi)
  236433:	e8 18 84 fc ff       	call   1fe850 <ToolsLayer::setUndoButtonEnabled()@plt>
  236438:	83 c4 10             	add    $0x10,%esp
  23643b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  23643e:	5e                   	pop    %esi
  23643f:	5f                   	pop    %edi
  236440:	5b                   	pop    %ebx
  236441:	5d                   	pop    %ebp
  236442:	c3                   	ret

Disassembly of section .text:
002364f0 <DrawScene::clearButtonPressed()@@Base>:
  2364f0:	55                   	push   %ebp
  2364f1:	89 e5                	mov    %esp,%ebp
  2364f3:	53                   	push   %ebx
  2364f4:	57                   	push   %edi
  2364f5:	56                   	push   %esi
  2364f6:	83 e4 f0             	and    $0xfffffff0,%esp
  2364f9:	83 ec 10             	sub    $0x10,%esp
  2364fc:	e8 00 00 00 00       	call   236501 <DrawScene::clearButtonPressed()@@Base+0x11>
  236501:	5b                   	pop    %ebx
  236502:	81 c3 93 aa 79 00    	add    $0x79aa93,%ebx
  236508:	8b 75 08             	mov    0x8(%ebp),%esi
  23650b:	8b be 50 02 00 00    	mov    0x250(%esi),%edi
  236511:	8b 86 54 02 00 00    	mov    0x254(%esi),%eax
  236517:	89 44 24 08          	mov    %eax,0x8(%esp)
  23651b:	39 c7                	cmp    %eax,%edi
  23651d:	0f 84 9c 00 00 00    	je     2365bf <DrawScene::clearButtonPressed()@@Base+0xcf>
  236523:	90                   	nop
  236524:	90                   	nop
  236525:	90                   	nop
  236526:	90                   	nop
  236527:	90                   	nop
  236528:	90                   	nop
  236529:	90                   	nop
  23652a:	90                   	nop
  23652b:	90                   	nop
  23652c:	90                   	nop
  23652d:	90                   	nop
  23652e:	90                   	nop
  23652f:	90                   	nop
  236530:	8b 37                	mov    (%edi),%esi
  236532:	85 f6                	test   %esi,%esi
  236534:	74 73                	je     2365a9 <DrawScene::clearButtonPressed()@@Base+0xb9>
  236536:	8b 06                	mov    (%esi),%eax
  236538:	83 ec 08             	sub    $0x8,%esp
  23653b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  23653e:	ff b1 40 03 00 00    	push   0x340(%ecx)
  236544:	56                   	push   %esi
  236545:	ff 90 60 01 00 00    	call   *0x160(%eax)
  23654b:	83 c4 10             	add    $0x10,%esp
  23654e:	8b 06                	mov    (%esi),%eax
  236550:	83 ec 0c             	sub    $0xc,%esp
  236553:	6a 00                	push   $0x0
  236555:	6a 00                	push   $0x0
  236557:	6a 00                	push   $0x0
  236559:	6a 00                	push   $0x0
  23655b:	56                   	push   %esi
  23655c:	ff 90 98 02 00 00    	call   *0x298(%eax)
  236562:	83 c4 20             	add    $0x20,%esp
  236565:	8b 06                	mov    (%esi),%eax
  236567:	83 ec 0c             	sub    $0xc,%esp
  23656a:	56                   	push   %esi
  23656b:	ff 90 a4 02 00 00    	call   *0x2a4(%eax)
  236571:	83 c4 10             	add    $0x10,%esp
  236574:	8b 06                	mov    (%esi),%eax
  236576:	83 ec 08             	sub    $0x8,%esp
  236579:	6a 00                	push   $0x0
  23657b:	56                   	push   %esi
  23657c:	ff 90 b8 00 00 00    	call   *0xb8(%eax)
  236582:	83 c4 10             	add    $0x10,%esp
  236585:	e8 56 7a fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23658a:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  236591:	75 16                	jne    2365a9 <DrawScene::clearButtonPressed()@@Base+0xb9>
  236593:	e8 48 7a fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  236598:	83 ec 0c             	sub    $0xc,%esp
  23659b:	ff b0 fc 00 00 00    	push   0xfc(%eax)
  2365a1:	e8 fa 7f fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  2365a6:	83 c4 10             	add    $0x10,%esp
  2365a9:	83 c7 04             	add    $0x4,%edi
  2365ac:	39 7c 24 08          	cmp    %edi,0x8(%esp)
  2365b0:	0f 85 7a ff ff ff    	jne    236530 <DrawScene::clearButtonPressed()@@Base+0x40>
  2365b6:	8b 75 08             	mov    0x8(%ebp),%esi
  2365b9:	8b be 50 02 00 00    	mov    0x250(%esi),%edi
  2365bf:	89 be 54 02 00 00    	mov    %edi,0x254(%esi)
  2365c5:	8b 86 70 02 00 00    	mov    0x270(%esi),%eax
  2365cb:	8b 08                	mov    (%eax),%ecx
  2365cd:	83 ec 0c             	sub    $0xc,%esp
  2365d0:	68 00 00 80 3f       	push   $0x3f800000
  2365d5:	68 00 00 80 3f       	push   $0x3f800000
  2365da:	68 00 00 80 3f       	push   $0x3f800000
  2365df:	68 00 00 80 3f       	push   $0x3f800000
  2365e4:	50                   	push   %eax
  2365e5:	ff 91 98 02 00 00    	call   *0x298(%ecx)
  2365eb:	83 c4 20             	add    $0x20,%esp
  2365ee:	8b 86 70 02 00 00    	mov    0x270(%esi),%eax
  2365f4:	8b 08                	mov    (%eax),%ecx
  2365f6:	83 ec 0c             	sub    $0xc,%esp
  2365f9:	50                   	push   %eax
  2365fa:	ff 91 a4 02 00 00    	call   *0x2a4(%ecx)
  236600:	83 c4 10             	add    $0x10,%esp
  236603:	e8 d8 79 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  236608:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  23660f:	75 16                	jne    236627 <DrawScene::clearButtonPressed()@@Base+0x137>
  236611:	e8 ca 79 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  236616:	83 ec 0c             	sub    $0xc,%esp
  236619:	ff b0 fc 00 00 00    	push   0xfc(%eax)
  23661f:	e8 7c 7f fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  236624:	83 c4 10             	add    $0x10,%esp
  236627:	83 ec 0c             	sub    $0xc,%esp
  23662a:	ff b6 f0 02 00 00    	push   0x2f0(%esi)
  236630:	e8 1b 82 fc ff       	call   1fe850 <ToolsLayer::setUndoButtonEnabled()@plt>
  236635:	83 c4 10             	add    $0x10,%esp
  236638:	8d 65 f4             	lea    -0xc(%ebp),%esp
  23663b:	5e                   	pop    %esi
  23663c:	5f                   	pop    %edi
  23663d:	5b                   	pop    %ebx
  23663e:	5d                   	pop    %ebp
  23663f:	c3                   	ret

Disassembly of section .text:
0023acb0 <DrawScene::clearAll()@@Base>:
  23acb0:	55                   	push   %ebp
  23acb1:	89 e5                	mov    %esp,%ebp
  23acb3:	53                   	push   %ebx
  23acb4:	57                   	push   %edi
  23acb5:	56                   	push   %esi
  23acb6:	83 e4 f0             	and    $0xfffffff0,%esp
  23acb9:	83 ec 10             	sub    $0x10,%esp
  23acbc:	e8 00 00 00 00       	call   23acc1 <DrawScene::clearAll()@@Base+0x11>
  23acc1:	5b                   	pop    %ebx
  23acc2:	81 c3 d3 62 79 00    	add    $0x7962d3,%ebx
  23acc8:	8b 75 08             	mov    0x8(%ebp),%esi
  23accb:	8b be 50 02 00 00    	mov    0x250(%esi),%edi
  23acd1:	8b 86 54 02 00 00    	mov    0x254(%esi),%eax
  23acd7:	89 44 24 08          	mov    %eax,0x8(%esp)
  23acdb:	39 c7                	cmp    %eax,%edi
  23acdd:	0f 84 9c 00 00 00    	je     23ad7f <DrawScene::clearAll()@@Base+0xcf>
  23ace3:	90                   	nop
  23ace4:	90                   	nop
  23ace5:	90                   	nop
  23ace6:	90                   	nop
  23ace7:	90                   	nop
  23ace8:	90                   	nop
  23ace9:	90                   	nop
  23acea:	90                   	nop
  23aceb:	90                   	nop
  23acec:	90                   	nop
  23aced:	90                   	nop
  23acee:	90                   	nop
  23acef:	90                   	nop
  23acf0:	8b 37                	mov    (%edi),%esi
  23acf2:	85 f6                	test   %esi,%esi
  23acf4:	74 73                	je     23ad69 <DrawScene::clearAll()@@Base+0xb9>
  23acf6:	8b 06                	mov    (%esi),%eax
  23acf8:	83 ec 08             	sub    $0x8,%esp
  23acfb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  23acfe:	ff b1 40 03 00 00    	push   0x340(%ecx)
  23ad04:	56                   	push   %esi
  23ad05:	ff 90 60 01 00 00    	call   *0x160(%eax)
  23ad0b:	83 c4 10             	add    $0x10,%esp
  23ad0e:	8b 06                	mov    (%esi),%eax
  23ad10:	83 ec 0c             	sub    $0xc,%esp
  23ad13:	6a 00                	push   $0x0
  23ad15:	6a 00                	push   $0x0
  23ad17:	6a 00                	push   $0x0
  23ad19:	6a 00                	push   $0x0
  23ad1b:	56                   	push   %esi
  23ad1c:	ff 90 98 02 00 00    	call   *0x298(%eax)
  23ad22:	83 c4 20             	add    $0x20,%esp
  23ad25:	8b 06                	mov    (%esi),%eax
  23ad27:	83 ec 0c             	sub    $0xc,%esp
  23ad2a:	56                   	push   %esi
  23ad2b:	ff 90 a4 02 00 00    	call   *0x2a4(%eax)
  23ad31:	83 c4 10             	add    $0x10,%esp
  23ad34:	8b 06                	mov    (%esi),%eax
  23ad36:	83 ec 08             	sub    $0x8,%esp
  23ad39:	6a 00                	push   $0x0
  23ad3b:	56                   	push   %esi
  23ad3c:	ff 90 b8 00 00 00    	call   *0xb8(%eax)
  23ad42:	83 c4 10             	add    $0x10,%esp
  23ad45:	e8 96 32 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23ad4a:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  23ad51:	75 16                	jne    23ad69 <DrawScene::clearAll()@@Base+0xb9>
  23ad53:	e8 88 32 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23ad58:	83 ec 0c             	sub    $0xc,%esp
  23ad5b:	ff b0 fc 00 00 00    	push   0xfc(%eax)
  23ad61:	e8 3a 38 fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  23ad66:	83 c4 10             	add    $0x10,%esp
  23ad69:	83 c7 04             	add    $0x4,%edi
  23ad6c:	39 7c 24 08          	cmp    %edi,0x8(%esp)
  23ad70:	0f 85 7a ff ff ff    	jne    23acf0 <DrawScene::clearAll()@@Base+0x40>
  23ad76:	8b 75 08             	mov    0x8(%ebp),%esi
  23ad79:	8b be 50 02 00 00    	mov    0x250(%esi),%edi
  23ad7f:	89 be 54 02 00 00    	mov    %edi,0x254(%esi)
  23ad85:	8b 86 70 02 00 00    	mov    0x270(%esi),%eax
  23ad8b:	8b 08                	mov    (%eax),%ecx
  23ad8d:	83 ec 0c             	sub    $0xc,%esp
  23ad90:	68 00 00 80 3f       	push   $0x3f800000
  23ad95:	68 00 00 80 3f       	push   $0x3f800000
  23ad9a:	68 00 00 80 3f       	push   $0x3f800000
  23ad9f:	68 00 00 80 3f       	push   $0x3f800000
  23ada4:	50                   	push   %eax
  23ada5:	ff 91 98 02 00 00    	call   *0x298(%ecx)
  23adab:	83 c4 20             	add    $0x20,%esp
  23adae:	8b 86 70 02 00 00    	mov    0x270(%esi),%eax
  23adb4:	8b 08                	mov    (%eax),%ecx
  23adb6:	83 ec 0c             	sub    $0xc,%esp
  23adb9:	50                   	push   %eax
  23adba:	ff 91 a4 02 00 00    	call   *0x2a4(%ecx)
  23adc0:	83 c4 10             	add    $0x10,%esp
  23adc3:	e8 18 32 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23adc8:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  23adcf:	75 16                	jne    23ade7 <DrawScene::clearAll()@@Base+0x137>
  23add1:	e8 0a 32 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23add6:	83 ec 0c             	sub    $0xc,%esp
  23add9:	ff b0 fc 00 00 00    	push   0xfc(%eax)
  23addf:	e8 bc 37 fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  23ade4:	83 c4 10             	add    $0x10,%esp
  23ade7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  23adea:	5e                   	pop    %esi
  23adeb:	5f                   	pop    %edi
  23adec:	5b                   	pop    %ebx
  23aded:	5d                   	pop    %ebp
  23adee:	c3                   	ret

Disassembly of section .text:
002347c0 <DrawScene::saveButtonPressed()@@Base>:
  2347c0:	55                   	push   %ebp
  2347c1:	89 e5                	mov    %esp,%ebp
  2347c3:	53                   	push   %ebx
  2347c4:	57                   	push   %edi
  2347c5:	56                   	push   %esi
  2347c6:	83 e4 f0             	and    $0xfffffff0,%esp
  2347c9:	81 ec c0 00 00 00    	sub    $0xc0,%esp
  2347cf:	e8 00 00 00 00       	call   2347d4 <DrawScene::saveButtonPressed()@@Base+0x14>
  2347d4:	5b                   	pop    %ebx
  2347d5:	81 c3 c0 c7 79 00    	add    $0x79c7c0,%ebx
  2347db:	8b 7d 08             	mov    0x8(%ebp),%edi
  2347de:	8b 07                	mov    (%edi),%eax
  2347e0:	89 3c 24             	mov    %edi,(%esp)
  2347e3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  2347ea:	00 
  2347eb:	ff 90 24 03 00 00    	call   *0x324(%eax)
  2347f1:	8b 87 f0 02 00 00    	mov    0x2f0(%edi),%eax
  2347f7:	89 04 24             	mov    %eax,(%esp)
  2347fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  234801:	00 
  234802:	e8 59 9e fc ff       	call   1fe660 <ToolsLayer::setButtonsEnabled(bool)@plt>
  234807:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  23480e:	e8 5d 9e fc ff       	call   1fe670 <RateUsDialogue::incrementScore(unsigned int)@plt>
  234813:	8b 87 50 02 00 00    	mov    0x250(%edi),%eax
  234819:	39 87 54 02 00 00    	cmp    %eax,0x254(%edi)
  23481f:	74 3b                	je     23485c <DrawScene::saveButtonPressed()@@Base+0x9c>
  234821:	31 f6                	xor    %esi,%esi
  234823:	90                   	nop
  234824:	90                   	nop
  234825:	90                   	nop
  234826:	90                   	nop
  234827:	90                   	nop
  234828:	90                   	nop
  234829:	90                   	nop
  23482a:	90                   	nop
  23482b:	90                   	nop
  23482c:	90                   	nop
  23482d:	90                   	nop
  23482e:	90                   	nop
  23482f:	90                   	nop
  234830:	8b 04 b0             	mov    (%eax,%esi,4),%eax
  234833:	8b 8f 70 02 00 00    	mov    0x270(%edi),%ecx
  234839:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  23483d:	89 44 24 04          	mov    %eax,0x4(%esp)
  234841:	e8 3a 9e fc ff       	call   1fe680 <DrawScene::drawCanvasOnCanvas(cocos2d::RenderTexture*, cocos2d::RenderTexture*)@plt>
  234846:	46                   	inc    %esi
  234847:	8b 87 50 02 00 00    	mov    0x250(%edi),%eax
  23484d:	8b 8f 54 02 00 00    	mov    0x254(%edi),%ecx
  234853:	29 c1                	sub    %eax,%ecx
  234855:	c1 f9 02             	sar    $0x2,%ecx
  234858:	39 ce                	cmp    %ecx,%esi
  23485a:	72 d4                	jb     234830 <DrawScene::saveButtonPressed()@@Base+0x70>
  23485c:	8b 87 70 02 00 00    	mov    0x270(%edi),%eax
  234862:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  234866:	e8 35 9c fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  23486b:	89 c6                	mov    %eax,%esi
  23486d:	e8 3e 9c fc ff       	call   1fe4b0 <LevelManager::getCurrentLevel()@plt>
  234872:	89 44 24 08          	mov    %eax,0x8(%esp)
  234876:	89 74 24 04          	mov    %esi,0x4(%esp)
  23487a:	8d 74 24 30          	lea    0x30(%esp),%esi
  23487e:	89 34 24             	mov    %esi,(%esp)
  234881:	e8 0a 9e fc ff       	call   1fe690 <ImageFileManager::getMainImageNameForSave(int, int)@plt>
  234886:	83 ec 04             	sub    $0x4,%esp
  234889:	c7 84 24 b0 00 00 00 	movl   $0x0,0xb0(%esp)
  234890:	00 00 00 00 
  234894:	8d 84 24 a0 00 00 00 	lea    0xa0(%esp),%eax
  23489b:	89 44 24 10          	mov    %eax,0x10(%esp)
  23489f:	89 74 24 04          	mov    %esi,0x4(%esp)
  2348a3:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  2348a7:	89 04 24             	mov    %eax,(%esp)
  2348aa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  2348b1:	00 
  2348b2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  2348b9:	00 
  2348ba:	e8 e1 9d fc ff       	call   1fe6a0 <cocos2d::RenderTexture::saveToFile(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, cocos2d::Image::Format, bool, std::__ndk1::function<void (cocos2d::RenderTexture*, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)>)@plt>
  2348bf:	8b 84 24 b0 00 00 00 	mov    0xb0(%esp),%eax
  2348c6:	8d 8c 24 a0 00 00 00 	lea    0xa0(%esp),%ecx
  2348cd:	39 c1                	cmp    %eax,%ecx
  2348cf:	0f 84 f0 03 00 00    	je     234cc5 <DrawScene::saveButtonPressed()@@Base+0x505>
  2348d5:	85 c0                	test   %eax,%eax
  2348d7:	74 08                	je     2348e1 <DrawScene::saveButtonPressed()@@Base+0x121>
  2348d9:	8b 08                	mov    (%eax),%ecx
  2348db:	89 04 24             	mov    %eax,(%esp)
  2348de:	ff 51 14             	call   *0x14(%ecx)
  2348e1:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  2348e6:	74 0c                	je     2348f4 <DrawScene::saveButtonPressed()@@Base+0x134>
  2348e8:	8b 44 24 38          	mov    0x38(%esp),%eax
  2348ec:	89 04 24             	mov    %eax,(%esp)
  2348ef:	e8 9c 96 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  2348f4:	e8 e7 96 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2348f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  2348fd:	8d 74 24 30          	lea    0x30(%esp),%esi
  234901:	89 34 24             	mov    %esi,(%esp)
  234904:	e8 77 9b fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  234909:	83 ec 04             	sub    $0x4,%esp
  23490c:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  234912:	f3 0f 59 83 10 46 e7 	mulss  -0x18b9f0(%ebx),%xmm0
  234919:	ff 
  23491a:	f3 0f 11 04 24       	movss  %xmm0,(%esp)
  23491f:	e8 8c 9d fc ff       	call   1fe6b0 <floorf@plt>
  234924:	d9 c0                	fld    %st(0)
  234926:	db 7c 24 64          	fstpt  0x64(%esp)
  23492a:	d9 5c 24 5c          	fstps  0x5c(%esp)
  23492e:	f3 0f 10 44 24 5c    	movss  0x5c(%esp),%xmm0
  234934:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  23493a:	f3 0f 2c c0          	cvttss2si %xmm0,%eax
  23493e:	89 44 24 04          	mov    %eax,0x4(%esp)
  234942:	89 04 24             	mov    %eax,(%esp)
  234945:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
  23494c:	00 
  23494d:	e8 2e 9c fc ff       	call   1fe580 <cocos2d::RenderTexture::create(int, int, cocos2d::Texture2D::PixelFormat)@plt>
  234952:	89 44 24 44          	mov    %eax,0x44(%esp)
  234956:	8b 87 70 02 00 00    	mov    0x270(%edi),%eax
  23495c:	8b 80 ac 02 00 00    	mov    0x2ac(%eax),%eax
  234962:	8b 08                	mov    (%eax),%ecx
  234964:	89 04 24             	mov    %eax,(%esp)
  234967:	ff 91 a4 02 00 00    	call   *0x2a4(%ecx)
  23496d:	89 04 24             	mov    %eax,(%esp)
  234970:	e8 4b 9d fc ff       	call   1fe6c0 <cocos2d::Sprite::createWithTexture(cocos2d::Texture2D*)@plt>
  234975:	89 c6                	mov    %eax,%esi
  234977:	8b 00                	mov    (%eax),%eax
  234979:	89 34 24             	mov    %esi,(%esp)
  23497c:	ff 90 a4 02 00 00    	call   *0x2a4(%eax)
  234982:	89 04 24             	mov    %eax,(%esp)
  234985:	e8 46 9d fc ff       	call   1fe6d0 <cocos2d::Texture2D::setAntiAliasTexParameters()@plt>
  23498a:	89 34 24             	mov    %esi,(%esp)
  23498d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  234994:	00 
  234995:	e8 46 9d fc ff       	call   1fe6e0 <cocos2d::Sprite::setFlippedY(bool)@plt>
  23499a:	8b 06                	mov    (%esi),%eax
  23499c:	89 74 24 04          	mov    %esi,0x4(%esp)
  2349a0:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  2349a4:	89 0c 24             	mov    %ecx,(%esp)
  2349a7:	ff 90 b8 01 00 00    	call   *0x1b8(%eax)
  2349ad:	83 ec 04             	sub    $0x4,%esp
  2349b0:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  2349b6:	f3 0f 5e 44 24 3c    	divss  0x3c(%esp),%xmm0
  2349bc:	f3 0f 11 44 24 40    	movss  %xmm0,0x40(%esp)
  2349c2:	8b 06                	mov    (%esi),%eax
  2349c4:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  2349ca:	89 34 24             	mov    %esi,(%esp)
  2349cd:	ff 50 40             	call   *0x40(%eax)
  2349d0:	f3 0f 10 87 ec 02 00 	movss  0x2ec(%edi),%xmm0
  2349d7:	00 
  2349d8:	f3 0f 11 44 24 58    	movss  %xmm0,0x58(%esp)
  2349de:	e8 fd 95 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2349e3:	89 44 24 04          	mov    %eax,0x4(%esp)
  2349e7:	8d 44 24 30          	lea    0x30(%esp),%eax
  2349eb:	89 04 24             	mov    %eax,(%esp)
  2349ee:	e8 8d 9a fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  2349f3:	83 ec 04             	sub    $0x4,%esp
  2349f6:	f3 0f 10 44 24 30    	movss  0x30(%esp),%xmm0
  2349fc:	f3 0f 59 83 14 46 e7 	mulss  -0x18b9ec(%ebx),%xmm0
  234a03:	ff 
  234a04:	f3 0f 58 44 24 58    	addss  0x58(%esp),%xmm0
  234a0a:	f3 0f 59 44 24 40    	mulss  0x40(%esp),%xmm0
  234a10:	db 6c 24 64          	fldt   0x64(%esp)
  234a14:	dd 9c 24 80 00 00 00 	fstpl  0x80(%esp)
  234a1b:	f2 0f 10 8c 24 80 00 	movsd  0x80(%esp),%xmm1
  234a22:	00 00 
  234a24:	f2 0f 59 8b 7c 4a e7 	mulsd  -0x18b584(%ebx),%xmm1
  234a2b:	ff 
  234a2c:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  234a30:	f2 0f 5a d1          	cvtsd2ss %xmm1,%xmm2
  234a34:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
  234a38:	0f 57 c0             	xorps  %xmm0,%xmm0
  234a3b:	f2 0f 5a c1          	cvtsd2ss %xmm1,%xmm0
  234a3f:	8b 06                	mov    (%esi),%eax
  234a41:	f3 0f 11 54 24 40    	movss  %xmm2,0x40(%esp)
  234a47:	f3 0f 11 54 24 08    	movss  %xmm2,0x8(%esp)
  234a4d:	89 74 24 64          	mov    %esi,0x64(%esp)
  234a51:	89 34 24             	mov    %esi,(%esp)
  234a54:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  234a5a:	ff 50 64             	call   *0x64(%eax)
  234a5d:	8b 4c 24 44          	mov    0x44(%esp),%ecx
  234a61:	8b 01                	mov    (%ecx),%eax
  234a63:	89 0c 24             	mov    %ecx,(%esp)
  234a66:	ff 90 94 02 00 00    	call   *0x294(%eax)
  234a6c:	8b 83 00 e3 ff ff    	mov    -0x1d00(%ebx),%eax
  234a72:	8b 00                	mov    (%eax),%eax
  234a74:	89 44 24 60          	mov    %eax,0x60(%esp)
  234a78:	8b 83 04 e3 ff ff    	mov    -0x1cfc(%ebx),%eax
  234a7e:	8b 08                	mov    (%eax),%ecx
  234a80:	8b 40 04             	mov    0x4(%eax),%eax
  234a83:	89 4c 24 78          	mov    %ecx,0x78(%esp)
  234a87:	89 44 24 7c          	mov    %eax,0x7c(%esp)
  234a8b:	8b 83 08 e3 ff ff    	mov    -0x1cf8(%ebx),%eax
  234a91:	8b 08                	mov    (%eax),%ecx
  234a93:	8b 40 04             	mov    0x4(%eax),%eax
  234a96:	89 4c 24 70          	mov    %ecx,0x70(%esp)
  234a9a:	89 44 24 74          	mov    %eax,0x74(%esp)
  234a9e:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
  234aa5:	00 
  234aa6:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
  234aad:	00 
  234aae:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
  234ab5:	00 
  234ab6:	8b 44 24 60          	mov    0x60(%esp),%eax
  234aba:	89 04 24             	mov    %eax,(%esp)
  234abd:	8d 44 24 48          	lea    0x48(%esp),%eax
  234ac1:	89 44 24 20          	mov    %eax,0x20(%esp)
  234ac5:	8d 44 24 70          	lea    0x70(%esp),%eax
  234ac9:	89 44 24 18          	mov    %eax,0x18(%esp)
  234acd:	8d 44 24 78          	lea    0x78(%esp),%eax
  234ad1:	89 44 24 14          	mov    %eax,0x14(%esp)
  234ad5:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  234adb:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  234ae1:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  234ae7:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  234aee:	ff 
  234aef:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  234af6:	00 
  234af7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  234afe:	00 
  234aff:	e8 8c 99 fc ff       	call   1fe490 <createLayerColor(cocos2d::Color4B, float, float, cocos2d::Node*, int, cocos2d::Vec2, cocos2d::Vec2, int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >)@plt>
  234b04:	89 c6                	mov    %eax,%esi
  234b06:	f6 44 24 48 01       	testb  $0x1,0x48(%esp)
  234b0b:	74 0c                	je     234b19 <DrawScene::saveButtonPressed()@@Base+0x359>
  234b0d:	8b 44 24 50          	mov    0x50(%esp),%eax
  234b11:	89 04 24             	mov    %eax,(%esp)
  234b14:	e8 77 94 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  234b19:	89 34 24             	mov    %esi,(%esp)
  234b1c:	e8 6f 9a fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  234b21:	e8 7a 99 fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  234b26:	89 c6                	mov    %eax,%esi
  234b28:	46                   	inc    %esi
  234b29:	e8 72 99 fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  234b2e:	89 c7                	mov    %eax,%edi
  234b30:	47                   	inc    %edi
  234b31:	e8 7a 99 fc ff       	call   1fe4b0 <LevelManager::getCurrentLevel()@plt>
  234b36:	40                   	inc    %eax
  234b37:	89 44 24 10          	mov    %eax,0x10(%esp)
  234b3b:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  234b3f:	89 74 24 08          	mov    %esi,0x8(%esp)
  234b43:	8d 83 41 14 e5 ff    	lea    -0x1aebbf(%ebx),%eax
  234b49:	89 44 24 04          	mov    %eax,0x4(%esp)
  234b4d:	8d 44 24 30          	lea    0x30(%esp),%eax
  234b51:	89 c6                	mov    %eax,%esi
  234b53:	89 04 24             	mov    %eax,(%esp)
  234b56:	e8 d5 97 fc ff       	call   1fe330 <cocos2d::StringUtils::format(char const*, ...)@plt>
  234b5b:	83 ec 04             	sub    $0x4,%esp
  234b5e:	89 34 24             	mov    %esi,(%esp)
  234b61:	e8 9a 9a fc ff       	call   1fe600 <cocos2d::Sprite::create(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  234b66:	89 c6                	mov    %eax,%esi
  234b68:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234b6d:	74 0c                	je     234b7b <DrawScene::saveButtonPressed()@@Base+0x3bb>
  234b6f:	8b 44 24 38          	mov    0x38(%esp),%eax
  234b73:	89 04 24             	mov    %eax,(%esp)
  234b76:	e8 15 94 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  234b7b:	8b 06                	mov    (%esi),%eax
  234b7d:	89 74 24 04          	mov    %esi,0x4(%esp)
  234b81:	8d 7c 24 30          	lea    0x30(%esp),%edi
  234b85:	89 3c 24             	mov    %edi,(%esp)
  234b88:	ff 90 b8 01 00 00    	call   *0x1b8(%eax)
  234b8e:	83 ec 04             	sub    $0x4,%esp
  234b91:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  234b97:	f3 0f 5e 44 24 3c    	divss  0x3c(%esp),%xmm0
  234b9d:	8b 06                	mov    (%esi),%eax
  234b9f:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  234ba5:	89 34 24             	mov    %esi,(%esp)
  234ba8:	ff 50 40             	call   *0x40(%eax)
  234bab:	8b 06                	mov    (%esi),%eax
  234bad:	f3 0f 10 44 24 40    	movss  0x40(%esp),%xmm0
  234bb3:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  234bb9:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  234bbf:	89 34 24             	mov    %esi,(%esp)
  234bc2:	ff 50 64             	call   *0x64(%eax)
  234bc5:	89 34 24             	mov    %esi,(%esp)
  234bc8:	e8 c3 99 fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  234bcd:	8b 44 24 64          	mov    0x64(%esp),%eax
  234bd1:	89 04 24             	mov    %eax,(%esp)
  234bd4:	e8 b7 99 fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  234bd9:	8b 7c 24 44          	mov    0x44(%esp),%edi
  234bdd:	8b 07                	mov    (%edi),%eax
  234bdf:	89 3c 24             	mov    %edi,(%esp)
  234be2:	ff 90 a4 02 00 00    	call   *0x2a4(%eax)
  234be8:	e8 b3 98 fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  234bed:	89 c6                	mov    %eax,%esi
  234bef:	e8 bc 98 fc ff       	call   1fe4b0 <LevelManager::getCurrentLevel()@plt>
  234bf4:	89 44 24 08          	mov    %eax,0x8(%esp)
  234bf8:	89 74 24 04          	mov    %esi,0x4(%esp)
  234bfc:	8d 74 24 30          	lea    0x30(%esp),%esi
  234c00:	89 34 24             	mov    %esi,(%esp)
  234c03:	e8 e8 9a fc ff       	call   1fe6f0 <ImageFileManager::getIconImageNameForSave(int, int)@plt>
  234c08:	83 ec 04             	sub    $0x4,%esp
  234c0b:	c7 84 24 98 00 00 00 	movl   $0x0,0x98(%esp)
  234c12:	00 00 00 00 
  234c16:	8d 84 24 88 00 00 00 	lea    0x88(%esp),%eax
  234c1d:	89 44 24 10          	mov    %eax,0x10(%esp)
  234c21:	89 74 24 04          	mov    %esi,0x4(%esp)
  234c25:	89 3c 24             	mov    %edi,(%esp)
  234c28:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  234c2f:	00 
  234c30:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  234c37:	00 
  234c38:	e8 63 9a fc ff       	call   1fe6a0 <cocos2d::RenderTexture::saveToFile(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, cocos2d::Image::Format, bool, std::__ndk1::function<void (cocos2d::RenderTexture*, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)>)@plt>
  234c3d:	8b 84 24 98 00 00 00 	mov    0x98(%esp),%eax
  234c44:	8d 8c 24 88 00 00 00 	lea    0x88(%esp),%ecx
  234c4b:	39 c1                	cmp    %eax,%ecx
  234c4d:	0f 84 8a 00 00 00    	je     234cdd <DrawScene::saveButtonPressed()@@Base+0x51d>
  234c53:	85 c0                	test   %eax,%eax
  234c55:	74 08                	je     234c5f <DrawScene::saveButtonPressed()@@Base+0x49f>
  234c57:	8b 08                	mov    (%eax),%ecx
  234c59:	89 04 24             	mov    %eax,(%esp)
  234c5c:	ff 51 14             	call   *0x14(%ecx)
  234c5f:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234c64:	74 0c                	je     234c72 <DrawScene::saveButtonPressed()@@Base+0x4b2>
  234c66:	8b 44 24 38          	mov    0x38(%esp),%eax
  234c6a:	89 04 24             	mov    %eax,(%esp)
  234c6d:	e8 1e 93 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  234c72:	e8 29 98 fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  234c77:	89 c6                	mov    %eax,%esi
  234c79:	e8 32 98 fc ff       	call   1fe4b0 <LevelManager::getCurrentLevel()@plt>
  234c7e:	89 44 24 04          	mov    %eax,0x4(%esp)
  234c82:	89 34 24             	mov    %esi,(%esp)
  234c85:	e8 76 9a fc ff       	call   1fe700 <LevelManager::setLastSavedImage(int, int)@plt>
  234c8a:	e8 51 93 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  234c8f:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  234c96:	75 13                	jne    234cab <DrawScene::saveButtonPressed()@@Base+0x4eb>
  234c98:	e8 43 93 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  234c9d:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  234ca3:	89 04 24             	mov    %eax,(%esp)
  234ca6:	e8 f5 98 fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  234cab:	e8 60 9a fc ff       	call   1fe710 <ScreenManager::setDefaultContentScaleFactor()@plt>
  234cb0:	e8 2b 93 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  234cb5:	89 04 24             	mov    %eax,(%esp)
  234cb8:	e8 63 9a fc ff       	call   1fe720 <cocos2d::Director::popScene()@plt>
  234cbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  234cc0:	5e                   	pop    %esi
  234cc1:	5f                   	pop    %edi
  234cc2:	5b                   	pop    %ebx
  234cc3:	5d                   	pop    %ebp
  234cc4:	c3                   	ret
  234cc5:	8b 08                	mov    (%eax),%ecx
  234cc7:	89 04 24             	mov    %eax,(%esp)
  234cca:	ff 51 10             	call   *0x10(%ecx)
  234ccd:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234cd2:	0f 85 10 fc ff ff    	jne    2348e8 <DrawScene::saveButtonPressed()@@Base+0x128>
  234cd8:	e9 17 fc ff ff       	jmp    2348f4 <DrawScene::saveButtonPressed()@@Base+0x134>
  234cdd:	8b 08                	mov    (%eax),%ecx
  234cdf:	89 04 24             	mov    %eax,(%esp)
  234ce2:	ff 51 10             	call   *0x10(%ecx)
  234ce5:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234cea:	0f 85 76 ff ff ff    	jne    234c66 <DrawScene::saveButtonPressed()@@Base+0x4a6>
  234cf0:	eb 80                	jmp    234c72 <DrawScene::saveButtonPressed()@@Base+0x4b2>
  234cf2:	89 c7                	mov    %eax,%edi
  234cf4:	8b 84 24 98 00 00 00 	mov    0x98(%esp),%eax
  234cfb:	8d 8c 24 88 00 00 00 	lea    0x88(%esp),%ecx
  234d02:	39 c1                	cmp    %eax,%ecx
  234d04:	74 30                	je     234d36 <DrawScene::saveButtonPressed()@@Base+0x576>
  234d06:	eb 3f                	jmp    234d47 <DrawScene::saveButtonPressed()@@Base+0x587>
  234d08:	89 c7                	mov    %eax,%edi
  234d0a:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234d0f:	75 49                	jne    234d5a <DrawScene::saveButtonPressed()@@Base+0x59a>
  234d11:	eb 53                	jmp    234d66 <DrawScene::saveButtonPressed()@@Base+0x5a6>
  234d13:	89 c7                	mov    %eax,%edi
  234d15:	f6 44 24 48 01       	testb  $0x1,0x48(%esp)
  234d1a:	74 4a                	je     234d66 <DrawScene::saveButtonPressed()@@Base+0x5a6>
  234d1c:	8b 44 24 50          	mov    0x50(%esp),%eax
  234d20:	eb 3c                	jmp    234d5e <DrawScene::saveButtonPressed()@@Base+0x59e>
  234d22:	89 c7                	mov    %eax,%edi
  234d24:	8b 84 24 b0 00 00 00 	mov    0xb0(%esp),%eax
  234d2b:	8d 8c 24 a0 00 00 00 	lea    0xa0(%esp),%ecx
  234d32:	39 c1                	cmp    %eax,%ecx
  234d34:	75 11                	jne    234d47 <DrawScene::saveButtonPressed()@@Base+0x587>
  234d36:	8b 08                	mov    (%eax),%ecx
  234d38:	89 04 24             	mov    %eax,(%esp)
  234d3b:	ff 51 10             	call   *0x10(%ecx)
  234d3e:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234d43:	75 15                	jne    234d5a <DrawScene::saveButtonPressed()@@Base+0x59a>
  234d45:	eb 1f                	jmp    234d66 <DrawScene::saveButtonPressed()@@Base+0x5a6>
  234d47:	85 c0                	test   %eax,%eax
  234d49:	74 08                	je     234d53 <DrawScene::saveButtonPressed()@@Base+0x593>
  234d4b:	8b 08                	mov    (%eax),%ecx
  234d4d:	89 04 24             	mov    %eax,(%esp)
  234d50:	ff 51 14             	call   *0x14(%ecx)
  234d53:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234d58:	74 0c                	je     234d66 <DrawScene::saveButtonPressed()@@Base+0x5a6>
  234d5a:	8b 44 24 38          	mov    0x38(%esp),%eax
  234d5e:	89 04 24             	mov    %eax,(%esp)
  234d61:	e8 2a 92 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  234d66:	89 3c 24             	mov    %edi,(%esp)
  234d69:	e8 45 36 5c 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  234d6e:	83 ec 04             	sub    $0x4,%esp

Disassembly of section .text:
00234e00 <DrawScene::makeScreenshot()@@Base>:
  234e00:	55                   	push   %ebp
  234e01:	89 e5                	mov    %esp,%ebp
  234e03:	53                   	push   %ebx
  234e04:	57                   	push   %edi
  234e05:	56                   	push   %esi
  234e06:	83 e4 f0             	and    $0xfffffff0,%esp
  234e09:	81 ec d0 00 00 00    	sub    $0xd0,%esp
  234e0f:	e8 00 00 00 00       	call   234e14 <DrawScene::makeScreenshot()@@Base+0x14>
  234e14:	5b                   	pop    %ebx
  234e15:	81 c3 80 c1 79 00    	add    $0x79c180,%ebx
  234e1b:	8b 7d 08             	mov    0x8(%ebp),%edi
  234e1e:	8b 07                	mov    (%edi),%eax
  234e20:	89 3c 24             	mov    %edi,(%esp)
  234e23:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  234e2a:	00 
  234e2b:	ff 90 24 03 00 00    	call   *0x324(%eax)
  234e31:	8b 87 f0 02 00 00    	mov    0x2f0(%edi),%eax
  234e37:	89 04 24             	mov    %eax,(%esp)
  234e3a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  234e41:	00 
  234e42:	e8 19 98 fc ff       	call   1fe660 <ToolsLayer::setButtonsEnabled(bool)@plt>
  234e47:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  234e4e:	e8 1d 91 fc ff       	call   1fdf70 <operator new(unsigned int)@plt>
  234e53:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
  234e5a:	c7 44 24 78 11 00 00 	movl   $0x11,0x78(%esp)
  234e61:	00 
  234e62:	c7 44 24 7c 0e 00 00 	movl   $0xe,0x7c(%esp)
  234e69:	00 
  234e6a:	66 c7 40 0c 6e 67    	movw   $0x676e,0xc(%eax)
  234e70:	c7 40 08 6f 74 2e 70 	movl   $0x702e746f,0x8(%eax)
  234e77:	c7 40 04 65 6e 73 68 	movl   $0x68736e65,0x4(%eax)
  234e7e:	c7 00 73 63 72 65    	movl   $0x65726373,(%eax)
  234e84:	c6 40 0e 00          	movb   $0x0,0xe(%eax)
  234e88:	e8 a3 98 fc ff       	call   1fe730 <cocos2d::FileUtils::getInstance()@plt>
  234e8d:	8b 08                	mov    (%eax),%ecx
  234e8f:	8b 49 50             	mov    0x50(%ecx),%ecx
  234e92:	89 44 24 04          	mov    %eax,0x4(%esp)
  234e96:	8d 44 24 30          	lea    0x30(%esp),%eax
  234e9a:	89 04 24             	mov    %eax,(%esp)
  234e9d:	ff d1                	call   *%ecx
  234e9f:	83 ec 04             	sub    $0x4,%esp
  234ea2:	8a 4c 24 78          	mov    0x78(%esp),%cl
  234ea6:	f6 c1 01             	test   $0x1,%cl
  234ea9:	74 0d                	je     234eb8 <DrawScene::makeScreenshot()@@Base+0xb8>
  234eab:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
  234eb2:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
  234eb6:	eb 09                	jmp    234ec1 <DrawScene::makeScreenshot()@@Base+0xc1>
  234eb8:	d0 e9                	shr    $1,%cl
  234eba:	8d 44 24 79          	lea    0x79(%esp),%eax
  234ebe:	0f b6 c9             	movzbl %cl,%ecx
  234ec1:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  234ec5:	89 44 24 04          	mov    %eax,0x4(%esp)
  234ec9:	8d 44 24 30          	lea    0x30(%esp),%eax
  234ecd:	89 04 24             	mov    %eax,(%esp)
  234ed0:	e8 fb 93 fc ff       	call   1fe2d0 <std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >::append(char const*, unsigned int)@plt>
  234ed5:	8b 48 08             	mov    0x8(%eax),%ecx
  234ed8:	89 4c 24 70          	mov    %ecx,0x70(%esp)
  234edc:	f2 0f 10 00          	movsd  (%eax),%xmm0
  234ee0:	f2 0f 11 44 24 68    	movsd  %xmm0,0x68(%esp)
  234ee6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  234eed:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  234ef4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  234efa:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  234eff:	74 0c                	je     234f0d <DrawScene::makeScreenshot()@@Base+0x10d>
  234f01:	8b 44 24 38          	mov    0x38(%esp),%eax
  234f05:	89 04 24             	mov    %eax,(%esp)
  234f08:	e8 83 90 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  234f0d:	8b b7 70 02 00 00    	mov    0x270(%edi),%esi
  234f13:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
  234f1a:	00 
  234f1b:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
  234f22:	00 
  234f23:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
  234f2a:	00 
  234f2b:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  234f32:	e8 39 90 fc ff       	call   1fdf70 <operator new(unsigned int)@plt>
  234f37:	89 f9                	mov    %edi,%ecx
  234f39:	89 c7                	mov    %eax,%edi
  234f3b:	89 7c 24 40          	mov    %edi,0x40(%esp)
  234f3f:	83 c7 04             	add    $0x4,%edi
  234f42:	89 7c 24 48          	mov    %edi,0x48(%esp)
  234f46:	89 30                	mov    %esi,(%eax)
  234f48:	89 7c 24 44          	mov    %edi,0x44(%esp)
  234f4c:	8b b1 50 02 00 00    	mov    0x250(%ecx),%esi
  234f52:	8b 81 54 02 00 00    	mov    0x254(%ecx),%eax
  234f58:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  234f5c:	39 c6                	cmp    %eax,%esi
  234f5e:	74 5a                	je     234fba <DrawScene::makeScreenshot()@@Base+0x1ba>
  234f60:	83 44 24 2c fc       	addl   $0xfffffffc,0x2c(%esp)
  234f65:	89 f9                	mov    %edi,%ecx
  234f67:	eb 12                	jmp    234f7b <DrawScene::makeScreenshot()@@Base+0x17b>
  234f69:	90                   	nop
  234f6a:	90                   	nop
  234f6b:	90                   	nop
  234f6c:	90                   	nop
  234f6d:	90                   	nop
  234f6e:	90                   	nop
  234f6f:	90                   	nop
  234f70:	83 c6 04             	add    $0x4,%esi
  234f73:	8b 4c 24 44          	mov    0x44(%esp),%ecx
  234f77:	8b 7c 24 48          	mov    0x48(%esp),%edi
  234f7b:	8b 06                	mov    (%esi),%eax
  234f7d:	89 44 24 30          	mov    %eax,0x30(%esp)
  234f81:	39 f9                	cmp    %edi,%ecx
  234f83:	74 1b                	je     234fa0 <DrawScene::makeScreenshot()@@Base+0x1a0>
  234f85:	89 01                	mov    %eax,(%ecx)
  234f87:	83 44 24 44 04       	addl   $0x4,0x44(%esp)
  234f8c:	39 74 24 2c          	cmp    %esi,0x2c(%esp)
  234f90:	75 de                	jne    234f70 <DrawScene::makeScreenshot()@@Base+0x170>
  234f92:	eb 26                	jmp    234fba <DrawScene::makeScreenshot()@@Base+0x1ba>
  234f94:	90                   	nop
  234f95:	90                   	nop
  234f96:	90                   	nop
  234f97:	90                   	nop
  234f98:	90                   	nop
  234f99:	90                   	nop
  234f9a:	90                   	nop
  234f9b:	90                   	nop
  234f9c:	90                   	nop
  234f9d:	90                   	nop
  234f9e:	90                   	nop
  234f9f:	90                   	nop
  234fa0:	8d 44 24 30          	lea    0x30(%esp),%eax
  234fa4:	89 44 24 04          	mov    %eax,0x4(%esp)
  234fa8:	8d 44 24 40          	lea    0x40(%esp),%eax
  234fac:	89 04 24             	mov    %eax,(%esp)
  234faf:	e8 1c 96 fc ff       	call   1fe5d0 <void std::__ndk1::vector<cocos2d::RenderTexture*, std::__ndk1::allocator<cocos2d::RenderTexture*> >::__push_back_slow_path<cocos2d::RenderTexture* const&>(cocos2d::RenderTexture* const&)@plt>
  234fb4:	39 74 24 2c          	cmp    %esi,0x2c(%esp)
  234fb8:	75 b6                	jne    234f70 <DrawScene::makeScreenshot()@@Base+0x170>
  234fba:	8b 45 08             	mov    0x8(%ebp),%eax
  234fbd:	f3 0f 10 80 ec 02 00 	movss  0x2ec(%eax),%xmm0
  234fc4:	00 
  234fc5:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  234fcb:	e8 10 90 fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  234fd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  234fd4:	8d 44 24 30          	lea    0x30(%esp),%eax
  234fd8:	89 04 24             	mov    %eax,(%esp)
  234fdb:	e8 a0 94 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  234fe0:	83 ec 04             	sub    $0x4,%esp
  234fe3:	f3 0f 10 44 24 30    	movss  0x30(%esp),%xmm0
  234fe9:	f3 0f 11 44 24 64    	movss  %xmm0,0x64(%esp)
  234fef:	e8 ec 8f fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  234ff4:	89 44 24 04          	mov    %eax,0x4(%esp)
  234ff8:	8d 44 24 30          	lea    0x30(%esp),%eax
  234ffc:	89 04 24             	mov    %eax,(%esp)
  234fff:	e8 7c 94 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  235004:	83 ec 04             	sub    $0x4,%esp
  235007:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  23500d:	f3 0f 11 84 24 84 00 	movss  %xmm0,0x84(%esp)
  235014:	00 00 
  235016:	e8 c5 8f fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23501b:	89 44 24 04          	mov    %eax,0x4(%esp)
  23501f:	8d 44 24 30          	lea    0x30(%esp),%eax
  235023:	89 04 24             	mov    %eax,(%esp)
  235026:	e8 55 94 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  23502b:	83 ec 04             	sub    $0x4,%esp
  23502e:	f3 0f 10 4c 24 64    	movss  0x64(%esp),%xmm1
  235034:	f3 0f 59 8b 00 46 e7 	mulss  -0x18ba00(%ebx),%xmm1
  23503b:	ff 
  23503c:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  235042:	f3 0f 5c c1          	subss  %xmm1,%xmm0
  235046:	f3 0f 10 8c 24 84 00 	movss  0x84(%esp),%xmm1
  23504d:	00 00 
  23504f:	f3 0f 59 8b 00 46 e7 	mulss  -0x18ba00(%ebx),%xmm1
  235056:	ff 
  235057:	f3 0f 5c c8          	subss  %xmm0,%xmm1
  23505b:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  235061:	f3 0f 59 83 00 46 e7 	mulss  -0x18ba00(%ebx),%xmm0
  235068:	ff 
  235069:	f3 0f 11 8c 24 a8 00 	movss  %xmm1,0xa8(%esp)
  235070:	00 00 
  235072:	f3 0f 11 84 24 ac 00 	movss  %xmm0,0xac(%esp)
  235079:	00 00 
  23507b:	e8 60 8f fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  235080:	89 44 24 04          	mov    %eax,0x4(%esp)
  235084:	8d 44 24 30          	lea    0x30(%esp),%eax
  235088:	89 04 24             	mov    %eax,(%esp)
  23508b:	e8 f0 93 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  235090:	83 ec 04             	sub    $0x4,%esp
  235093:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  235099:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  23509f:	e8 3c 8f fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2350a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  2350a8:	8d 44 24 30          	lea    0x30(%esp),%eax
  2350ac:	89 04 24             	mov    %eax,(%esp)
  2350af:	e8 cc 93 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  2350b4:	83 ec 04             	sub    $0x4,%esp
  2350b7:	f3 0f 2c 44 24 34    	cvttss2si 0x34(%esp),%eax
  2350bd:	f3 0f 2c 4c 24 2c    	cvttss2si 0x2c(%esp),%ecx
  2350c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  2350c7:	89 0c 24             	mov    %ecx,(%esp)
  2350ca:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
  2350d1:	00 
  2350d2:	e8 a9 94 fc ff       	call   1fe580 <cocos2d::RenderTexture::create(int, int, cocos2d::Texture2D::PixelFormat)@plt>
  2350d7:	89 c7                	mov    %eax,%edi
  2350d9:	8b 00                	mov    (%eax),%eax
  2350db:	8b 80 94 02 00 00    	mov    0x294(%eax),%eax
  2350e1:	89 3c 24             	mov    %edi,(%esp)
  2350e4:	ff d0                	call   *%eax
  2350e6:	8b 83 00 e3 ff ff    	mov    -0x1d00(%ebx),%eax
  2350ec:	8b 00                	mov    (%eax),%eax
  2350ee:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
  2350f5:	e8 e6 8e fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2350fa:	89 44 24 04          	mov    %eax,0x4(%esp)
  2350fe:	8d 44 24 30          	lea    0x30(%esp),%eax
  235102:	89 04 24             	mov    %eax,(%esp)
  235105:	e8 76 93 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  23510a:	83 ec 04             	sub    $0x4,%esp
  23510d:	f3 0f 10 44 24 30    	movss  0x30(%esp),%xmm0
  235113:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  235119:	e8 c2 8e fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  23511e:	89 44 24 04          	mov    %eax,0x4(%esp)
  235122:	8d 44 24 30          	lea    0x30(%esp),%eax
  235126:	89 04 24             	mov    %eax,(%esp)
  235129:	e8 52 93 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  23512e:	83 ec 04             	sub    $0x4,%esp
  235131:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  235137:	8b 83 04 e3 ff ff    	mov    -0x1cfc(%ebx),%eax
  23513d:	8b 08                	mov    (%eax),%ecx
  23513f:	8b 40 04             	mov    0x4(%eax),%eax
  235142:	89 8c 24 a0 00 00 00 	mov    %ecx,0xa0(%esp)
  235149:	89 84 24 a4 00 00 00 	mov    %eax,0xa4(%esp)
  235150:	8b 83 08 e3 ff ff    	mov    -0x1cf8(%ebx),%eax
  235156:	8b 08                	mov    (%eax),%ecx
  235158:	8b 40 04             	mov    0x4(%eax),%eax
  23515b:	89 8c 24 98 00 00 00 	mov    %ecx,0x98(%esp)
  235162:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%esp)
  235169:	c7 84 24 90 00 00 00 	movl   $0x0,0x90(%esp)
  235170:	00 00 00 00 
  235174:	c7 84 24 8c 00 00 00 	movl   $0x0,0x8c(%esp)
  23517b:	00 00 00 00 
  23517f:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
  235186:	00 00 00 00 
  23518a:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
  235191:	89 04 24             	mov    %eax,(%esp)
  235194:	8d 84 24 88 00 00 00 	lea    0x88(%esp),%eax
  23519b:	89 44 24 20          	mov    %eax,0x20(%esp)
  23519f:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  2351a6:	89 44 24 18          	mov    %eax,0x18(%esp)
  2351aa:	8d 84 24 a0 00 00 00 	lea    0xa0(%esp),%eax
  2351b1:	89 44 24 14          	mov    %eax,0x14(%esp)
  2351b5:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  2351bb:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  2351c1:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  2351c7:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  2351ce:	ff 
  2351cf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  2351d6:	00 
  2351d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2351de:	00 
  2351df:	e8 ac 92 fc ff       	call   1fe490 <createLayerColor(cocos2d::Color4B, float, float, cocos2d::Node*, int, cocos2d::Vec2, cocos2d::Vec2, int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >)@plt>
  2351e4:	89 c6                	mov    %eax,%esi
  2351e6:	f6 84 24 88 00 00 00 	testb  $0x1,0x88(%esp)
  2351ed:	01 
  2351ee:	74 0f                	je     2351ff <DrawScene::makeScreenshot()@@Base+0x3ff>
  2351f0:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
  2351f7:	89 04 24             	mov    %eax,(%esp)
  2351fa:	e8 91 8d fc ff       	call   1fdf90 <operator delete(void*)@plt>
  2351ff:	89 34 24             	mov    %esi,(%esp)
  235202:	e8 89 93 fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  235207:	89 7c 24 64          	mov    %edi,0x64(%esp)
  23520b:	8b 74 24 40          	mov    0x40(%esp),%esi
  23520f:	8b 44 24 44          	mov    0x44(%esp),%eax
  235213:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  235217:	39 c6                	cmp    %eax,%esi
  235219:	74 5a                	je     235275 <DrawScene::makeScreenshot()@@Base+0x475>
  23521b:	90                   	nop
  23521c:	90                   	nop
  23521d:	90                   	nop
  23521e:	90                   	nop
  23521f:	90                   	nop
  235220:	8b 06                	mov    (%esi),%eax
  235222:	8b 80 ac 02 00 00    	mov    0x2ac(%eax),%eax
  235228:	8b 08                	mov    (%eax),%ecx
  23522a:	8b 89 a4 02 00 00    	mov    0x2a4(%ecx),%ecx
  235230:	89 04 24             	mov    %eax,(%esp)
  235233:	ff d1                	call   *%ecx
  235235:	89 04 24             	mov    %eax,(%esp)
  235238:	e8 83 94 fc ff       	call   1fe6c0 <cocos2d::Sprite::createWithTexture(cocos2d::Texture2D*)@plt>
  23523d:	89 c7                	mov    %eax,%edi
  23523f:	8b 00                	mov    (%eax),%eax
  235241:	8b 40 4c             	mov    0x4c(%eax),%eax
  235244:	8d 8c 24 a8 00 00 00 	lea    0xa8(%esp),%ecx
  23524b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  23524f:	89 3c 24             	mov    %edi,(%esp)
  235252:	ff d0                	call   *%eax
  235254:	89 3c 24             	mov    %edi,(%esp)
  235257:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  23525e:	00 
  23525f:	e8 7c 94 fc ff       	call   1fe6e0 <cocos2d::Sprite::setFlippedY(bool)@plt>
  235264:	89 3c 24             	mov    %edi,(%esp)
  235267:	e8 24 93 fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  23526c:	83 c6 04             	add    $0x4,%esi
  23526f:	39 74 24 2c          	cmp    %esi,0x2c(%esp)
  235273:	75 ab                	jne    235220 <DrawScene::makeScreenshot()@@Base+0x420>
  235275:	e8 26 92 fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  23527a:	89 c7                	mov    %eax,%edi
  23527c:	e8 1f 92 fc ff       	call   1fe4a0 <LevelManager::getCurrentPack()@plt>
  235281:	89 c6                	mov    %eax,%esi
  235283:	e8 28 92 fc ff       	call   1fe4b0 <LevelManager::getCurrentLevel()@plt>
  235288:	47                   	inc    %edi
  235289:	46                   	inc    %esi
  23528a:	40                   	inc    %eax
  23528b:	89 44 24 10          	mov    %eax,0x10(%esp)
  23528f:	89 74 24 0c          	mov    %esi,0xc(%esp)
  235293:	89 7c 24 08          	mov    %edi,0x8(%esp)
  235297:	8d 83 41 14 e5 ff    	lea    -0x1aebbf(%ebx),%eax
  23529d:	89 44 24 04          	mov    %eax,0x4(%esp)
  2352a1:	8d 44 24 30          	lea    0x30(%esp),%eax
  2352a5:	89 04 24             	mov    %eax,(%esp)
  2352a8:	e8 83 90 fc ff       	call   1fe330 <cocos2d::StringUtils::format(char const*, ...)@plt>
  2352ad:	83 ec 04             	sub    $0x4,%esp
  2352b0:	8d 44 24 30          	lea    0x30(%esp),%eax
  2352b4:	89 04 24             	mov    %eax,(%esp)
  2352b7:	e8 44 93 fc ff       	call   1fe600 <cocos2d::Sprite::create(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  2352bc:	89 c7                	mov    %eax,%edi
  2352be:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  2352c3:	74 0c                	je     2352d1 <DrawScene::makeScreenshot()@@Base+0x4d1>
  2352c5:	8b 44 24 38          	mov    0x38(%esp),%eax
  2352c9:	89 04 24             	mov    %eax,(%esp)
  2352cc:	e8 bf 8c fc ff       	call   1fdf90 <operator delete(void*)@plt>
  2352d1:	e8 0a 8d fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2352d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  2352da:	8d 44 24 30          	lea    0x30(%esp),%eax
  2352de:	89 04 24             	mov    %eax,(%esp)
  2352e1:	e8 9a 91 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  2352e6:	83 ec 04             	sub    $0x4,%esp
  2352e9:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  2352ef:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  2352f5:	e8 e6 8c fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2352fa:	89 44 24 04          	mov    %eax,0x4(%esp)
  2352fe:	8d 44 24 30          	lea    0x30(%esp),%eax
  235302:	89 04 24             	mov    %eax,(%esp)
  235305:	e8 76 91 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  23530a:	83 ec 04             	sub    $0x4,%esp
  23530d:	f3 0f 10 4c 24 2c    	movss  0x2c(%esp),%xmm1
  235313:	f3 0f 59 8b 00 46 e7 	mulss  -0x18ba00(%ebx),%xmm1
  23531a:	ff 
  23531b:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  235321:	f3 0f 59 83 00 46 e7 	mulss  -0x18ba00(%ebx),%xmm0
  235328:	ff 
  235329:	8b 07                	mov    (%edi),%eax
  23532b:	8b 40 64             	mov    0x64(%eax),%eax
  23532e:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  235334:	f3 0f 11 4c 24 04    	movss  %xmm1,0x4(%esp)
  23533a:	89 3c 24             	mov    %edi,(%esp)
  23533d:	ff d0                	call   *%eax
  23533f:	e8 9c 8c fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  235344:	89 44 24 04          	mov    %eax,0x4(%esp)
  235348:	8d 44 24 30          	lea    0x30(%esp),%eax
  23534c:	89 04 24             	mov    %eax,(%esp)
  23534f:	e8 2c 91 fc ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  235354:	83 ec 04             	sub    $0x4,%esp
  235357:	f3 0f 10 44 24 34    	movss  0x34(%esp),%xmm0
  23535d:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  235363:	8b 07                	mov    (%edi),%eax
  235365:	8b 80 b8 01 00 00    	mov    0x1b8(%eax),%eax
  23536b:	89 7c 24 04          	mov    %edi,0x4(%esp)
  23536f:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  235373:	89 0c 24             	mov    %ecx,(%esp)
  235376:	ff d0                	call   *%eax
  235378:	83 ec 04             	sub    $0x4,%esp
  23537b:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  235381:	f3 0f 5e 44 24 3c    	divss  0x3c(%esp),%xmm0
  235387:	8b 07                	mov    (%edi),%eax
  235389:	8b 40 40             	mov    0x40(%eax),%eax
  23538c:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  235392:	89 3c 24             	mov    %edi,(%esp)
  235395:	ff d0                	call   *%eax
  235397:	89 3c 24             	mov    %edi,(%esp)
  23539a:	e8 f1 91 fc ff       	call   1fe590 <cocos2d::Node::visit()@plt>
  23539f:	8b 4c 24 64          	mov    0x64(%esp),%ecx
  2353a3:	8b 01                	mov    (%ecx),%eax
  2353a5:	8b 80 a4 02 00 00    	mov    0x2a4(%eax),%eax
  2353ab:	89 0c 24             	mov    %ecx,(%esp)
  2353ae:	ff d0                	call   *%eax
  2353b0:	e8 2b 8c fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2353b5:	80 b8 10 01 00 00 00 	cmpb   $0x0,0x110(%eax)
  2353bc:	75 13                	jne    2353d1 <DrawScene::makeScreenshot()@@Base+0x5d1>
  2353be:	e8 1d 8c fc ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  2353c3:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  2353c9:	89 04 24             	mov    %eax,(%esp)
  2353cc:	e8 cf 91 fc ff       	call   1fe5a0 <cocos2d::Renderer::render()@plt>
  2353d1:	e8 5a 93 fc ff       	call   1fe730 <cocos2d::FileUtils::getInstance()@plt>
  2353d6:	8b 08                	mov    (%eax),%ecx
  2353d8:	8b 89 94 00 00 00    	mov    0x94(%ecx),%ecx
  2353de:	8d 74 24 68          	lea    0x68(%esp),%esi
  2353e2:	89 74 24 04          	mov    %esi,0x4(%esp)
  2353e6:	89 04 24             	mov    %eax,(%esp)
  2353e9:	ff d1                	call   *%ecx
  2353eb:	84 c0                	test   %al,%al
  2353ed:	74 16                	je     235405 <DrawScene::makeScreenshot()@@Base+0x605>
  2353ef:	e8 3c 93 fc ff       	call   1fe730 <cocos2d::FileUtils::getInstance()@plt>
  2353f4:	8b 08                	mov    (%eax),%ecx
  2353f6:	8b 89 bc 00 00 00    	mov    0xbc(%ecx),%ecx
  2353fc:	89 74 24 04          	mov    %esi,0x4(%esp)
  235400:	89 04 24             	mov    %eax,(%esp)
  235403:	ff d1                	call   *%ecx
  235405:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
  23540c:	00 
  23540d:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
  235414:	00 
  235415:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
  23541c:	00 
  23541d:	f6 44 24 68 01       	testb  $0x1,0x68(%esp)
  235422:	75 16                	jne    23543a <DrawScene::makeScreenshot()@@Base+0x63a>
  235424:	8b 44 24 70          	mov    0x70(%esp),%eax
  235428:	89 44 24 58          	mov    %eax,0x58(%esp)
  23542c:	f2 0f 10 44 24 68    	movsd  0x68(%esp),%xmm0
  235432:	f2 0f 11 44 24 50    	movsd  %xmm0,0x50(%esp)
  235438:	eb 75                	jmp    2354af <DrawScene::makeScreenshot()@@Base+0x6af>
  23543a:	8b 4c 24 6c          	mov    0x6c(%esp),%ecx
  23543e:	83 f9 f0             	cmp    $0xfffffff0,%ecx
  235441:	0f 83 71 01 00 00    	jae    2355b8 <DrawScene::makeScreenshot()@@Base+0x7b8>
  235447:	8b 54 24 70          	mov    0x70(%esp),%edx
  23544b:	83 f9 0b             	cmp    $0xb,%ecx
  23544e:	73 12                	jae    235462 <DrawScene::makeScreenshot()@@Base+0x662>
  235450:	89 c8                	mov    %ecx,%eax
  235452:	00 c8                	add    %cl,%al
  235454:	88 44 24 50          	mov    %al,0x50(%esp)
  235458:	8d 7c 24 51          	lea    0x51(%esp),%edi
  23545c:	85 c9                	test   %ecx,%ecx
  23545e:	75 37                	jne    235497 <DrawScene::makeScreenshot()@@Base+0x697>
  235460:	eb 49                	jmp    2354ab <DrawScene::makeScreenshot()@@Base+0x6ab>
  235462:	89 94 24 84 00 00 00 	mov    %edx,0x84(%esp)
  235469:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
  23546d:	8d 71 10             	lea    0x10(%ecx),%esi
  235470:	83 e6 f0             	and    $0xfffffff0,%esi
  235473:	89 34 24             	mov    %esi,(%esp)
  235476:	e8 f5 8a fc ff       	call   1fdf70 <operator new(unsigned int)@plt>
  23547b:	89 c7                	mov    %eax,%edi
  23547d:	89 44 24 58          	mov    %eax,0x58(%esp)
  235481:	83 ce 01             	or     $0x1,%esi
  235484:	89 74 24 50          	mov    %esi,0x50(%esp)
  235488:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  23548c:	89 4c 24 54          	mov    %ecx,0x54(%esp)
  235490:	8b 94 24 84 00 00 00 	mov    0x84(%esp),%edx
  235497:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  23549b:	89 54 24 04          	mov    %edx,0x4(%esp)
  23549f:	89 3c 24             	mov    %edi,(%esp)
  2354a2:	89 ce                	mov    %ecx,%esi
  2354a4:	e8 f7 8d fc ff       	call   1fe2a0 <memcpy@plt>
  2354a9:	89 f1                	mov    %esi,%ecx
  2354ab:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
  2354af:	8b 75 08             	mov    0x8(%ebp),%esi
  2354b2:	89 74 24 5c          	mov    %esi,0x5c(%esp)
  2354b6:	c7 84 24 c0 00 00 00 	movl   $0x0,0xc0(%esp)
  2354bd:	00 00 00 00 
  2354c1:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  2354c8:	e8 a3 8a fc ff       	call   1fdf70 <operator new(unsigned int)@plt>
  2354cd:	8d 8b 04 78 fd ff    	lea    -0x287fc(%ebx),%ecx
  2354d3:	89 08                	mov    %ecx,(%eax)
  2354d5:	8b 4c 24 58          	mov    0x58(%esp),%ecx
  2354d9:	89 48 0c             	mov    %ecx,0xc(%eax)
  2354dc:	f2 0f 10 44 24 50    	movsd  0x50(%esp),%xmm0
  2354e2:	f2 0f 11 40 04       	movsd  %xmm0,0x4(%eax)
  2354e7:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
  2354ee:	00 
  2354ef:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
  2354f6:	00 
  2354f7:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
  2354fe:	00 
  2354ff:	89 70 10             	mov    %esi,0x10(%eax)
  235502:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%esp)
  235509:	8d bc 24 b0 00 00 00 	lea    0xb0(%esp),%edi
  235510:	89 7c 24 10          	mov    %edi,0x10(%esp)
  235514:	8d 44 24 78          	lea    0x78(%esp),%eax
  235518:	89 44 24 04          	mov    %eax,0x4(%esp)
  23551c:	8b 44 24 64          	mov    0x64(%esp),%eax
  235520:	89 04 24             	mov    %eax,(%esp)
  235523:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  23552a:	00 
  23552b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  235532:	00 
  235533:	e8 68 91 fc ff       	call   1fe6a0 <cocos2d::RenderTexture::saveToFile(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, cocos2d::Image::Format, bool, std::__ndk1::function<void (cocos2d::RenderTexture*, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)>)@plt>
  235538:	8b 84 24 c0 00 00 00 	mov    0xc0(%esp),%eax
  23553f:	39 c7                	cmp    %eax,%edi
  235541:	74 64                	je     2355a7 <DrawScene::makeScreenshot()@@Base+0x7a7>
  235543:	85 c0                	test   %eax,%eax
  235545:	74 08                	je     23554f <DrawScene::makeScreenshot()@@Base+0x74f>
  235547:	8b 08                	mov    (%eax),%ecx
  235549:	89 04 24             	mov    %eax,(%esp)
  23554c:	ff 51 14             	call   *0x14(%ecx)
  23554f:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  235554:	74 0c                	je     235562 <DrawScene::makeScreenshot()@@Base+0x762>
  235556:	8b 44 24 58          	mov    0x58(%esp),%eax
  23555a:	89 04 24             	mov    %eax,(%esp)
  23555d:	e8 2e 8a fc ff       	call   1fdf90 <operator delete(void*)@plt>
  235562:	8b 44 24 40          	mov    0x40(%esp),%eax
  235566:	85 c0                	test   %eax,%eax
  235568:	74 0c                	je     235576 <DrawScene::makeScreenshot()@@Base+0x776>
  23556a:	89 44 24 44          	mov    %eax,0x44(%esp)
  23556e:	89 04 24             	mov    %eax,(%esp)
  235571:	e8 1a 8a fc ff       	call   1fdf90 <operator delete(void*)@plt>
  235576:	f6 44 24 68 01       	testb  $0x1,0x68(%esp)
  23557b:	74 0c                	je     235589 <DrawScene::makeScreenshot()@@Base+0x789>
  23557d:	8b 44 24 70          	mov    0x70(%esp),%eax
  235581:	89 04 24             	mov    %eax,(%esp)
  235584:	e8 07 8a fc ff       	call   1fdf90 <operator delete(void*)@plt>
  235589:	f6 44 24 78 01       	testb  $0x1,0x78(%esp)
  23558e:	74 0f                	je     23559f <DrawScene::makeScreenshot()@@Base+0x79f>
  235590:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
  235597:	89 04 24             	mov    %eax,(%esp)
  23559a:	e8 f1 89 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  23559f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2355a2:	5e                   	pop    %esi
  2355a3:	5f                   	pop    %edi
  2355a4:	5b                   	pop    %ebx
  2355a5:	5d                   	pop    %ebp
  2355a6:	c3                   	ret
  2355a7:	8b 08                	mov    (%eax),%ecx
  2355a9:	89 04 24             	mov    %eax,(%esp)
  2355ac:	ff 51 10             	call   *0x10(%ecx)
  2355af:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  2355b4:	75 a0                	jne    235556 <DrawScene::makeScreenshot()@@Base+0x756>
  2355b6:	eb aa                	jmp    235562 <DrawScene::makeScreenshot()@@Base+0x762>
  2355b8:	8d 44 24 50          	lea    0x50(%esp),%eax
  2355bc:	89 04 24             	mov    %eax,(%esp)
  2355bf:	e8 1c 8d fc ff       	call   1fe2e0 <std::__ndk1::__basic_string_common<true>::__throw_length_error() const@plt>
  2355c4:	83 ec 04             	sub    $0x4,%esp
  2355c7:	89 c6                	mov    %eax,%esi
  2355c9:	8b 84 24 c0 00 00 00 	mov    0xc0(%esp),%eax
  2355d0:	39 c7                	cmp    %eax,%edi
  2355d2:	75 14                	jne    2355e8 <DrawScene::makeScreenshot()@@Base+0x7e8>
  2355d4:	8b 08                	mov    (%eax),%ecx
  2355d6:	89 04 24             	mov    %eax,(%esp)
  2355d9:	ff 51 10             	call   *0x10(%ecx)
  2355dc:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  2355e1:	75 23                	jne    235606 <DrawScene::makeScreenshot()@@Base+0x806>
  2355e3:	e9 85 00 00 00       	jmp    23566d <DrawScene::makeScreenshot()@@Base+0x86d>
  2355e8:	85 c0                	test   %eax,%eax
  2355ea:	74 13                	je     2355ff <DrawScene::makeScreenshot()@@Base+0x7ff>
  2355ec:	8b 08                	mov    (%eax),%ecx
  2355ee:	89 04 24             	mov    %eax,(%esp)
  2355f1:	ff 51 14             	call   *0x14(%ecx)
  2355f4:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  2355f9:	75 0b                	jne    235606 <DrawScene::makeScreenshot()@@Base+0x806>
  2355fb:	eb 70                	jmp    23566d <DrawScene::makeScreenshot()@@Base+0x86d>
  2355fd:	89 c6                	mov    %eax,%esi
  2355ff:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  235604:	74 67                	je     23566d <DrawScene::makeScreenshot()@@Base+0x86d>
  235606:	8b 44 24 58          	mov    0x58(%esp),%eax
  23560a:	eb 22                	jmp    23562e <DrawScene::makeScreenshot()@@Base+0x82e>
  23560c:	89 c6                	mov    %eax,%esi
  23560e:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  235613:	74 58                	je     23566d <DrawScene::makeScreenshot()@@Base+0x86d>
  235615:	8b 44 24 38          	mov    0x38(%esp),%eax
  235619:	eb 13                	jmp    23562e <DrawScene::makeScreenshot()@@Base+0x82e>
  23561b:	89 c6                	mov    %eax,%esi
  23561d:	f6 84 24 88 00 00 00 	testb  $0x1,0x88(%esp)
  235624:	01 
  235625:	74 46                	je     23566d <DrawScene::makeScreenshot()@@Base+0x86d>
  235627:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
  23562e:	89 04 24             	mov    %eax,(%esp)
  235631:	e8 5a 89 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  235636:	eb 35                	jmp    23566d <DrawScene::makeScreenshot()@@Base+0x86d>
  235638:	89 c6                	mov    %eax,%esi
  23563a:	f6 44 24 68 01       	testb  $0x1,0x68(%esp)
  23563f:	75 47                	jne    235688 <DrawScene::makeScreenshot()@@Base+0x888>
  235641:	eb 51                	jmp    235694 <DrawScene::makeScreenshot()@@Base+0x894>
  235643:	89 c6                	mov    %eax,%esi
  235645:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  23564a:	74 48                	je     235694 <DrawScene::makeScreenshot()@@Base+0x894>
  23564c:	8b 44 24 38          	mov    0x38(%esp),%eax
  235650:	eb 3a                	jmp    23568c <DrawScene::makeScreenshot()@@Base+0x88c>
  235652:	eb 17                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  235654:	eb 15                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  235656:	89 c6                	mov    %eax,%esi
  235658:	f6 44 24 78 01       	testb  $0x1,0x78(%esp)
  23565d:	75 3c                	jne    23569b <DrawScene::makeScreenshot()@@Base+0x89b>
  23565f:	eb 49                	jmp    2356aa <DrawScene::makeScreenshot()@@Base+0x8aa>
  235661:	eb 08                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  235663:	eb 06                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  235665:	eb 04                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  235667:	eb 02                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  235669:	eb 00                	jmp    23566b <DrawScene::makeScreenshot()@@Base+0x86b>
  23566b:	89 c6                	mov    %eax,%esi
  23566d:	8b 44 24 40          	mov    0x40(%esp),%eax
  235671:	85 c0                	test   %eax,%eax
  235673:	74 0c                	je     235681 <DrawScene::makeScreenshot()@@Base+0x881>
  235675:	89 44 24 44          	mov    %eax,0x44(%esp)
  235679:	89 04 24             	mov    %eax,(%esp)
  23567c:	e8 0f 89 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  235681:	f6 44 24 68 01       	testb  $0x1,0x68(%esp)
  235686:	74 0c                	je     235694 <DrawScene::makeScreenshot()@@Base+0x894>
  235688:	8b 44 24 70          	mov    0x70(%esp),%eax
  23568c:	89 04 24             	mov    %eax,(%esp)
  23568f:	e8 fc 88 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  235694:	f6 44 24 78 01       	testb  $0x1,0x78(%esp)
  235699:	74 0f                	je     2356aa <DrawScene::makeScreenshot()@@Base+0x8aa>
  23569b:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
  2356a2:	89 04 24             	mov    %eax,(%esp)
  2356a5:	e8 e6 88 fc ff       	call   1fdf90 <operator delete(void*)@plt>
  2356aa:	89 34 24             	mov    %esi,(%esp)
  2356ad:	e8 01 2d 5c 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  2356b2:	83 ec 04             	sub    $0x4,%esp

Disassembly of section .text:
00240880 <ImageFileManager::getMainImageNameForSave(int, int)@@Base>:
  240880:	55                   	push   %ebp
  240881:	89 e5                	mov    %esp,%ebp
  240883:	53                   	push   %ebx
  240884:	56                   	push   %esi
  240885:	83 e4 f0             	and    $0xfffffff0,%esp
  240888:	e8 00 00 00 00       	call   24088d <ImageFileManager::getMainImageNameForSave(int, int)@@Base+0xd>
  24088d:	5b                   	pop    %ebx
  24088e:	81 c3 07 07 79 00    	add    $0x790707,%ebx
  240894:	8b 75 08             	mov    0x8(%ebp),%esi
  240897:	8d 83 5f 18 e5 ff    	lea    -0x1ae7a1(%ebx),%eax
  24089d:	ff 75 10             	push   0x10(%ebp)
  2408a0:	ff 75 0c             	push   0xc(%ebp)
  2408a3:	50                   	push   %eax
  2408a4:	56                   	push   %esi
  2408a5:	e8 86 da fb ff       	call   1fe330 <cocos2d::StringUtils::format(char const*, ...)@plt>
  2408aa:	83 c4 0c             	add    $0xc,%esp
  2408ad:	89 f0                	mov    %esi,%eax
  2408af:	8d 65 f8             	lea    -0x8(%ebp),%esp
  2408b2:	5e                   	pop    %esi
  2408b3:	5b                   	pop    %ebx
  2408b4:	5d                   	pop    %ebp
  2408b5:	c2 04 00             	ret    $0x4

Disassembly of section .text:
002408c0 <ImageFileManager::getMainImageNameForRead(int, int)@@Base>:
  2408c0:	55                   	push   %ebp
  2408c1:	89 e5                	mov    %esp,%ebp
  2408c3:	53                   	push   %ebx
  2408c4:	56                   	push   %esi
  2408c5:	83 e4 f0             	and    $0xfffffff0,%esp
  2408c8:	83 ec 30             	sub    $0x30,%esp
  2408cb:	e8 00 00 00 00       	call   2408d0 <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0x10>
  2408d0:	5b                   	pop    %ebx
  2408d1:	81 c3 c4 06 79 00    	add    $0x7906c4,%ebx
  2408d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  2408da:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2408dd:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  2408e1:	89 44 24 08          	mov    %eax,0x8(%esp)
  2408e5:	8d 83 5f 18 e5 ff    	lea    -0x1ae7a1(%ebx),%eax
  2408eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  2408ef:	8d 44 24 10          	lea    0x10(%esp),%eax
  2408f3:	89 04 24             	mov    %eax,(%esp)
  2408f6:	e8 35 da fb ff       	call   1fe330 <cocos2d::StringUtils::format(char const*, ...)@plt>
  2408fb:	83 ec 04             	sub    $0x4,%esp
  2408fe:	e8 2d de fb ff       	call   1fe730 <cocos2d::FileUtils::getInstance()@plt>
  240903:	8b 08                	mov    (%eax),%ecx
  240905:	8b 49 50             	mov    0x50(%ecx),%ecx
  240908:	89 44 24 04          	mov    %eax,0x4(%esp)
  24090c:	8d 74 24 20          	lea    0x20(%esp),%esi
  240910:	89 34 24             	mov    %esi,(%esp)
  240913:	ff d1                	call   *%ecx
  240915:	83 ec 04             	sub    $0x4,%esp
  240918:	8a 4c 24 10          	mov    0x10(%esp),%cl
  24091c:	f6 c1 01             	test   $0x1,%cl
  24091f:	74 0a                	je     24092b <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0x6b>
  240921:	8b 44 24 18          	mov    0x18(%esp),%eax
  240925:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  240929:	eb 09                	jmp    240934 <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0x74>
  24092b:	d0 e9                	shr    $1,%cl
  24092d:	8d 44 24 11          	lea    0x11(%esp),%eax
  240931:	0f b6 c9             	movzbl %cl,%ecx
  240934:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  240938:	89 44 24 04          	mov    %eax,0x4(%esp)
  24093c:	89 34 24             	mov    %esi,(%esp)
  24093f:	e8 8c d9 fb ff       	call   1fe2d0 <std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >::append(char const*, unsigned int)@plt>
  240944:	8b 75 08             	mov    0x8(%ebp),%esi
  240947:	8b 48 08             	mov    0x8(%eax),%ecx
  24094a:	89 4e 08             	mov    %ecx,0x8(%esi)
  24094d:	f2 0f 10 00          	movsd  (%eax),%xmm0
  240951:	f2 0f 11 06          	movsd  %xmm0,(%esi)
  240955:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  24095c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  240963:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  240969:	f6 44 24 20 01       	testb  $0x1,0x20(%esp)
  24096e:	74 0c                	je     24097c <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0xbc>
  240970:	8b 44 24 28          	mov    0x28(%esp),%eax
  240974:	89 04 24             	mov    %eax,(%esp)
  240977:	e8 14 d6 fb ff       	call   1fdf90 <operator delete(void*)@plt>
  24097c:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  240981:	74 0c                	je     24098f <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0xcf>
  240983:	8b 44 24 18          	mov    0x18(%esp),%eax
  240987:	89 04 24             	mov    %eax,(%esp)
  24098a:	e8 01 d6 fb ff       	call   1fdf90 <operator delete(void*)@plt>
  24098f:	89 f0                	mov    %esi,%eax
  240991:	8d 65 f8             	lea    -0x8(%ebp),%esp
  240994:	5e                   	pop    %esi
  240995:	5b                   	pop    %ebx
  240996:	5d                   	pop    %ebp
  240997:	c2 04 00             	ret    $0x4
  24099a:	89 c6                	mov    %eax,%esi
  24099c:	f6 44 24 20 01       	testb  $0x1,0x20(%esp)
  2409a1:	74 17                	je     2409ba <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0xfa>
  2409a3:	8b 44 24 28          	mov    0x28(%esp),%eax
  2409a7:	89 04 24             	mov    %eax,(%esp)
  2409aa:	e8 e1 d5 fb ff       	call   1fdf90 <operator delete(void*)@plt>
  2409af:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  2409b4:	75 0b                	jne    2409c1 <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0x101>
  2409b6:	eb 15                	jmp    2409cd <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0x10d>
  2409b8:	89 c6                	mov    %eax,%esi
  2409ba:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  2409bf:	74 0c                	je     2409cd <ImageFileManager::getMainImageNameForRead(int, int)@@Base+0x10d>
  2409c1:	8b 44 24 18          	mov    0x18(%esp),%eax
  2409c5:	89 04 24             	mov    %eax,(%esp)
  2409c8:	e8 c3 d5 fb ff       	call   1fdf90 <operator delete(void*)@plt>
  2409cd:	89 34 24             	mov    %esi,(%esp)
  2409d0:	e8 de 79 5b 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  2409d5:	83 ec 04             	sub    $0x4,%esp
