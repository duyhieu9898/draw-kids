
extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


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
