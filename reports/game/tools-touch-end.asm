
extracted/game/lib/x86/libMyGame.so:     file format elf32-i386


Disassembly of section .text:

00259c70 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base>:
  259c70:	55                   	push   %ebp
  259c71:	89 e5                	mov    %esp,%ebp
  259c73:	53                   	push   %ebx
  259c74:	57                   	push   %edi
  259c75:	56                   	push   %esi
  259c76:	83 e4 f0             	and    $0xfffffff0,%esp
  259c79:	83 ec 40             	sub    $0x40,%esp
  259c7c:	e8 00 00 00 00       	call   259c81 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x11>
  259c81:	5b                   	pop    %ebx
  259c82:	81 c3 13 73 77 00    	add    $0x777313,%ebx
  259c88:	8b 45 08             	mov    0x8(%ebp),%eax
  259c8b:	8b b0 78 02 00 00    	mov    0x278(%eax),%esi
  259c91:	8b 80 7c 02 00 00    	mov    0x27c(%eax),%eax
  259c97:	89 44 24 0c          	mov    %eax,0xc(%esp)
  259c9b:	39 c6                	cmp    %eax,%esi
  259c9d:	0f 84 70 01 00 00    	je     259e13 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x1a3>
  259ca3:	8b 45 0c             	mov    0xc(%ebp),%eax
  259ca6:	8b 08                	mov    (%eax),%ecx
  259ca8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  259cac:	8b 40 04             	mov    0x4(%eax),%eax
  259caf:	89 44 24 10          	mov    %eax,0x10(%esp)
  259cb3:	90                   	nop
  259cb4:	90                   	nop
  259cb5:	90                   	nop
  259cb6:	90                   	nop
  259cb7:	90                   	nop
  259cb8:	90                   	nop
  259cb9:	90                   	nop
  259cba:	90                   	nop
  259cbb:	90                   	nop
  259cbc:	90                   	nop
  259cbd:	90                   	nop
  259cbe:	90                   	nop
  259cbf:	90                   	nop
  259cc0:	8b 3e                	mov    (%esi),%edi
  259cc2:	8b 44 24 14          	mov    0x14(%esp),%eax
  259cc6:	89 44 24 18          	mov    %eax,0x18(%esp)
  259cca:	8b 44 24 10          	mov    0x10(%esp),%eax
  259cce:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  259cd2:	8b 07                	mov    (%edi),%eax
  259cd4:	83 ec 08             	sub    $0x8,%esp
  259cd7:	57                   	push   %edi
  259cd8:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  259cdc:	51                   	push   %ecx
  259cdd:	ff 90 b8 01 00 00    	call   *0x1b8(%eax)
  259ce3:	83 c4 0c             	add    $0xc,%esp
  259ce6:	8b 07                	mov    (%edi),%eax
  259ce8:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
  259cee:	83 ec 0c             	sub    $0xc,%esp
  259cf1:	57                   	push   %edi
  259cf2:	ff d0                	call   *%eax
  259cf4:	83 c4 10             	add    $0x10,%esp
  259cf7:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  259cfb:	89 ca                	mov    %ecx,%edx
  259cfd:	83 ec 04             	sub    $0x4,%esp
  259d00:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  259d04:	51                   	push   %ecx
  259d05:	50                   	push   %eax
  259d06:	52                   	push   %edx
  259d07:	e8 14 4b fa ff       	call   1fe820 <cocos2d::Node::convertToNodeSpace(cocos2d::Vec2 const&) const@plt>
  259d0c:	8d 44 24 3c          	lea    0x3c(%esp),%eax
  259d10:	83 c4 0c             	add    $0xc,%esp
  259d13:	83 ec 08             	sub    $0x8,%esp
  259d16:	50                   	push   %eax
  259d17:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  259d1b:	50                   	push   %eax
  259d1c:	e8 0f 4b fa ff       	call   1fe830 <cocos2d::Rect::containsPoint(cocos2d::Vec2 const&) const@plt>
  259d21:	83 c4 10             	add    $0x10,%esp
  259d24:	84 c0                	test   %al,%al
  259d26:	75 0e                	jne    259d36 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0xc6>
  259d28:	83 c6 04             	add    $0x4,%esi
  259d2b:	39 74 24 0c          	cmp    %esi,0xc(%esp)
  259d2f:	75 8f                	jne    259cc0 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x50>
  259d31:	e9 dd 00 00 00       	jmp    259e13 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x1a3>
  259d36:	8b 07                	mov    (%edi),%eax
  259d38:	83 ec 0c             	sub    $0xc,%esp
  259d3b:	57                   	push   %edi
  259d3c:	ff 90 5c 01 00 00    	call   *0x15c(%eax)
  259d42:	83 c4 10             	add    $0x10,%esp
  259d45:	89 c7                	mov    %eax,%edi
  259d47:	83 f8 ff             	cmp    $0xffffffff,%eax
  259d4a:	0f 84 c3 00 00 00    	je     259e13 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x1a3>
  259d50:	8b 45 08             	mov    0x8(%ebp),%eax
  259d53:	89 c6                	mov    %eax,%esi
  259d55:	8b 00                	mov    (%eax),%eax
  259d57:	83 ec 08             	sub    $0x8,%esp
  259d5a:	ff b6 5c 03 00 00    	push   0x35c(%esi)
  259d60:	56                   	push   %esi
  259d61:	ff 90 14 01 00 00    	call   *0x114(%eax)
  259d67:	83 c4 10             	add    $0x10,%esp
  259d6a:	8b 08                	mov    (%eax),%ecx
  259d6c:	83 ec 08             	sub    $0x8,%esp
  259d6f:	ff b6 8c 03 00 00    	push   0x38c(%esi)
  259d75:	50                   	push   %eax
  259d76:	ff 91 14 01 00 00    	call   *0x114(%ecx)
  259d7c:	83 c4 10             	add    $0x10,%esp
  259d7f:	8b 08                	mov    (%eax),%ecx
  259d81:	83 ec 08             	sub    $0x8,%esp
  259d84:	ff b6 94 03 00 00    	push   0x394(%esi)
  259d8a:	50                   	push   %eax
  259d8b:	ff 91 14 01 00 00    	call   *0x114(%ecx)
  259d91:	83 c4 10             	add    $0x10,%esp
  259d94:	8b 08                	mov    (%eax),%ecx
  259d96:	83 ec 0c             	sub    $0xc,%esp
  259d99:	50                   	push   %eax
  259d9a:	ff 91 bc 00 00 00    	call   *0xbc(%ecx)
  259da0:	83 c4 10             	add    $0x10,%esp
  259da3:	83 ff 03             	cmp    $0x3,%edi
  259da6:	7c 04                	jl     259dac <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x13c>
  259da8:	84 c0                	test   %al,%al
  259daa:	75 67                	jne    259e13 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x1a3>
  259dac:	83 ec 08             	sub    $0x8,%esp
  259daf:	57                   	push   %edi
  259db0:	8b 75 08             	mov    0x8(%ebp),%esi
  259db3:	56                   	push   %esi
  259db4:	e8 b7 6b fa ff       	call   200970 <ToolsLayer::selectColor(int)@plt>
  259db9:	83 c4 10             	add    $0x10,%esp
  259dbc:	8b 06                	mov    (%esi),%eax
  259dbe:	83 ec 08             	sub    $0x8,%esp
  259dc1:	ff b6 5c 03 00 00    	push   0x35c(%esi)
  259dc7:	56                   	push   %esi
  259dc8:	ff 90 14 01 00 00    	call   *0x114(%eax)
  259dce:	83 c4 10             	add    $0x10,%esp
  259dd1:	8b 08                	mov    (%eax),%ecx
  259dd3:	83 ec 08             	sub    $0x8,%esp
  259dd6:	ff b6 8c 03 00 00    	push   0x38c(%esi)
  259ddc:	50                   	push   %eax
  259ddd:	ff 91 14 01 00 00    	call   *0x114(%ecx)
  259de3:	83 c4 10             	add    $0x10,%esp
  259de6:	89 c7                	mov    %eax,%edi
  259de8:	8b 00                	mov    (%eax),%eax
  259dea:	83 ec 08             	sub    $0x8,%esp
  259ded:	68 38 ff ff ff       	push   $0xffffff38
  259df2:	57                   	push   %edi
  259df3:	ff 50 0c             	call   *0xc(%eax)
  259df6:	83 c4 10             	add    $0x10,%esp
  259df9:	6a 01                	push   $0x1
  259dfb:	6a 00                	push   $0x0
  259dfd:	57                   	push   %edi
  259dfe:	56                   	push   %esi
  259dff:	e8 3c 6a fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  259e04:	83 c4 10             	add    $0x10,%esp
  259e07:	83 ec 0c             	sub    $0xc,%esp
  259e0a:	56                   	push   %esi
  259e0b:	e8 a0 6a fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  259e10:	83 c4 10             	add    $0x10,%esp
  259e13:	8b 45 08             	mov    0x8(%ebp),%eax
  259e16:	8b b0 cc 02 00 00    	mov    0x2cc(%eax),%esi
  259e1c:	8b 80 d0 02 00 00    	mov    0x2d0(%eax),%eax
  259e22:	89 44 24 14          	mov    %eax,0x14(%esp)
  259e26:	39 c6                	cmp    %eax,%esi
  259e28:	0f 84 c1 00 00 00    	je     259eef <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x27f>
  259e2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  259e31:	8b 08                	mov    (%eax),%ecx
  259e33:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  259e37:	8b 40 04             	mov    0x4(%eax),%eax
  259e3a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  259e3e:	90                   	nop
  259e3f:	90                   	nop
  259e40:	8b 3e                	mov    (%esi),%edi
  259e42:	8b 44 24 10          	mov    0x10(%esp),%eax
  259e46:	89 44 24 20          	mov    %eax,0x20(%esp)
  259e4a:	8b 44 24 0c          	mov    0xc(%esp),%eax
  259e4e:	89 44 24 24          	mov    %eax,0x24(%esp)
  259e52:	83 ec 08             	sub    $0x8,%esp
  259e55:	8d 44 24 28          	lea    0x28(%esp),%eax
  259e59:	50                   	push   %eax
  259e5a:	57                   	push   %edi
  259e5b:	e8 c0 6a fa ff       	call   200920 <ToolsView::isTouched(cocos2d::Vec2)@plt>
  259e60:	83 c4 10             	add    $0x10,%esp
  259e63:	84 c0                	test   %al,%al
  259e65:	75 0b                	jne    259e72 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x202>
  259e67:	83 c6 04             	add    $0x4,%esi
  259e6a:	39 74 24 14          	cmp    %esi,0x14(%esp)
  259e6e:	75 d0                	jne    259e40 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x1d0>
  259e70:	eb 7d                	jmp    259eef <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x27f>
  259e72:	8b 07                	mov    (%edi),%eax
  259e74:	83 ec 0c             	sub    $0xc,%esp
  259e77:	57                   	push   %edi
  259e78:	ff 90 5c 01 00 00    	call   *0x15c(%eax)
  259e7e:	83 c4 10             	add    $0x10,%esp
  259e81:	83 f8 ff             	cmp    $0xffffffff,%eax
  259e84:	74 69                	je     259eef <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x27f>
  259e86:	83 ec 04             	sub    $0x4,%esp
  259e89:	6a 01                	push   $0x1
  259e8b:	50                   	push   %eax
  259e8c:	8b 7d 08             	mov    0x8(%ebp),%edi
  259e8f:	57                   	push   %edi
  259e90:	e8 cb 6a fa ff       	call   200960 <ToolsLayer::selectTool(int, bool)@plt>
  259e95:	83 c4 10             	add    $0x10,%esp
  259e98:	8b 07                	mov    (%edi),%eax
  259e9a:	83 ec 08             	sub    $0x8,%esp
  259e9d:	ff b7 5c 03 00 00    	push   0x35c(%edi)
  259ea3:	57                   	push   %edi
  259ea4:	ff 90 14 01 00 00    	call   *0x114(%eax)
  259eaa:	83 c4 10             	add    $0x10,%esp
  259ead:	8b 08                	mov    (%eax),%ecx
  259eaf:	83 ec 08             	sub    $0x8,%esp
  259eb2:	ff b7 84 03 00 00    	push   0x384(%edi)
  259eb8:	50                   	push   %eax
  259eb9:	ff 91 14 01 00 00    	call   *0x114(%ecx)
  259ebf:	83 c4 10             	add    $0x10,%esp
  259ec2:	89 c6                	mov    %eax,%esi
  259ec4:	8b 00                	mov    (%eax),%eax
  259ec6:	83 ec 08             	sub    $0x8,%esp
  259ec9:	68 38 ff ff ff       	push   $0xffffff38
  259ece:	56                   	push   %esi
  259ecf:	ff 50 0c             	call   *0xc(%eax)
  259ed2:	83 c4 10             	add    $0x10,%esp
  259ed5:	6a 01                	push   $0x1
  259ed7:	6a 00                	push   $0x0
  259ed9:	56                   	push   %esi
  259eda:	57                   	push   %edi
  259edb:	e8 60 69 fa ff       	call   200840 <ToolsLayer::setPopupVisible(cocos2d::Node*, bool, bool)@plt>
  259ee0:	83 c4 10             	add    $0x10,%esp
  259ee3:	83 ec 0c             	sub    $0xc,%esp
  259ee6:	57                   	push   %edi
  259ee7:	e8 c4 69 fa ff       	call   2008b0 <ToolsLayer::releaseAllButtons()@plt>
  259eec:	83 c4 10             	add    $0x10,%esp
  259eef:	8b 45 08             	mov    0x8(%ebp),%eax
  259ef2:	c6 80 64 02 00 00 00 	movb   $0x0,0x264(%eax)
  259ef9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  259efc:	5e                   	pop    %esi
  259efd:	5f                   	pop    %edi
  259efe:	5b                   	pop    %ebx
  259eff:	5d                   	pop    %ebp
  259f00:	c3                   	ret
  259f01:	eb 00                	jmp    259f03 <ToolsLayer::touchEnded(cocos2d::Vec2)@@Base+0x293>
  259f03:	83 ec 0c             	sub    $0xc,%esp
  259f06:	50                   	push   %eax
  259f07:	e8 a7 e4 59 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  259f0c:	83 c4 0c             	add    $0xc,%esp
  259f0f:	90                   	nop

