
extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

0026aea0 <IntroScene::setupScene()@@Base>:
  26aea0:	55                   	push   %ebp
  26aea1:	89 e5                	mov    %esp,%ebp
  26aea3:	53                   	push   %ebx
  26aea4:	57                   	push   %edi
  26aea5:	56                   	push   %esi
  26aea6:	83 e4 f0             	and    $0xfffffff0,%esp
  26aea9:	83 ec 60             	sub    $0x60,%esp
  26aeac:	e8 00 00 00 00       	call   26aeb1 <IntroScene::setupScene()@@Base+0x11>
  26aeb1:	5b                   	pop    %ebx
  26aeb2:	81 c3 e3 60 76 00    	add    $0x7660e3,%ebx
  26aeb8:	8b 75 08             	mov    0x8(%ebp),%esi
  26aebb:	e8 20 31 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26aec0:	89 44 24 04          	mov    %eax,0x4(%esp)
  26aec4:	8d 7c 24 10          	lea    0x10(%esp),%edi
  26aec8:	89 3c 24             	mov    %edi,(%esp)
  26aecb:	e8 b0 35 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26aed0:	83 ec 04             	sub    $0x4,%esp
  26aed3:	f3 0f 10 44 24 10    	movss  0x10(%esp),%xmm0
  26aed9:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  26aedf:	e8 fc 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26aee4:	89 44 24 04          	mov    %eax,0x4(%esp)
  26aee8:	89 3c 24             	mov    %edi,(%esp)
  26aeeb:	e8 90 35 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26aef0:	83 ec 04             	sub    $0x4,%esp
  26aef3:	f3 0f 10 44 24 14    	movss  0x14(%esp),%xmm0
  26aef9:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  26aeff:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  26af05:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  26af0b:	8b 83 00 e3 ff ff    	mov    -0x1d00(%ebx),%eax
  26af11:	89 04 24             	mov    %eax,(%esp)
  26af14:	e8 f7 3a f9 ff       	call   1fea10 <cocos2d::LayerColor::create(cocos2d::Color4B const&, float, float)@plt>
  26af19:	8b 0e                	mov    (%esi),%ecx
  26af1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  26af1f:	89 34 24             	mov    %esi,(%esp)
  26af22:	ff 91 04 01 00 00    	call   *0x104(%ecx)
  26af28:	e8 b3 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26af2d:	8b 80 f4 00 00 00    	mov    0xf4(%eax),%eax
  26af33:	89 44 24 44          	mov    %eax,0x44(%esp)
  26af37:	e8 a4 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26af3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  26af40:	8d 44 24 50          	lea    0x50(%esp),%eax
  26af44:	89 04 24             	mov    %eax,(%esp)
  26af47:	e8 34 35 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26af4c:	83 ec 04             	sub    $0x4,%esp
  26af4f:	e8 8c 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26af54:	89 44 24 04          	mov    %eax,0x4(%esp)
  26af58:	89 3c 24             	mov    %edi,(%esp)
  26af5b:	e8 20 35 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26af60:	83 ec 04             	sub    $0x4,%esp
  26af63:	f3 0f 10 44 24 10    	movss  0x10(%esp),%xmm0
  26af69:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  26af6f:	e8 6c 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26af74:	89 44 24 04          	mov    %eax,0x4(%esp)
  26af78:	89 3c 24             	mov    %edi,(%esp)
  26af7b:	e8 00 35 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26af80:	83 ec 04             	sub    $0x4,%esp
  26af83:	f3 0f 10 44 24 2c    	movss  0x2c(%esp),%xmm0
  26af89:	0f 2e 44 24 14       	ucomiss 0x14(%esp),%xmm0
  26af8e:	76 2b                	jbe    26afbb <IntroScene::setupScene()@@Base+0x11b>
  26af90:	89 3c 24             	mov    %edi,(%esp)
  26af93:	c7 44 24 08 00 80 86 	movl   $0x44868000,0x8(%esp)
  26af9a:	44 
  26af9b:	c7 44 24 04 00 c0 b3 	movl   $0x44b3c000,0x4(%esp)
  26afa2:	44 
  26afa3:	e8 48 4f f9 ff       	call   1ffef0 <cocos2d::Size::Size(float, float)@plt>
  26afa8:	e8 33 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26afad:	f3 0f 10 44 24 14    	movss  0x14(%esp),%xmm0
  26afb3:	f3 0f 5e 44 24 54    	divss  0x54(%esp),%xmm0
  26afb9:	eb 29                	jmp    26afe4 <IntroScene::setupScene()@@Base+0x144>
  26afbb:	89 3c 24             	mov    %edi,(%esp)
  26afbe:	c7 44 24 08 00 c0 b3 	movl   $0x44b3c000,0x8(%esp)
  26afc5:	44 
  26afc6:	c7 44 24 04 00 80 86 	movl   $0x44868000,0x4(%esp)
  26afcd:	44 
  26afce:	e8 1d 4f f9 ff       	call   1ffef0 <cocos2d::Size::Size(float, float)@plt>
  26afd3:	e8 08 30 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26afd8:	f3 0f 10 44 24 10    	movss  0x10(%esp),%xmm0
  26afde:	f3 0f 5e 44 24 50    	divss  0x50(%esp),%xmm0
  26afe4:	f3 0f 11 44 24 04    	movss  %xmm0,0x4(%esp)
  26afea:	89 04 24             	mov    %eax,(%esp)
  26afed:	e8 ae 56 f9 ff       	call   2006a0 <cocos2d::Director::setContentScaleFactor(float)@plt>
  26aff2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  26aff9:	00 
  26affa:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  26b001:	00 
  26b002:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  26b009:	00 
  26b00a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  26b011:	e8 5a 2f f9 ff       	call   1fdf70 <operator new(unsigned int)@plt>
  26b016:	89 44 24 18          	mov    %eax,0x18(%esp)
  26b01a:	c7 44 24 10 21 00 00 	movl   $0x21,0x10(%esp)
  26b021:	00 
  26b022:	c7 44 24 14 10 00 00 	movl   $0x10,0x14(%esp)
  26b029:	00 
  26b02a:	c7 40 0c 6a 73 6f 6e 	movl   $0x6e6f736a,0xc(%eax)
  26b031:	c7 40 08 74 72 6f 2e 	movl   $0x2e6f7274,0x8(%eax)
  26b038:	c7 40 04 6f 2f 69 6e 	movl   $0x6e692f6f,0x4(%eax)
  26b03f:	c7 00 69 6e 74 72    	movl   $0x72746e69,(%eax)
  26b045:	c6 40 10 00          	movb   $0x0,0x10(%eax)
  26b049:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
  26b050:	00 
  26b051:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  26b058:	00 
  26b059:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  26b060:	00 
  26b061:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  26b068:	e8 03 2f f9 ff       	call   1fdf70 <operator new(unsigned int)@plt>
  26b06d:	89 44 24 38          	mov    %eax,0x38(%esp)
  26b071:	c7 44 24 30 21 00 00 	movl   $0x21,0x30(%esp)
  26b078:	00 
  26b079:	c7 44 24 34 11 00 00 	movl   $0x11,0x34(%esp)
  26b080:	00 
  26b081:	c7 40 0c 61 74 6c 61 	movl   $0x616c7461,0xc(%eax)
  26b088:	c7 40 08 74 72 6f 2e 	movl   $0x2e6f7274,0x8(%eax)
  26b08f:	c7 40 04 6f 2f 69 6e 	movl   $0x6e692f6f,0x4(%eax)
  26b096:	c7 00 69 6e 74 72    	movl   $0x72746e69,(%eax)
  26b09c:	66 c7 40 10 73 00    	movw   $0x73,0x10(%eax)
  26b0a2:	e8 39 2f f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26b0a7:	f3 0f 10 83 fc 45 e7 	movss  -0x18ba04(%ebx),%xmm0
  26b0ae:	ff 
  26b0af:	f3 0f 5e 80 f4 00 00 	divss  0xf4(%eax),%xmm0
  26b0b6:	00 
  26b0b7:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  26b0bd:	8d 44 24 30          	lea    0x30(%esp),%eax
  26b0c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  26b0c5:	89 3c 24             	mov    %edi,(%esp)
  26b0c8:	e8 c3 4d f9 ff       	call   1ffe90 <spine::SkeletonAnimation::createWithJsonFile(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, float)@plt>
  26b0cd:	89 86 68 02 00 00    	mov    %eax,0x268(%esi)
  26b0d3:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  26b0d8:	74 0c                	je     26b0e6 <IntroScene::setupScene()@@Base+0x246>
  26b0da:	8b 44 24 38          	mov    0x38(%esp),%eax
  26b0de:	89 04 24             	mov    %eax,(%esp)
  26b0e1:	e8 aa 2e f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b0e6:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  26b0eb:	74 0c                	je     26b0f9 <IntroScene::setupScene()@@Base+0x259>
  26b0ed:	8b 44 24 18          	mov    0x18(%esp),%eax
  26b0f1:	89 04 24             	mov    %eax,(%esp)
  26b0f4:	e8 97 2e f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b0f9:	8b 86 68 02 00 00    	mov    0x268(%esi),%eax
  26b0ff:	8b 0e                	mov    (%esi),%ecx
  26b101:	89 44 24 04          	mov    %eax,0x4(%esp)
  26b105:	89 34 24             	mov    %esi,(%esp)
  26b108:	ff 91 04 01 00 00    	call   *0x104(%ecx)
  26b10e:	89 f7                	mov    %esi,%edi
  26b110:	8b b6 68 02 00 00    	mov    0x268(%esi),%esi
  26b116:	e8 c5 2e f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26b11b:	89 44 24 04          	mov    %eax,0x4(%esp)
  26b11f:	8d 44 24 10          	lea    0x10(%esp),%eax
  26b123:	89 04 24             	mov    %eax,(%esp)
  26b126:	e8 55 33 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26b12b:	83 ec 04             	sub    $0x4,%esp
  26b12e:	f3 0f 10 8b 00 46 e7 	movss  -0x18ba00(%ebx),%xmm1
  26b135:	ff 
  26b136:	f3 0f 11 4c 24 40    	movss  %xmm1,0x40(%esp)
  26b13c:	f3 0f 10 44 24 10    	movss  0x10(%esp),%xmm0
  26b142:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
  26b146:	f3 0f 11 44 24 2c    	movss  %xmm0,0x2c(%esp)
  26b14c:	e8 8f 2e f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26b151:	89 44 24 04          	mov    %eax,0x4(%esp)
  26b155:	8d 44 24 30          	lea    0x30(%esp),%eax
  26b159:	89 04 24             	mov    %eax,(%esp)
  26b15c:	e8 1f 33 f9 ff       	call   1fe480 <cocos2d::Director::getVisibleSize() const@plt>
  26b161:	83 ec 04             	sub    $0x4,%esp
  26b164:	f3 0f 10 44 24 40    	movss  0x40(%esp),%xmm0
  26b16a:	f3 0f 59 44 24 34    	mulss  0x34(%esp),%xmm0
  26b170:	f3 0f 10 4c 24 2c    	movss  0x2c(%esp),%xmm1
  26b176:	f3 0f 11 4c 24 48    	movss  %xmm1,0x48(%esp)
  26b17c:	f3 0f 11 44 24 4c    	movss  %xmm0,0x4c(%esp)
  26b182:	8b 06                	mov    (%esi),%eax
  26b184:	8b 40 4c             	mov    0x4c(%eax),%eax
  26b187:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  26b18b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  26b18f:	89 34 24             	mov    %esi,(%esp)
  26b192:	ff d0                	call   *%eax
  26b194:	8b 87 68 02 00 00    	mov    0x268(%edi),%eax
  26b19a:	8b 08                	mov    (%eax),%ecx
  26b19c:	89 04 24             	mov    %eax,(%esp)
  26b19f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  26b1a6:	00 
  26b1a7:	ff 91 b8 00 00 00    	call   *0xb8(%ecx)
  26b1ad:	8b 87 68 02 00 00    	mov    0x268(%edi),%eax
  26b1b3:	8d 8b 04 ad fd ff    	lea    -0x252fc(%ebx),%ecx
  26b1b9:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  26b1bd:	89 7c 24 14          	mov    %edi,0x14(%esp)
  26b1c1:	8b 4c 24 44          	mov    0x44(%esp),%ecx
  26b1c5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  26b1c9:	8d 74 24 10          	lea    0x10(%esp),%esi
  26b1cd:	89 74 24 20          	mov    %esi,0x20(%esp)
  26b1d1:	89 74 24 04          	mov    %esi,0x4(%esp)
  26b1d5:	89 04 24             	mov    %eax,(%esp)
  26b1d8:	e8 33 63 f9 ff       	call   201510 <spine::SkeletonAnimation::setEventListener(std::__ndk1::function<void (spTrackEntry*, spEvent*)> const&)@plt>
  26b1dd:	8b 44 24 20          	mov    0x20(%esp),%eax
  26b1e1:	39 c6                	cmp    %eax,%esi
  26b1e3:	74 0e                	je     26b1f3 <IntroScene::setupScene()@@Base+0x353>
  26b1e5:	85 c0                	test   %eax,%eax
  26b1e7:	74 12                	je     26b1fb <IntroScene::setupScene()@@Base+0x35b>
  26b1e9:	8b 08                	mov    (%eax),%ecx
  26b1eb:	89 04 24             	mov    %eax,(%esp)
  26b1ee:	ff 51 14             	call   *0x14(%ecx)
  26b1f1:	eb 08                	jmp    26b1fb <IntroScene::setupScene()@@Base+0x35b>
  26b1f3:	8b 08                	mov    (%eax),%ecx
  26b1f5:	89 04 24             	mov    %eax,(%esp)
  26b1f8:	ff 51 10             	call   *0x10(%ecx)
  26b1fb:	8b 87 68 02 00 00    	mov    0x268(%edi),%eax
  26b201:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  26b208:	00 
  26b209:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  26b210:	00 
  26b211:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  26b218:	00 
  26b219:	c6 44 24 10 0a       	movb   $0xa,0x10(%esp)
  26b21e:	66 c7 44 24 15 6f 00 	movw   $0x6f,0x15(%esp)
  26b225:	c7 44 24 11 69 6e 74 	movl   $0x72746e69,0x11(%esp)
  26b22c:	72 
  26b22d:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  26b231:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  26b235:	89 04 24             	mov    %eax,(%esp)
  26b238:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  26b23f:	00 
  26b240:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  26b247:	00 
  26b248:	e8 53 4c f9 ff       	call   1ffea0 <spine::SkeletonAnimation::setAnimation(int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, bool)@plt>
  26b24d:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  26b252:	74 0c                	je     26b260 <IntroScene::setupScene()@@Base+0x3c0>
  26b254:	8b 44 24 18          	mov    0x18(%esp),%eax
  26b258:	89 04 24             	mov    %eax,(%esp)
  26b25b:	e8 30 2d f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b260:	8d 65 f4             	lea    -0xc(%ebp),%esp
  26b263:	5e                   	pop    %esi
  26b264:	5f                   	pop    %edi
  26b265:	5b                   	pop    %ebx
  26b266:	5d                   	pop    %ebp
  26b267:	c3                   	ret
  26b268:	89 c7                	mov    %eax,%edi
  26b26a:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  26b26f:	74 32                	je     26b2a3 <IntroScene::setupScene()@@Base+0x403>
  26b271:	8b 44 24 18          	mov    0x18(%esp),%eax
  26b275:	89 04 24             	mov    %eax,(%esp)
  26b278:	e8 13 2d f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b27d:	eb 24                	jmp    26b2a3 <IntroScene::setupScene()@@Base+0x403>
  26b27f:	89 c7                	mov    %eax,%edi
  26b281:	8b 44 24 20          	mov    0x20(%esp),%eax
  26b285:	39 c6                	cmp    %eax,%esi
  26b287:	75 0a                	jne    26b293 <IntroScene::setupScene()@@Base+0x3f3>
  26b289:	8b 08                	mov    (%eax),%ecx
  26b28b:	89 04 24             	mov    %eax,(%esp)
  26b28e:	ff 51 10             	call   *0x10(%ecx)
  26b291:	eb 10                	jmp    26b2a3 <IntroScene::setupScene()@@Base+0x403>
  26b293:	85 c0                	test   %eax,%eax
  26b295:	74 0c                	je     26b2a3 <IntroScene::setupScene()@@Base+0x403>
  26b297:	8b 08                	mov    (%eax),%ecx
  26b299:	89 04 24             	mov    %eax,(%esp)
  26b29c:	ff 51 14             	call   *0x14(%ecx)
  26b29f:	eb 02                	jmp    26b2a3 <IntroScene::setupScene()@@Base+0x403>
  26b2a1:	89 c7                	mov    %eax,%edi
  26b2a3:	89 3c 24             	mov    %edi,(%esp)
  26b2a6:	e8 08 d1 58 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  26b2ab:	83 ec 04             	sub    $0x4,%esp
  26b2ae:	89 f7                	mov    %esi,%edi
  26b2b0:	89 c6                	mov    %eax,%esi
  26b2b2:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  26b2b7:	75 26                	jne    26b2df <IntroScene::setupScene()@@Base+0x43f>
  26b2b9:	eb 30                	jmp    26b2eb <IntroScene::setupScene()@@Base+0x44b>
  26b2bb:	89 f7                	mov    %esi,%edi
  26b2bd:	89 c6                	mov    %eax,%esi
  26b2bf:	eb 2a                	jmp    26b2eb <IntroScene::setupScene()@@Base+0x44b>
  26b2c1:	89 f7                	mov    %esi,%edi
  26b2c3:	89 c6                	mov    %eax,%esi
  26b2c5:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  26b2ca:	74 0c                	je     26b2d8 <IntroScene::setupScene()@@Base+0x438>
  26b2cc:	8b 44 24 38          	mov    0x38(%esp),%eax
  26b2d0:	89 04 24             	mov    %eax,(%esp)
  26b2d3:	e8 b8 2c f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b2d8:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  26b2dd:	74 0c                	je     26b2eb <IntroScene::setupScene()@@Base+0x44b>
  26b2df:	8b 44 24 18          	mov    0x18(%esp),%eax
  26b2e3:	89 04 24             	mov    %eax,(%esp)
  26b2e6:	e8 a5 2c f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b2eb:	89 34 24             	mov    %esi,(%esp)
  26b2ee:	e8 ad 2d f9 ff       	call   1fe0a0 <__cxa_begin_catch@plt>
  26b2f3:	89 3c 24             	mov    %edi,(%esp)
  26b2f6:	e8 25 62 f9 ff       	call   201520 <IntroScene::startNextScene(float)@plt>
  26b2fb:	e8 30 62 f9 ff       	call   201530 <__cxa_end_catch@plt>
  26b300:	e9 5b ff ff ff       	jmp    26b260 <IntroScene::setupScene()@@Base+0x3c0>
  26b305:	89 c7                	mov    %eax,%edi
  26b307:	e8 24 62 f9 ff       	call   201530 <__cxa_end_catch@plt>
  26b30c:	eb 95                	jmp    26b2a3 <IntroScene::setupScene()@@Base+0x403>
  26b30e:	89 04 24             	mov    %eax,(%esp)
  26b311:	e8 da 43 fc ff       	call   22f6f0 <BimiBooApplication::willEnterForeground()@@Base+0x10>
  26b316:	83 ec 04             	sub    $0x4,%esp

extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

0026b320 <IntroScene::startIntro(float)@@Base>:
  26b320:	55                   	push   %ebp
  26b321:	89 e5                	mov    %esp,%ebp
  26b323:	53                   	push   %ebx
  26b324:	57                   	push   %edi
  26b325:	56                   	push   %esi
  26b326:	83 e4 f0             	and    $0xfffffff0,%esp
  26b329:	83 ec 40             	sub    $0x40,%esp
  26b32c:	e8 00 00 00 00       	call   26b331 <IntroScene::startIntro(float)@@Base+0x11>
  26b331:	5b                   	pop    %ebx
  26b332:	81 c3 63 5c 76 00    	add    $0x765c63,%ebx
  26b338:	8b 45 08             	mov    0x8(%ebp),%eax
  26b33b:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
  26b341:	8b 08                	mov    (%eax),%ecx
  26b343:	89 04 24             	mov    %eax,(%esp)
  26b346:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  26b34d:	00 
  26b34e:	ff 91 b8 00 00 00    	call   *0xb8(%ecx)
  26b354:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  26b35b:	00 
  26b35c:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  26b363:	00 
  26b364:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  26b36b:	00 
  26b36c:	c6 44 24 28 10       	movb   $0x10,0x28(%esp)
  26b371:	c7 44 24 2d 6f 2f 62 	movl   $0x67622f6f,0x2d(%esp)
  26b378:	67 
  26b379:	c7 44 24 29 69 6e 74 	movl   $0x72746e69,0x29(%esp)
  26b380:	72 
  26b381:	c6 44 24 31 00       	movb   $0x0,0x31(%esp)
  26b386:	8d 44 24 28          	lea    0x28(%esp),%eax
  26b38a:	89 04 24             	mov    %eax,(%esp)
  26b38d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  26b394:	00 
  26b395:	c7 44 24 04 00 00 80 	movl   $0x3f800000,0x4(%esp)
  26b39c:	3f 
  26b39d:	e8 ce 34 f9 ff       	call   1fe870 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@plt>
  26b3a2:	f6 44 24 28 01       	testb  $0x1,0x28(%esp)
  26b3a7:	74 0c                	je     26b3b5 <IntroScene::startIntro(float)@@Base+0x95>
  26b3a9:	8b 44 24 30          	mov    0x30(%esp),%eax
  26b3ad:	89 04 24             	mov    %eax,(%esp)
  26b3b0:	e8 db 2b f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b3b5:	c7 44 24 38 02 00 00 	movl   $0x2,0x38(%esp)
  26b3bc:	00 
  26b3bd:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  26b3c4:	00 
  26b3c5:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  26b3cc:	00 
  26b3cd:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  26b3d4:	00 
  26b3d5:	8d 44 24 18          	lea    0x18(%esp),%eax
  26b3d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  26b3dd:	8d 44 24 38          	lea    0x38(%esp),%eax
  26b3e1:	89 04 24             	mov    %eax,(%esp)
  26b3e4:	e8 c7 5f f9 ff       	call   2013b0 <Analytics::sendEvent(int const&, std::__ndk1::vector<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::allocator<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > const&)@plt>
  26b3e9:	8b 74 24 18          	mov    0x18(%esp),%esi
  26b3ed:	85 f6                	test   %esi,%esi
  26b3ef:	74 3d                	je     26b42e <IntroScene::startIntro(float)@@Base+0x10e>
  26b3f1:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  26b3f5:	39 f0                	cmp    %esi,%eax
  26b3f7:	74 27                	je     26b420 <IntroScene::startIntro(float)@@Base+0x100>
  26b3f9:	90                   	nop
  26b3fa:	90                   	nop
  26b3fb:	90                   	nop
  26b3fc:	90                   	nop
  26b3fd:	90                   	nop
  26b3fe:	90                   	nop
  26b3ff:	90                   	nop
  26b400:	8d 78 f4             	lea    -0xc(%eax),%edi
  26b403:	f6 40 f4 01          	testb  $0x1,-0xc(%eax)
  26b407:	74 0b                	je     26b414 <IntroScene::startIntro(float)@@Base+0xf4>
  26b409:	8b 40 fc             	mov    -0x4(%eax),%eax
  26b40c:	89 04 24             	mov    %eax,(%esp)
  26b40f:	e8 7c 2b f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b414:	39 fe                	cmp    %edi,%esi
  26b416:	89 f8                	mov    %edi,%eax
  26b418:	75 e6                	jne    26b400 <IntroScene::startIntro(float)@@Base+0xe0>
  26b41a:	8b 44 24 18          	mov    0x18(%esp),%eax
  26b41e:	eb 02                	jmp    26b422 <IntroScene::startIntro(float)@@Base+0x102>
  26b420:	89 f0                	mov    %esi,%eax
  26b422:	89 74 24 1c          	mov    %esi,0x1c(%esp)
  26b426:	89 04 24             	mov    %eax,(%esp)
  26b429:	e8 62 2b f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b42e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  26b431:	5e                   	pop    %esi
  26b432:	5f                   	pop    %edi
  26b433:	5b                   	pop    %ebx
  26b434:	5d                   	pop    %ebp
  26b435:	c3                   	ret
  26b436:	89 44 24 34          	mov    %eax,0x34(%esp)
  26b43a:	8b 7c 24 18          	mov    0x18(%esp),%edi
  26b43e:	85 ff                	test   %edi,%edi
  26b440:	74 4d                	je     26b48f <IntroScene::startIntro(float)@@Base+0x16f>
  26b442:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  26b446:	39 f8                	cmp    %edi,%eax
  26b448:	74 2a                	je     26b474 <IntroScene::startIntro(float)@@Base+0x154>
  26b44a:	90                   	nop
  26b44b:	90                   	nop
  26b44c:	90                   	nop
  26b44d:	90                   	nop
  26b44e:	90                   	nop
  26b44f:	90                   	nop
  26b450:	8d 70 f4             	lea    -0xc(%eax),%esi
  26b453:	f6 40 f4 01          	testb  $0x1,-0xc(%eax)
  26b457:	74 0b                	je     26b464 <IntroScene::startIntro(float)@@Base+0x144>
  26b459:	8b 40 fc             	mov    -0x4(%eax),%eax
  26b45c:	89 04 24             	mov    %eax,(%esp)
  26b45f:	e8 2c 2b f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b464:	39 f7                	cmp    %esi,%edi
  26b466:	89 f0                	mov    %esi,%eax
  26b468:	75 e6                	jne    26b450 <IntroScene::startIntro(float)@@Base+0x130>
  26b46a:	8b 44 24 18          	mov    0x18(%esp),%eax
  26b46e:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
  26b472:	eb 13                	jmp    26b487 <IntroScene::startIntro(float)@@Base+0x167>
  26b474:	89 f8                	mov    %edi,%eax
  26b476:	eb f6                	jmp    26b46e <IntroScene::startIntro(float)@@Base+0x14e>
  26b478:	89 44 24 34          	mov    %eax,0x34(%esp)
  26b47c:	f6 44 24 28 01       	testb  $0x1,0x28(%esp)
  26b481:	74 0c                	je     26b48f <IntroScene::startIntro(float)@@Base+0x16f>
  26b483:	8b 44 24 30          	mov    0x30(%esp),%eax
  26b487:	89 04 24             	mov    %eax,(%esp)
  26b48a:	e8 01 2b f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26b48f:	8b 44 24 34          	mov    0x34(%esp),%eax
  26b493:	89 04 24             	mov    %eax,(%esp)
  26b496:	e8 18 cf 58 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  26b49b:	83 ec 04             	sub    $0x4,%esp

extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

0026adf0 <IntroScene::start()@@Base>:
  26adf0:	55                   	push   %ebp
  26adf1:	89 e5                	mov    %esp,%ebp
  26adf3:	53                   	push   %ebx
  26adf4:	57                   	push   %edi
  26adf5:	56                   	push   %esi
  26adf6:	83 e4 f0             	and    $0xfffffff0,%esp
  26adf9:	83 ec 20             	sub    $0x20,%esp
  26adfc:	e8 00 00 00 00       	call   26ae01 <IntroScene::start()@@Base+0x11>
  26ae01:	5b                   	pop    %ebx
  26ae02:	81 c3 93 61 76 00    	add    $0x766193,%ebx
  26ae08:	8b 7d 08             	mov    0x8(%ebp),%edi
  26ae0b:	89 3c 24             	mov    %edi,(%esp)
  26ae0e:	e8 bd 66 f9 ff       	call   2014d0 <IntroScene::setupScene()@plt>
  26ae13:	8b b7 6c 02 00 00    	mov    0x26c(%edi),%esi
  26ae19:	85 f6                	test   %esi,%esi
  26ae1b:	75 26                	jne    26ae43 <IntroScene::start()@@Base+0x53>
  26ae1d:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
  26ae24:	e8 47 31 f9 ff       	call   1fdf70 <operator new(unsigned int)@plt>
  26ae29:	89 c6                	mov    %eax,%esi
  26ae2b:	8d 87 4c 02 00 00    	lea    0x24c(%edi),%eax
  26ae31:	89 44 24 04          	mov    %eax,0x4(%esp)
  26ae35:	89 34 24             	mov    %esi,(%esp)
  26ae38:	e8 a3 66 f9 ff       	call   2014e0 <ResourceManager::ResourceManager(ResourceManagerDelegate*)@plt>
  26ae3d:	89 b7 6c 02 00 00    	mov    %esi,0x26c(%edi)
  26ae43:	89 34 24             	mov    %esi,(%esp)
  26ae46:	e8 a5 66 f9 ff       	call   2014f0 <ResourceManager::uncompress()@plt>
  26ae4b:	8b 83 d8 e3 ff ff    	mov    -0x1c28(%ebx),%eax
  26ae51:	89 44 24 10          	mov    %eax,0x10(%esp)
  26ae55:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  26ae5c:	00 
  26ae5d:	f2 0f 10 44 24 10    	movsd  0x10(%esp),%xmm0
  26ae63:	f2 0f 11 44 24 04    	movsd  %xmm0,0x4(%esp)
  26ae69:	89 3c 24             	mov    %edi,(%esp)
  26ae6c:	c7 44 24 0c cd cc cc 	movl   $0x3ecccccd,0xc(%esp)
  26ae73:	3e 
  26ae74:	e8 87 66 f9 ff       	call   201500 <cocos2d::Node::scheduleOnce(void (cocos2d::Ref::*)(float), float)@plt>
  26ae79:	8d 65 f4             	lea    -0xc(%ebp),%esp
  26ae7c:	5e                   	pop    %esi
  26ae7d:	5f                   	pop    %edi
  26ae7e:	5b                   	pop    %ebx
  26ae7f:	5d                   	pop    %ebp
  26ae80:	c3                   	ret
  26ae81:	89 c7                	mov    %eax,%edi
  26ae83:	89 34 24             	mov    %esi,(%esp)
  26ae86:	e8 05 31 f9 ff       	call   1fdf90 <operator delete(void*)@plt>
  26ae8b:	89 3c 24             	mov    %edi,(%esp)
  26ae8e:	e8 20 d5 58 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  26ae93:	83 ec 04             	sub    $0x4,%esp

extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

0026ac50 <IntroScene::startNextScene(float)@@Base>:
  26ac50:	55                   	push   %ebp
  26ac51:	89 e5                	mov    %esp,%ebp
  26ac53:	53                   	push   %ebx
  26ac54:	57                   	push   %edi
  26ac55:	56                   	push   %esi
  26ac56:	83 e4 f0             	and    $0xfffffff0,%esp
  26ac59:	83 ec 10             	sub    $0x10,%esp
  26ac5c:	e8 00 00 00 00       	call   26ac61 <IntroScene::startNextScene(float)@@Base+0x11>
  26ac61:	5b                   	pop    %ebx
  26ac62:	81 c3 33 63 76 00    	add    $0x766333,%ebx
  26ac68:	8b 7d 08             	mov    0x8(%ebp),%edi
  26ac6b:	80 bf 78 02 00 00 00 	cmpb   $0x0,0x278(%edi)
  26ac72:	0f 84 94 00 00 00    	je     26ad0c <IntroScene::startNextScene(float)@@Base+0xbc>
  26ac78:	80 bf 79 02 00 00 00 	cmpb   $0x0,0x279(%edi)
  26ac7f:	0f 84 87 00 00 00    	je     26ad0c <IntroScene::startNextScene(float)@@Base+0xbc>
  26ac85:	83 bf 60 02 00 00 00 	cmpl   $0x0,0x260(%edi)
  26ac8c:	74 7e                	je     26ad0c <IntroScene::startNextScene(float)@@Base+0xbc>
  26ac8e:	c7 83 bc 48 01 00 00 	movl   $0x0,0x148bc(%ebx)
  26ac95:	00 00 00 
  26ac98:	e8 03 68 f9 ff       	call   2014a0 <SoundManager::endEngine()@plt>
  26ac9d:	e8 3e 33 f9 ff       	call   1fdfe0 <cocos2d::Director::getInstance()@plt>
  26aca2:	89 c6                	mov    %eax,%esi
  26aca4:	8b 87 60 02 00 00    	mov    0x260(%edi),%eax
  26acaa:	85 c0                	test   %eax,%eax
  26acac:	74 66                	je     26ad14 <IntroScene::startNextScene(float)@@Base+0xc4>
  26acae:	8b 08                	mov    (%eax),%ecx
  26acb0:	89 04 24             	mov    %eax,(%esp)
  26acb3:	ff 51 18             	call   *0x18(%ecx)
  26acb6:	8b 8b dc e2 ff ff    	mov    -0x1d24(%ebx),%ecx
  26acbc:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  26acc0:	89 44 24 04          	mov    %eax,0x4(%esp)
  26acc4:	c7 04 24 00 00 80 3f 	movl   $0x3f800000,(%esp)
  26accb:	e8 70 54 f9 ff       	call   200140 <cocos2d::TransitionFade::create(float, cocos2d::Scene*, cocos2d::Color3B const&)@plt>
  26acd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  26acd4:	89 34 24             	mov    %esi,(%esp)
  26acd7:	e8 d4 67 f9 ff       	call   2014b0 <cocos2d::Director::replaceScene(cocos2d::Scene*)@plt>
  26acdc:	8b 87 60 02 00 00    	mov    0x260(%edi),%eax
  26ace2:	c7 87 60 02 00 00 00 	movl   $0x0,0x260(%edi)
  26ace9:	00 00 00 
  26acec:	81 c7 50 02 00 00    	add    $0x250,%edi
  26acf2:	39 c7                	cmp    %eax,%edi
  26acf4:	74 0e                	je     26ad04 <IntroScene::startNextScene(float)@@Base+0xb4>
  26acf6:	85 c0                	test   %eax,%eax
  26acf8:	74 12                	je     26ad0c <IntroScene::startNextScene(float)@@Base+0xbc>
  26acfa:	8b 08                	mov    (%eax),%ecx
  26acfc:	89 04 24             	mov    %eax,(%esp)
  26acff:	ff 51 14             	call   *0x14(%ecx)
  26ad02:	eb 08                	jmp    26ad0c <IntroScene::startNextScene(float)@@Base+0xbc>
  26ad04:	8b 08                	mov    (%eax),%ecx
  26ad06:	89 04 24             	mov    %eax,(%esp)
  26ad09:	ff 51 10             	call   *0x10(%ecx)
  26ad0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  26ad0f:	5e                   	pop    %esi
  26ad10:	5f                   	pop    %edi
  26ad11:	5b                   	pop    %ebx
  26ad12:	5d                   	pop    %ebp
  26ad13:	c3                   	ret
  26ad14:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  26ad1b:	e8 80 36 f9 ff       	call   1fe3a0 <__cxa_allocate_exception@plt>
  26ad20:	8b 8b cc e3 ff ff    	mov    -0x1c34(%ebx),%ecx
  26ad26:	83 c1 08             	add    $0x8,%ecx
  26ad29:	89 08                	mov    %ecx,(%eax)
  26ad2b:	8b 8b d0 e3 ff ff    	mov    -0x1c30(%ebx),%ecx
  26ad31:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  26ad35:	8b 8b d4 e3 ff ff    	mov    -0x1c2c(%ebx),%ecx
  26ad3b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  26ad3f:	89 04 24             	mov    %eax,(%esp)
  26ad42:	e8 79 36 f9 ff       	call   1fe3c0 <__cxa_throw@plt>
  26ad47:	83 ec 0c             	sub    $0xc,%esp

extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

00246a00 <MainMenu::introAnimation()@@Base>:
  246a00:	55                   	push   %ebp
  246a01:	89 e5                	mov    %esp,%ebp
  246a03:	83 e4 fc             	and    $0xfffffffc,%esp
  246a06:	89 ec                	mov    %ebp,%esp
  246a08:	5d                   	pop    %ebp
  246a09:	c3                   	ret

extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

002d1900 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base>:
  2d1900:	55                   	push   %ebp
  2d1901:	89 e5                	mov    %esp,%ebp
  2d1903:	53                   	push   %ebx
  2d1904:	57                   	push   %edi
  2d1905:	56                   	push   %esi
  2d1906:	83 e4 f0             	and    $0xfffffff0,%esp
  2d1909:	83 ec 30             	sub    $0x30,%esp
  2d190c:	e8 00 00 00 00       	call   2d1911 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x11>
  2d1911:	5b                   	pop    %ebx
  2d1912:	81 c3 83 f6 6f 00    	add    $0x6ff683,%ebx
  2d1918:	8b 75 08             	mov    0x8(%ebp),%esi
  2d191b:	f6 06 01             	testb  $0x1,(%esi)
  2d191e:	75 05                	jne    2d1925 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x25>
  2d1920:	8d 46 01             	lea    0x1(%esi),%eax
  2d1923:	eb 03                	jmp    2d1928 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x28>
  2d1925:	8b 46 08             	mov    0x8(%esi),%eax
  2d1928:	89 44 24 04          	mov    %eax,0x4(%esp)
  2d192c:	8d 83 47 40 e5 ff    	lea    -0x1abfb9(%ebx),%eax
  2d1932:	89 04 24             	mov    %eax,(%esp)
  2d1935:	e8 86 cb f2 ff       	call   1fe4c0 <cocos2d::log(char const*, ...)@plt>
  2d193a:	3b b3 b0 e5 ff ff    	cmp    -0x1a50(%ebx),%esi
  2d1940:	74 2d                	je     2d196f <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x6f>
  2d1942:	8a 0e                	mov    (%esi),%cl
  2d1944:	f6 c1 01             	test   $0x1,%cl
  2d1947:	74 08                	je     2d1951 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x51>
  2d1949:	8b 46 08             	mov    0x8(%esi),%eax
  2d194c:	8b 4e 04             	mov    0x4(%esi),%ecx
  2d194f:	eb 08                	jmp    2d1959 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x59>
  2d1951:	8d 46 01             	lea    0x1(%esi),%eax
  2d1954:	d0 e9                	shr    $1,%cl
  2d1956:	0f b6 c9             	movzbl %cl,%ecx
  2d1959:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  2d195d:	89 44 24 04          	mov    %eax,0x4(%esp)
  2d1961:	8b 83 b0 e5 ff ff    	mov    -0x1a50(%ebx),%eax
  2d1967:	89 04 24             	mov    %eax,(%esp)
  2d196a:	e8 c1 d1 f2 ff       	call   1feb30 <std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >::assign(char const*, unsigned int)@plt>
  2d196f:	8b b3 b4 e5 ff ff    	mov    -0x1a4c(%ebx),%esi
  2d1975:	f3 0f 10 45 0c       	movss  0xc(%ebp),%xmm0
  2d197a:	f3 0f 11 06          	movss  %xmm0,(%esi)
  2d197e:	8b bb b8 e5 ff ff    	mov    -0x1a48(%ebx),%edi
  2d1984:	8b 07                	mov    (%edi),%eax
  2d1986:	89 04 24             	mov    %eax,(%esp)
  2d1989:	e8 b2 21 f3 ff       	call   203b40 <cocos2d::experimental::AudioEngine::stop(int)@plt>
  2d198e:	8b 83 bc e5 ff ff    	mov    -0x1a44(%ebx),%eax
  2d1994:	80 38 00             	cmpb   $0x0,(%eax)
  2d1997:	74 05                	je     2d199e <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x9e>
  2d1999:	0f 57 c0             	xorps  %xmm0,%xmm0
  2d199c:	eb 04                	jmp    2d19a2 <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0xa2>
  2d199e:	f3 0f 10 06          	movss  (%esi),%xmm0
  2d19a2:	f3 0f 11 44 24 1c    	movss  %xmm0,0x1c(%esp)
  2d19a8:	8b 45 08             	mov    0x8(%ebp),%eax
  2d19ab:	89 44 24 04          	mov    %eax,0x4(%esp)
  2d19af:	8d 74 24 20          	lea    0x20(%esp),%esi
  2d19b3:	89 34 24             	mov    %esi,(%esp)
  2d19b6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2d19bd:	00 
  2d19be:	e8 5d 21 f3 ff       	call   203b20 <SoundManager::_resource(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, SoundManager::SoundType)@plt>
  2d19c3:	83 ec 04             	sub    $0x4,%esp
  2d19c6:	f3 0f 10 44 24 1c    	movss  0x1c(%esp),%xmm0
  2d19cc:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  2d19d2:	0f b6 45 10          	movzbl 0x10(%ebp),%eax
  2d19d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  2d19da:	89 34 24             	mov    %esi,(%esp)
  2d19dd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2d19e4:	00 
  2d19e5:	e8 46 21 f3 ff       	call   203b30 <cocos2d::experimental::AudioEngine::play2d(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, bool, float, cocos2d::experimental::AudioProfile const*)@plt>
  2d19ea:	89 07                	mov    %eax,(%edi)
  2d19ec:	f6 44 24 20 01       	testb  $0x1,0x20(%esp)
  2d19f1:	74 0c                	je     2d19ff <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0xff>
  2d19f3:	8b 44 24 28          	mov    0x28(%esp),%eax
  2d19f7:	89 04 24             	mov    %eax,(%esp)
  2d19fa:	e8 91 c5 f2 ff       	call   1fdf90 <operator delete(void*)@plt>
  2d19ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2d1a02:	5e                   	pop    %esi
  2d1a03:	5f                   	pop    %edi
  2d1a04:	5b                   	pop    %ebx
  2d1a05:	5d                   	pop    %ebp
  2d1a06:	c3                   	ret
  2d1a07:	89 c6                	mov    %eax,%esi
  2d1a09:	f6 44 24 20 01       	testb  $0x1,0x20(%esp)
  2d1a0e:	74 0c                	je     2d1a1c <SoundManager::playBackgroundMusic(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x11c>
  2d1a10:	8b 44 24 28          	mov    0x28(%esp),%eax
  2d1a14:	89 04 24             	mov    %eax,(%esp)
  2d1a17:	e8 74 c5 f2 ff       	call   1fdf90 <operator delete(void*)@plt>
  2d1a1c:	89 34 24             	mov    %esi,(%esp)
  2d1a1f:	e8 8f 69 52 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  2d1a24:	83 ec 04             	sub    $0x4,%esp

extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .plt:

Disassembly of section .text:

002d16f0 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base>:
  2d16f0:	55                   	push   %ebp
  2d16f1:	89 e5                	mov    %esp,%ebp
  2d16f3:	53                   	push   %ebx
  2d16f4:	56                   	push   %esi
  2d16f5:	83 e4 f0             	and    $0xfffffff0,%esp
  2d16f8:	83 ec 20             	sub    $0x20,%esp
  2d16fb:	e8 00 00 00 00       	call   2d1700 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x10>
  2d1700:	5b                   	pop    %ebx
  2d1701:	81 c3 94 f8 6f 00    	add    $0x6ff894,%ebx
  2d1707:	f3 0f 10 45 0c       	movss  0xc(%ebp),%xmm0
  2d170c:	8b 75 08             	mov    0x8(%ebp),%esi
  2d170f:	f6 06 01             	testb  $0x1,(%esi)
  2d1712:	75 05                	jne    2d1719 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x29>
  2d1714:	8d 46 01             	lea    0x1(%esi),%eax
  2d1717:	eb 03                	jmp    2d171c <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x2c>
  2d1719:	8b 46 08             	mov    0x8(%esi),%eax
  2d171c:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  2d1720:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%esp)
  2d1726:	89 44 24 04          	mov    %eax,0x4(%esp)
  2d172a:	8d 83 1c 41 e5 ff    	lea    -0x1abee4(%ebx),%eax
  2d1730:	89 04 24             	mov    %eax,(%esp)
  2d1733:	e8 88 cd f2 ff       	call   1fe4c0 <cocos2d::log(char const*, ...)@plt>
  2d1738:	89 74 24 04          	mov    %esi,0x4(%esp)
  2d173c:	8d 74 24 10          	lea    0x10(%esp),%esi
  2d1740:	89 34 24             	mov    %esi,(%esp)
  2d1743:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  2d174a:	00 
  2d174b:	e8 d0 23 f3 ff       	call   203b20 <SoundManager::_resource(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, SoundManager::SoundType)@plt>
  2d1750:	83 ec 04             	sub    $0x4,%esp
  2d1753:	f3 0f 10 45 0c       	movss  0xc(%ebp),%xmm0
  2d1758:	f3 0f 11 44 24 08    	movss  %xmm0,0x8(%esp)
  2d175e:	0f b6 45 10          	movzbl 0x10(%ebp),%eax
  2d1762:	89 44 24 04          	mov    %eax,0x4(%esp)
  2d1766:	89 34 24             	mov    %esi,(%esp)
  2d1769:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  2d1770:	00 
  2d1771:	e8 ba 23 f3 ff       	call   203b30 <cocos2d::experimental::AudioEngine::play2d(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&, bool, float, cocos2d::experimental::AudioProfile const*)@plt>
  2d1776:	89 c6                	mov    %eax,%esi
  2d1778:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  2d177d:	74 0c                	je     2d178b <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0x9b>
  2d177f:	8b 44 24 18          	mov    0x18(%esp),%eax
  2d1783:	89 04 24             	mov    %eax,(%esp)
  2d1786:	e8 05 c8 f2 ff       	call   1fdf90 <operator delete(void*)@plt>
  2d178b:	89 f0                	mov    %esi,%eax
  2d178d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  2d1790:	5e                   	pop    %esi
  2d1791:	5b                   	pop    %ebx
  2d1792:	5d                   	pop    %ebp
  2d1793:	c3                   	ret
  2d1794:	89 c6                	mov    %eax,%esi
  2d1796:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
  2d179b:	74 0c                	je     2d17a9 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@@Base+0xb9>
  2d179d:	8b 44 24 18          	mov    0x18(%esp),%eax
  2d17a1:	89 04 24             	mov    %eax,(%esp)
  2d17a4:	e8 e7 c7 f2 ff       	call   1fdf90 <operator delete(void*)@plt>
  2d17a9:	89 34 24             	mov    %esi,(%esp)
  2d17ac:	e8 02 6c 52 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  2d17b1:	83 ec 04             	sub    $0x4,%esp
