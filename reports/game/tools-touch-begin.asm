
extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .text:

00258b70 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base>:
  258b70:	55                   	push   %ebp
  258b71:	89 e5                	mov    %esp,%ebp
  258b73:	53                   	push   %ebx
  258b74:	57                   	push   %edi
  258b75:	56                   	push   %esi
  258b76:	83 e4 f0             	and    $0xfffffff0,%esp
  258b79:	81 ec b0 00 00 00    	sub    $0xb0,%esp
  258b7f:	e8 00 00 00 00       	call   258b84 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x14>
  258b84:	5f                   	pop    %edi
  258b85:	81 c7 10 84 77 00    	add    $0x778410,%edi
  258b8b:	8b 55 0c             	mov    0xc(%ebp),%edx
  258b8e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  258b91:	c6 81 64 02 00 00 01 	movb   $0x1,0x264(%ecx)
  258b98:	8b 02                	mov    (%edx),%eax
  258b9a:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
  258ba1:	8b 42 04             	mov    0x4(%edx),%eax
  258ba4:	89 84 24 84 00 00 00 	mov    %eax,0x84(%esp)
  258bab:	8d 84 24 80 00 00 00 	lea    0x80(%esp),%eax
  258bb2:	89 44 24 08          	mov    %eax,0x8(%esp)
  258bb6:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  258bba:	8d 44 24 18          	lea    0x18(%esp),%eax
  258bbe:	89 04 24             	mov    %eax,(%esp)
  258bc1:	89 fb                	mov    %edi,%ebx
  258bc3:	e8 68 7d fa ff       	call   200930 <ToolsLayer::getTouchedButton(cocos2d::Vec2)@plt>
  258bc8:	83 ec 04             	sub    $0x4,%esp
  258bcb:	8a 54 24 18          	mov    0x18(%esp),%dl
  258bcf:	89 d0                	mov    %edx,%eax
  258bd1:	d0 e8                	shr    $1,%al
  258bd3:	f6 c2 01             	test   $0x1,%dl
  258bd6:	0f b6 c0             	movzbl %al,%eax
  258bd9:	89 c1                	mov    %eax,%ecx
  258bdb:	74 04                	je     258be1 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x71>
  258bdd:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  258be1:	85 c9                	test   %ecx,%ecx
  258be3:	89 7c 24 10          	mov    %edi,0x10(%esp)
  258be7:	0f 84 95 0b 00 00    	je     259782 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc12>
  258bed:	8b 75 08             	mov    0x8(%ebp),%esi
  258bf0:	8a 9e 14 03 00 00    	mov    0x314(%esi),%bl
  258bf6:	f6 c3 01             	test   $0x1,%bl
  258bf9:	74 0f                	je     258c0a <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x9a>
  258bfb:	8b b6 18 03 00 00    	mov    0x318(%esi),%esi
  258c01:	39 f1                	cmp    %esi,%ecx
  258c03:	74 14                	je     258c19 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xa9>
  258c05:	e9 ef 03 00 00       	jmp    258ff9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x489>
  258c0a:	88 de                	mov    %bl,%dh
  258c0c:	d0 ee                	shr    $1,%dh
  258c0e:	0f b6 f6             	movzbl %dh,%esi
  258c11:	39 f1                	cmp    %esi,%ecx
  258c13:	0f 85 e0 03 00 00    	jne    258ff9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x489>
  258c19:	8b 7d 08             	mov    0x8(%ebp),%edi
  258c1c:	8d b7 14 03 00 00    	lea    0x314(%edi),%esi
  258c22:	f6 c3 01             	test   $0x1,%bl
  258c25:	74 2d                	je     258c54 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe4>
  258c27:	8b bf 1c 03 00 00    	mov    0x31c(%edi),%edi
  258c2d:	f6 c2 01             	test   $0x1,%dl
  258c30:	74 2a                	je     258c5c <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xec>
  258c32:	8b 44 24 20          	mov    0x20(%esp),%eax
  258c36:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  258c3a:	89 7c 24 04          	mov    %edi,0x4(%esp)
  258c3e:	89 04 24             	mov    %eax,(%esp)
  258c41:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258c45:	e8 26 5b fa ff       	call   1fe770 <memcmp@plt>
  258c4a:	85 c0                	test   %eax,%eax
  258c4c:	0f 85 a7 03 00 00    	jne    258ff9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x489>
  258c52:	eb 1f                	jmp    258c73 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x103>
  258c54:	8d 7e 01             	lea    0x1(%esi),%edi
  258c57:	f6 c2 01             	test   $0x1,%dl
  258c5a:	75 d6                	jne    258c32 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc2>
  258c5c:	31 c9                	xor    %ecx,%ecx
  258c5e:	90                   	nop
  258c5f:	90                   	nop
  258c60:	0f b6 54 0c 19       	movzbl 0x19(%esp,%ecx,1),%edx
  258c65:	3a 14 0f             	cmp    (%edi,%ecx,1),%dl
  258c68:	0f 85 8b 03 00 00    	jne    258ff9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x489>
  258c6e:	41                   	inc    %ecx
  258c6f:	39 c8                	cmp    %ecx,%eax
  258c71:	75 ed                	jne    258c60 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf0>
  258c73:	8b 45 08             	mov    0x8(%ebp),%eax
  258c76:	8d b8 08 03 00 00    	lea    0x308(%eax),%edi
  258c7c:	89 74 24 04          	mov    %esi,0x4(%esp)
  258c80:	89 3c 24             	mov    %edi,(%esp)
  258c83:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258c87:	e8 74 7b fa ff       	call   200800 <std::__ndk1::map<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::allocator<std::__ndk1::pair<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const, cocos2d::Node*> > >::operator[](std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  258c8c:	8b 30                	mov    (%eax),%esi
  258c8e:	8b 06                	mov    (%esi),%eax
  258c90:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
  258c96:	89 34 24             	mov    %esi,(%esp)
  258c99:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258c9d:	ff d0                	call   *%eax
  258c9f:	85 c0                	test   %eax,%eax
  258ca1:	0f 84 1f 01 00 00    	je     258dc6 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x256>
  258ca7:	8b 45 08             	mov    0x8(%ebp),%eax
  258caa:	89 c2                	mov    %eax,%edx
  258cac:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  258cb2:	8b 0a                	mov    (%edx),%ecx
  258cb4:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258cba:	89 44 24 04          	mov    %eax,0x4(%esp)
  258cbe:	89 14 24             	mov    %edx,(%esp)
  258cc1:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258cc5:	ff d1                	call   *%ecx
  258cc7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  258cca:	8b 89 84 03 00 00    	mov    0x384(%ecx),%ecx
  258cd0:	8b 10                	mov    (%eax),%edx
  258cd2:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  258cd8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  258cdc:	89 04 24             	mov    %eax,(%esp)
  258cdf:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258ce3:	ff d2                	call   *%edx
  258ce5:	89 c6                	mov    %eax,%esi
  258ce7:	8b 00                	mov    (%eax),%eax
  258ce9:	8b 40 0c             	mov    0xc(%eax),%eax
  258cec:	89 34 24             	mov    %esi,(%esp)
  258cef:	c7 44 24 04 38 ff ff 	movl   $0xffffff38,0x4(%esp)
  258cf6:	ff 
  258cf7:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258cfb:	ff d0                	call   *%eax
  258cfd:	89 74 24 04          	mov    %esi,0x4(%esp)
  258d01:	8b 45 08             	mov    0x8(%ebp),%eax
  258d04:	89 04 24             	mov    %eax,(%esp)
  258d07:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  258d0e:	00 
  258d0f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  258d16:	00 
  258d17:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258d1b:	e8 20 7b fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  258d20:	8b 45 08             	mov    0x8(%ebp),%eax
  258d23:	c6 80 64 02 00 00 00 	movb   $0x0,0x264(%eax)
  258d2a:	89 04 24             	mov    %eax,(%esp)
  258d2d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258d31:	e8 7a 7b fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  258d36:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%esp)
  258d3d:	00 
  258d3e:	c7 44 24 60 00 00 00 	movl   $0x0,0x60(%esp)
  258d45:	00 
  258d46:	c7 44 24 68 00 00 00 	movl   $0x0,0x68(%esp)
  258d4d:	00 
  258d4e:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  258d55:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258d59:	e8 12 52 fa ff       	call   1fdf70 <operator new(unsigned int)@plt>
  258d5e:	89 44 24 68          	mov    %eax,0x68(%esp)
  258d62:	c7 44 24 60 11 00 00 	movl   $0x11,0x60(%esp)
  258d69:	00 
  258d6a:	c7 44 24 64 0b 00 00 	movl   $0xb,0x64(%esp)
  258d71:	00 
  258d72:	c7 40 04 6b 2d 63 6f 	movl   $0x6f632d6b,0x4(%eax)
  258d79:	c7 00 63 6c 69 63    	movl   $0x63696c63,(%eax)
  258d7f:	c7 40 08 6c 6f 72 00 	movl   $0x726f6c,0x8(%eax)
  258d86:	8d 44 24 60          	lea    0x60(%esp),%eax
  258d8a:	89 04 24             	mov    %eax,(%esp)
  258d8d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  258d94:	00 
  258d95:	c7 44 24 04 00 00 80 	movl   $0x3f800000,0x4(%esp)
  258d9c:	3f 
  258d9d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258da1:	e8 9a 5a fa ff       	call   1fe840 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@plt>
  258da6:	f6 44 24 60 01       	testb  $0x1,0x60(%esp)
  258dab:	0f 84 48 02 00 00    	je     258ff9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x489>
  258db1:	8b 44 24 68          	mov    0x68(%esp),%eax
  258db5:	89 04 24             	mov    %eax,(%esp)
  258db8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258dbc:	e8 cf 51 fa ff       	call   1fdf90 <operator delete(void*)@plt>
  258dc1:	e9 33 02 00 00       	jmp    258ff9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x489>
  258dc6:	8b 45 08             	mov    0x8(%ebp),%eax
  258dc9:	89 04 24             	mov    %eax,(%esp)
  258dcc:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258dd0:	e8 db 7a fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  258dd5:	8b 45 08             	mov    0x8(%ebp),%eax
  258dd8:	8d 80 2c 03 00 00    	lea    0x32c(%eax),%eax
  258dde:	89 44 24 04          	mov    %eax,0x4(%esp)
  258de2:	89 3c 24             	mov    %edi,(%esp)
  258de5:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258de9:	e8 12 7a fa ff       	call   200800 <std::__ndk1::map<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::allocator<std::__ndk1::pair<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const, cocos2d::Node*> > >::operator[](std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  258dee:	8b 38                	mov    (%eax),%edi
  258df0:	8b 07                	mov    (%edi),%eax
  258df2:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
  258df8:	89 3c 24             	mov    %edi,(%esp)
  258dfb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  258e02:	00 
  258e03:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258e07:	ff d0                	call   *%eax
  258e09:	8b 45 08             	mov    0x8(%ebp),%eax
  258e0c:	8b 80 7c 03 00 00    	mov    0x37c(%eax),%eax
  258e12:	8b 0f                	mov    (%edi),%ecx
  258e14:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258e1a:	89 44 24 04          	mov    %eax,0x4(%esp)
  258e1e:	89 3c 24             	mov    %edi,(%esp)
  258e21:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258e25:	ff d1                	call   *%ecx
  258e27:	8b 08                	mov    (%eax),%ecx
  258e29:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  258e2f:	89 04 24             	mov    %eax,(%esp)
  258e32:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  258e39:	00 
  258e3a:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258e3e:	ff d1                	call   *%ecx
  258e40:	8b 45 08             	mov    0x8(%ebp),%eax
  258e43:	8b 80 80 03 00 00    	mov    0x380(%eax),%eax
  258e49:	8b 0f                	mov    (%edi),%ecx
  258e4b:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258e51:	89 44 24 04          	mov    %eax,0x4(%esp)
  258e55:	89 3c 24             	mov    %edi,(%esp)
  258e58:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258e5c:	ff d1                	call   *%ecx
  258e5e:	8b 08                	mov    (%eax),%ecx
  258e60:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  258e66:	89 04 24             	mov    %eax,(%esp)
  258e69:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  258e70:	00 
  258e71:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258e75:	ff d1                	call   *%ecx
  258e77:	8b 45 08             	mov    0x8(%ebp),%eax
  258e7a:	8b 80 7c 03 00 00    	mov    0x37c(%eax),%eax
  258e80:	8b 0e                	mov    (%esi),%ecx
  258e82:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258e88:	89 44 24 04          	mov    %eax,0x4(%esp)
  258e8c:	89 34 24             	mov    %esi,(%esp)
  258e8f:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258e93:	ff d1                	call   *%ecx
  258e95:	8b 08                	mov    (%eax),%ecx
  258e97:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  258e9d:	89 04 24             	mov    %eax,(%esp)
  258ea0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  258ea7:	00 
  258ea8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258eac:	ff d1                	call   *%ecx
  258eae:	8b 45 08             	mov    0x8(%ebp),%eax
  258eb1:	8b 80 80 03 00 00    	mov    0x380(%eax),%eax
  258eb7:	8b 0e                	mov    (%esi),%ecx
  258eb9:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258ebf:	89 44 24 04          	mov    %eax,0x4(%esp)
  258ec3:	89 34 24             	mov    %esi,(%esp)
  258ec6:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258eca:	ff d1                	call   *%ecx
  258ecc:	8b 08                	mov    (%eax),%ecx
  258ece:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  258ed4:	89 04 24             	mov    %eax,(%esp)
  258ed7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  258ede:	00 
  258edf:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258ee3:	ff d1                	call   *%ecx
  258ee5:	8b 06                	mov    (%esi),%eax
  258ee7:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
  258eed:	89 34 24             	mov    %esi,(%esp)
  258ef0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  258ef7:	00 
  258ef8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258efc:	ff d0                	call   *%eax
  258efe:	8b 45 08             	mov    0x8(%ebp),%eax
  258f01:	89 c2                	mov    %eax,%edx
  258f03:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  258f09:	8b 0a                	mov    (%edx),%ecx
  258f0b:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258f11:	89 44 24 04          	mov    %eax,0x4(%esp)
  258f15:	89 14 24             	mov    %edx,(%esp)
  258f18:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258f1c:	ff d1                	call   *%ecx
  258f1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  258f21:	8b 89 84 03 00 00    	mov    0x384(%ecx),%ecx
  258f27:	8b 10                	mov    (%eax),%edx
  258f29:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  258f2f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  258f33:	89 04 24             	mov    %eax,(%esp)
  258f36:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258f3a:	ff d2                	call   *%edx
  258f3c:	89 c6                	mov    %eax,%esi
  258f3e:	8b 00                	mov    (%eax),%eax
  258f40:	8b 40 0c             	mov    0xc(%eax),%eax
  258f43:	89 34 24             	mov    %esi,(%esp)
  258f46:	c7 44 24 04 9c ff ff 	movl   $0xffffff9c,0x4(%esp)
  258f4d:	ff 
  258f4e:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258f52:	ff d0                	call   *%eax
  258f54:	89 74 24 04          	mov    %esi,0x4(%esp)
  258f58:	8b 45 08             	mov    0x8(%ebp),%eax
  258f5b:	89 04 24             	mov    %eax,(%esp)
  258f5e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  258f65:	00 
  258f66:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  258f6d:	00 
  258f6e:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258f72:	e8 c9 78 fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  258f77:	8b 45 08             	mov    0x8(%ebp),%eax
  258f7a:	89 c2                	mov    %eax,%edx
  258f7c:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  258f82:	8b 0a                	mov    (%edx),%ecx
  258f84:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  258f8a:	89 44 24 04          	mov    %eax,0x4(%esp)
  258f8e:	89 14 24             	mov    %edx,(%esp)
  258f91:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258f95:	ff d1                	call   *%ecx
  258f97:	8b 4d 08             	mov    0x8(%ebp),%ecx
  258f9a:	8b 89 8c 03 00 00    	mov    0x38c(%ecx),%ecx
  258fa0:	8b 10                	mov    (%eax),%edx
  258fa2:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  258fa8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  258fac:	89 04 24             	mov    %eax,(%esp)
  258faf:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258fb3:	ff d2                	call   *%edx
  258fb5:	89 c6                	mov    %eax,%esi
  258fb7:	8b 00                	mov    (%eax),%eax
  258fb9:	8b 40 0c             	mov    0xc(%eax),%eax
  258fbc:	89 34 24             	mov    %esi,(%esp)
  258fbf:	c7 44 24 04 38 ff ff 	movl   $0xffffff38,0x4(%esp)
  258fc6:	ff 
  258fc7:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258fcb:	ff d0                	call   *%eax
  258fcd:	89 74 24 04          	mov    %esi,0x4(%esp)
  258fd1:	8b 45 08             	mov    0x8(%ebp),%eax
  258fd4:	89 04 24             	mov    %eax,(%esp)
  258fd7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  258fde:	00 
  258fdf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  258fe6:	00 
  258fe7:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258feb:	e8 50 78 fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  258ff0:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  258ff4:	e8 57 56 fa ff       	call   1fe650 <SoundManager::playButtonClick()@plt>
  258ff9:	8a 4c 24 18          	mov    0x18(%esp),%cl
  258ffd:	89 c8                	mov    %ecx,%eax
  258fff:	d0 e8                	shr    $1,%al
  259001:	f6 c1 01             	test   $0x1,%cl
  259004:	0f b6 c0             	movzbl %al,%eax
  259007:	89 c7                	mov    %eax,%edi
  259009:	74 04                	je     25900f <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x49f>
  25900b:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
  25900f:	8b 75 08             	mov    0x8(%ebp),%esi
  259012:	8a 96 20 03 00 00    	mov    0x320(%esi),%dl
  259018:	f6 c2 01             	test   $0x1,%dl
  25901b:	74 0f                	je     25902c <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x4bc>
  25901d:	8b b6 24 03 00 00    	mov    0x324(%esi),%esi
  259023:	39 f7                	cmp    %esi,%edi
  259025:	74 14                	je     25903b <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x4cb>
  259027:	e9 55 03 00 00       	jmp    259381 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x811>
  25902c:	88 d5                	mov    %dl,%ch
  25902e:	d0 ed                	shr    $1,%ch
  259030:	0f b6 f5             	movzbl %ch,%esi
  259033:	39 f7                	cmp    %esi,%edi
  259035:	0f 85 46 03 00 00    	jne    259381 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x811>
  25903b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  25903e:	8d b3 20 03 00 00    	lea    0x320(%ebx),%esi
  259044:	f6 c2 01             	test   $0x1,%dl
  259047:	74 33                	je     25907c <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x50c>
  259049:	8b 93 28 03 00 00    	mov    0x328(%ebx),%edx
  25904f:	f6 c1 01             	test   $0x1,%cl
  259052:	75 30                	jne    259084 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x514>
  259054:	8d 4c 24 19          	lea    0x19(%esp),%ecx
  259058:	74 30                	je     25908a <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x51a>
  25905a:	85 ff                	test   %edi,%edi
  25905c:	74 45                	je     2590a3 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x533>
  25905e:	89 7c 24 08          	mov    %edi,0x8(%esp)
  259062:	89 54 24 04          	mov    %edx,0x4(%esp)
  259066:	89 0c 24             	mov    %ecx,(%esp)
  259069:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25906d:	e8 fe 56 fa ff       	call   1fe770 <memcmp@plt>
  259072:	85 c0                	test   %eax,%eax
  259074:	0f 85 07 03 00 00    	jne    259381 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x811>
  25907a:	eb 27                	jmp    2590a3 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x533>
  25907c:	8d 56 01             	lea    0x1(%esi),%edx
  25907f:	f6 c1 01             	test   $0x1,%cl
  259082:	74 d0                	je     259054 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x4e4>
  259084:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  259088:	75 d0                	jne    25905a <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x4ea>
  25908a:	85 ff                	test   %edi,%edi
  25908c:	74 15                	je     2590a3 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x533>
  25908e:	31 c9                	xor    %ecx,%ecx
  259090:	0f b6 5c 0c 19       	movzbl 0x19(%esp,%ecx,1),%ebx
  259095:	3a 1c 0a             	cmp    (%edx,%ecx,1),%bl
  259098:	0f 85 e3 02 00 00    	jne    259381 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x811>
  25909e:	41                   	inc    %ecx
  25909f:	39 c8                	cmp    %ecx,%eax
  2590a1:	75 ed                	jne    259090 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x520>
  2590a3:	8b 45 08             	mov    0x8(%ebp),%eax
  2590a6:	8d b8 08 03 00 00    	lea    0x308(%eax),%edi
  2590ac:	89 74 24 04          	mov    %esi,0x4(%esp)
  2590b0:	89 3c 24             	mov    %edi,(%esp)
  2590b3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2590b7:	e8 44 77 fa ff       	call   200800 <std::__ndk1::map<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::allocator<std::__ndk1::pair<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const, cocos2d::Node*> > >::operator[](std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  2590bc:	8b 30                	mov    (%eax),%esi
  2590be:	8b 06                	mov    (%esi),%eax
  2590c0:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
  2590c6:	89 34 24             	mov    %esi,(%esp)
  2590c9:	ff d0                	call   *%eax
  2590cb:	85 c0                	test   %eax,%eax
  2590cd:	0f 84 fb 00 00 00    	je     2591ce <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x65e>
  2590d3:	8b 45 08             	mov    0x8(%ebp),%eax
  2590d6:	89 c2                	mov    %eax,%edx
  2590d8:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  2590de:	8b 0a                	mov    (%edx),%ecx
  2590e0:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2590e6:	89 44 24 04          	mov    %eax,0x4(%esp)
  2590ea:	89 14 24             	mov    %edx,(%esp)
  2590ed:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2590f1:	ff d1                	call   *%ecx
  2590f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2590f6:	8b 89 8c 03 00 00    	mov    0x38c(%ecx),%ecx
  2590fc:	8b 10                	mov    (%eax),%edx
  2590fe:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  259104:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  259108:	89 04 24             	mov    %eax,(%esp)
  25910b:	ff d2                	call   *%edx
  25910d:	89 c6                	mov    %eax,%esi
  25910f:	8b 00                	mov    (%eax),%eax
  259111:	8b 40 0c             	mov    0xc(%eax),%eax
  259114:	89 34 24             	mov    %esi,(%esp)
  259117:	c7 44 24 04 38 ff ff 	movl   $0xffffff38,0x4(%esp)
  25911e:	ff 
  25911f:	ff d0                	call   *%eax
  259121:	89 74 24 04          	mov    %esi,0x4(%esp)
  259125:	8b 45 08             	mov    0x8(%ebp),%eax
  259128:	89 04 24             	mov    %eax,(%esp)
  25912b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  259132:	00 
  259133:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  25913a:	00 
  25913b:	e8 00 77 fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  259140:	8b 45 08             	mov    0x8(%ebp),%eax
  259143:	c6 80 64 02 00 00 00 	movb   $0x0,0x264(%eax)
  25914a:	89 04 24             	mov    %eax,(%esp)
  25914d:	e8 5e 77 fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  259152:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
  259159:	00 
  25915a:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
  259161:	00 
  259162:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
  259169:	00 
  25916a:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  259171:	e8 fa 4d fa ff       	call   1fdf70 <operator new(unsigned int)@plt>
  259176:	89 44 24 48          	mov    %eax,0x48(%esp)
  25917a:	c7 44 24 40 11 00 00 	movl   $0x11,0x40(%esp)
  259181:	00 
  259182:	c7 44 24 44 0b 00 00 	movl   $0xb,0x44(%esp)
  259189:	00 
  25918a:	c7 40 04 6b 2d 63 6f 	movl   $0x6f632d6b,0x4(%eax)
  259191:	c7 00 63 6c 69 63    	movl   $0x63696c63,(%eax)
  259197:	c7 40 08 6c 6f 72 00 	movl   $0x726f6c,0x8(%eax)
  25919e:	8d 44 24 40          	lea    0x40(%esp),%eax
  2591a2:	89 04 24             	mov    %eax,(%esp)
  2591a5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2591ac:	00 
  2591ad:	c7 44 24 04 00 00 80 	movl   $0x3f800000,0x4(%esp)
  2591b4:	3f 
  2591b5:	e8 86 56 fa ff       	call   1fe840 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@plt>
  2591ba:	f6 44 24 40 01       	testb  $0x1,0x40(%esp)
  2591bf:	0f 84 bc 01 00 00    	je     259381 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x811>
  2591c5:	8b 44 24 48          	mov    0x48(%esp),%eax
  2591c9:	e9 a7 01 00 00       	jmp    259375 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x805>
  2591ce:	8b 45 08             	mov    0x8(%ebp),%eax
  2591d1:	89 04 24             	mov    %eax,(%esp)
  2591d4:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2591d8:	e8 d3 76 fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  2591dd:	8b 45 08             	mov    0x8(%ebp),%eax
  2591e0:	8d 80 2c 03 00 00    	lea    0x32c(%eax),%eax
  2591e6:	89 44 24 04          	mov    %eax,0x4(%esp)
  2591ea:	89 3c 24             	mov    %edi,(%esp)
  2591ed:	e8 0e 76 fa ff       	call   200800 <std::__ndk1::map<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::allocator<std::__ndk1::pair<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const, cocos2d::Node*> > >::operator[](std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  2591f2:	8b 38                	mov    (%eax),%edi
  2591f4:	8b 07                	mov    (%edi),%eax
  2591f6:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
  2591fc:	89 3c 24             	mov    %edi,(%esp)
  2591ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  259206:	00 
  259207:	ff d0                	call   *%eax
  259209:	8b 45 08             	mov    0x8(%ebp),%eax
  25920c:	8b 80 7c 03 00 00    	mov    0x37c(%eax),%eax
  259212:	8b 0f                	mov    (%edi),%ecx
  259214:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  25921a:	89 44 24 04          	mov    %eax,0x4(%esp)
  25921e:	89 3c 24             	mov    %edi,(%esp)
  259221:	ff d1                	call   *%ecx
  259223:	8b 08                	mov    (%eax),%ecx
  259225:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  25922b:	89 04 24             	mov    %eax,(%esp)
  25922e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  259235:	00 
  259236:	ff d1                	call   *%ecx
  259238:	8b 45 08             	mov    0x8(%ebp),%eax
  25923b:	8b 80 80 03 00 00    	mov    0x380(%eax),%eax
  259241:	8b 0f                	mov    (%edi),%ecx
  259243:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  259249:	89 44 24 04          	mov    %eax,0x4(%esp)
  25924d:	89 3c 24             	mov    %edi,(%esp)
  259250:	ff d1                	call   *%ecx
  259252:	8b 08                	mov    (%eax),%ecx
  259254:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  25925a:	89 04 24             	mov    %eax,(%esp)
  25925d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  259264:	00 
  259265:	ff d1                	call   *%ecx
  259267:	8b 06                	mov    (%esi),%eax
  259269:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
  25926f:	89 34 24             	mov    %esi,(%esp)
  259272:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  259279:	00 
  25927a:	ff d0                	call   *%eax
  25927c:	8b 45 08             	mov    0x8(%ebp),%eax
  25927f:	8b 80 7c 03 00 00    	mov    0x37c(%eax),%eax
  259285:	8b 0e                	mov    (%esi),%ecx
  259287:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  25928d:	89 44 24 04          	mov    %eax,0x4(%esp)
  259291:	89 34 24             	mov    %esi,(%esp)
  259294:	ff d1                	call   *%ecx
  259296:	8b 08                	mov    (%eax),%ecx
  259298:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  25929e:	89 04 24             	mov    %eax,(%esp)
  2592a1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  2592a8:	00 
  2592a9:	ff d1                	call   *%ecx
  2592ab:	8b 45 08             	mov    0x8(%ebp),%eax
  2592ae:	8b 80 80 03 00 00    	mov    0x380(%eax),%eax
  2592b4:	8b 0e                	mov    (%esi),%ecx
  2592b6:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2592bc:	89 44 24 04          	mov    %eax,0x4(%esp)
  2592c0:	89 34 24             	mov    %esi,(%esp)
  2592c3:	ff d1                	call   *%ecx
  2592c5:	8b 08                	mov    (%eax),%ecx
  2592c7:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  2592cd:	89 04 24             	mov    %eax,(%esp)
  2592d0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  2592d7:	00 
  2592d8:	ff d1                	call   *%ecx
  2592da:	8b 45 08             	mov    0x8(%ebp),%eax
  2592dd:	89 04 24             	mov    %eax,(%esp)
  2592e0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  2592e7:	00 
  2592e8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  2592ef:	00 
  2592f0:	e8 4b 76 fa ff       	call   200940 <ToolsLayer::setPalettePopupVisible(bool, bool)@plt>
  2592f5:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
  2592fc:	00 
  2592fd:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
  259304:	00 
  259305:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
  25930c:	00 
  25930d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  259314:	e8 57 4c fa ff       	call   1fdf70 <operator new(unsigned int)@plt>
  259319:	89 44 24 58          	mov    %eax,0x58(%esp)
  25931d:	c7 44 24 50 21 00 00 	movl   $0x21,0x50(%esp)
  259324:	00 
  259325:	c7 44 24 54 11 00 00 	movl   $0x11,0x54(%esp)
  25932c:	00 
  25932d:	c7 40 0c 65 6c 65 63 	movl   $0x63656c65,0xc(%eax)
  259334:	c7 40 08 6f 72 2d 73 	movl   $0x732d726f,0x8(%eax)
  25933b:	c7 40 04 2d 63 6f 6c 	movl   $0x6c6f632d,0x4(%eax)
  259342:	c7 00 64 72 61 77    	movl   $0x77617264,(%eax)
  259348:	66 c7 40 10 74 00    	movw   $0x74,0x10(%eax)
  25934e:	8d 44 24 50          	lea    0x50(%esp),%eax
  259352:	89 04 24             	mov    %eax,(%esp)
  259355:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  25935c:	00 
  25935d:	c7 44 24 04 00 00 80 	movl   $0x3f800000,0x4(%esp)
  259364:	3f 
  259365:	e8 d6 54 fa ff       	call   1fe840 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@plt>
  25936a:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  25936f:	74 10                	je     259381 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x811>
  259371:	8b 44 24 58          	mov    0x58(%esp),%eax
  259375:	89 04 24             	mov    %eax,(%esp)
  259378:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25937c:	e8 0f 4c fa ff       	call   1fdf90 <operator delete(void*)@plt>
  259381:	8a 4c 24 18          	mov    0x18(%esp),%cl
  259385:	89 c8                	mov    %ecx,%eax
  259387:	d0 e8                	shr    $1,%al
  259389:	f6 c1 01             	test   $0x1,%cl
  25938c:	0f b6 c0             	movzbl %al,%eax
  25938f:	89 c6                	mov    %eax,%esi
  259391:	74 04                	je     259397 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x827>
  259393:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  259397:	8b 7d 08             	mov    0x8(%ebp),%edi
  25939a:	8a 97 2c 03 00 00    	mov    0x32c(%edi),%dl
  2593a0:	f6 c2 01             	test   $0x1,%dl
  2593a3:	74 08                	je     2593ad <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x83d>
  2593a5:	8b bf 30 03 00 00    	mov    0x330(%edi),%edi
  2593ab:	eb 07                	jmp    2593b4 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x844>
  2593ad:	88 d5                	mov    %dl,%ch
  2593af:	d0 ed                	shr    $1,%ch
  2593b1:	0f b6 fd             	movzbl %ch,%edi
  2593b4:	39 fe                	cmp    %edi,%esi
  2593b6:	8b 7c 24 10          	mov    0x10(%esp),%edi
  2593ba:	0f 85 c2 03 00 00    	jne    259782 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc12>
  2593c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2593c3:	8d 9b 2c 03 00 00    	lea    0x32c(%ebx),%ebx
  2593c9:	f6 c2 01             	test   $0x1,%dl
  2593cc:	74 0b                	je     2593d9 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x869>
  2593ce:	8b 55 08             	mov    0x8(%ebp),%edx
  2593d1:	8b 92 34 03 00 00    	mov    0x334(%edx),%edx
  2593d7:	eb 03                	jmp    2593dc <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x86c>
  2593d9:	8d 53 01             	lea    0x1(%ebx),%edx
  2593dc:	f6 c1 01             	test   $0x1,%cl
  2593df:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  2593e3:	74 26                	je     25940b <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x89b>
  2593e5:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  2593e9:	74 26                	je     259411 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x8a1>
  2593eb:	85 f6                	test   %esi,%esi
  2593ed:	74 44                	je     259433 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x8c3>
  2593ef:	89 74 24 08          	mov    %esi,0x8(%esp)
  2593f3:	89 54 24 04          	mov    %edx,0x4(%esp)
  2593f7:	89 0c 24             	mov    %ecx,(%esp)
  2593fa:	89 fb                	mov    %edi,%ebx
  2593fc:	e8 6f 53 fa ff       	call   1fe770 <memcmp@plt>
  259401:	85 c0                	test   %eax,%eax
  259403:	0f 85 79 03 00 00    	jne    259782 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc12>
  259409:	eb 28                	jmp    259433 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x8c3>
  25940b:	8d 4c 24 19          	lea    0x19(%esp),%ecx
  25940f:	75 da                	jne    2593eb <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x87b>
  259411:	85 f6                	test   %esi,%esi
  259413:	74 1e                	je     259433 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x8c3>
  259415:	31 c9                	xor    %ecx,%ecx
  259417:	90                   	nop
  259418:	90                   	nop
  259419:	90                   	nop
  25941a:	90                   	nop
  25941b:	90                   	nop
  25941c:	90                   	nop
  25941d:	90                   	nop
  25941e:	90                   	nop
  25941f:	90                   	nop
  259420:	0f b6 5c 0c 19       	movzbl 0x19(%esp,%ecx,1),%ebx
  259425:	3a 1c 0a             	cmp    (%edx,%ecx,1),%bl
  259428:	0f 85 54 03 00 00    	jne    259782 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc12>
  25942e:	41                   	inc    %ecx
  25942f:	39 c8                	cmp    %ecx,%eax
  259431:	75 ed                	jne    259420 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0x8b0>
  259433:	8b 45 08             	mov    0x8(%ebp),%eax
  259436:	8d b0 08 03 00 00    	lea    0x308(%eax),%esi
  25943c:	8b 44 24 14          	mov    0x14(%esp),%eax
  259440:	89 44 24 04          	mov    %eax,0x4(%esp)
  259444:	89 34 24             	mov    %esi,(%esp)
  259447:	89 fb                	mov    %edi,%ebx
  259449:	e8 b2 73 fa ff       	call   200800 <std::__ndk1::map<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::allocator<std::__ndk1::pair<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const, cocos2d::Node*> > >::operator[](std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  25944e:	8b 38                	mov    (%eax),%edi
  259450:	8b 07                	mov    (%edi),%eax
  259452:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
  259458:	89 3c 24             	mov    %edi,(%esp)
  25945b:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25945f:	ff d0                	call   *%eax
  259461:	85 c0                	test   %eax,%eax
  259463:	0f 84 39 01 00 00    	je     2595a2 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xa32>
  259469:	8b 45 08             	mov    0x8(%ebp),%eax
  25946c:	c6 80 64 02 00 00 00 	movb   $0x0,0x264(%eax)
  259473:	89 04 24             	mov    %eax,(%esp)
  259476:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25947a:	e8 31 74 fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  25947f:	8b 44 24 14          	mov    0x14(%esp),%eax
  259483:	89 44 24 04          	mov    %eax,0x4(%esp)
  259487:	89 34 24             	mov    %esi,(%esp)
  25948a:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25948e:	e8 6d 73 fa ff       	call   200800 <std::__ndk1::map<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::allocator<std::__ndk1::pair<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const, cocos2d::Node*> > >::operator[](std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > const&)@plt>
  259493:	8b 30                	mov    (%eax),%esi
  259495:	8b 06                	mov    (%esi),%eax
  259497:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
  25949d:	89 34 24             	mov    %esi,(%esp)
  2594a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  2594a7:	00 
  2594a8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2594ac:	ff d0                	call   *%eax
  2594ae:	8b 45 08             	mov    0x8(%ebp),%eax
  2594b1:	8b 80 7c 03 00 00    	mov    0x37c(%eax),%eax
  2594b7:	8b 0e                	mov    (%esi),%ecx
  2594b9:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2594bf:	89 44 24 04          	mov    %eax,0x4(%esp)
  2594c3:	89 34 24             	mov    %esi,(%esp)
  2594c6:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2594ca:	ff d1                	call   *%ecx
  2594cc:	8b 08                	mov    (%eax),%ecx
  2594ce:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  2594d4:	89 04 24             	mov    %eax,(%esp)
  2594d7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  2594de:	00 
  2594df:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2594e3:	ff d1                	call   *%ecx
  2594e5:	8b 45 08             	mov    0x8(%ebp),%eax
  2594e8:	8b 80 80 03 00 00    	mov    0x380(%eax),%eax
  2594ee:	8b 0e                	mov    (%esi),%ecx
  2594f0:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2594f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  2594fa:	89 34 24             	mov    %esi,(%esp)
  2594fd:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259501:	ff d1                	call   *%ecx
  259503:	8b 08                	mov    (%eax),%ecx
  259505:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  25950b:	89 04 24             	mov    %eax,(%esp)
  25950e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  259515:	00 
  259516:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25951a:	ff d1                	call   *%ecx
  25951c:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
  259523:	00 
  259524:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  25952b:	00 
  25952c:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  259533:	00 
  259534:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
  25953b:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25953f:	e8 2c 4a fa ff       	call   1fdf70 <operator new(unsigned int)@plt>
  259544:	89 44 24 38          	mov    %eax,0x38(%esp)
  259548:	c7 44 24 30 11 00 00 	movl   $0x11,0x30(%esp)
  25954f:	00 
  259550:	c7 44 24 34 0b 00 00 	movl   $0xb,0x34(%esp)
  259557:	00 
  259558:	c7 40 04 6b 2d 63 6f 	movl   $0x6f632d6b,0x4(%eax)
  25955f:	c7 00 63 6c 69 63    	movl   $0x63696c63,(%eax)
  259565:	c7 40 08 6c 6f 72 00 	movl   $0x726f6c,0x8(%eax)
  25956c:	8d 44 24 30          	lea    0x30(%esp),%eax
  259570:	89 04 24             	mov    %eax,(%esp)
  259573:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  25957a:	00 
  25957b:	c7 44 24 04 00 00 80 	movl   $0x3f800000,0x4(%esp)
  259582:	3f 
  259583:	8b 7c 24 10          	mov    0x10(%esp),%edi
  259587:	89 fb                	mov    %edi,%ebx
  259589:	e8 b2 52 fa ff       	call   1fe840 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@plt>
  25958e:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  259593:	0f 84 e9 01 00 00    	je     259782 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc12>
  259599:	8b 44 24 38          	mov    0x38(%esp),%eax
  25959d:	e9 d6 01 00 00       	jmp    259778 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc08>
  2595a2:	8b 45 08             	mov    0x8(%ebp),%eax
  2595a5:	89 04 24             	mov    %eax,(%esp)
  2595a8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2595ac:	e8 ff 72 fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  2595b1:	8b 45 08             	mov    0x8(%ebp),%eax
  2595b4:	8b 80 7c 03 00 00    	mov    0x37c(%eax),%eax
  2595ba:	8b 0f                	mov    (%edi),%ecx
  2595bc:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2595c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  2595c6:	89 3c 24             	mov    %edi,(%esp)
  2595c9:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2595cd:	ff d1                	call   *%ecx
  2595cf:	8b 08                	mov    (%eax),%ecx
  2595d1:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  2595d7:	89 04 24             	mov    %eax,(%esp)
  2595da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  2595e1:	00 
  2595e2:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2595e6:	ff d1                	call   *%ecx
  2595e8:	8b 45 08             	mov    0x8(%ebp),%eax
  2595eb:	8b 80 80 03 00 00    	mov    0x380(%eax),%eax
  2595f1:	8b 0f                	mov    (%edi),%ecx
  2595f3:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2595f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  2595fd:	89 3c 24             	mov    %edi,(%esp)
  259600:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259604:	ff d1                	call   *%ecx
  259606:	8b 08                	mov    (%eax),%ecx
  259608:	8b 89 b8 00 00 00    	mov    0xb8(%ecx),%ecx
  25960e:	89 04 24             	mov    %eax,(%esp)
  259611:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  259618:	00 
  259619:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25961d:	ff d1                	call   *%ecx
  25961f:	8b 07                	mov    (%edi),%eax
  259621:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
  259627:	89 3c 24             	mov    %edi,(%esp)
  25962a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  259631:	00 
  259632:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259636:	ff d0                	call   *%eax
  259638:	8b 45 08             	mov    0x8(%ebp),%eax
  25963b:	89 c2                	mov    %eax,%edx
  25963d:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  259643:	8b 0a                	mov    (%edx),%ecx
  259645:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  25964b:	89 44 24 04          	mov    %eax,0x4(%esp)
  25964f:	89 14 24             	mov    %edx,(%esp)
  259652:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259656:	ff d1                	call   *%ecx
  259658:	8b 4d 08             	mov    0x8(%ebp),%ecx
  25965b:	8b 89 84 03 00 00    	mov    0x384(%ecx),%ecx
  259661:	8b 10                	mov    (%eax),%edx
  259663:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  259669:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  25966d:	89 04 24             	mov    %eax,(%esp)
  259670:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259674:	ff d2                	call   *%edx
  259676:	89 c6                	mov    %eax,%esi
  259678:	8b 00                	mov    (%eax),%eax
  25967a:	8b 40 0c             	mov    0xc(%eax),%eax
  25967d:	89 34 24             	mov    %esi,(%esp)
  259680:	c7 44 24 04 38 ff ff 	movl   $0xffffff38,0x4(%esp)
  259687:	ff 
  259688:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25968c:	ff d0                	call   *%eax
  25968e:	89 74 24 04          	mov    %esi,0x4(%esp)
  259692:	8b 45 08             	mov    0x8(%ebp),%eax
  259695:	89 04 24             	mov    %eax,(%esp)
  259698:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  25969f:	00 
  2596a0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2596a7:	00 
  2596a8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2596ac:	e8 8f 71 fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  2596b1:	8b 45 08             	mov    0x8(%ebp),%eax
  2596b4:	89 c2                	mov    %eax,%edx
  2596b6:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  2596bc:	8b 0a                	mov    (%edx),%ecx
  2596be:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  2596c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  2596c8:	89 14 24             	mov    %edx,(%esp)
  2596cb:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2596cf:	ff d1                	call   *%ecx
  2596d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2596d4:	8b 89 8c 03 00 00    	mov    0x38c(%ecx),%ecx
  2596da:	8b 10                	mov    (%eax),%edx
  2596dc:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  2596e2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  2596e6:	89 04 24             	mov    %eax,(%esp)
  2596e9:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2596ed:	ff d2                	call   *%edx
  2596ef:	89 c6                	mov    %eax,%esi
  2596f1:	8b 00                	mov    (%eax),%eax
  2596f3:	8b 40 0c             	mov    0xc(%eax),%eax
  2596f6:	89 34 24             	mov    %esi,(%esp)
  2596f9:	c7 44 24 04 38 ff ff 	movl   $0xffffff38,0x4(%esp)
  259700:	ff 
  259701:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259705:	ff d0                	call   *%eax
  259707:	89 74 24 04          	mov    %esi,0x4(%esp)
  25970b:	8b 45 08             	mov    0x8(%ebp),%eax
  25970e:	89 04 24             	mov    %eax,(%esp)
  259711:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  259718:	00 
  259719:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  259720:	00 
  259721:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259725:	e8 16 71 fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  25972a:	c6 44 24 70 14       	movb   $0x14,0x70(%esp)
  25972f:	66 c7 44 24 79 73 65 	movw   $0x6573,0x79(%esp)
  259736:	c7 44 24 75 2d 65 72 	movl   $0x6172652d,0x75(%esp)
  25973d:	61 
  25973e:	c7 44 24 71 64 72 61 	movl   $0x77617264,0x71(%esp)
  259745:	77 
  259746:	c6 44 24 7b 00       	movb   $0x0,0x7b(%esp)
  25974b:	8d 44 24 70          	lea    0x70(%esp),%eax
  25974f:	89 04 24             	mov    %eax,(%esp)
  259752:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  259759:	00 
  25975a:	c7 44 24 04 00 00 80 	movl   $0x3f800000,0x4(%esp)
  259761:	3f 
  259762:	8b 7c 24 10          	mov    0x10(%esp),%edi
  259766:	89 fb                	mov    %edi,%ebx
  259768:	e8 d3 50 fa ff       	call   1fe840 <SoundManager::playEffect(std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, float, bool)@plt>
  25976d:	f6 44 24 70 01       	testb  $0x1,0x70(%esp)
  259772:	74 0e                	je     259782 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xc12>
  259774:	8b 44 24 78          	mov    0x78(%esp),%eax
  259778:	89 04 24             	mov    %eax,(%esp)
  25977b:	89 fb                	mov    %edi,%ebx
  25977d:	e8 0e 48 fa ff       	call   1fdf90 <operator delete(void*)@plt>
  259782:	8b 45 08             	mov    0x8(%ebp),%eax
  259785:	89 c2                	mov    %eax,%edx
  259787:	8b 80 5c 03 00 00    	mov    0x35c(%eax),%eax
  25978d:	8b 0a                	mov    (%edx),%ecx
  25978f:	8b 89 14 01 00 00    	mov    0x114(%ecx),%ecx
  259795:	89 44 24 04          	mov    %eax,0x4(%esp)
  259799:	89 14 24             	mov    %edx,(%esp)
  25979c:	89 fb                	mov    %edi,%ebx
  25979e:	ff d1                	call   *%ecx
  2597a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2597a3:	8b 89 8c 03 00 00    	mov    0x38c(%ecx),%ecx
  2597a9:	8b 10                	mov    (%eax),%edx
  2597ab:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  2597b1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  2597b5:	89 04 24             	mov    %eax,(%esp)
  2597b8:	89 fb                	mov    %edi,%ebx
  2597ba:	ff d2                	call   *%edx
  2597bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2597bf:	8b 89 94 03 00 00    	mov    0x394(%ecx),%ecx
  2597c5:	8b 10                	mov    (%eax),%edx
  2597c7:	8b 92 14 01 00 00    	mov    0x114(%edx),%edx
  2597cd:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  2597d1:	89 04 24             	mov    %eax,(%esp)
  2597d4:	89 fb                	mov    %edi,%ebx
  2597d6:	ff d2                	call   *%edx
  2597d8:	89 c6                	mov    %eax,%esi
  2597da:	8b 00                	mov    (%eax),%eax
  2597dc:	8b 80 bc 00 00 00    	mov    0xbc(%eax),%eax
  2597e2:	89 34 24             	mov    %esi,(%esp)
  2597e5:	89 fb                	mov    %edi,%ebx
  2597e7:	ff d0                	call   *%eax
  2597e9:	84 c0                	test   %al,%al
  2597eb:	0f 84 81 00 00 00    	je     259872 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xd02>
  2597f1:	89 fb                	mov    %edi,%ebx
  2597f3:	e8 98 54 fa ff       	call   1fec90 <LevelManager::isToolsPurchased()@plt>
  2597f8:	84 c0                	test   %al,%al
  2597fa:	75 76                	jne    259872 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xd02>
  2597fc:	8b 06                	mov    (%esi),%eax
  2597fe:	8b 80 b8 01 00 00    	mov    0x1b8(%eax),%eax
  259804:	89 74 24 04          	mov    %esi,0x4(%esp)
  259808:	89 fb                	mov    %edi,%ebx
  25980a:	8d bc 24 98 00 00 00 	lea    0x98(%esp),%edi
  259811:	89 3c 24             	mov    %edi,(%esp)
  259814:	ff d0                	call   *%eax
  259816:	83 ec 04             	sub    $0x4,%esp
  259819:	8b 06                	mov    (%esi),%eax
  25981b:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
  259821:	89 34 24             	mov    %esi,(%esp)
  259824:	ff d0                	call   *%eax
  259826:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  259829:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  25982d:	89 44 24 04          	mov    %eax,0x4(%esp)
  259831:	8d b4 24 90 00 00 00 	lea    0x90(%esp),%esi
  259838:	89 34 24             	mov    %esi,(%esp)
  25983b:	e8 e0 4f fa ff       	call   1fe820 <cocos2d::Node::convertToNodeSpace(cocos2d::Vec2 const&) const@plt>
  259840:	83 ec 04             	sub    $0x4,%esp
  259843:	89 74 24 04          	mov    %esi,0x4(%esp)
  259847:	89 3c 24             	mov    %edi,(%esp)
  25984a:	89 df                	mov    %ebx,%edi
  25984c:	e8 df 4f fa ff       	call   1fe830 <cocos2d::Rect::containsPoint(cocos2d::Vec2 const&) const@plt>
  259851:	84 c0                	test   %al,%al
  259853:	74 1d                	je     259872 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xd02>
  259855:	8b 45 08             	mov    0x8(%ebp),%eax
  259858:	8b 80 58 03 00 00    	mov    0x358(%eax),%eax
  25985e:	89 04 24             	mov    %eax,(%esp)
  259861:	89 fb                	mov    %edi,%ebx
  259863:	e8 e8 70 fa ff       	call   200950 <DrawScene::buyTools()@plt>
  259868:	8b 45 08             	mov    0x8(%ebp),%eax
  25986b:	c6 80 64 02 00 00 00 	movb   $0x0,0x264(%eax)
  259872:	8b 45 08             	mov    0x8(%ebp),%eax
  259875:	8b b0 78 02 00 00    	mov    0x278(%eax),%esi
  25987b:	8b 80 7c 02 00 00    	mov    0x27c(%eax),%eax
  259881:	89 44 24 28          	mov    %eax,0x28(%esp)
  259885:	39 c6                	cmp    %eax,%esi
  259887:	0f 84 a9 00 00 00    	je     259936 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xdc6>
  25988d:	8b 45 0c             	mov    0xc(%ebp),%eax
  259890:	8b 08                	mov    (%eax),%ecx
  259892:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  259896:	8b 40 04             	mov    0x4(%eax),%eax
  259899:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  25989d:	90                   	nop
  25989e:	90                   	nop
  25989f:	90                   	nop
  2598a0:	8b 3e                	mov    (%esi),%edi
  2598a2:	8b 44 24 14          	mov    0x14(%esp),%eax
  2598a6:	89 84 24 88 00 00 00 	mov    %eax,0x88(%esp)
  2598ad:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  2598b1:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
  2598b8:	8b 07                	mov    (%edi),%eax
  2598ba:	8b 80 b8 01 00 00    	mov    0x1b8(%eax),%eax
  2598c0:	89 7c 24 04          	mov    %edi,0x4(%esp)
  2598c4:	8d 8c 24 98 00 00 00 	lea    0x98(%esp),%ecx
  2598cb:	89 0c 24             	mov    %ecx,(%esp)
  2598ce:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2598d2:	ff d0                	call   *%eax
  2598d4:	83 ec 04             	sub    $0x4,%esp
  2598d7:	8b 07                	mov    (%edi),%eax
  2598d9:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
  2598df:	89 3c 24             	mov    %edi,(%esp)
  2598e2:	ff d0                	call   *%eax
  2598e4:	8d 8c 24 90 00 00 00 	lea    0x90(%esp),%ecx
  2598eb:	89 ca                	mov    %ecx,%edx
  2598ed:	8d 8c 24 88 00 00 00 	lea    0x88(%esp),%ecx
  2598f4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  2598f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  2598fc:	89 14 24             	mov    %edx,(%esp)
  2598ff:	e8 1c 4f fa ff       	call   1fe820 <cocos2d::Node::convertToNodeSpace(cocos2d::Vec2 const&) const@plt>
  259904:	83 ec 04             	sub    $0x4,%esp
  259907:	8d 84 24 90 00 00 00 	lea    0x90(%esp),%eax
  25990e:	89 44 24 04          	mov    %eax,0x4(%esp)
  259912:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  259919:	89 04 24             	mov    %eax,(%esp)
  25991c:	e8 0f 4f fa ff       	call   1fe830 <cocos2d::Rect::containsPoint(cocos2d::Vec2 const&) const@plt>
  259921:	84 c0                	test   %al,%al
  259923:	0f 85 c7 00 00 00    	jne    2599f0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe80>
  259929:	83 c6 04             	add    $0x4,%esi
  25992c:	39 74 24 28          	cmp    %esi,0x28(%esp)
  259930:	0f 85 6a ff ff ff    	jne    2598a0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xd30>
  259936:	8b 7d 08             	mov    0x8(%ebp),%edi
  259939:	8b b7 cc 02 00 00    	mov    0x2cc(%edi),%esi
  25993f:	8b 87 d0 02 00 00    	mov    0x2d0(%edi),%eax
  259945:	89 44 24 28          	mov    %eax,0x28(%esp)
  259949:	39 c6                	cmp    %eax,%esi
  25994b:	74 4f                	je     25999c <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe2c>
  25994d:	8b 45 0c             	mov    0xc(%ebp),%eax
  259950:	8b 08                	mov    (%eax),%ecx
  259952:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  259956:	8b 40 04             	mov    0x4(%eax),%eax
  259959:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  25995d:	90                   	nop
  25995e:	90                   	nop
  25995f:	90                   	nop
  259960:	8b 3e                	mov    (%esi),%edi
  259962:	8b 44 24 14          	mov    0x14(%esp),%eax
  259966:	89 84 24 98 00 00 00 	mov    %eax,0x98(%esp)
  25996d:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  259971:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%esp)
  259978:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  25997f:	89 44 24 04          	mov    %eax,0x4(%esp)
  259983:	89 3c 24             	mov    %edi,(%esp)
  259986:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  25998a:	e8 91 6f fa ff       	call   200920 <ToolsView::isTouched(cocos2d::Vec2)@plt>
  25998f:	84 c0                	test   %al,%al
  259991:	75 2a                	jne    2599bd <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe4d>
  259993:	83 c6 04             	add    $0x4,%esi
  259996:	39 74 24 28          	cmp    %esi,0x28(%esp)
  25999a:	75 c4                	jne    259960 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xdf0>
  25999c:	8b 7c 24 10          	mov    0x10(%esp),%edi
  2599a0:	f6 44 24 18 01       	testb  $0x1,0x18(%esp)
  2599a5:	74 0e                	je     2599b5 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe45>
  2599a7:	8b 44 24 20          	mov    0x20(%esp),%eax
  2599ab:	89 04 24             	mov    %eax,(%esp)
  2599ae:	89 fb                	mov    %edi,%ebx
  2599b0:	e8 db 45 fa ff       	call   1fdf90 <operator delete(void*)@plt>
  2599b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2599b8:	5e                   	pop    %esi
  2599b9:	5f                   	pop    %edi
  2599ba:	5b                   	pop    %ebx
  2599bb:	5d                   	pop    %ebp
  2599bc:	c3                   	ret
  2599bd:	8b 07                	mov    (%edi),%eax
  2599bf:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
  2599c5:	89 3c 24             	mov    %edi,(%esp)
  2599c8:	8b 7c 24 10          	mov    0x10(%esp),%edi
  2599cc:	89 fb                	mov    %edi,%ebx
  2599ce:	ff d0                	call   *%eax
  2599d0:	83 f8 ff             	cmp    $0xffffffff,%eax
  2599d3:	74 cb                	je     2599a0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe30>
  2599d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  2599d9:	8b 45 08             	mov    0x8(%ebp),%eax
  2599dc:	89 04 24             	mov    %eax,(%esp)
  2599df:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  2599e6:	00 
  2599e7:	89 fb                	mov    %edi,%ebx
  2599e9:	e8 72 6f fa ff       	call   200960 <ToolsLayer::selectTool(int, bool)@plt>
  2599ee:	eb b0                	jmp    2599a0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xe30>
  2599f0:	8b 07                	mov    (%edi),%eax
  2599f2:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
  2599f8:	89 3c 24             	mov    %edi,(%esp)
  2599fb:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2599ff:	ff d0                	call   *%eax
  259a01:	83 f8 ff             	cmp    $0xffffffff,%eax
  259a04:	8b 7d 08             	mov    0x8(%ebp),%edi
  259a07:	0f 84 2c ff ff ff    	je     259939 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xdc9>
  259a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  259a11:	89 3c 24             	mov    %edi,(%esp)
  259a14:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  259a18:	e8 53 6f fa ff       	call   200970 <ToolsLayer::selectColor(int)@plt>
  259a1d:	e9 17 ff ff ff       	jmp    259939 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xdc9>
  259a22:	e9 99 00 00 00       	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259a27:	e9 83 00 00 00       	jmp    259aaf <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf3f>
  259a2c:	89 c6                	mov    %eax,%esi
  259a2e:	f6 44 24 70 01       	testb  $0x1,0x70(%esp)
  259a33:	0f 84 89 00 00 00    	je     259ac2 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf52>
  259a39:	8b 44 24 78          	mov    0x78(%esp),%eax
  259a3d:	eb 3e                	jmp    259a7d <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf0d>
  259a3f:	89 c6                	mov    %eax,%esi
  259a41:	f6 44 24 50 01       	testb  $0x1,0x50(%esp)
  259a46:	74 7a                	je     259ac2 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf52>
  259a48:	8b 44 24 58          	mov    0x58(%esp),%eax
  259a4c:	eb 2f                	jmp    259a7d <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf0d>
  259a4e:	89 c6                	mov    %eax,%esi
  259a50:	f6 44 24 60 01       	testb  $0x1,0x60(%esp)
  259a55:	74 6b                	je     259ac2 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf52>
  259a57:	8b 44 24 68          	mov    0x68(%esp),%eax
  259a5b:	eb 20                	jmp    259a7d <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf0d>
  259a5d:	eb 61                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259a5f:	eb 5f                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259a61:	89 c6                	mov    %eax,%esi
  259a63:	f6 44 24 30 01       	testb  $0x1,0x30(%esp)
  259a68:	74 58                	je     259ac2 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf52>
  259a6a:	8b 44 24 38          	mov    0x38(%esp),%eax
  259a6e:	eb 0d                	jmp    259a7d <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf0d>
  259a70:	89 c6                	mov    %eax,%esi
  259a72:	f6 44 24 40 01       	testb  $0x1,0x40(%esp)
  259a77:	74 49                	je     259ac2 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf52>
  259a79:	8b 44 24 48          	mov    0x48(%esp),%eax
  259a7d:	89 04 24             	mov    %eax,(%esp)
  259a80:	8b 7c 24 10          	mov    0x10(%esp),%edi
  259a84:	89 fb                	mov    %edi,%ebx
  259a86:	e8 05 45 fa ff       	call   1fdf90 <operator delete(void*)@plt>
  259a8b:	f6 44 24 18 01       	testb  $0x1,0x18(%esp)
  259a90:	75 3b                	jne    259acd <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf5d>
  259a92:	eb 47                	jmp    259adb <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf6b>
  259a94:	eb 2a                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259a96:	eb 08                	jmp    259aa0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf30>
  259a98:	eb 26                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259a9a:	89 c6                	mov    %eax,%esi
  259a9c:	eb 3d                	jmp    259adb <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf6b>
  259a9e:	eb 20                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259aa0:	89 c6                	mov    %eax,%esi
  259aa2:	89 df                	mov    %ebx,%edi
  259aa4:	f6 44 24 18 01       	testb  $0x1,0x18(%esp)
  259aa9:	75 22                	jne    259acd <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf5d>
  259aab:	eb 2e                	jmp    259adb <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf6b>
  259aad:	eb 11                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259aaf:	89 c6                	mov    %eax,%esi
  259ab1:	f6 44 24 18 01       	testb  $0x1,0x18(%esp)
  259ab6:	75 15                	jne    259acd <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf5d>
  259ab8:	eb 21                	jmp    259adb <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf6b>
  259aba:	eb 04                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259abc:	eb 02                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259abe:	eb 00                	jmp    259ac0 <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf50>
  259ac0:	89 c6                	mov    %eax,%esi
  259ac2:	8b 7c 24 10          	mov    0x10(%esp),%edi
  259ac6:	f6 44 24 18 01       	testb  $0x1,0x18(%esp)
  259acb:	74 0e                	je     259adb <ToolsLayer::touchBegan(cocos2d::Vec2)@@Base+0xf6b>
  259acd:	8b 44 24 20          	mov    0x20(%esp),%eax
  259ad1:	89 04 24             	mov    %eax,(%esp)
  259ad4:	89 fb                	mov    %edi,%ebx
  259ad6:	e8 b5 44 fa ff       	call   1fdf90 <operator delete(void*)@plt>
  259adb:	89 34 24             	mov    %esi,(%esp)
  259ade:	89 fb                	mov    %edi,%ebx
  259ae0:	e8 ce e8 59 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  259ae5:	83 ec 04             	sub    $0x4,%esp
  259ae8:	90                   	nop
  259ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