00259f10 <ToolsLayer::getParticleColor()@@Base>:
  259f10:	55                   	push   %ebp
  259f11:	89 e5                	mov    %esp,%ebp
  259f13:	53                   	push   %ebx
  259f14:	57                   	push   %edi
  259f15:	56                   	push   %esi
  259f16:	83 e4 f0             	and    $0xfffffff0,%esp
  259f19:	83 ec 10             	sub    $0x10,%esp
  259f1c:	e8 00 00 00 00       	call   259f21 <ToolsLayer::getParticleColor()@@Base+0x11>
  259f21:	5b                   	pop    %ebx
  259f22:	81 c3 73 70 77 00    	add    $0x777073,%ebx
  259f28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  259f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  259f2e:	8b 90 68 02 00 00    	mov    0x268(%eax),%edx
  259f34:	8b b8 70 02 00 00    	mov    0x270(%eax),%edi
  259f3a:	85 ff                	test   %edi,%edi
  259f3c:	74 42                	je     259f80 <ToolsLayer::getParticleColor()@@Base+0x70>
  259f3e:	8d b0 70 02 00 00    	lea    0x270(%eax),%esi
  259f44:	eb 0c                	jmp    259f52 <ToolsLayer::getParticleColor()@@Base+0x42>
  259f46:	90                   	nop
  259f47:	90                   	nop
  259f48:	90                   	nop
  259f49:	90                   	nop
  259f4a:	90                   	nop
  259f4b:	90                   	nop
  259f4c:	90                   	nop
  259f4d:	90                   	nop
  259f4e:	90                   	nop
  259f4f:	90                   	nop
  259f50:	89 c7                	mov    %eax,%edi
  259f52:	8b 47 10             	mov    0x10(%edi),%eax
  259f55:	39 c2                	cmp    %eax,%edx
  259f57:	7d 17                	jge    259f70 <ToolsLayer::getParticleColor()@@Base+0x60>
  259f59:	8b 07                	mov    (%edi),%eax
  259f5b:	85 c0                	test   %eax,%eax
  259f5d:	89 fe                	mov    %edi,%esi
  259f5f:	75 ef                	jne    259f50 <ToolsLayer::getParticleColor()@@Base+0x40>
  259f61:	eb 23                	jmp    259f86 <ToolsLayer::getParticleColor()@@Base+0x76>
  259f63:	90                   	nop
  259f64:	90                   	nop
  259f65:	90                   	nop
  259f66:	90                   	nop
  259f67:	90                   	nop
  259f68:	90                   	nop
  259f69:	90                   	nop
  259f6a:	90                   	nop
  259f6b:	90                   	nop
  259f6c:	90                   	nop
  259f6d:	90                   	nop
  259f6e:	90                   	nop
  259f6f:	90                   	nop
  259f70:	39 d0                	cmp    %edx,%eax
  259f72:	7d 14                	jge    259f88 <ToolsLayer::getParticleColor()@@Base+0x78>
  259f74:	8d 77 04             	lea    0x4(%edi),%esi
  259f77:	8b 47 04             	mov    0x4(%edi),%eax
  259f7a:	85 c0                	test   %eax,%eax
  259f7c:	75 d2                	jne    259f50 <ToolsLayer::getParticleColor()@@Base+0x40>
  259f7e:	eb 08                	jmp    259f88 <ToolsLayer::getParticleColor()@@Base+0x78>
  259f80:	8d b8 70 02 00 00    	lea    0x270(%eax),%edi
  259f86:	89 fe                	mov    %edi,%esi
  259f88:	8b 06                	mov    (%esi),%eax
  259f8a:	85 c0                	test   %eax,%eax
  259f8c:	75 71                	jne    259fff <ToolsLayer::getParticleColor()@@Base+0xef>
  259f8e:	83 ec 0c             	sub    $0xc,%esp
  259f91:	6a 18                	push   $0x18
  259f93:	89 54 24 14          	mov    %edx,0x14(%esp)
  259f97:	e8 d4 3f fa ff       	call   1fdf70 <operator new(unsigned int)@plt>
  259f9c:	83 c4 10             	add    $0x10,%esp
  259f9f:	89 c1                	mov    %eax,%ecx
  259fa1:	8b 44 24 04          	mov    0x4(%esp),%eax
  259fa5:	89 41 10             	mov    %eax,0x10(%ecx)
  259fa8:	c7 41 14 00 00 00 00 	movl   $0x0,0x14(%ecx)
  259faf:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
  259fb5:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
  259fbc:	89 79 08             	mov    %edi,0x8(%ecx)
  259fbf:	89 0e                	mov    %ecx,(%esi)
  259fc1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  259fc4:	8b 87 6c 02 00 00    	mov    0x26c(%edi),%eax
  259fca:	8b 00                	mov    (%eax),%eax
  259fcc:	85 c0                	test   %eax,%eax
  259fce:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  259fd2:	74 08                	je     259fdc <ToolsLayer::getParticleColor()@@Base+0xcc>
  259fd4:	89 87 6c 02 00 00    	mov    %eax,0x26c(%edi)
  259fda:	8b 0e                	mov    (%esi),%ecx
  259fdc:	83 ec 08             	sub    $0x8,%esp
  259fdf:	51                   	push   %ecx
  259fe0:	ff b7 70 02 00 00    	push   0x270(%edi)
  259fe6:	e8 35 5c fa ff       	call   1ffc20 <void std::__ndk1::__tree_balance_after_insert<std::__ndk1::__tree_node_base<void*>*>(std::__ndk1::__tree_node_base<void*>*, std::__ndk1::__tree_node_base<void*>*)@plt>
  259feb:	83 c4 10             	add    $0x10,%esp
  259fee:	ff 87 74 02 00 00    	incl   0x274(%edi)
  259ff4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  259ff7:	8b 54 24 04          	mov    0x4(%esp),%edx
  259ffb:	8b 44 24 08          	mov    0x8(%esp),%eax
  259fff:	83 ec 04             	sub    $0x4,%esp
  25a002:	ff 70 14             	push   0x14(%eax)
  25a005:	52                   	push   %edx
  25a006:	51                   	push   %ecx
  25a007:	89 ce                	mov    %ecx,%esi
  25a009:	e8 72 69 fa ff       	call   200980 <ColorManager::getParticleColor(int, int)@plt>
  25a00e:	83 c4 0c             	add    $0xc,%esp
  25a011:	89 f0                	mov    %esi,%eax
  25a013:	8d 65 f4             	lea    -0xc(%ebp),%esp
  25a016:	5e                   	pop    %esi
  25a017:	5f                   	pop    %edi
  25a018:	5b                   	pop    %ebx
  25a019:	5d                   	pop    %ebp
  25a01a:	c2 04 00             	ret    $0x4
  25a01d:	8d 76 00             	lea    0x0(%esi),%esi

