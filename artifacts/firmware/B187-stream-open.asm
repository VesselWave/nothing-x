0x2c131bcc 2de9f047   push.w    {r4, r5, r6, r7, r8, sb, sl, lr}
0x2c131bd0 914b       ldr       r3, [pc, #0x244] ; [0x2c131e18]=0x20005600
0x2c131bd2 8ab0       sub       sp, #0x28
0x2c131bd4 1b68       ldr       r3, [r3]
0x2c131bd6 0993       str       r3, [sp, #0x24]
0x2c131bd8 4ff00003   mov.w     r3, #0
0x2c131bdc 0d46       mov       r5, r1
0x2c131bde 1646       mov       r6, r2
0x2c131be0 8046       mov       r8, r0
0x2c131be2 fff703f8   bl        #0x2c130bec
0x2c131be6 8d4a       ldr       r2, [pc, #0x234] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131be8 0446       mov       r4, r0
0x2c131bea 4346       mov       r3, r8
0x2c131bec 4420       movs      r0, #0x44
0x2c131bee 8c49       ldr       r1, [pc, #0x230] ; [0x2c131e20]=0x2c1b4465 '[%s] id = %d, stream = %d'
0x2c131bf0 0095       str       r5, [sp]
0x2c131bf2 11f051f9   bl        #0x2c142e98
0x2c131bf6 f269       ldr       r2, [r6, #0x1c]
0x2c131bf8 1ab9       cbnz      r2, #0x2c131c02
0x2c131bfa 8849       ldr       r1, [pc, #0x220] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131bfc 8948       ldr       r0, [pc, #0x224] ; [0x2c131e24]=0x2c1b4609 '[%s] ERROR: data_ptr == NULL!!!'
0x2c131bfe 11f04bf8   bl        #0x2c142c98
0x2c131c02 9307       lsls      r3, r2, #0x1e
0x2c131c04 03d0       beq       #0x2c131c0e
0x2c131c06 8549       ldr       r1, [pc, #0x214] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131c08 8748       ldr       r0, [pc, #0x21c] ; [0x2c131e28]=0x2c1b4629 '[%s] ERROR: data_ptr(%p) is not align!!!'
0x2c131c0a 11f045f8   bl        #0x2c142c98
0x2c131c0e 336a       ldr       r3, [r6, #0x20]
0x2c131c10 13b9       cbnz      r3, #0x2c131c18
0x2c131c12 8249       ldr       r1, [pc, #0x208] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131c14 8548       ldr       r0, [pc, #0x214] ; [0x2c131e2c]=0x2c1b4652 '[%s] ERROR: data_size == 0!!!'
0x2c131c16 f2e7       b         #0x2c131bfe
0x2c131c18 737d       ldrb      r3, [r6, #0x15]
0x2c131c1a 4bb1       cbz       r3, #0x2c131c30
0x2c131c1c 337b       ldrb      r3, [r6, #0xc]
0x2c131c1e 012b       cmp       r3, #1
0x2c131c20 06d9       bls       #0x2c131c30
0x2c131c22 b27b       ldrb      r2, [r6, #0xe]
0x2c131c24 931e       subs      r3, r2, #2
0x2c131c26 0a2b       cmp       r3, #0xa
0x2c131c28 02d9       bls       #0x2c131c30
0x2c131c2a 7c49       ldr       r1, [pc, #0x1f0] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131c2c 8048       ldr       r0, [pc, #0x200] ; [0x2c131e30]=0x2c1b4670 '[%s] ERROR: Unsupport chan_sep_buf for device %d'
0x2c131c2e ece7       b         #0x2c131c0a
0x2c131c30 fff79cfa   bl        #0x2c13116c
0x2c131c34 94f80290   ldrb.w    sb, [r4, #2]
0x2c131c38 b9f1010f   cmp.w     sb, #1
0x2c131c3c 12d0       beq       #0x2c131c64
0x2c131c3e 4b46       mov       r3, sb
0x2c131c40 4320       movs      r0, #0x43
0x2c131c42 764a       ldr       r2, [pc, #0x1d8] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131c44 7b49       ldr       r1, [pc, #0x1ec] ; [0x2c131e34]=0x2c1b447f '[%s] ERROR: status = %d'
0x2c131c46 11f027f9   bl        #0x2c142e98
0x2c131c4a 0124       movs      r4, #1
0x2c131c4c fff796fa   bl        #0x2c13117c
0x2c131c50 714b       ldr       r3, [pc, #0x1c4] ; [0x2c131e18]=0x20005600
0x2c131c52 1a68       ldr       r2, [r3]
0x2c131c54 099b       ldr       r3, [sp, #0x24]
0x2c131c56 5a40       eors      r2, r3
0x2c131c58 4ff00003   mov.w     r3, #0
0x2c131c5c 00f0d780   beq.w     #0x2c131e0e
0x2c131c60 55f74ef9   bl        #0x2c086f00
0x2c131c64 b446       mov       ip, r6
0x2c131c66 04f11807   add.w     r7, r4, #0x18
0x2c131c6a bce80f00   ldm.w     ip!, {r0, r1, r2, r3}
0x2c131c6e 0fc7       stm       r7!, {r0, r1, r2, r3}
0x2c131c70 bce80f00   ldm.w     ip!, {r0, r1, r2, r3}
0x2c131c74 0fc7       stm       r7!, {r0, r1, r2, r3}
0x2c131c76 dcf80030   ldr.w     r3, [ip]
0x2c131c7a 1c22       movs      r2, #0x1c
0x2c131c7c 3b60       str       r3, [r7]
0x2c131c7e b77b       ldrb      r7, [r6, #0xe]
0x2c131c80 0021       movs      r1, #0
0x2c131c82 e770       strb      r7, [r4, #3]
0x2c131c84 04f17c00   add.w     r0, r4, #0x7c
0x2c131c88 11f0e6f9   bl        #0x2c143058
0x2c131c8c 0f2f       cmp       r7, #0xf
0x2c131c8e 04f1180a   add.w     sl, r4, #0x18
0x2c131c92 0fd0       beq       #0x2c131cb4
0x2c131c94 84f88390   strb.w    sb, [r4, #0x83]
0x2c131c98 337b       ldrb      r3, [r6, #0xc]
0x2c131c9a 012b       cmp       r3, #1
0x2c131c9c 05d9       bls       #0x2c131caa
0x2c131c9e 002d       cmp       r5, #0
0x2c131ca0 6dd1       bne       #0x2c131d7e
0x2c131ca2 96f81590   ldrb.w    sb, [r6, #0x15]
0x2c131ca6 89f00109   eor       sb, sb, #1
0x2c131caa 0123       movs      r3, #1
0x2c131cac 84f88290   strb.w    sb, [r4, #0x82]
0x2c131cb0 84f87d30   strb.w    r3, [r4, #0x7d]
0x2c131cb4 604b       ldr       r3, [pc, #0x180] ; [0x2c131e38]=0xc130c2d
0x2c131cb6 c4f89030   str.w     r3, [r4, #0x90]
0x2c131cba 002d       cmp       r5, #0
0x2c131cbc 7fd1       bne       #0x2c131dbe
0x2c131cbe 4ff00109   mov.w     sb, #1
0x2c131cc2 022f       cmp       r7, #2
0x2c131cc4 a4f88490   strh.w    sb, [r4, #0x84]
0x2c131cc8 68d1       bne       #0x2c131d9c
0x2c131cca 4bf733f8   bl        #0x2c07cd34
0x2c131cce 2846       mov       r0, r5
0x2c131cd0 4af746fe   bl        #0x2c07c960
0x2c131cd4 9fed590a   vldr      s0, [pc, #0x164] ; [0x2c131e3c]=0x0
0x2c131cd8 594f       ldr       r7, [pc, #0x164] ; [0x2c131e40]=0x2001ed90
0x2c131cda f3ee0e0a   vmov.f32  s1, #3.000000e+01
0x2c131cde 87ed060a   vstr      s0, [r7, #0x18]
0x2c131ce2 87ed070a   vstr      s0, [r7, #0x1c]
0x2c131ce6 87ed080a   vstr      s0, [r7, #0x20]
0x2c131cea 87ed090a   vstr      s0, [r7, #0x24]
0x2c131cee d6ed017a   vldr      s15, [r6, #4]
0x2c131cf2 f8ee677a   vcvt.f32.u32 s15, s15
0x2c131cf6 03a8       add       r0, sp, #0xc
0x2c131cf8 b6ee001a   vmov.f32  s2, #5.000000e-01
0x2c131cfc c0eea70a   vdiv.f32  s1, s1, s15
0x2c131d00 55f702fd   bl        #0x2c087708
0x2c131d04 069b       ldr       r3, [sp, #0x18]
0x2c131d06 6422       movs      r2, #0x64
0x2c131d08 3b60       str       r3, [r7]
0x2c131d0a 079b       ldr       r3, [sp, #0x1c]
0x2c131d0c 4d48       ldr       r0, [pc, #0x134] ; [0x2c131e44]=0x200577f0
0x2c131d0e 7b60       str       r3, [r7, #4]
0x2c131d10 089b       ldr       r3, [sp, #0x20]
0x2c131d12 bb60       str       r3, [r7, #8]
0x2c131d14 039b       ldr       r3, [sp, #0xc]
0x2c131d16 fb60       str       r3, [r7, #0xc]
0x2c131d18 049b       ldr       r3, [sp, #0x10]
0x2c131d1a 3b61       str       r3, [r7, #0x10]
0x2c131d1c 059b       ldr       r3, [sp, #0x14]
0x2c131d1e 7b61       str       r3, [r7, #0x14]
0x2c131d20 7168       ldr       r1, [r6, #4]
0x2c131d22 fff761f8   bl        #0x2c130de8
0x2c131d26 4ff07e52   mov.w     r2, #0x3f800000
0x2c131d2a 474b       ldr       r3, [pc, #0x11c] ; [0x2c131e48]=0x200577ec
0x2c131d2c 1a60       str       r2, [r3]
0x2c131d2e 474b       ldr       r3, [pc, #0x11c] ; [0x2c131e4c]=0x2001ed8c
0x2c131d30 83f80090   strb.w    sb, [r3]
0x2c131d34 3323       movs      r3, #0x33
0x2c131d36 0021       movs      r1, #0
0x2c131d38 84f88630   strb.w    r3, [r4, #0x86]
0x2c131d3c 94f88600   ldrb.w    r0, [r4, #0x86]
0x2c131d40 42f77af9   bl        #0x2c074038
0x2c131d44 84f87c00   strb.w    r0, [r4, #0x7c]
0x2c131d48 42f766f9   bl        #0x2c074018
0x2c131d4c 3246       mov       r2, r6
0x2c131d4e 2146       mov       r1, r4
0x2c131d50 c4f89800   str.w     r0, [r4, #0x98]
0x2c131d54 2846       mov       r0, r5
0x2c131d56 fef7a3ff   bl        #0x2c130ca0
0x2c131d5a b369       ldr       r3, [r6, #0x18]
0x2c131d5c 2946       mov       r1, r5
0x2c131d5e c4f89c30   str.w     r3, [r4, #0x9c]
0x2c131d62 4046       mov       r0, r8
0x2c131d64 fef742ff   bl        #0x2c130bec
0x2c131d68 8378       ldrb      r3, [r0, #2]
0x2c131d6a 5246       mov       r2, sl
0x2c131d6c 43f00203   orr       r3, r3, #2
0x2c131d70 8370       strb      r3, [r0, #2]
0x2c131d72 2946       mov       r1, r5
0x2c131d74 4046       mov       r0, r8
0x2c131d76 fff711fe   bl        #0x2c13199c
0x2c131d7a 0024       movs      r4, #0
0x2c131d7c 66e7       b         #0x2c131c4c
0x2c131d7e 012d       cmp       r5, #1
0x2c131d80 93d1       bne       #0x2c131caa
0x2c131d82 737d       ldrb      r3, [r6, #0x15]
0x2c131d84 002b       cmp       r3, #0
0x2c131d86 90d1       bne       #0x2c131caa
0x2c131d88 a7f10209   sub.w     sb, r7, #2
0x2c131d8c b9f1010f   cmp.w     sb, #1
0x2c131d90 94bf       ite       ls
0x2c131d92 4ff00009   movls.w   sb, #0
0x2c131d96 4ff00109   movhi.w   sb, #1
0x2c131d9a 86e7       b         #0x2c131caa
0x2c131d9c 032f       cmp       r7, #3
0x2c131d9e 06d1       bne       #0x2c131dae
0x2c131da0 4bf772fa   bl        #0x2c07d288
0x2c131da4 2846       mov       r0, r5
0x2c131da6 4bf72ffa   bl        #0x2c07d208
0x2c131daa 4e23       movs      r3, #0x4e
0x2c131dac c3e7       b         #0x2c131d36
0x2c131dae 0f2f       cmp       r7, #0xf
0x2c131db0 29d1       bne       #0x2c131e06
0x2c131db2 2946       mov       r1, r5
0x2c131db4 2846       mov       r0, r5
0x2c131db6 42f7bdfc   bl        #0x2c074734
0x2c131dba 3523       movs      r3, #0x35
0x2c131dbc bbe7       b         #0x2c131d36
0x2c131dbe 0223       movs      r3, #2
0x2c131dc0 0020       movs      r0, #0
0x2c131dc2 9f42       cmp       r7, r3
0x2c131dc4 84f88600   strb.w    r0, [r4, #0x86]
0x2c131dc8 84f88430   strb.w    r3, [r4, #0x84]
0x2c131dcc 0bd1       bne       #0x2c131de6
0x2c131dce 4af7b1ff   bl        #0x2c07cd34
0x2c131dd2 2846       mov       r0, r5
0x2c131dd4 4af7c4fd   bl        #0x2c07c960
0x2c131dd8 3223       movs      r3, #0x32
0x2c131dda 84f88530   strb.w    r3, [r4, #0x85]
0x2c131dde 0021       movs      r1, #0
0x2c131de0 94f88500   ldrb.w    r0, [r4, #0x85]
0x2c131de4 ace7       b         #0x2c131d40
0x2c131de6 032f       cmp       r7, #3
0x2c131de8 06d1       bne       #0x2c131df8
0x2c131dea 4bf74dfa   bl        #0x2c07d288
0x2c131dee 2846       mov       r0, r5
0x2c131df0 4bf70afa   bl        #0x2c07d208
0x2c131df4 4d23       movs      r3, #0x4d
0x2c131df6 f0e7       b         #0x2c131dda
0x2c131df8 0f2f       cmp       r7, #0xf
0x2c131dfa 04d1       bne       #0x2c131e06
0x2c131dfc 2946       mov       r1, r5
0x2c131dfe 42f799fc   bl        #0x2c074734
0x2c131e02 3423       movs      r3, #0x34
0x2c131e04 e9e7       b         #0x2c131dda
0x2c131e06 3a46       mov       r2, r7
0x2c131e08 0449       ldr       r1, [pc, #0x10] ; [0x2c131e1c]=0x2c1b4ec2 'af_stream_open'
0x2c131e0a 1148       ldr       r0, [pc, #0x44] ; [0x2c131e50]=0x2c1b45e3 '[%s] ERROR: device %d is not defined!'
0x2c131e0c fde6       b         #0x2c131c0a
0x2c131e0e 2046       mov       r0, r4
0x2c131e10 0ab0       add       sp, #0x28
0x2c131e12 bde8f087   pop.w     {r4, r5, r6, r7, r8, sb, sl, pc}
0x2c131e16 00bf       nop       
0x2c131e18 0056       ldrsb     r0, [r0, r0]
0x2c131e1a 0020       movs      r0, #0
0x2c131e1c c24e       ldr       r6, [pc, #0x308] ; [0x2c132128]=0xe8bdb002
0x2c131e1e 1b2c       cmp       r4, #0x1b
0x2c131e20 6544       add       r5, ip
0x2c131e22 1b2c       cmp       r4, #0x1b
0x2c131e24 0946       mov       r1, r1
0x2c131e26 1b2c       cmp       r4, #0x1b
0x2c131e28 2946       mov       r1, r5
0x2c131e2a 1b2c       cmp       r4, #0x1b
0x2c131e2c 5246       mov       r2, sl
0x2c131e2e 1b2c       cmp       r4, #0x1b
0x2c131e30 7046       mov       r0, lr
0x2c131e32 1b2c       cmp       r4, #0x1b
0x2c131e34 7f44       add       r7, pc
0x2c131e36 1b2c       cmp       r4, #0x1b
0x2c131e38 2d0c       lsrs      r5, r5, #0x10
0x2c131e3a 130c       lsrs      r3, r2, #0x10
0x2c131e3c 0000       movs      r0, r0
0x2c131e3e 0000       movs      r0, r0
0x2c131e40 90ed0120   ldc       p0, c2, [r0, #4]
0x2c131e44 f077       strb      r0, [r6, #0x1f]
0x2c131e46 0520       movs      r0, #5
0x2c131e48 ec77       strb      r4, [r5, #0x1f]
0x2c131e4a 0520       movs      r0, #5
0x2c131e4c 8ced0120   stc       p0, c2, [ip, #4]
0x2c131e50 e345       cmp       fp, ip
0x2c131e52 1b2c       cmp       r4, #0x1b
0x2c131e54 73b5       push      {r0, r1, r4, r5, r6, lr}
0x2c131e56 1546       mov       r5, r2
0x2c131e58 0193       str       r3, [sp, #4]
0x2c131e5a 0c46       mov       r4, r1
0x2c131e5c fef7c6fe   bl        #0x2c130bec
0x2c131e60 0646       mov       r6, r0
0x2c131e62 fff783f9   bl        #0x2c13116c
0x2c131e66 b378       ldrb      r3, [r6, #2]
0x2c131e68 019a       ldr       r2, [sp, #4]
0x2c131e6a 13f0020f   tst.w     r3, #2
0x2c131e6e 06d1       bne       #0x2c131e7e
0x2c131e70 4320       movs      r0, #0x43
0x2c131e72 0d4a       ldr       r2, [pc, #0x34] ; [0x2c131ea8]=0x2c1b4e6c 'af_stream_set_chan_vol'
0x2c131e74 0d49       ldr       r1, [pc, #0x34] ; [0x2c131eac]=0x2c1b447f '[%s] ERROR: status = %d'
0x2c131e76 11f00ff8   bl        #0x2c142e98
0x2c131e7a 0124       movs      r4, #1
0x2c131e7c 07e0       b         #0x2c131e8e
0x2c131e7e f378       ldrb      r3, [r6, #3]
0x2c131e80 022b       cmp       r3, #2
0x2c131e82 09d1       bne       #0x2c131e98
0x2c131e84 2946       mov       r1, r5
0x2c131e86 2046       mov       r0, r4
0x2c131e88 4af77cfe   bl        #0x2c07cb84
0x2c131e8c 0024       movs      r4, #0
0x2c131e8e fff775f9   bl        #0x2c13117c
0x2c131e92 2046       mov       r0, r4
0x2c131e94 02b0       add       sp, #8
0x2c131e96 70bd       pop       {r4, r5, r6, pc}
0x2c131e98 032b       cmp       r3, #3
0x2c131e9a eed1       bne       #0x2c131e7a
0x2c131e9c 2946       mov       r1, r5
0x2c131e9e 2046       mov       r0, r4
0x2c131ea0 4bf740f9   bl        #0x2c07d124
0x2c131ea4 f2e7       b         #0x2c131e8c
0x2c131ea6 00bf       nop       
0x2c131ea8 6c4e       ldr       r6, [pc, #0x1b0] ; [0x2c13205c]=0x2e0278bb
0x2c131eaa 1b2c       cmp       r4, #0x1b
0x2c131eac 7f44       add       r7, pc
0x2c131eae 1b2c       cmp       r4, #0x1b
0x2c131eb0 2de9f041   push.w    {r4, r5, r6, r7, r8, lr}
0x2c131eb4 544b       ldr       r3, [pc, #0x150] ; [0x2c132008]=0x20005600
0x2c131eb6 86b0       sub       sp, #0x18
0x2c131eb8 1b68       ldr       r3, [r3]
0x2c131eba 0593       str       r3, [sp, #0x14]
0x2c131ebc 4ff00003   mov.w     r3, #0
0x2c131ec0 0d46       mov       r5, r1
0x2c131ec2 8046       mov       r8, r0
0x2c131ec4 fef792fe   bl        #0x2c130bec
0x2c131ec8 0446       mov       r4, r0
0x2c131eca 4346       mov       r3, r8
0x2c131ecc 4f4a       ldr       r2, [pc, #0x13c] ; [0x2c13200c]=0x2c1b4fa0 'af_stream_start'
0x2c131ece 5049       ldr       r1, [pc, #0x140] ; [0x2c132010]=0x2c1b4465 '[%s] id = %d, stream = %d'
0x2c131ed0 4420       movs      r0, #0x44
0x2c131ed2 0095       str       r5, [sp]
0x2c131ed4 10f0e0ff   bl        #0x2c142e98
0x2c131ed8 fff748f9   bl        #0x2c13116c
0x2c131edc a378       ldrb      r3, [r4, #2]
0x2c131ede 032b       cmp       r3, #3
0x2c131ee0 10d0       beq       #0x2c131f04
0x2c131ee2 4320       movs      r0, #0x43
0x2c131ee4 494a       ldr       r2, [pc, #0x124] ; [0x2c13200c]=0x2c1b4fa0 'af_stream_start'
0x2c131ee6 4b49       ldr       r1, [pc, #0x12c] ; [0x2c132014]=0x2c1b447f '[%s] ERROR: status = %d'
0x2c131ee8 10f0d6ff   bl        #0x2c142e98
0x2c131eec 0124       movs      r4, #1
0x2c131eee fff745f9   bl        #0x2c13117c
0x2c131ef2 454b       ldr       r3, [pc, #0x114] ; [0x2c132008]=0x20005600
0x2c131ef4 1a68       ldr       r2, [r3]
0x2c131ef6 059b       ldr       r3, [sp, #0x14]
0x2c131ef8 5a40       eors      r2, r3
0x2c131efa 4ff00003   mov.w     r3, #0
0x2c131efe 7fd0       beq       #0x2c132000
