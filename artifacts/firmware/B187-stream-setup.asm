0x2c13199c 2de9f041   push.w    {r4, r5, r6, r7, r8, lr}
0x2c1319a0 7e4b       ldr       r3, [pc, #0x1f8] ; [0x2c131b9c]=0x20005600
0x2c1319a2 8cb0       sub       sp, #0x30
0x2c1319a4 0390       str       r0, [sp, #0xc]
0x2c1319a6 1b68       ldr       r3, [r3]
0x2c1319a8 0b93       str       r3, [sp, #0x2c]
0x2c1319aa 4ff00003   mov.w     r3, #0
0x2c1319ae 0f46       mov       r7, r1
0x2c1319b0 1446       mov       r4, r2
0x2c1319b2 fff71bf9   bl        #0x2c130bec
0x2c1319b6 0546       mov       r5, r0
0x2c1319b8 039b       ldr       r3, [sp, #0xc]
0x2c1319ba 7949       ldr       r1, [pc, #0x1e4] ; [0x2c131ba0]=0x2c1b4465 '[%s] id = %d, stream = %d'
0x2c1319bc 794a       ldr       r2, [pc, #0x1e4] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c1319be 4420       movs      r0, #0x44
0x2c1319c0 0097       str       r7, [sp]
0x2c1319c2 11f069fa   bl        #0x2c142e98
0x2c1319c6 fff7d1fb   bl        #0x2c13116c
0x2c1319ca ab78       ldrb      r3, [r5, #2]
0x2c1319cc 9907       lsls      r1, r3, #0x1e
0x2c1319ce 11d4       bmi       #0x2c1319f4
0x2c1319d0 4320       movs      r0, #0x43
0x2c1319d2 744a       ldr       r2, [pc, #0x1d0] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c1319d4 7449       ldr       r1, [pc, #0x1d0] ; [0x2c131ba8]=0x2c1b447f '[%s] ERROR: status = %d'
0x2c1319d6 11f05ffa   bl        #0x2c142e98
0x2c1319da 0124       movs      r4, #1
0x2c1319dc fff7cefb   bl        #0x2c13117c
0x2c1319e0 6e4b       ldr       r3, [pc, #0x1b8] ; [0x2c131b9c]=0x20005600
0x2c1319e2 1a68       ldr       r2, [r3]
0x2c1319e4 0b9b       ldr       r3, [sp, #0x2c]
0x2c1319e6 5a40       eors      r2, r3
0x2c1319e8 4ff00003   mov.w     r3, #0
0x2c1319ec 00f0d180   beq.w     #0x2c131b92
0x2c1319f0 55f786fa   bl        #0x2c086f00
0x2c1319f4 05f11806   add.w     r6, r5, #0x18
0x2c1319f8 b442       cmp       r4, r6
0x2c1319fa 95f80380   ldrb.w    r8, [r5, #3]
0x2c1319fe 4ad0       beq       #0x2c131a96
0x2c131a00 95f82530   ldrb.w    r3, [r5, #0x25]
0x2c131a04 627b       ldrb      r2, [r4, #0xd]
0x2c131a06 9342       cmp       r3, r2
0x2c131a08 26d0       beq       #0x2c131a58
0x2c131a0a cde90027   strd      r2, r7, [sp]
0x2c131a0e 4520       movs      r0, #0x45
0x2c131a10 644a       ldr       r2, [pc, #0x190] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131a12 6649       ldr       r1, [pc, #0x198] ; [0x2c131bac]=0x2c1b4497 '[%s] Change bits from %d to %d for stream %d'
0x2c131a14 11f040fa   bl        #0x2c142e98
0x2c131a18 0122       movs      r2, #1
0x2c131a1a 6b6b       ldr       r3, [r5, #0x34]
0x2c131a1c e169       ldr       r1, [r4, #0x1c]
0x2c131a1e 8b42       cmp       r3, r1
0x2c131a20 07d0       beq       #0x2c131a32
0x2c131a22 cde90017   strd      r1, r7, [sp]
0x2c131a26 5f4a       ldr       r2, [pc, #0x17c] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131a28 4520       movs      r0, #0x45
0x2c131a2a 6149       ldr       r1, [pc, #0x184] ; [0x2c131bb0]=0x2c1b44c4 '[%s] Change data_ptr from %p to %p for stream %d'
0x2c131a2c 11f034fa   bl        #0x2c142e98
0x2c131a30 0122       movs      r2, #1
0x2c131a32 ab6b       ldr       r3, [r5, #0x38]
0x2c131a34 216a       ldr       r1, [r4, #0x20]
0x2c131a36 8b42       cmp       r3, r1
0x2c131a38 10d0       beq       #0x2c131a5c
0x2c131a3a cde90017   strd      r1, r7, [sp]
0x2c131a3e 4520       movs      r0, #0x45
0x2c131a40 584a       ldr       r2, [pc, #0x160] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131a42 5c49       ldr       r1, [pc, #0x170] ; [0x2c131bb4]=0x2c1b44f5 '[%s] Change data_size from %d to %d for stream %d'
0x2c131a44 11f028fa   bl        #0x2c142e98
0x2c131a48 ab78       ldrb      r3, [r5, #2]
0x2c131a4a 5a07       lsls      r2, r3, #0x1d
0x2c131a4c 49d5       bpl       #0x2c131ae2
0x2c131a4e 3a46       mov       r2, r7
0x2c131a50 5449       ldr       r1, [pc, #0x150] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131a52 5948       ldr       r0, [pc, #0x164] ; [0x2c131bb8]=0x2c1b4527 '[%s] ERROR: Update dma while stream %d started'
0x2c131a54 11f020f9   bl        #0x2c142c98
0x2c131a58 0022       movs      r2, #0
0x2c131a5a dee7       b         #0x2c131a1a
0x2c131a5c 002a       cmp       r2, #0
0x2c131a5e f3d1       bne       #0x2c131a48
0x2c131a60 eb69       ldr       r3, [r5, #0x1c]
0x2c131a62 6268       ldr       r2, [r4, #4]
0x2c131a64 9342       cmp       r3, r2
0x2c131a66 42d1       bne       #0x2c131aee
0x2c131a68 95f82420   ldrb.w    r2, [r5, #0x24]
0x2c131a6c 237b       ldrb      r3, [r4, #0xc]
0x2c131a6e 9a42       cmp       r2, r3
0x2c131a70 52d1       bne       #0x2c131b18
0x2c131a72 4ff0000e   mov.w     lr, #0
0x2c131a76 a446       mov       ip, r4
0x2c131a78 bce80f00   ldm.w     ip!, {r0, r1, r2, r3}
0x2c131a7c 0fc6       stm       r6!, {r0, r1, r2, r3}
0x2c131a7e bce80f00   ldm.w     ip!, {r0, r1, r2, r3}
0x2c131a82 0fc6       stm       r6!, {r0, r1, r2, r3}
0x2c131a84 dcf80030   ldr.w     r3, [ip]
0x2c131a88 3360       str       r3, [r6]
0x2c131a8a bef1000f   cmp.w     lr, #0
0x2c131a8e 02d0       beq       #0x2c131a96
0x2c131a90 2846       mov       r0, r5
0x2c131a92 fef757ff   bl        #0x2c130944
0x2c131a96 b8f1020f   cmp.w     r8, #2
0x2c131a9a 40d1       bne       #0x2c131b1e
0x2c131a9c 1822       movs      r2, #0x18
0x2c131a9e 0021       movs      r1, #0
0x2c131aa0 05a8       add       r0, sp, #0x14
0x2c131aa2 11f0d9fa   bl        #0x2c143058
0x2c131aa6 637b       ldrb      r3, [r4, #0xd]
0x2c131aa8 4449       ldr       r1, [pc, #0x110] ; [0x2c131bbc]=0x2c1b45cf '[%s] current vol:%d'
0x2c131aaa 8df81430   strb.w    r3, [sp, #0x14]
0x2c131aae 6368       ldr       r3, [r4, #4]
0x2c131ab0 4320       movs      r0, #0x43
0x2c131ab2 0693       str       r3, [sp, #0x18]
0x2c131ab4 237b       ldrb      r3, [r4, #0xc]
0x2c131ab6 8df81c30   strb.w    r3, [sp, #0x1c]
0x2c131aba a368       ldr       r3, [r4, #8]
0x2c131abc 0893       str       r3, [sp, #0x20]
0x2c131abe e37d       ldrb      r3, [r4, #0x17]
0x2c131ac0 5a00       lsls      r2, r3, #1
0x2c131ac2 42f00102   orr       r2, r2, #1
0x2c131ac6 8df82420   strb.w    r2, [sp, #0x24]
0x2c131aca e27b       ldrb      r2, [r4, #0xf]
0x2c131acc 8df82520   strb.w    r2, [sp, #0x25]
0x2c131ad0 344a       ldr       r2, [pc, #0xd0] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131ad2 11f0e1f9   bl        #0x2c142e98
0x2c131ad6 3846       mov       r0, r7
0x2c131ad8 05a9       add       r1, sp, #0x14
0x2c131ada 4af757ff   bl        #0x2c07c98c
0x2c131ade 0024       movs      r4, #0
0x2c131ae0 7ce7       b         #0x2c1319dc
0x2c131ae2 2246       mov       r2, r4
0x2c131ae4 2946       mov       r1, r5
0x2c131ae6 3846       mov       r0, r7
0x2c131ae8 fff7daf8   bl        #0x2c130ca0
0x2c131aec b8e7       b         #0x2c131a60
0x2c131aee cde90027   strd      r2, r7, [sp]
0x2c131af2 4520       movs      r0, #0x45
0x2c131af4 2b4a       ldr       r2, [pc, #0xac] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131af6 3249       ldr       r1, [pc, #0xc8] ; [0x2c131bc0]=0x2c1b4556 '[%s] Change sample rate from %d to %d for stream %d'
0x2c131af8 11f0cef9   bl        #0x2c142e98
0x2c131afc ab78       ldrb      r3, [r5, #2]
0x2c131afe 5b07       lsls      r3, r3, #0x1d
0x2c131b00 06d5       bpl       #0x2c131b10
0x2c131b02 0097       str       r7, [sp]
0x2c131b04 6368       ldr       r3, [r4, #4]
0x2c131b06 ea69       ldr       r2, [r5, #0x1c]
0x2c131b08 2649       ldr       r1, [pc, #0x98] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131b0a 2e48       ldr       r0, [pc, #0xb8] ; [0x2c131bc4]=0x2c1b458a '[%s] ERROR: Change sample rate from %d to %d while stream %d started'
0x2c131b0c 11f0c4f8   bl        #0x2c142c98
0x2c131b10 ea69       ldr       r2, [r5, #0x1c]
0x2c131b12 6368       ldr       r3, [r4, #4]
0x2c131b14 9a42       cmp       r2, r3
0x2c131b16 a7d0       beq       #0x2c131a68
0x2c131b18 4ff0010e   mov.w     lr, #1
0x2c131b1c abe7       b         #0x2c131a76
0x2c131b1e b8f1030f   cmp.w     r8, #3
0x2c131b22 21d1       bne       #0x2c131b68
0x2c131b24 1822       movs      r2, #0x18
0x2c131b26 0021       movs      r1, #0
0x2c131b28 05a8       add       r0, sp, #0x14
0x2c131b2a 11f095fa   bl        #0x2c143058
0x2c131b2e 637b       ldrb      r3, [r4, #0xd]
0x2c131b30 2249       ldr       r1, [pc, #0x88] ; [0x2c131bbc]=0x2c1b45cf '[%s] current vol:%d'
0x2c131b32 8df81430   strb.w    r3, [sp, #0x14]
0x2c131b36 6368       ldr       r3, [r4, #4]
0x2c131b38 4320       movs      r0, #0x43
0x2c131b3a 0693       str       r3, [sp, #0x18]
0x2c131b3c 237b       ldrb      r3, [r4, #0xc]
0x2c131b3e 8df81c30   strb.w    r3, [sp, #0x1c]
0x2c131b42 a368       ldr       r3, [r4, #8]
0x2c131b44 0893       str       r3, [sp, #0x20]
0x2c131b46 e37d       ldrb      r3, [r4, #0x17]
0x2c131b48 5a00       lsls      r2, r3, #1
0x2c131b4a 42f00102   orr       r2, r2, #1
0x2c131b4e 8df82420   strb.w    r2, [sp, #0x24]
0x2c131b52 e27b       ldrb      r2, [r4, #0xf]
0x2c131b54 8df82520   strb.w    r2, [sp, #0x25]
0x2c131b58 124a       ldr       r2, [pc, #0x48] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131b5a 11f09df9   bl        #0x2c142e98
0x2c131b5e 3846       mov       r0, r7
0x2c131b60 05a9       add       r1, sp, #0x14
0x2c131b62 4bf72ffa   bl        #0x2c07cfc4
0x2c131b66 bae7       b         #0x2c131ade
0x2c131b68 b8f10f0f   cmp.w     r8, #0xf
0x2c131b6c 0dd1       bne       #0x2c131b8a
0x2c131b6e 0123       movs      r3, #1
0x2c131b70 0893       str       r3, [sp, #0x20]
0x2c131b72 637b       ldrb      r3, [r4, #0xd]
0x2c131b74 3946       mov       r1, r7
0x2c131b76 0593       str       r3, [sp, #0x14]
0x2c131b78 237b       ldrb      r3, [r4, #0xc]
0x2c131b7a 05aa       add       r2, sp, #0x14
0x2c131b7c 0693       str       r3, [sp, #0x18]
0x2c131b7e 6368       ldr       r3, [r4, #4]
0x2c131b80 0020       movs      r0, #0
0x2c131b82 0793       str       r3, [sp, #0x1c]
0x2c131b84 42f760fe   bl        #0x2c074848
0x2c131b88 a9e7       b         #0x2c131ade
0x2c131b8a 4246       mov       r2, r8
0x2c131b8c 0549       ldr       r1, [pc, #0x14] ; [0x2c131ba4]=0x2c1b4e83 'af_stream_setup'
0x2c131b8e 0e48       ldr       r0, [pc, #0x38] ; [0x2c131bc8]=0x2c1b45e3 '[%s] ERROR: device %d is not defined!'
0x2c131b90 60e7       b         #0x2c131a54
0x2c131b92 2046       mov       r0, r4
0x2c131b94 0cb0       add       sp, #0x30
0x2c131b96 bde8f081   pop.w     {r4, r5, r6, r7, r8, pc}
0x2c131b9a 00bf       nop       
0x2c131b9c 0056       ldrsb     r0, [r0, r0]
0x2c131b9e 0020       movs      r0, #0
0x2c131ba0 6544       add       r5, ip
0x2c131ba2 1b2c       cmp       r4, #0x1b
0x2c131ba4 834e       ldr       r6, [pc, #0x20c] ; [0x2c131db4]=0xf7424628
0x2c131ba6 1b2c       cmp       r4, #0x1b
0x2c131ba8 7f44       add       r7, pc
0x2c131baa 1b2c       cmp       r4, #0x1b
0x2c131bac 9744       add       pc, r2
0x2c131bae 1b2c       cmp       r4, #0x1b
0x2c131bb0 c444       add       ip, r8
0x2c131bb2 1b2c       cmp       r4, #0x1b
0x2c131bb4 f544       add       sp, lr
0x2c131bb6 1b2c       cmp       r4, #0x1b
0x2c131bb8 2745       cmp       r7, r4
0x2c131bba 1b2c       cmp       r4, #0x1b
0x2c131bbc cf45       cmp       pc, sb
0x2c131bbe 1b2c       cmp       r4, #0x1b
0x2c131bc0 5645       cmp       r6, sl
0x2c131bc2 1b2c       cmp       r4, #0x1b
0x2c131bc4 8a45       cmp       sl, r1
0x2c131bc6 1b2c       cmp       r4, #0x1b
0x2c131bc8 e345       cmp       fp, ip
0x2c131bca 1b2c       cmp       r4, #0x1b