0025a020 <cocosbuilder::CCBMemberVariableAssigner::onAssignCCBCustomProperty(cocos2d::Ref*, char const*, cocos2d::Value const&)@@Base>:
  25a020:	55                   	push   %ebp
  25a021:	89 e5                	mov    %esp,%ebp
  25a023:	83 e4 fc             	and    $0xfffffffc,%esp
  25a026:	31 c0                	xor    %eax,%eax
  25a028:	89 ec                	mov    %ebp,%esp
  25a02a:	5d                   	pop    %ebp
  25a02b:	c3                   	ret
  25a02c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

0025a030 <ToolsLayerLoader::~ToolsLayerLoader()@@Base>:
  25a030:	55                   	push   %ebp
  25a031:	89 e5                	mov    %esp,%ebp
  25a033:	53                   	push   %ebx
  25a034:	56                   	push   %esi
  25a035:	83 e4 f0             	and    $0xfffffff0,%esp
  25a038:	83 ec 10             	sub    $0x10,%esp
  25a03b:	e8 00 00 00 00       	call   25a040 <ToolsLayerLoader::~ToolsLayerLoader()@@Base+0x10>
  25a040:	5b                   	pop    %ebx
  25a041:	81 c3 54 6f 77 00    	add    $0x776f54,%ebx
  25a047:	8b 75 08             	mov    0x8(%ebp),%esi
  25a04a:	89 34 24             	mov    %esi,(%esp)
  25a04d:	e8 3e 69 fa ff       	call   200990 <cocosbuilder::NodeLoader::~NodeLoader()@plt>
  25a052:	89 34 24             	mov    %esi,(%esp)
  25a055:	e8 36 3f fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a05a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  25a05d:	5e                   	pop    %esi
  25a05e:	5b                   	pop    %ebx
  25a05f:	5d                   	pop    %ebp
  25a060:	c3                   	ret
  25a061:	eb 0d                	jmp    25a070 <ToolsLayerLoader::createNode(cocos2d::Node*, cocosbuilder::CCBReader*)@@Base>
  25a063:	90                   	nop
  25a064:	90                   	nop
  25a065:	90                   	nop
  25a066:	90                   	nop
  25a067:	90                   	nop
  25a068:	90                   	nop
  25a069:	90                   	nop
  25a06a:	90                   	nop
  25a06b:	90                   	nop
  25a06c:	90                   	nop
  25a06d:	90                   	nop
  25a06e:	90                   	nop
  25a06f:	90                   	nop

