0x2c15f68c f0b5       push      {r4, r5, r6, r7, lr}
0x2c15f68e 0446       mov       r4, r0
0x2c15f690 0d46       mov       r5, r1
0x2c15f692 3e4b       ldr       r3, [pc, #0xf8] ; [0x2c15f78c]=0x2c1fd030
0x2c15f694 87b0       sub       sp, #0x1c
0x2c15f696 1b68       ldr       r3, [r3]
0x2c15f698 0593       str       r3, [sp, #0x14]
0x2c15f69a 4ff00003   mov.w     r3, #0
0x2c15f69e 3c4a       ldr       r2, [pc, #0xf0] ; [0x2c15f790]=0x2c1fcfa9 'media_PlayAudio'
0x2c15f6a0 0346       mov       r3, r0
0x2c15f6a2 0091       str       r1, [sp]
0x2c15f6a4 4420       movs      r0, #0x44
0x2c15f6a6 3b49       ldr       r1, [pc, #0xec] ; [0x2c15f794]=0x2c1fcfb9 '%s id:%x device_id:%d'
0x2c15f6a8 40f0e6fc   bl        #0x2c1a0078
0x2c15f6ac 2946       mov       r1, r5
0x2c15f6ae 2046       mov       r0, r4
0x2c15f6b0 394a       ldr       r2, [pc, #0xe4] ; [0x2c15f798]=0xc15f68d
0x2c15f6b2 fff731f9   bl        #0x2c15e918
0x2c15f6b6 40b1       cbz       r0, #0x2c15f6ca
0x2c15f6b8 13f044f9   bl        #0x2c172944
0x2c15f6bc 60b1       cbz       r0, #0x2c15f6d8
0x2c15f6be 2346       mov       r3, r4
0x2c15f6c0 4320       movs      r0, #0x43
0x2c15f6c2 334a       ldr       r2, [pc, #0xcc] ; [0x2c15f790]=0x2c1fcfa9 'media_PlayAudio'
0x2c15f6c4 3549       ldr       r1, [pc, #0xd4] ; [0x2c15f79c]=0x2c1fcfcf '%s id:%x The ear is restarting'
0x2c15f6c6 40f0d7fc   bl        #0x2c1a0078
0x2c15f6ca 304b       ldr       r3, [pc, #0xc0] ; [0x2c15f78c]=0x2c1fd030
0x2c15f6cc 1a68       ldr       r2, [r3]
0x2c15f6ce 059b       ldr       r3, [sp, #0x14]
0x2c15f6d0 5a40       eors      r2, r3
0x2c15f6d2 59d0       beq       #0x2c15f788
0x2c15f6d4 44f716fb   bl        #0x2c0a3d04
0x2c15f6d8 2046       mov       r0, r4
0x2c15f6da fef779ff   bl        #0x2c15e5d0
0x2c15f6de 0746       mov       r7, r0
0x2c15f6e0 4cf7befb   bl        #0x2c0abe60
0x2c15f6e4 0028       cmp       r0, #0
0x2c15f6e6 45d0       beq       #0x2c15f774
0x2c15f6e8 002f       cmp       r7, #0
0x2c15f6ea 43d1       bne       #0x2c15f774
0x2c15f6ec 55f70efe   bl        #0x2c0b530c
0x2c15f6f0 0128       cmp       r0, #1
0x2c15f6f2 0646       mov       r6, r0
0x2c15f6f4 0dd1       bne       #0x2c15f712
0x2c15f6f6 2a46       mov       r2, r5
0x2c15f6f8 3946       mov       r1, r7
0x2c15f6fa a0b2       uxth      r0, r4
0x2c15f6fc fef794fe   bl        #0x2c15e428
0x2c15f700 0028       cmp       r0, #0
0x2c15f702 37d0       beq       #0x2c15f774
0x2c15f704 3b46       mov       r3, r7
0x2c15f706 2a46       mov       r2, r5
0x2c15f708 2146       mov       r1, r4
0x2c15f70a 0a20       movs      r0, #0xa
0x2c15f70c fff726ff   bl        #0x2c15f55c
0x2c15f710 dbe7       b         #0x2c15f6ca
0x2c15f712 78bb       cbnz      r0, #0x2c15f774
0x2c15f714 224f       ldr       r7, [pc, #0x88] ; [0x2c15f7a0]=0x200d0716
0x2c15f716 4320       movs      r0, #0x43
0x2c15f718 3b78       ldrb      r3, [r7]
0x2c15f71a 1d4a       ldr       r2, [pc, #0x74] ; [0x2c15f790]=0x2c1fcfa9 'media_PlayAudio'
0x2c15f71c 2149       ldr       r1, [pc, #0x84] ; [0x2c15f7a4]=0x2c1fcfee '%s app_prompt_is_on_going:%d'
0x2c15f71e 40f0abfc   bl        #0x2c1a0078
0x2c15f722 3f78       ldrb      r7, [r7]
0x2c15f724 d7b9       cbnz      r7, #0x2c15f75c
0x2c15f726 252c       cmp       r4, #0x25
0x2c15f728 24d0       beq       #0x2c15f774
0x2c15f72a 1f4e       ldr       r6, [pc, #0x7c] ; [0x2c15f7a8]=0x200d06b0
0x2c15f72c 2a46       mov       r2, r5
0x2c15f72e 1f49       ldr       r1, [pc, #0x7c] ; [0x2c15f7ac]=0x2c1fd00b '(d%d)Let peer bud play prompt 0x%x'
0x2c15f730 a3b2       uxth      r3, r4
0x2c15f732 4320       movs      r0, #0x43
0x2c15f734 3770       strb      r7, [r6]
0x2c15f736 40f09ffc   bl        #0x2c1a0078
0x2c15f73a 0622       movs      r2, #6
0x2c15f73c 48f23d00   movw      r0, #0x803d
0x2c15f740 03a9       add       r1, sp, #0xc
0x2c15f742 adf80e40   strh.w    r4, [sp, #0xe]
0x2c15f746 8df80c50   strb.w    r5, [sp, #0xc]
0x2c15f74a adf81070   strh.w    r7, [sp, #0x10]
0x2c15f74e 55f7e9fa   bl        #0x2c0b4d24
0x2c15f752 112c       cmp       r4, #0x11
0x2c15f754 b9d1       bne       #0x2c15f6ca
0x2c15f756 0123       movs      r3, #1
0x2c15f758 3370       strb      r3, [r6]
0x2c15f75a b6e7       b         #0x2c15f6ca
0x2c15f75c 112c       cmp       r4, #0x11
0x2c15f75e 04d1       bne       #0x2c15f76a
0x2c15f760 114b       ldr       r3, [pc, #0x44] ; [0x2c15f7a8]=0x200d06b0
0x2c15f762 1a78       ldrb      r2, [r3]
0x2c15f764 0ab1       cbz       r2, #0x2c15f76a
0x2c15f766 1e70       strb      r6, [r3]
0x2c15f768 afe7       b         #0x2c15f6ca
0x2c15f76a 0023       movs      r3, #0
0x2c15f76c 2a46       mov       r2, r5
0x2c15f76e 2146       mov       r1, r4
0x2c15f770 1846       mov       r0, r3
0x2c15f772 cbe7       b         #0x2c15f70c
0x2c15f774 0123       movs      r3, #1
0x2c15f776 2a46       mov       r2, r5
0x2c15f778 2146       mov       r1, r4
0x2c15f77a 0020       movs      r0, #0
0x2c15f77c fff7eefe   bl        #0x2c15f55c
0x2c15f780 0022       movs      r2, #0
0x2c15f782 0b4b       ldr       r3, [pc, #0x2c] ; [0x2c15f7b0]=0x200d070c
0x2c15f784 1a70       strb      r2, [r3]
0x2c15f786 a0e7       b         #0x2c15f6ca
0x2c15f788 07b0       add       sp, #0x1c
0x2c15f78a f0bd       pop       {r4, r5, r6, r7, pc}
0x2c15f78c 30d0       beq       #0x2c15f7f0
0x2c15f78e 1f2c       cmp       r4, #0x1f
0x2c15f790 a9cf       ldm       r7, {r0, r3, r5, r7}
0x2c15f792 1f2c       cmp       r4, #0x1f
0x2c15f794 b9cf       ldm       r7, {r0, r3, r4, r5, r7}
0x2c15f796 1f2c       cmp       r4, #0x1f
0x2c15f798 8df6       .byte     0x8d, 0xf6
0x2c15f79a 150c       lsrs      r5, r2, #0x10
0x2c15f79c cfcf       ldm       r7, {r0, r1, r2, r3, r6, r7}
0x2c15f79e 1f2c       cmp       r4, #0x1f
0x2c15f7a0 1607       lsls      r6, r2, #0x1c
0x2c15f7a2 0d20       movs      r0, #0xd
0x2c15f7a4 eecf       ldm       r7, {r1, r2, r3, r5, r6, r7}
0x2c15f7a6 1f2c       cmp       r4, #0x1f
0x2c15f7a8 b006       lsls      r0, r6, #0x1a
0x2c15f7aa 0d20       movs      r0, #0xd
0x2c15f7ac 0bd0       beq       #0x2c15f7c6
0x2c15f7ae 1f2c       cmp       r4, #0x1f
0x2c15f7b0 0c07       lsls      r4, r1, #0x1c
0x2c15f7b2 0d20       movs      r0, #0xd
0x2c15f7b4 2de9f04f   push.w    {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c15f7b8 4ff00009   mov.w     sb, #0
0x2c15f7bc ba4b       ldr       r3, [pc, #0x2e8] ; [0x2c15faa8]=0x2c1fd190
0x2c15f7be 9bb0       sub       sp, #0x6c
0x2c15f7c0 0546       mov       r5, r0
0x2c15f7c2 1b68       ldr       r3, [r3]
0x2c15f7c4 1993       str       r3, [sp, #0x64]
0x2c15f7c6 4ff00003   mov.w     r3, #0
0x2c15f7ca 0c46       mov       r4, r1
0x2c15f7cc cdf82890   str.w     sb, [sp, #0x28]
0x2c15f7d0 88f7ecff   bl        #0x2c0e87ac
0x2c15f7d4 b54e       ldr       r6, [pc, #0x2d4] ; [0x2c15faac]=0x200d0704
0x2c15f7d6 b64a       ldr       r2, [pc, #0x2d8] ; [0x2c15fab0]=0x2c25816f 'start'
0x2c15f7d8 b64b       ldr       r3, [pc, #0x2d8] ; [0x2c15fab4]=0x2c25b03e
0x2c15f7da b749       ldr       r1, [pc, #0x2dc] ; [0x2c15fab8]=0x2c1fd03c
0x2c15f7dc 4d45       cmp       r5, sb
0x2c15f7de 18bf       it        ne
0x2c15f7e0 1346       movne     r3, r2
0x2c15f7e2 0590       str       r0, [sp, #0x14]
0x2c15f7e4 b54a       ldr       r2, [pc, #0x2d4] ; [0x2c15fabc]=0x2c1fd034 'Running'
0x2c15f7e6 3078       ldrb      r0, [r6]
0x2c15f7e8 4845       cmp       r0, sb
0x2c15f7ea 08bf       it        eq
0x2c15f7ec 0a46       moveq     r2, r1
0x2c15f7ee 4320       movs      r0, #0x43
0x2c15f7f0 b349       ldr       r1, [pc, #0x2cc] ; [0x2c15fac0]=0x2c1fd041 'Audio prompt stream state %s, to %s it'
0x2c15f7f2 40f041fc   bl        #0x2c1a0078
0x2c15f7f6 3378       ldrb      r3, [r6]
0x2c15f7f8 ab42       cmp       r3, r5
0x2c15f7fa 00f08380   beq.w     #0x2c15f904
0x2c15f7fe b14f       ldr       r7, [pc, #0x2c4] ; [0x2c15fac4]=0x200a0720
