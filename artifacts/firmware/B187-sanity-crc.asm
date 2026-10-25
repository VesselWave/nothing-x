0x2c0d6ab0 59f052fb   bl        #0x2c130158
0x2c0d6ab4 2823       movs      r3, #0x28
0x2c0d6ab6 2d21       movs      r1, #0x2d
0x2c0d6ab8 8df80130   strb.w    r3, [sp, #1]
0x2c0d6abc 9df80230   ldrb.w    r3, [sp, #2]
0x2c0d6ac0 cdf82900   str.w     r0, [sp, #0x29]
0x2c0d6ac4 23f00303   bic       r3, r3, #3
0x2c0d6ac8 8df80230   strb.w    r3, [sp, #2]
0x2c0d6acc d7f89830   ldr.w     r3, [r7, #0x98]
0x2c0d6ad0 6846       mov       r0, sp
0x2c0d6ad2 9847       blx       r3
0x2c0d6ad4 154b       ldr       r3, [pc, #0x54] ; [0x2c0d6b2c]=0x20005600
0x2c0d6ad6 1a68       ldr       r2, [r3]
0x2c0d6ad8 459b       ldr       r3, [sp, #0x114]
0x2c0d6ada 5a40       eors      r2, r3
0x2c0d6adc 4ff00003   mov.w     r3, #0
0x2c0d6ae0 21d0       beq       #0x2c0d6b26
0x2c0d6ae2 b0f70dfa   bl        #0x2c086f00
0x2c0d6ae6 40f20d12   movw      r2, #0x10d
0x2c0d6aea 0021       movs      r1, #0
0x2c0d6aec 6846       mov       r0, sp
0x2c0d6aee 6cf0b3fa   bl        #0x2c143058
0x2c0d6af2 8d23       movs      r3, #0x8d
0x2c0d6af4 8df80030   strb.w    r3, [sp]
0x2c0d6af8 2346       mov       r3, r4
0x2c0d6afa cdf80160   str.w     r6, [sp, #1]
0x2c0d6afe 0df10502   add.w     r2, sp, #5
0x2c0d6b02 13f8011f   ldrb      r1, [r3, #1]!
0x2c0d6b06 ab42       cmp       r3, r5
0x2c0d6b08 02f8011b   strb      r1, [r2], #1
0x2c0d6b0c f9d1       bne       #0x2c0d6b02
0x2c0d6b0e 0df10101   add.w     r1, sp, #1
0x2c0d6b12 2422       movs      r2, #0x24
0x2c0d6b14 0020       movs      r0, #0
0x2c0d6b16 59f01ffb   bl        #0x2c130158
0x2c0d6b1a 2921       movs      r1, #0x29
0x2c0d6b1c d7f89830   ldr.w     r3, [r7, #0x98]
0x2c0d6b20 cdf82500   str.w     r0, [sp, #0x25]
0x2c0d6b24 d4e7       b         #0x2c0d6ad0
0x2c0d6b26 47b0       add       sp, #0x11c
0x2c0d6b28 f0bd       pop       {r4, r5, r6, r7, pc}
0x2c0d6b2a 00bf       nop       
0x2c0d6b2c 0056       ldrsb     r0, [r0, r0]
0x2c0d6b2e 0020       movs      r0, #0
0x2c0d6b30 3c2a       cmp       r2, #0x3c
0x2c0d6b32 0420       movs      r0, #4
0x2c0d6b34 1c32       adds      r2, #0x1c
0x2c0d6b36 0420       movs      r0, #4
0x2c0d6b38 10b5       push      {r4, lr}
0x2c0d6b3a 0a4c       ldr       r4, [pc, #0x28] ; [0x2c0d6b64]=0x2004321c
0x2c0d6b3c 30b1       cbz       r0, #0x2c0d6b4c
0x2c0d6b3e fff7e7fe   bl        #0x2c0d6910
0x2c0d6b42 e368       ldr       r3, [r4, #0xc]
0x2c0d6b44 a361       str       r3, [r4, #0x18]
0x2c0d6b46 6369       ldr       r3, [r4, #0x14]
0x2c0d6b48 e361       str       r3, [r4, #0x1c]
0x2c0d6b4a 10bd       pop       {r4, pc}
0x2c0d6b4c e369       ldr       r3, [r4, #0x1c]
0x2c0d6b4e 6169       ldr       r1, [r4, #0x14]
0x2c0d6b50 a069       ldr       r0, [r4, #0x18]
0x2c0d6b52 c91a       subs      r1, r1, r3
0x2c0d6b54 fff7bafd   bl        #0x2c0d66cc
0x2c0d6b58 a369       ldr       r3, [r4, #0x18]
0x2c0d6b5a e360       str       r3, [r4, #0xc]
0x2c0d6b5c e369       ldr       r3, [r4, #0x1c]
0x2c0d6b5e 6361       str       r3, [r4, #0x14]
0x2c0d6b60 f3e7       b         #0x2c0d6b4a
0x2c0d6b62 00bf       nop       
0x2c0d6b64 1c32       adds      r2, #0x1c
0x2c0d6b66 0420       movs      r0, #4
0x2c0d6b68 30b5       push      {r4, r5, lr}
0x2c0d6b6a 1e4b       ldr       r3, [pc, #0x78] ; [0x2c0d6be4]=0x20005600
0x2c0d6b6c c7b0       sub       sp, #0x11c
0x2c0d6b6e 0546       mov       r5, r0
0x2c0d6b70 1b68       ldr       r3, [r3]
0x2c0d6b72 4593       str       r3, [sp, #0x114]
0x2c0d6b74 4ff00003   mov.w     r3, #0
0x2c0d6b78 0c46       mov       r4, r1
0x2c0d6b7a 19b9       cbnz      r1, #0x2c0d6b84
0x2c0d6b7c 1a49       ldr       r1, [pc, #0x68] ; [0x2c0d6be8]=0x2c19a92a 'ibrt_tws_ota_breakPoint_resume'
0x2c0d6b7e 1b48       ldr       r0, [pc, #0x6c] ; [0x2c0d6bec]=0x2c19a58e 'NULL pointer received in %s'
0x2c0d6b80 6cf08af8   bl        #0x2c142c98
0x2c0d6b84 40f20d12   movw      r2, #0x10d
0x2c0d6b88 0021       movs      r1, #0
0x2c0d6b8a 01a8       add       r0, sp, #4
0x2c0d6b8c 6cf064fa   bl        #0x2c143058
0x2c0d6b90 8d23       movs      r3, #0x8d
0x2c0d6b92 2146       mov       r1, r4
0x2c0d6b94 8df80430   strb.w    r3, [sp, #4]
0x2c0d6b98 cdf80550   str.w     r5, [sp, #5]
0x2c0d6b9c 0df10903   add.w     r3, sp, #9
0x2c0d6ba0 04f12002   add.w     r2, r4, #0x20
0x2c0d6ba4 51f8040b   ldr       r0, [r1], #4
0x2c0d6ba8 9142       cmp       r1, r2
0x2c0d6baa 43f8040b   str       r0, [r3], #4
0x2c0d6bae f9d1       bne       #0x2c0d6ba4
0x2c0d6bb0 2422       movs      r2, #0x24
0x2c0d6bb2 0df10501   add.w     r1, sp, #5
0x2c0d6bb6 0020       movs      r0, #0
0x2c0d6bb8 59f0cefa   bl        #0x2c130158
0x2c0d6bbc 2922       movs      r2, #0x29
0x2c0d6bbe cdf82900   str.w     r0, [sp, #0x29]
0x2c0d6bc2 01a9       add       r1, sp, #4
0x2c0d6bc4 48f26a00   movw      r0, #0x806a
0x2c0d6bc8 e1f71af9   bl        #0x2c0b7e00
0x2c0d6bcc 054b       ldr       r3, [pc, #0x14] ; [0x2c0d6be4]=0x20005600
0x2c0d6bce 1a68       ldr       r2, [r3]
0x2c0d6bd0 459b       ldr       r3, [sp, #0x114]
0x2c0d6bd2 5a40       eors      r2, r3
0x2c0d6bd4 4ff00003   mov.w     r3, #0
0x2c0d6bd8 01d0       beq       #0x2c0d6bde
0x2c0d6bda b0f791f9   bl        #0x2c086f00
0x2c0d6bde 47b0       add       sp, #0x11c
0x2c0d6be0 30bd       pop       {r4, r5, pc}
0x2c0d6be2 00bf       nop       
0x2c0d6be4 0056       ldrsb     r0, [r0, r0]
0x2c0d6be6 0020       movs      r0, #0
0x2c0d6be8 2aa9       add       r1, sp, #0xa8
0x2c0d6bea 192c       cmp       r4, #0x19
0x2c0d6bec 8ea5       adr       r5, #0x238
0x2c0d6bee 192c       cmp       r4, #0x19
0x2c0d6bf0 0d4a       ldr       r2, [pc, #0x34] ; [0x2c0d6c28]=0x20042a3c
0x2c0d6bf2 1278       ldrb      r2, [r2]
0x2c0d6bf4 032a       cmp       r2, #3
0x2c0d6bf6 12d1       bne       #0x2c0d6c1e
0x2c0d6bf8 8d21       movs      r1, #0x8d
0x2c0d6bfa 0c4a       ldr       r2, [pc, #0x30] ; [0x2c0d6c2c]=0x2003f264
0x2c0d6bfc 0c4b       ldr       r3, [pc, #0x30] ; [0x2c0d6c30]=0x2001e708
0x2c0d6bfe 1160       str       r1, [r2]
0x2c0d6c00 0c4a       ldr       r2, [pc, #0x30] ; [0x2c0d6c34]=0x2003f268
0x2c0d6c02 1060       str       r0, [r2]
0x2c0d6c04 1a78       ldrb      r2, [r3]
0x2c0d6c06 8a42       cmp       r2, r1
0x2c0d6c08 04d1       bne       #0x2c0d6c14
0x2c0d6c0a 9a88       ldrh      r2, [r3, #4]
0x2c0d6c0c 5888       ldrh      r0, [r3, #2]
0x2c0d6c0e 991d       adds      r1, r3, #6
0x2c0d6c10 faf704bc   b.w       #0x2c0d141c
0x2c0d6c14 40f6d130   movw      r0, #0xbd1
0x2c0d6c18 0749       ldr       r1, [pc, #0x1c] ; [0x2c0d6c38]=0x2c19a949 'slave wait for ota info from master'
0x2c0d6c1a 6cf03db9   b.w       #0x2c142e98
0x2c0d6c1e 022a       cmp       r2, #2
0x2c0d6c20 01d1       bne       #0x2c0d6c26
0x2c0d6c22 fff7a1bf   b.w       #0x2c0d6b68
0x2c0d6c26 7047       bx        lr
0x2c0d6c28 3c2a       cmp       r2, #0x3c
0x2c0d6c2a 0420       movs      r0, #4
0x2c0d6c2c 64f2       .byte     0x64, 0xf2
0x2c0d6c2e 0320       movs      r0, #3
0x2c0d6c30 08e7       b         #0x2c0d6a44
0x2c0d6c32 0120       movs      r0, #1
0x2c0d6c34 68f2       .byte     0x68, 0xf2
0x2c0d6c36 0320       movs      r0, #3
0x2c0d6c38 49a9       add       r1, sp, #0x124
0x2c0d6c3a 192c       cmp       r4, #0x19
0x2c0d6c3c 73b5       push      {r0, r1, r4, r5, r6, lr}
0x2c0d6c3e 1c46       mov       r4, r3
0x2c0d6c40 3e4b       ldr       r3, [pc, #0xf8] ; [0x2c0d6d3c]=0x20042a3c
0x2c0d6c42 0546       mov       r5, r0
0x2c0d6c44 1b78       ldrb      r3, [r3]
0x2c0d6c46 0e46       mov       r6, r1
0x2c0d6c48 022b       cmp       r3, #2
0x2c0d6c4a 0dd1       bne       #0x2c0d6c68
0x2c0d6c4c 3c49       ldr       r1, [pc, #0xf0] ; [0x2c0d6d40]=0x2c19a96d 'master send ota info to slave'
0x2c0d6c4e 40f6d130   movw      r0, #0xbd1
0x2c0d6c52 0192       str       r2, [sp, #4]
0x2c0d6c54 6cf020f9   bl        #0x2c142e98
0x2c0d6c58 3146       mov       r1, r6
0x2c0d6c5a 2046       mov       r0, r4
0x2c0d6c5c 019a       ldr       r2, [sp, #4]
0x2c0d6c5e 02b0       add       sp, #8
0x2c0d6c60 bde87040   pop.w     {r4, r5, r6, lr}
0x2c0d6c64 e1f7ccb8   b.w       #0x2c0b7e00
0x2c0d6c68 032b       cmp       r3, #3
0x2c0d6c6a 34d1       bne       #0x2c0d6cd6
0x2c0d6c6c 40f6d130   movw      r0, #0xbd1
0x2c0d6c70 3449       ldr       r1, [pc, #0xd0] ; [0x2c0d6d44]=0x2c19a949 'slave wait for ota info from master'
0x2c0d6c72 6cf011f9   bl        #0x2c142e98
0x2c0d6c76 344c       ldr       r4, [pc, #0xd0] ; [0x2c0d6d48]=0x2001e708
0x2c0d6c78 344b       ldr       r3, [pc, #0xd0] ; [0x2c0d6d4c]=0x2003f264
0x2c0d6c7a 1d60       str       r5, [r3]
0x2c0d6c7c 2378       ldrb      r3, [r4]
0x2c0d6c7e ff2b       cmp       r3, #0xff
0x2c0d6c80 01d0       beq       #0x2c0d6c86
0x2c0d6c82 9d42       cmp       r5, r3
0x2c0d6c84 07d0       beq       #0x2c0d6c96
0x2c0d6c86 40f6d130   movw      r0, #0xbd1
0x2c0d6c8a 3149       ldr       r1, [pc, #0xc4] ; [0x2c0d6d50]=0x2c19a98b 'slave wait for ota info from master!'
0x2c0d6c8c 02b0       add       sp, #8
0x2c0d6c8e bde87040   pop.w     {r4, r5, r6, lr}
0x2c0d6c92 6cf001b9   b.w       #0x2c142e98
0x2c0d6c96 2b46       mov       r3, r5
0x2c0d6c98 44f24300   movw      r0, #0x4043
0x2c0d6c9c 2d4a       ldr       r2, [pc, #0xb4] ; [0x2c0d6d54]=0x2c19a9b0 'ota_tws_send_handle'
0x2c0d6c9e 2e49       ldr       r1, [pc, #0xb8] ; [0x2c0d6d58]=0x2c19874e 'ota_control_W [%s] typeCode:%x'
0x2c0d6ca0 813d       subs      r5, #0x81
0x2c0d6ca2 6cf0f9f8   bl        #0x2c142e98
0x2c0d6ca6 192d       cmp       r5, #0x19
0x2c0d6ca8 13d8       bhi       #0x2c0d6cd2
0x2c0d6caa dfe805f0   tbb       [pc, r5] ; [0x2c0d6cac]=0x1216f005
0x2c0d6cae 1612       asrs      r6, r2, #8
0x2c0d6cb0 0d22       movs      r2, #0xd
0x2c0d6cb2 1212       asrs      r2, r2, #8
0x2c0d6cb4 1c12       asrs      r4, r3, #8
0x2c0d6cb6 1212       asrs      r2, r2, #8
0x2c0d6cb8 1212       asrs      r2, r2, #8
0x2c0d6cba 1212       asrs      r2, r2, #8
0x2c0d6cbc 2812       asrs      r0, r5, #8
0x2c0d6cbe 2e12       asrs      r6, r5, #8
0x2c0d6cc0 3412       asrs      r4, r6, #8
0x2c0d6cc2 1212       asrs      r2, r2, #8
0x2c0d6cc4 1240       ands      r2, r2
0x2c0d6cc6 123a       subs      r2, #0x12
0x2c0d6cc8 a288       ldrh      r2, [r4, #4]
0x2c0d6cca 2449       ldr       r1, [pc, #0x90] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6ccc 6088       ldrh      r0, [r4, #2]
0x2c0d6cce faf79bfd   bl        #0x2c0d1808
0x2c0d6cd2 ff23       movs      r3, #0xff
0x2c0d6cd4 2370       strb      r3, [r4]
0x2c0d6cd6 02b0       add       sp, #8
0x2c0d6cd8 70bd       pop       {r4, r5, r6, pc}
0x2c0d6cda a288       ldrh      r2, [r4, #4]
0x2c0d6cdc 1f49       ldr       r1, [pc, #0x7c] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6cde 6088       ldrh      r0, [r4, #2]
0x2c0d6ce0 faf774fc   bl        #0x2c0d15cc
0x2c0d6ce4 f5e7       b         #0x2c0d6cd2
0x2c0d6ce6 a288       ldrh      r2, [r4, #4]
0x2c0d6ce8 1c49       ldr       r1, [pc, #0x70] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6cea 6088       ldrh      r0, [r4, #2]
0x2c0d6cec faf7d8fc   bl        #0x2c0d16a0
0x2c0d6cf0 efe7       b         #0x2c0d6cd2
0x2c0d6cf2 a288       ldrh      r2, [r4, #4]
0x2c0d6cf4 1949       ldr       r1, [pc, #0x64] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6cf6 6088       ldrh      r0, [r4, #2]
0x2c0d6cf8 faf74cfe   bl        #0x2c0d1994
0x2c0d6cfc e9e7       b         #0x2c0d6cd2
0x2c0d6cfe a288       ldrh      r2, [r4, #4]
0x2c0d6d00 1649       ldr       r1, [pc, #0x58] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6d02 6088       ldrh      r0, [r4, #2]
0x2c0d6d04 faf7befa   bl        #0x2c0d1284
0x2c0d6d08 e3e7       b         #0x2c0d6cd2
0x2c0d6d0a a288       ldrh      r2, [r4, #4]
0x2c0d6d0c 1349       ldr       r1, [pc, #0x4c] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6d0e 6088       ldrh      r0, [r4, #2]
0x2c0d6d10 faf71cfb   bl        #0x2c0d134c
0x2c0d6d14 dde7       b         #0x2c0d6cd2
0x2c0d6d16 a288       ldrh      r2, [r4, #4]
0x2c0d6d18 1049       ldr       r1, [pc, #0x40] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6d1a 6088       ldrh      r0, [r4, #2]
0x2c0d6d1c faf7eefe   bl        #0x2c0d1afc
0x2c0d6d20 d7e7       b         #0x2c0d6cd2
0x2c0d6d22 a288       ldrh      r2, [r4, #4]
0x2c0d6d24 0d49       ldr       r1, [pc, #0x34] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6d26 6088       ldrh      r0, [r4, #2]
0x2c0d6d28 fbf724f8   bl        #0x2c0d1d74
0x2c0d6d2c d1e7       b         #0x2c0d6cd2
0x2c0d6d2e a288       ldrh      r2, [r4, #4]
0x2c0d6d30 0a49       ldr       r1, [pc, #0x28] ; [0x2c0d6d5c]=0x2001e70e
0x2c0d6d32 6088       ldrh      r0, [r4, #2]
0x2c0d6d34 faf77eff   bl        #0x2c0d1c34
0x2c0d6d38 cbe7       b         #0x2c0d6cd2
0x2c0d6d3a 00bf       nop       
0x2c0d6d3c 3c2a       cmp       r2, #0x3c
0x2c0d6d3e 0420       movs      r0, #4
0x2c0d6d40 6da9       add       r1, sp, #0x1b4
0x2c0d6d42 192c       cmp       r4, #0x19
0x2c0d6d44 49a9       add       r1, sp, #0x124
0x2c0d6d46 192c       cmp       r4, #0x19
0x2c0d6d48 08e7       b         #0x2c0d6b5c
0x2c0d6d4a 0120       movs      r0, #1
0x2c0d6d4c 64f2       .byte     0x64, 0xf2
0x2c0d6d4e 0320       movs      r0, #3
0x2c0d6d50 8ba9       add       r1, sp, #0x22c
0x2c0d6d52 192c       cmp       r4, #0x19
0x2c0d6d54 b0a9       add       r1, sp, #0x2c0
0x2c0d6d56 192c       cmp       r4, #0x19
0x2c0d6d58 4e87       strh      r6, [r1, #0x3a]
0x2c0d6d5a 192c       cmp       r4, #0x19
0x2c0d6d5c 0ee7       b         #0x2c0d6b7c
0x2c0d6d5e 0120       movs      r0, #1
0x2c0d6d60 024a       ldr       r2, [pc, #8] ; [0x2c0d6d6c]=0x20042f7b
0x2c0d6d62 1378       ldrb      r3, [r2]
0x2c0d6d64 0bb1       cbz       r3, #0x2c0d6d6a
0x2c0d6d66 013b       subs      r3, #1
0x2c0d6d68 1370       strb      r3, [r2]
0x2c0d6d6a 7047       bx        lr
0x2c0d6d6c 7b2f       cmp       r7, #0x7b
0x2c0d6d6e 0420       movs      r0, #4
0x2c0d6d70 7fb5       push      {r0, r1, r2, r3, r4, r5, r6, lr}
0x2c0d6d72 114b       ldr       r3, [pc, #0x44] ; [0x2c0d6db8]=0x20005600
0x2c0d6d74 1b68       ldr       r3, [r3]
0x2c0d6d76 0593       str       r3, [sp, #0x14]
0x2c0d6d78 4ff00003   mov.w     r3, #0
0x2c0d6d7c fef780f9   bl        #0x2c0d5080
0x2c0d6d80 68b1       cbz       r0, #0x2c0d6d9e
0x2c0d6d82 1423       movs      r3, #0x14
0x2c0d6d84 6a46       mov       r2, sp
0x2c0d6d86 0021       movs      r1, #0
0x2c0d6d88 0220       movs      r0, #2
0x2c0d6d8a 6cf0edf9   bl        #0x2c143168
0x2c0d6d8e 40f6d330   movw      r0, #0xbd3
0x2c0d6d92 049b       ldr       r3, [sp, #0x10]
0x2c0d6d94 094a       ldr       r2, [pc, #0x24] ; [0x2c0d6dbc]=0x2c19a9c4 'app_get_boot_word'
0x2c0d6d96 0a49       ldr       r1, [pc, #0x28] ; [0x2c0d6dc0]=0x2c19a9d6 '%s boot word 0x%x'
0x2c0d6d98 6cf07ef8   bl        #0x2c142e98
0x2c0d6d9c 0498       ldr       r0, [sp, #0x10]
0x2c0d6d9e 064b       ldr       r3, [pc, #0x18] ; [0x2c0d6db8]=0x20005600
0x2c0d6da0 1a68       ldr       r2, [r3]
0x2c0d6da2 059b       ldr       r3, [sp, #0x14]
0x2c0d6da4 5a40       eors      r2, r3
0x2c0d6da6 4ff00003   mov.w     r3, #0
0x2c0d6daa 01d0       beq       #0x2c0d6db0
0x2c0d6dac b0f7a8f8   bl        #0x2c086f00
0x2c0d6db0 07b0       add       sp, #0x1c
0x2c0d6db2 5df804fb   ldr       pc, [sp], #4
0x2c0d6db6 00bf       nop       
0x2c0d6db8 0056       ldrsb     r0, [r0, r0]
0x2c0d6dba 0020       movs      r0, #0
0x2c0d6dbc c4a9       add       r1, sp, #0x310
0x2c0d6dbe 192c       cmp       r4, #0x19
0x2c0d6dc0 d6a9       add       r1, sp, #0x358
0x2c0d6dc2 192c       cmp       r4, #0x19
0x2c0d6dc4 84b0       sub       sp, #0x10
0x2c0d6dc6 2de9f041   push.w    {r4, r5, r6, r7, r8, lr}
0x2c0d6dca 06ac       add       r4, sp, #0x18
0x2c0d6dcc 84e80f00   stm.w     r4, {r0, r1, r2, r3}
0x2c0d6dd0 2e4b       ldr       r3, [pc, #0xb8] ; [0x2c0d6e8c]=0x2004321c
0x2c0d6dd2 0022       movs      r2, #0
0x2c0d6dd4 9c46       mov       ip, r3
0x2c0d6dd6 93f8b250   ldrb.w    r5, [r3, #0xb2]
0x2c0d6dda 9df81810   ldrb.w    r1, [sp, #0x18]
0x2c0d6dde d0b2       uxtb      r0, r2
0x2c0d6de0 8542       cmp       r5, r0
0x2c0d6de2 18d9       bls       #0x2c0d6e16
0x2c0d6de4 93f8b400   ldrb.w    r0, [r3, #0xb4]
0x2c0d6de8 1446       mov       r4, r2
0x2c0d6dea 8842       cmp       r0, r1
0x2c0d6dec 02f10102   add.w     r2, r2, #1
0x2c0d6df0 03f11803   add.w     r3, r3, #0x18
0x2c0d6df4 f3d1       bne       #0x2c0d6dde
0x2c0d6df6 1823       movs      r3, #0x18
0x2c0d6df8 03fb04c4   mla       r4, r3, r4, ip
0x2c0d6dfc 0deb0305   add.w     r5, sp, r3
0x2c0d6e00 b434       adds      r4, #0xb4
0x2c0d6e02 0fcd       ldm       r5!, {r0, r1, r2, r3}
0x2c0d6e04 0fc4       stm       r4!, {r0, r1, r2, r3}
0x2c0d6e06 95e80300   ldm.w     r5, {r0, r1}
0x2c0d6e0a 84e80300   stm.w     r4, {r0, r1}
0x2c0d6e0e bde8f041   pop.w     {r4, r5, r6, r7, r8, lr}
0x2c0d6e12 04b0       add       sp, #0x10
0x2c0d6e14 7047       bx        lr
0x2c0d6e16 052d       cmp       r5, #5
0x2c0d6e18 02d9       bls       #0x2c0d6e20
0x2c0d6e1a 1d48       ldr       r0, [pc, #0x74] ; [0x2c0d6e90]=0x2c19a9e8 'OTA user number exceeds'
0x2c0d6e1c 6bf03cff   bl        #0x2c142c98