0025a070 <ToolsLayerLoader::createNode(cocos2d::Node*, cocosbuilder::CCBReader*)@@Base>:
  25a070:	55                   	push   %ebp
  25a071:	89 e5                	mov    %esp,%ebp
  25a073:	53                   	push   %ebx
  25a074:	57                   	push   %edi
  25a075:	56                   	push   %esi
  25a076:	83 e4 f0             	and    $0xfffffff0,%esp
  25a079:	83 ec 10             	sub    $0x10,%esp
  25a07c:	e8 00 00 00 00       	call   25a081 <ToolsLayerLoader::createNode(cocos2d::Node*, cocosbuilder::CCBReader*)@@Base+0x11>
  25a081:	5b                   	pop    %ebx
  25a082:	81 c3 13 6f 77 00    	add    $0x776f13,%ebx
  25a088:	8b bb c8 e2 ff ff    	mov    -0x1d38(%ebx),%edi
  25a08e:	89 7c 24 04          	mov    %edi,0x4(%esp)
  25a092:	c7 04 24 a0 03 00 00 	movl   $0x3a0,(%esp)
  25a099:	e8 92 3f fa ff       	call   1fe030 <operator new(unsigned int, std::nothrow_t const&)@plt>
  25a09e:	89 c6                	mov    %eax,%esi
  25a0a0:	31 c0                	xor    %eax,%eax
  25a0a2:	85 f6                	test   %esi,%esi
  25a0a4:	74 2d                	je     25a0d3 <ToolsLayerLoader::createNode(cocos2d::Node*, cocosbuilder::CCBReader*)@@Base+0x63>
  25a0a6:	89 34 24             	mov    %esi,(%esp)
  25a0a9:	e8 f2 68 fa ff       	call   2009a0 <ToolsLayer::ToolsLayer()@plt>
  25a0ae:	8b 06                	mov    (%esi),%eax
  25a0b0:	89 34 24             	mov    %esi,(%esp)
  25a0b3:	ff 90 7c 02 00 00    	call   *0x27c(%eax)
  25a0b9:	84 c0                	test   %al,%al
  25a0bb:	74 0c                	je     25a0c9 <ToolsLayerLoader::createNode(cocos2d::Node*, cocosbuilder::CCBReader*)@@Base+0x59>
  25a0bd:	89 34 24             	mov    %esi,(%esp)
  25a0c0:	e8 9b 3f fa ff       	call   1fe060 <cocos2d::Ref::autorelease()@plt>
  25a0c5:	89 f0                	mov    %esi,%eax
  25a0c7:	eb 0a                	jmp    25a0d3 <ToolsLayerLoader::createNode(cocos2d::Node*, cocosbuilder::CCBReader*)@@Base+0x63>
  25a0c9:	8b 06                	mov    (%esi),%eax
  25a0cb:	89 34 24             	mov    %esi,(%esp)
  25a0ce:	ff 50 04             	call   *0x4(%eax)
  25a0d1:	31 c0                	xor    %eax,%eax
  25a0d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  25a0d6:	5e                   	pop    %esi
  25a0d7:	5f                   	pop    %edi
  25a0d8:	5b                   	pop    %ebx
  25a0d9:	5d                   	pop    %ebp
  25a0da:	c3                   	ret
  25a0db:	89 44 24 08          	mov    %eax,0x8(%esp)
  25a0df:	89 7c 24 04          	mov    %edi,0x4(%esp)
  25a0e3:	89 34 24             	mov    %esi,(%esp)
  25a0e6:	e8 a5 3f fa ff       	call   1fe090 <operator delete(void*, std::nothrow_t const&)@plt>
  25a0eb:	8b 44 24 08          	mov    0x8(%esp),%eax
  25a0ef:	89 04 24             	mov    %eax,(%esp)
  25a0f2:	e8 bc e2 59 00       	call   7f83b3 <CProfileManager::dumpAll()@@Base+0x1d13>
  25a0f7:	83 ec 04             	sub    $0x4,%esp
  25a0fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

0025a100 <std::__ndk1::__tree<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::__map_value_compare<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, true>, std::__ndk1::allocator<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, void*>*)@@Base>:
  25a100:	55                   	push   %ebp
  25a101:	89 e5                	mov    %esp,%ebp
  25a103:	53                   	push   %ebx
  25a104:	57                   	push   %edi
  25a105:	56                   	push   %esi
  25a106:	83 e4 f0             	and    $0xfffffff0,%esp
  25a109:	83 ec 10             	sub    $0x10,%esp
  25a10c:	e8 00 00 00 00       	call   25a111 <std::__ndk1::__tree<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::__map_value_compare<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, true>, std::__ndk1::allocator<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, void*>*)@@Base+0x11>
  25a111:	5b                   	pop    %ebx
  25a112:	81 c3 83 6e 77 00    	add    $0x776e83,%ebx
  25a118:	8b 75 0c             	mov    0xc(%ebp),%esi
  25a11b:	85 f6                	test   %esi,%esi
  25a11d:	74 39                	je     25a158 <std::__ndk1::__tree<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::__map_value_compare<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, true>, std::__ndk1::allocator<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, void*>*)@@Base+0x58>
  25a11f:	8b 7d 08             	mov    0x8(%ebp),%edi
  25a122:	8b 06                	mov    (%esi),%eax
  25a124:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a128:	89 3c 24             	mov    %edi,(%esp)
  25a12b:	e8 40 67 fa ff       	call   200870 <std::__ndk1::__tree<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::__map_value_compare<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, true>, std::__ndk1::allocator<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, void*>*)@plt>
  25a130:	8b 46 04             	mov    0x4(%esi),%eax
  25a133:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a137:	89 3c 24             	mov    %edi,(%esp)
  25a13a:	e8 31 67 fa ff       	call   200870 <std::__ndk1::__tree<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::__map_value_compare<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, true>, std::__ndk1::allocator<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, void*>*)@plt>
  25a13f:	f6 46 10 01          	testb  $0x1,0x10(%esi)
  25a143:	74 0b                	je     25a150 <std::__ndk1::__tree<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::__map_value_compare<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, std::__ndk1::less<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, true>, std::__ndk1::allocator<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> >, cocos2d::Node*>, void*>*)@@Base+0x50>
  25a145:	8b 46 18             	mov    0x18(%esi),%eax
  25a148:	89 04 24             	mov    %eax,(%esp)
  25a14b:	e8 40 3e fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a150:	89 34 24             	mov    %esi,(%esp)
  25a153:	e8 38 3e fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a158:	8d 65 f4             	lea    -0xc(%ebp),%esp
  25a15b:	5e                   	pop    %esi
  25a15c:	5f                   	pop    %edi
  25a15d:	5b                   	pop    %ebx
  25a15e:	5d                   	pop    %ebp
  25a15f:	c3                   	ret

0025a160 <std::__ndk1::__tree<std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, ToolsView*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, ToolsView*>, void*>*)@@Base>:
  25a160:	55                   	push   %ebp
  25a161:	89 e5                	mov    %esp,%ebp
  25a163:	53                   	push   %ebx
  25a164:	57                   	push   %edi
  25a165:	56                   	push   %esi
  25a166:	83 e4 f0             	and    $0xfffffff0,%esp
  25a169:	83 ec 10             	sub    $0x10,%esp
  25a16c:	e8 00 00 00 00       	call   25a171 <std::__ndk1::__tree<std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, ToolsView*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, ToolsView*>, void*>*)@@Base+0x11>
  25a171:	5b                   	pop    %ebx
  25a172:	81 c3 23 6e 77 00    	add    $0x776e23,%ebx
  25a178:	8b 75 0c             	mov    0xc(%ebp),%esi
  25a17b:	85 f6                	test   %esi,%esi
  25a17d:	74 28                	je     25a1a7 <std::__ndk1::__tree<std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, ToolsView*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, ToolsView*>, void*>*)@@Base+0x47>
  25a17f:	8b 7d 08             	mov    0x8(%ebp),%edi
  25a182:	8b 06                	mov    (%esi),%eax
  25a184:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a188:	89 3c 24             	mov    %edi,(%esp)
  25a18b:	e8 f0 66 fa ff       	call   200880 <std::__ndk1::__tree<std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, ToolsView*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, ToolsView*>, void*>*)@plt>
  25a190:	8b 46 04             	mov    0x4(%esi),%eax
  25a193:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a197:	89 3c 24             	mov    %edi,(%esp)
  25a19a:	e8 e1 66 fa ff       	call   200880 <std::__ndk1::__tree<std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, ToolsView*>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, ToolsView*> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, ToolsView*>, void*>*)@plt>
  25a19f:	89 34 24             	mov    %esi,(%esp)
  25a1a2:	e8 e9 3d fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a1a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  25a1aa:	5e                   	pop    %esi
  25a1ab:	5f                   	pop    %edi
  25a1ac:	5b                   	pop    %ebx
  25a1ad:	5d                   	pop    %ebp
  25a1ae:	c3                   	ret
  25a1af:	90                   	nop

0025a1b0 <std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*)@@Base>:
  25a1b0:	55                   	push   %ebp
  25a1b1:	89 e5                	mov    %esp,%ebp
  25a1b3:	53                   	push   %ebx
  25a1b4:	57                   	push   %edi
  25a1b5:	56                   	push   %esi
  25a1b6:	83 e4 f0             	and    $0xfffffff0,%esp
  25a1b9:	83 ec 10             	sub    $0x10,%esp
  25a1bc:	e8 00 00 00 00       	call   25a1c1 <std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*)@@Base+0x11>
  25a1c1:	5b                   	pop    %ebx
  25a1c2:	81 c3 d3 6d 77 00    	add    $0x776dd3,%ebx
  25a1c8:	8b 75 0c             	mov    0xc(%ebp),%esi
  25a1cb:	85 f6                	test   %esi,%esi
  25a1cd:	74 28                	je     25a1f7 <std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*)@@Base+0x47>
  25a1cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  25a1d2:	8b 06                	mov    (%esi),%eax
  25a1d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a1d8:	89 3c 24             	mov    %edi,(%esp)
  25a1db:	e8 b0 66 fa ff       	call   200890 <std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*)@plt>
  25a1e0:	8b 46 04             	mov    0x4(%esi),%eax
  25a1e3:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a1e7:	89 3c 24             	mov    %edi,(%esp)
  25a1ea:	e8 a1 66 fa ff       	call   200890 <std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*)@plt>
  25a1ef:	89 34 24             	mov    %esi,(%esp)
  25a1f2:	e8 99 3d fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a1f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  25a1fa:	5e                   	pop    %esi
  25a1fb:	5f                   	pop    %edi
  25a1fc:	5b                   	pop    %ebx
  25a1fd:	5d                   	pop    %ebp
  25a1fe:	c3                   	ret
  25a1ff:	90                   	nop

0025a200 <std::__ndk1::__tree<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, void*>*)@@Base>:
  25a200:	55                   	push   %ebp
  25a201:	89 e5                	mov    %esp,%ebp
  25a203:	53                   	push   %ebx
  25a204:	57                   	push   %edi
  25a205:	56                   	push   %esi
  25a206:	83 e4 f0             	and    $0xfffffff0,%esp
  25a209:	83 ec 10             	sub    $0x10,%esp
  25a20c:	e8 00 00 00 00       	call   25a211 <std::__ndk1::__tree<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, void*>*)@@Base+0x11>
  25a211:	5b                   	pop    %ebx
  25a212:	81 c3 83 6d 77 00    	add    $0x776d83,%ebx
  25a218:	8b 75 0c             	mov    0xc(%ebp),%esi
  25a21b:	85 f6                	test   %esi,%esi
  25a21d:	74 39                	je     25a258 <std::__ndk1::__tree<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, void*>*)@@Base+0x58>
  25a21f:	8b 7d 08             	mov    0x8(%ebp),%edi
  25a222:	8b 06                	mov    (%esi),%eax
  25a224:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a228:	89 3c 24             	mov    %edi,(%esp)
  25a22b:	e8 e0 65 fa ff       	call   200810 <std::__ndk1::__tree<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, void*>*)@plt>
  25a230:	8b 46 04             	mov    0x4(%esi),%eax
  25a233:	89 44 24 04          	mov    %eax,0x4(%esp)
  25a237:	89 3c 24             	mov    %edi,(%esp)
  25a23a:	e8 d1 65 fa ff       	call   200810 <std::__ndk1::__tree<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, void*>*)@plt>
  25a23f:	f6 46 14 01          	testb  $0x1,0x14(%esi)
  25a243:	74 0b                	je     25a250 <std::__ndk1::__tree<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > > > >::destroy(std::__ndk1::__tree_node<std::__ndk1::__value_type<int, std::__ndk1::basic_string<char, std::__ndk1::char_traits<char>, std::__ndk1::allocator<char> > >, void*>*)@@Base+0x50>
  25a245:	8b 46 1c             	mov    0x1c(%esi),%eax
  25a248:	89 04 24             	mov    %eax,(%esp)
  25a24b:	e8 40 3d fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a250:	89 34 24             	mov    %esi,(%esp)
  25a253:	e8 38 3d fa ff       	call   1fdf90 <operator delete(void*)@plt>
  25a258:	8d 65 f4             	lea    -0xc(%ebp),%esp
  25a25b:	5e                   	pop    %esi
  25a25c:	5f                   	pop    %edi
  25a25d:	5b                   	pop    %ebx
  25a25e:	5d                   	pop    %ebp
  25a25f:	c3                   	ret

0025a260 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base>:
  25a260:	55                   	push   %ebp
  25a261:	89 e5                	mov    %esp,%ebp
  25a263:	53                   	push   %ebx
  25a264:	57                   	push   %edi
  25a265:	56                   	push   %esi
  25a266:	83 e4 fc             	and    $0xfffffffc,%esp
  25a269:	8b 4d 18             	mov    0x18(%ebp),%ecx
  25a26c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  25a26f:	8b 7d 08             	mov    0x8(%ebp),%edi
  25a272:	8d 47 04             	lea    0x4(%edi),%eax
  25a275:	8b 55 0c             	mov    0xc(%ebp),%edx
  25a278:	39 c2                	cmp    %eax,%edx
  25a27a:	74 09                	je     25a285 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x25>
  25a27c:	8b 31                	mov    (%ecx),%esi
  25a27e:	8b 4a 10             	mov    0x10(%edx),%ecx
  25a281:	39 ce                	cmp    %ecx,%esi
  25a283:	7d 26                	jge    25a2ab <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x4b>
  25a285:	39 17                	cmp    %edx,(%edi)
  25a287:	8b 0a                	mov    (%edx),%ecx
  25a289:	74 42                	je     25a2cd <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x6d>
  25a28b:	85 c9                	test   %ecx,%ecx
  25a28d:	74 42                	je     25a2d1 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x71>
  25a28f:	89 ce                	mov    %ecx,%esi
  25a291:	90                   	nop
  25a292:	90                   	nop
  25a293:	90                   	nop
  25a294:	90                   	nop
  25a295:	90                   	nop
  25a296:	90                   	nop
  25a297:	90                   	nop
  25a298:	90                   	nop
  25a299:	90                   	nop
  25a29a:	90                   	nop
  25a29b:	90                   	nop
  25a29c:	90                   	nop
  25a29d:	90                   	nop
  25a29e:	90                   	nop
  25a29f:	90                   	nop
  25a2a0:	89 f3                	mov    %esi,%ebx
  25a2a2:	8b 76 04             	mov    0x4(%esi),%esi
  25a2a5:	85 f6                	test   %esi,%esi
  25a2a7:	75 f7                	jne    25a2a0 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x40>
  25a2a9:	eb 3e                	jmp    25a2e9 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x89>
  25a2ab:	39 f1                	cmp    %esi,%ecx
  25a2ad:	0f 8d ab 00 00 00    	jge    25a35e <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0xfe>
  25a2b3:	8b 7a 04             	mov    0x4(%edx),%edi
  25a2b6:	85 ff                	test   %edi,%edi
  25a2b8:	0f 84 b3 00 00 00    	je     25a371 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x111>
  25a2be:	90                   	nop
  25a2bf:	90                   	nop
  25a2c0:	89 f9                	mov    %edi,%ecx
  25a2c2:	8b 3f                	mov    (%edi),%edi
  25a2c4:	85 ff                	test   %edi,%edi
  25a2c6:	75 f8                	jne    25a2c0 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x60>
  25a2c8:	e9 bf 00 00 00       	jmp    25a38c <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x12c>
  25a2cd:	89 d3                	mov    %edx,%ebx
  25a2cf:	eb 22                	jmp    25a2f3 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x93>
  25a2d1:	89 d3                	mov    %edx,%ebx
  25a2d3:	90                   	nop
  25a2d4:	90                   	nop
  25a2d5:	90                   	nop
  25a2d6:	90                   	nop
  25a2d7:	90                   	nop
  25a2d8:	90                   	nop
  25a2d9:	90                   	nop
  25a2da:	90                   	nop
  25a2db:	90                   	nop
  25a2dc:	90                   	nop
  25a2dd:	90                   	nop
  25a2de:	90                   	nop
  25a2df:	90                   	nop
  25a2e0:	89 de                	mov    %ebx,%esi
  25a2e2:	8b 5b 08             	mov    0x8(%ebx),%ebx
  25a2e5:	39 33                	cmp    %esi,(%ebx)
  25a2e7:	74 f7                	je     25a2e0 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0x80>
  25a2e9:	8b 75 18             	mov    0x18(%ebp),%esi
  25a2ec:	8b 36                	mov    (%esi),%esi
  25a2ee:	39 73 10             	cmp    %esi,0x10(%ebx)
  25a2f1:	7d 13                	jge    25a306 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0xa6>
  25a2f3:	8b 45 10             	mov    0x10(%ebp),%eax
  25a2f6:	85 c9                	test   %ecx,%ecx
  25a2f8:	74 5b                	je     25a355 <std::__ndk1::__tree_node_base<void*>*& std::__ndk1::__tree<std::__ndk1::__value_type<int, int>, std::__ndk1::__map_value_compare<int, std::__ndk1::__value_type<int, int>, std::__ndk1::less<int>, true>, std::__ndk1::allocator<std::__ndk1::__value_type<int, int> > >::__find_equal<int>(std::__ndk1::__tree_const_iterator<std::__ndk1::__value_type<int, int>, std::__ndk1::__tree_node<std::__ndk1::__value_type<int, int>, void*>*, int>, std::__ndk1::__tree_end_node<std::__ndk1::__tree_node_base<void*>*>*&, std::__ndk1::__tree_node_base<void*>*&, int const&)@@Base+0xf5>
  25a2fa:	89 18                	mov    %ebx,(%eax)
  25a2fc:	83 c3 04             	add    $0x4,%ebx
  25a2ff:	89                   	.byte 0x89
