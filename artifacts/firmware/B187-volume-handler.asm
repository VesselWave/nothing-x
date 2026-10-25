0x2c137030 2de9f041   push.w    {r4, r5, r6, r7, r8, lr}
0x2c137034 0746       mov       r7, r0
0x2c137036 0120       movs      r0, #1
0x2c137038 fff798fe   bl        #0x2c136d6c
0x2c13703c 0246       mov       r2, r0
0x2c13703e 0028       cmp       r0, #0
0x2c137040 69d1       bne       #0x2c137116
0x2c137042 0220       movs      r0, #2
0x2c137044 fff792fe   bl        #0x2c136d6c
0x2c137048 8046       mov       r8, r0
0x2c13704a 18b9       cbnz      r0, #0x2c137054
0x2c13704c 0420       movs      r0, #4
0x2c13704e fff78dfe   bl        #0x2c136d6c
0x2c137052 8046       mov       r8, r0
0x2c137054 0820       movs      r0, #8
0x2c137056 fff789fe   bl        #0x2c136d6c
0x2c13705a 0646       mov       r6, r0
0x2c13705c 0028       cmp       r0, #0
0x2c13705e 40f0d180   bne.w     #0x2c137204
0x2c137062 1020       movs      r0, #0x10
0x2c137064 fff782fe   bl        #0x2c136d6c
0x2c137068 0646       mov       r6, r0
0x2c13706a 18b9       cbnz      r0, #0x2c137074
0x2c13706c 2020       movs      r0, #0x20
0x2c13706e fff77dfe   bl        #0x2c136d6c
0x2c137072 0646       mov       r6, r0
0x2c137074 002a       cmp       r2, #0
0x2c137076 40f0c880   bne.w     #0x2c13720a
0x2c13707a 1046       mov       r0, r2
0x2c13707c fff776fe   bl        #0x2c136d6c
0x2c137080 0028       cmp       r0, #0
0x2c137082 00f0bd80   beq.w     #0x2c137200
0x2c137086 f5f775ff   bl        #0x2c12cf74
0x2c13708a 4078       ldrb      r0, [r0, #1]
0x2c13708c b0f7faf8   bl        #0x2c0e7284
0x2c137090 0546       mov       r5, r0
0x2c137092 b8b9       cbnz      r0, #0x2c1370c4
0x2c137094 00f0eefc   bl        #0x2c137a74
0x2c137098 694a       ldr       r2, [pc, #0x1a4] ; [0x2c137240]=0x2c1ee794 'app_bt_stream_volumeup_generic'
0x2c13709a 0346       mov       r3, r0
0x2c13709c 6949       ldr       r1, [pc, #0x1a4] ; [0x2c137244]=0x2c1ee7e7 '%s invalid sbc id %x'
0x2c13709e 4320       movs      r0, #0x43
0x2c1370a0 0bf0fafe   bl        #0x2c142e98
0x2c1370a4 f5f766ff   bl        #0x2c12cf74
0x2c1370a8 0378       ldrb      r3, [r0]
0x2c1370aa 012b       cmp       r3, #1
0x2c1370ac 40f0c380   bne.w     #0x2c137236
0x2c1370b0 4078       ldrb      r0, [r0, #1]
0x2c1370b2 ff28       cmp       r0, #0xff
0x2c1370b4 00f0bf80   beq.w     #0x2c137236
0x2c1370b8 b0f7e4f8   bl        #0x2c0e7284
0x2c1370bc 0546       mov       r5, r0
0x2c1370be 0028       cmp       r0, #0
0x2c1370c0 00f0b980   beq.w     #0x2c137236
0x2c1370c4 5e4a       ldr       r2, [pc, #0x178] ; [0x2c137240]=0x2c1ee794 'app_bt_stream_volumeup_generic'
0x2c1370c6 6049       ldr       r1, [pc, #0x180] ; [0x2c137248]=0x2c1ee7fc '%s set a2dp volume'
0x2c1370c8 4220       movs      r0, #0x42
0x2c1370ca 0bf0e5fe   bl        #0x2c142e98
0x2c1370ce a87a       ldrb      r0, [r5, #0xa]
0x2c1370d0 b4f7e2f8   bl        #0x2c0eb298
0x2c1370d4 0f28       cmp       r0, #0xf
0x2c1370d6 0446       mov       r4, r0
0x2c1370d8 05d9       bls       #0x2c1370e6
0x2c1370da 5c49       ldr       r1, [pc, #0x170] ; [0x2c13724c]=0x2c1ee80f 'a2dp vol already max!'
0x2c1370dc 4120       movs      r0, #0x41
0x2c1370de 0bf0dbfe   bl        #0x2c142e98
0x2c1370e2 fdf7b5fd   bl        #0x2c134c50
0x2c1370e6 002f       cmp       r7, #0
0x2c1370e8 75d0       beq       #0x2c1371d6
0x2c1370ea 0134       adds      r4, #1
0x2c1370ec e4b2       uxtb      r4, r4
0x2c1370ee 0f2c       cmp       r4, #0xf
0x2c1370f0 6cd9       bls       #0x2c1371cc
0x2c1370f2 fdf7adfd   bl        #0x2c134c50
0x2c1370f6 1024       movs      r4, #0x10
0x2c1370f8 b8f1000f   cmp.w     r8, #0
0x2c1370fc 68d1       bne       #0x2c1371d0
0x2c1370fe 002e       cmp       r6, #0
0x2c137100 14bf       ite       ne
0x2c137102 4ff0ff36   movne.w   r6, #-1
0x2c137106 3026       moveq     r6, #0x30
0x2c137108 2146       mov       r1, r4
0x2c13710a a87a       ldrb      r0, [r5, #0xa]
0x2c13710c b4f704fd   bl        #0x2c0ebb18
0x2c137110 4f4b       ldr       r3, [pc, #0x13c] ; [0x2c137250]=0x2005882c
0x2c137112 1c70       strb      r4, [r3]
0x2c137114 1de0       b         #0x2c137152
0x2c137116 8046       mov       r8, r0
0x2c137118 9ce7       b         #0x2c137054
0x2c13711a 807a       ldrb      r0, [r0, #0xa]
0x2c13711c aef73afb   bl        #0x2c0e5794
0x2c137120 0f28       cmp       r0, #0xf
0x2c137122 0446       mov       r4, r0
0x2c137124 05d9       bls       #0x2c137132
0x2c137126 4b49       ldr       r1, [pc, #0x12c] ; [0x2c137254]=0x2c1ee7c8 'hfp vol already max!'
0x2c137128 4120       movs      r0, #0x41
0x2c13712a 0bf0b5fe   bl        #0x2c142e98
0x2c13712e fdf78ffd   bl        #0x2c134c50
0x2c137132 002f       cmp       r7, #0
0x2c137134 38d0       beq       #0x2c1371a8
0x2c137136 0134       adds      r4, #1
0x2c137138 e4b2       uxtb      r4, r4
0x2c13713a 0f2c       cmp       r4, #0xf
0x2c13713c 44d9       bls       #0x2c1371c8
0x2c13713e fdf787fd   bl        #0x2c134c50
0x2c137142 1024       movs      r4, #0x10
0x2c137144 3026       movs      r6, #0x30
0x2c137146 2146       mov       r1, r4
0x2c137148 a87a       ldrb      r0, [r5, #0xa]
0x2c13714a aef79dfb   bl        #0x2c0e5888
0x2c13714e 404b       ldr       r3, [pc, #0x100] ; [0x2c137250]=0x2005882c
0x2c137150 5c70       strb      r4, [r3, #1]
0x2c137152 60b2       sxtb      r0, r4
0x2c137154 fff750ff   bl        #0x2c136ff8
0x2c137158 ac7a       ldrb      r4, [r5, #0xa]
0x2c13715a 7df76dfb   bl        #0x2c0b4838
0x2c13715e 0546       mov       r5, r0
0x2c137160 90b9       cbnz      r0, #0x2c137188
0x2c137162 731c       adds      r3, r6, #1
0x2c137164 10d0       beq       #0x2c137188
0x2c137166 3246       mov       r2, r6
0x2c137168 3b49       ldr       r1, [pc, #0xec] ; [0x2c137258]=0x2c1ee7dd 'AUD_ID=%d'
0x2c13716a 4220       movs      r0, #0x42
0x2c13716c 0bf094fe   bl        #0x2c142e98
0x2c137170 21f72afb   bl        #0x2c0587c8
0x2c137174 40b1       cbz       r0, #0x2c137188
0x2c137176 322e       cmp       r6, #0x32
0x2c137178 06d0       beq       #0x2c137188
0x2c13717a 2846       mov       r0, r5
0x2c13717c 21f71efb   bl        #0x2c0587bc
0x2c137180 2946       mov       r1, r5
0x2c137182 3046       mov       r0, r6
0x2c137184 fdf7aafb   bl        #0x2c1348dc
0x2c137188 314d       ldr       r5, [pc, #0xc4] ; [0x2c137250]=0x2005882c
0x2c13718a 2d4a       ldr       r2, [pc, #0xb4] ; [0x2c137240]=0x2c1ee794 'app_bt_stream_volumeup_generic'
0x2c13718c 2b78       ldrb      r3, [r5]
0x2c13718e 3349       ldr       r1, [pc, #0xcc] ; [0x2c13725c]=0x2c1ee825 '%s a2dp: %d'
0x2c137190 4320       movs      r0, #0x43
0x2c137192 0bf081fe   bl        #0x2c142e98
0x2c137196 6b78       ldrb      r3, [r5, #1]
0x2c137198 294a       ldr       r2, [pc, #0xa4] ; [0x2c137240]=0x2c1ee794 'app_bt_stream_volumeup_generic'
0x2c13719a 3149       ldr       r1, [pc, #0xc4] ; [0x2c137260]=0x2c1ee831 '%s hfp: %d'
0x2c13719c 4320       movs      r0, #0x43
0x2c13719e 0bf07bfe   bl        #0x2c142e98
0x2c1371a2 a7f715f8   bl        #0x2c0de1d0
0x2c1371a6 47e0       b         #0x2c137238
0x2c1371a8 2046       mov       r0, r4
0x2c1371aa aef75bfb   bl        #0x2c0e5864
0x2c1371ae 0e28       cmp       r0, #0xe
0x2c1371b0 97bf       itett     ls
0x2c1371b2 0130       addls     r0, #1
0x2c1371b4 0f20       movhi     r0, #0xf
0x2c1371b6 c0b2       uxtbls    r0, r0
0x2c1371b8 4ff0ff36   movls.w   r6, #-1
0x2c1371bc 88bf       it        hi
0x2c1371be 1d26       movhi     r6, #0x1d
0x2c1371c0 aef79afb   bl        #0x2c0e58f8
0x2c1371c4 0446       mov       r4, r0
0x2c1371c6 bee7       b         #0x2c137146
0x2c1371c8 3226       movs      r6, #0x32
0x2c1371ca bce7       b         #0x2c137146
0x2c1371cc 3226       movs      r6, #0x32
0x2c1371ce 9be7       b         #0x2c137108
0x2c1371d0 4ff0ff36   mov.w     r6, #-1
0x2c1371d4 98e7       b         #0x2c137108
0x2c1371d6 a87a       ldrb      r0, [r5, #0xa]
0x2c1371d8 b4f766f9   bl        #0x2c0eb4a8
0x2c1371dc 7e28       cmp       r0, #0x7e
0x2c1371de 8ebf       itee      hi
0x2c1371e0 7f24       movhi     r4, #0x7f
0x2c1371e2 0130       addls     r0, #1
0x2c1371e4 c4b2       uxtbls    r4, r0
0x2c1371e6 2146       mov       r1, r4
0x2c1371e8 a87a       ldrb      r0, [r5, #0xa]
0x2c1371ea 94bf       ite       ls
0x2c1371ec 4ff0ff36   movls.w   r6, #-1
0x2c1371f0 1d26       movhi     r6, #0x1d
0x2c1371f2 b4f767fc   bl        #0x2c0ebac4
0x2c1371f6 2046       mov       r0, r4
0x2c1371f8 b4f744fc   bl        #0x2c0eba84
0x2c1371fc 0446       mov       r4, r0
0x2c1371fe 87e7       b         #0x2c137110
0x2c137200 ff24       movs      r4, #0xff
0x2c137202 c1e7       b         #0x2c137188
0x2c137204 002a       cmp       r2, #0
0x2c137206 3ff43eaf   beq.w     #0x2c137086
0x2c13720a 1649       ldr       r1, [pc, #0x58] ; [0x2c137264]=0x2c1ee772 '[STRM_PLAYER][VOL][UP] hfp volume'
0x2c13720c 40f24140   movw      r0, #0x441
0x2c137210 0bf042fe   bl        #0x2c142e98
0x2c137214 f5f7aefe   bl        #0x2c12cf74
0x2c137218 4078       ldrb      r0, [r0, #1]
0x2c13721a b0f733f8   bl        #0x2c0e7284
0x2c13721e 0546       mov       r5, r0
0x2c137220 0028       cmp       r0, #0
0x2c137222 7ff47aaf   bne.w     #0x2c13711a
0x2c137226 00f02bfc   bl        #0x2c137a80
0x2c13722a 054a       ldr       r2, [pc, #0x14] ; [0x2c137240]=0x2c1ee794 'app_bt_stream_volumeup_generic'
0x2c13722c 0346       mov       r3, r0
0x2c13722e 0e49       ldr       r1, [pc, #0x38] ; [0x2c137268]=0x2c1ee7b3 '%s invalid sco id %x'
0x2c137230 4320       movs      r0, #0x43
0x2c137232 0bf031fe   bl        #0x2c142e98
0x2c137236 ff24       movs      r4, #0xff
0x2c137238 2046       mov       r0, r4
0x2c13723a bde8f081   pop.w     {r4, r5, r6, r7, r8, pc}
0x2c13723e 00bf       nop       
0x2c137240 94e7       b         #0x2c13716c
0x2c137242 1e2c       cmp       r4, #0x1e
0x2c137244 e7e7       b         #0x2c137216
0x2c137246 1e2c       cmp       r4, #0x1e
0x2c137248 fce7       b         #0x2c137244
0x2c13724a 1e2c       cmp       r4, #0x1e
0x2c13724c 0fe8       .byte     0x0f, 0xe8
0x2c13724e 1e2c       cmp       r4, #0x1e
0x2c137250 2c88       ldrh      r4, [r5]
0x2c137252 0520       movs      r0, #5
0x2c137254 c8e7       b         #0x2c1371e8
0x2c137256 1e2c       cmp       r4, #0x1e
0x2c137258 dde7       b         #0x2c137216
0x2c13725a 1e2c       cmp       r4, #0x1e
0x2c13725c 25e8       .byte     0x25, 0xe8
0x2c13725e 1e2c       cmp       r4, #0x1e
0x2c137260 31e8       .byte     0x31, 0xe8
0x2c137262 1e2c       cmp       r4, #0x1e
0x2c137264 72e7       b         #0x2c13714c
0x2c137266 1e2c       cmp       r4, #0x1e
0x2c137268 b3e7       b         #0x2c1371d2
0x2c13726a 1e2c       cmp       r4, #0x1e
0x2c13726c 0120       movs      r0, #1
0x2c13726e fff7dfbe   b.w       #0x2c137030
0x2c137272 0000       movs      r0, r0
0x2c137274 10f0010f   tst.w     r0, #1
0x2c137278 70b5       push      {r4, r5, r6, lr}
0x2c13727a 0646       mov       r6, r0
0x2c13727c 0d46       mov       r5, r1
0x2c13727e 2d4c       ldr       r4, [pc, #0xb4] ; [0x2c137334]=0x20058828
0x2c137280 1fd0       beq       #0x2c1372c2
0x2c137282 0120       movs      r0, #1
0x2c137284 fff772fd   bl        #0x2c136d6c
0x2c137288 d8b1       cbz       r0, #0x2c1372c2
0x2c13728a 40f24140   movw      r0, #0x441
0x2c13728e 2a49       ldr       r1, [pc, #0xa8] ; [0x2c137338]=0x2c1ee83c '[STRM_PLAYER][VOL] set hfp volume'
0x2c137290 0bf002fe   bl        #0x2c142e98
0x2c137294 0f2d       cmp       r5, #0xf
0x2c137296 0ad8       bhi       #0x2c1372ae
0x2c137298 a6f7fcfc   bl        #0x2c0ddc94
0x2c13729c 2368       ldr       r3, [r4]
0x2c13729e 5d70       strb      r5, [r3, #1]
0x2c1372a0 a6f71afd   bl        #0x2c0ddcd8
0x2c1372a4 2368       ldr       r3, [r4]
0x2c1372a6 93f90100   ldrsb.w   r0, [r3, #1]
0x2c1372aa fff7a5fe   bl        #0x2c136ff8
0x2c1372ae 2368       ldr       r3, [r4]
0x2c1372b0 5b78       ldrb      r3, [r3, #1]
0x2c1372b2 33b9       cbnz      r3, #0x2c1372c2
0x2c1372b4 7df7c0fa   bl        #0x2c0b4838
0x2c1372b8 0146       mov       r1, r0
0x2c1372ba 10b9       cbnz      r0, #0x2c1372c2
0x2c1372bc 1d20       movs      r0, #0x1d
0x2c1372be fdf70dfb   bl        #0x2c1348dc
0x2c1372c2 3307       lsls      r3, r6, #0x1c
0x2c1372c4 23d5       bpl       #0x2c13730e
0x2c1372c6 0020       movs      r0, #0
0x2c1372c8 fff750fd   bl        #0x2c136d6c
0x2c1372cc 18b9       cbnz      r0, #0x2c1372d6
0x2c1372ce 0820       movs      r0, #8
0x2c1372d0 fff74cfd   bl        #0x2c136d6c
0x2c1372d4 d8b1       cbz       r0, #0x2c13730e
0x2c1372d6 40f24140   movw      r0, #0x441
0x2c1372da 1849       ldr       r1, [pc, #0x60] ; [0x2c13733c]=0x2c1ee85e '[STRM_PLAYER][VOL] set a2dp volume'
0x2c1372dc 0bf0dcfd   bl        #0x2c142e98
0x2c1372e0 0f2d       cmp       r5, #0xf
0x2c1372e2 0ad8       bhi       #0x2c1372fa
0x2c1372e4 a6f7d6fc   bl        #0x2c0ddc94
0x2c1372e8 2368       ldr       r3, [r4]
0x2c1372ea 1d70       strb      r5, [r3]
0x2c1372ec a6f7f4fc   bl        #0x2c0ddcd8
0x2c1372f0 2368       ldr       r3, [r4]
0x2c1372f2 93f90000   ldrsb.w   r0, [r3]
0x2c1372f6 fff77ffe   bl        #0x2c136ff8
0x2c1372fa 2368       ldr       r3, [r4]
0x2c1372fc 1b78       ldrb      r3, [r3]
0x2c1372fe 33b9       cbnz      r3, #0x2c13730e
0x2c137300 7df79afa   bl        #0x2c0b4838
0x2c137304 0146       mov       r1, r0
0x2c137306 10b9       cbnz      r0, #0x2c13730e
0x2c137308 1d20       movs      r0, #0x1d
0x2c13730a fdf7e7fa   bl        #0x2c1348dc
0x2c13730e 2368       ldr       r3, [r4]
0x2c137310 0b49       ldr       r1, [pc, #0x2c] ; [0x2c137340]=0x2c1ee881 '[STRM_PLAYER][VOL] a2dp: %d'
0x2c137312 1a78       ldrb      r2, [r3]
0x2c137314 40f24240   movw      r0, #0x442
0x2c137318 0bf0befd   bl        #0x2c142e98
0x2c13731c 2368       ldr       r3, [r4]
0x2c13731e 40f24240   movw      r0, #0x442
0x2c137322 5a78       ldrb      r2, [r3, #1]
0x2c137324 0749       ldr       r1, [pc, #0x1c] ; [0x2c137344]=0x2c1ee89d '[STRM_PLAYER][VOL] hfp: %d'
0x2c137326 0bf0b7fd   bl        #0x2c142e98
0x2c13732a bde87040   pop.w     {r4, r5, r6, lr}
0x2c13732e a6f74fbf   b.w       #0x2c0de1d0
0x2c137332 00bf       nop       
0x2c137334 2888       ldrh      r0, [r5]
0x2c137336 0520       movs      r0, #5
0x2c137338 3ce8       .byte     0x3c, 0xe8
0x2c13733a 1e2c       cmp       r4, #0x1e
0x2c13733c 5ee8       .byte     0x5e, 0xe8
0x2c13733e 1e2c       cmp       r4, #0x1e
0x2c137340 81e8       .byte     0x81, 0xe8
0x2c137342 1e2c       cmp       r4, #0x1e
0x2c137344 9de81e2c   ldm.w     sp, {r1, r2, r3, r4, sl, fp, sp}
0x2c137348 2de9f041   push.w    {r4, r5, r6, r7, r8, lr}
0x2c13734c 8046       mov       r8, r0
0x2c13734e 0120       movs      r0, #1
0x2c137350 fff70cfd   bl        #0x2c136d6c
0x2c137354 0246       mov       r2, r0
0x2c137356 68bb       cbnz      r0, #0x2c1373b4
0x2c137358 0220       movs      r0, #2
0x2c13735a fff707fd   bl        #0x2c136d6c
0x2c13735e 0746       mov       r7, r0
0x2c137360 18b9       cbnz      r0, #0x2c13736a
0x2c137362 0420       movs      r0, #4
0x2c137364 fff702fd   bl        #0x2c136d6c
0x2c137368 0746       mov       r7, r0
0x2c13736a 0820       movs      r0, #8
0x2c13736c fff7fefc   bl        #0x2c136d6c
0x2c137370 0646       mov       r6, r0
0x2c137372 0028       cmp       r0, #0
0x2c137374 40f0e680   bne.w     #0x2c137544
0x2c137378 1020       movs      r0, #0x10
0x2c13737a fff7f7fc   bl        #0x2c136d6c
0x2c13737e 0646       mov       r6, r0
0x2c137380 18b9       cbnz      r0, #0x2c13738a
0x2c137382 2020       movs      r0, #0x20
0x2c137384 fff7f2fc   bl        #0x2c136d6c
0x2c137388 0646       mov       r6, r0
0x2c13738a 002a       cmp       r2, #0
0x2c13738c 72d0       beq       #0x2c137474
0x2c13738e f5f7f1fd   bl        #0x2c12cf74
0x2c137392 4078       ldrb      r0, [r0, #1]
0x2c137394 aff776ff   bl        #0x2c0e7284
0x2c137398 0546       mov       r5, r0
0x2c13739a 68b9       cbnz      r0, #0x2c1373b8
0x2c13739c 00f070fb   bl        #0x2c137a80
0x2c1373a0 6a4a       ldr       r2, [pc, #0x1a8] ; [0x2c13754c]=0x2c1ee8b8 'app_bt_stream_volumedown_generic'
0x2c1373a2 0346       mov       r3, r0
0x2c1373a4 6a49       ldr       r1, [pc, #0x1a8] ; [0x2c137550]=0x2c1ee7b3 '%s invalid sco id %x'
0x2c1373a6 4320       movs      r0, #0x43
0x2c1373a8 0bf076fd   bl        #0x2c142e98
0x2c1373ac ff24       movs      r4, #0xff
0x2c1373ae 2046       mov       r0, r4
0x2c1373b0 bde8f081   pop.w     {r4, r5, r6, r7, r8, pc}
0x2c1373b4 0746       mov       r7, r0
0x2c1373b6 d8e7       b         #0x2c13736a
0x2c1373b8 644a       ldr       r2, [pc, #0x190] ; [0x2c13754c]=0x2c1ee8b8 'app_bt_stream_volumedown_generic'
0x2c1373ba 6649       ldr       r1, [pc, #0x198] ; [0x2c137554]=0x2c1ee8d9 '%s set hfp volume'
0x2c1373bc 4220       movs      r0, #0x42
0x2c1373be 0bf06bfd   bl        #0x2c142e98
0x2c1373c2 a87a       ldrb      r0, [r5, #0xa]
0x2c1373c4 aef7e6f9   bl        #0x2c0e5794
0x2c1373c8 0128       cmp       r0, #1
0x2c1373ca 0446       mov       r4, r0
0x2c1373cc 05d8       bhi       #0x2c1373da
0x2c1373ce 6249       ldr       r1, [pc, #0x188] ; [0x2c137558]=0x2c1ee8eb 'hfp vol already min!'
0x2c1373d0 4120       movs      r0, #0x41
0x2c1373d2 0bf061fd   bl        #0x2c142e98
0x2c1373d6 fdf73bfc   bl        #0x2c134c50
0x2c1373da b8f1000f   cmp.w     r8, #0
0x2c1373de 39d0       beq       #0x2c137454
0x2c1373e0 1cb1       cbz       r4, #0x2c1373ea
0x2c1373e2 013c       subs      r4, #1
0x2c1373e4 e4b2       uxtb      r4, r4
0x2c1373e6 012c       cmp       r4, #1
0x2c1373e8 42d8       bhi       #0x2c137470
0x2c1373ea fdf731fc   bl        #0x2c134c50
0x2c1373ee 0124       movs      r4, #1
0x2c1373f0 3126       movs      r6, #0x31
0x2c1373f2 2146       mov       r1, r4
0x2c1373f4 a87a       ldrb      r0, [r5, #0xa]
0x2c1373f6 aef747fa   bl        #0x2c0e5888
0x2c1373fa 584b       ldr       r3, [pc, #0x160] ; [0x2c13755c]=0x2005882c
0x2c1373fc 5c70       strb      r4, [r3, #1]
0x2c1373fe 60b2       sxtb      r0, r4
0x2c137400 fff7fafd   bl        #0x2c136ff8
0x2c137404 ac7a       ldrb      r4, [r5, #0xa]
0x2c137406 7df717fa   bl        #0x2c0b4838
0x2c13740a 0546       mov       r5, r0
0x2c13740c 90b9       cbnz      r0, #0x2c137434
0x2c13740e 731c       adds      r3, r6, #1
0x2c137410 10d0       beq       #0x2c137434
0x2c137412 3246       mov       r2, r6
0x2c137414 5249       ldr       r1, [pc, #0x148] ; [0x2c137560]=0x2c1ee7dd 'AUD_ID=%d'
0x2c137416 4220       movs      r0, #0x42
0x2c137418 0bf03efd   bl        #0x2c142e98
0x2c13741c 21f7d4f9   bl        #0x2c0587c8
0x2c137420 40b1       cbz       r0, #0x2c137434
0x2c137422 332e       cmp       r6, #0x33
0x2c137424 06d0       beq       #0x2c137434
0x2c137426 2846       mov       r0, r5
0x2c137428 21f7c8f9   bl        #0x2c0587bc
0x2c13742c 2946       mov       r1, r5
0x2c13742e 3046       mov       r0, r6
0x2c137430 fdf754fa   bl        #0x2c1348dc
0x2c137434 494d       ldr       r5, [pc, #0x124] ; [0x2c13755c]=0x2005882c
0x2c137436 454a       ldr       r2, [pc, #0x114] ; [0x2c13754c]=0x2c1ee8b8 'app_bt_stream_volumedown_generic'
0x2c137438 2b78       ldrb      r3, [r5]
0x2c13743a 4a49       ldr       r1, [pc, #0x128] ; [0x2c137564]=0x2c1ee825 '%s a2dp: %d'
0x2c13743c 4320       movs      r0, #0x43
0x2c13743e 0bf02bfd   bl        #0x2c142e98
0x2c137442 6b78       ldrb      r3, [r5, #1]
0x2c137444 414a       ldr       r2, [pc, #0x104] ; [0x2c13754c]=0x2c1ee8b8 'app_bt_stream_volumedown_generic'
0x2c137446 4849       ldr       r1, [pc, #0x120] ; [0x2c137568]=0x2c1ee831 '%s hfp: %d'
0x2c137448 4320       movs      r0, #0x43
0x2c13744a 0bf025fd   bl        #0x2c142e98
0x2c13744e a6f7bffe   bl        #0x2c0de1d0
0x2c137452 ace7       b         #0x2c1373ae
0x2c137454 2046       mov       r0, r4
0x2c137456 aef705fa   bl        #0x2c0e5864
0x2c13745a 38b1       cbz       r0, #0x2c13746c
0x2c13745c 4ff0ff36   mov.w     r6, #-1
0x2c137460 0138       subs      r0, #1
0x2c137462 c0b2       uxtb      r0, r0
0x2c137464 aef748fa   bl        #0x2c0e58f8
0x2c137468 0446       mov       r4, r0
0x2c13746a c2e7       b         #0x2c1373f2
0x2c13746c 1d26       movs      r6, #0x1d
0x2c13746e f9e7       b         #0x2c137464
0x2c137470 3326       movs      r6, #0x33
0x2c137472 bee7       b         #0x2c1373f2
0x2c137474 1046       mov       r0, r2
0x2c137476 fff779fc   bl        #0x2c136d6c
0x2c13747a 0028       cmp       r0, #0
0x2c13747c 4ad0       beq       #0x2c137514
0x2c13747e f5f779fd   bl        #0x2c12cf74
0x2c137482 4078       ldrb      r0, [r0, #1]
0x2c137484 aff7fefe   bl        #0x2c0e7284
0x2c137488 0546       mov       r5, r0
0x2c13748a b0b9       cbnz      r0, #0x2c1374ba
0x2c13748c 00f0f2fa   bl        #0x2c137a74
0x2c137490 2e4a       ldr       r2, [pc, #0xb8] ; [0x2c13754c]=0x2c1ee8b8 'app_bt_stream_volumedown_generic'
0x2c137492 0346       mov       r3, r0
0x2c137494 3549       ldr       r1, [pc, #0xd4] ; [0x2c13756c]=0x2c1ee7e7 '%s invalid sbc id %x'
0x2c137496 4320       movs      r0, #0x43
0x2c137498 0bf0fefc   bl        #0x2c142e98
0x2c13749c f5f76afd   bl        #0x2c12cf74
0x2c1374a0 0378       ldrb      r3, [r0]
0x2c1374a2 012b       cmp       r3, #1
0x2c1374a4 82d1       bne       #0x2c1373ac
0x2c1374a6 4078       ldrb      r0, [r0, #1]
0x2c1374a8 ff28       cmp       r0, #0xff
0x2c1374aa 3ff47faf   beq.w     #0x2c1373ac
0x2c1374ae aff7e9fe   bl        #0x2c0e7284
0x2c1374b2 0546       mov       r5, r0
0x2c1374b4 0028       cmp       r0, #0
0x2c1374b6 3ff479af   beq.w     #0x2c1373ac
0x2c1374ba 244a       ldr       r2, [pc, #0x90] ; [0x2c13754c]=0x2c1ee8b8 'app_bt_stream_volumedown_generic'
0x2c1374bc 2c49       ldr       r1, [pc, #0xb0] ; [0x2c137570]=0x2c1ee7fc '%s set a2dp volume'
0x2c1374be 4220       movs      r0, #0x42
0x2c1374c0 0bf0eafc   bl        #0x2c142e98
0x2c1374c4 a87a       ldrb      r0, [r5, #0xa]
0x2c1374c6 b3f7e7fe   bl        #0x2c0eb298
0x2c1374ca 0446       mov       r4, r0
0x2c1374cc 20bb       cbnz      r0, #0x2c137518
0x2c1374ce 2949       ldr       r1, [pc, #0xa4] ; [0x2c137574]=0x2c1ee900 'a2dp vol already min!'
0x2c1374d0 4120       movs      r0, #0x41
0x2c1374d2 0bf0e1fc   bl        #0x2c142e98
0x2c1374d6 fdf7bbfb   bl        #0x2c134c50
0x2c1374da b8f1000f   cmp.w     r8, #0
0x2c1374de 1ed0       beq       #0x2c13751e
0x2c1374e0 97b9       cbnz      r7, #0x2c137508
0x2c1374e2 002e       cmp       r6, #0
0x2c1374e4 3c46       mov       r4, r7
0x2c1374e6 14bf       ite       ne
0x2c1374e8 4ff0ff36   movne.w   r6, #-1
0x2c1374ec 3126       moveq     r6, #0x31
0x2c1374ee 04e0       b         #0x2c1374fa
0x2c1374f0 013c       subs      r4, #1
0x2c1374f2 14f0ff04   ands      r4, r4, #0xff
0x2c1374f6 f3d0       beq       #0x2c1374e0
0x2c1374f8 3326       movs      r6, #0x33
0x2c1374fa 2146       mov       r1, r4
0x2c1374fc a87a       ldrb      r0, [r5, #0xa]
0x2c1374fe b4f70bfb   bl        #0x2c0ebb18
0x2c137502 164b       ldr       r3, [pc, #0x58] ; [0x2c13755c]=0x2005882c
0x2c137504 1c70       strb      r4, [r3]
0x2c137506 7ae7       b         #0x2c1373fe
0x2c137508 0024       movs      r4, #0
0x2c13750a 4ff0ff36   mov.w     r6, #-1
0x2c13750e f4e7       b         #0x2c1374fa
0x2c137510 1d26       movs      r6, #0x1d
0x2c137512 0ee0       b         #0x2c137532
0x2c137514 ff24       movs      r4, #0xff
0x2c137516 8de7       b         #0x2c137434
0x2c137518 b8f1000f   cmp.w     r8, #0
0x2c13751c e8d1       bne       #0x2c1374f0
0x2c13751e a87a       ldrb      r0, [r5, #0xa]
0x2c137520 b3f7c2ff   bl        #0x2c0eb4a8
0x2c137524 0446       mov       r4, r0
0x2c137526 0028       cmp       r0, #0
0x2c137528 f2d0       beq       #0x2c137510
0x2c13752a 4ff0ff36   mov.w     r6, #-1
0x2c13752e 441e       subs      r4, r0, #1
0x2c137530 e4b2       uxtb      r4, r4
0x2c137532 2146       mov       r1, r4
0x2c137534 a87a       ldrb      r0, [r5, #0xa]
0x2c137536 b4f7c5fa   bl        #0x2c0ebac4
0x2c13753a 2046       mov       r0, r4
0x2c13753c b4f7a2fa   bl        #0x2c0eba84
0x2c137540 0446       mov       r4, r0
0x2c137542 dee7       b         #0x2c137502
0x2c137544 002a       cmp       r2, #0
0x2c137546 7ff422af   bne.w     #0x2c13738e
0x2c13754a 98e7       b         #0x2c13747e
0x2c13754c b8e81e2c   ldm.w     r8!, {r1, r2, r3, r4, sl, fp, sp}
0x2c137550 b3e7       b         #0x2c1374ba
0x2c137552 1e2c       cmp       r4, #0x1e
0x2c137554 d9e8       .byte     0xd9, 0xe8
0x2c137556 1e2c       cmp       r4, #0x1e
0x2c137558 ebe81e2c   strd      r2, ip, [fp], #0x78
0x2c13755c 2c88       ldrh      r4, [r5]
0x2c13755e 0520       movs      r0, #5
0x2c137560 dde7       b         #0x2c13751e
0x2c137562 1e2c       cmp       r4, #0x1e
0x2c137564 25e8       .byte     0x25, 0xe8
0x2c137566 1e2c       cmp       r4, #0x1e
0x2c137568 31e8       .byte     0x31, 0xe8
0x2c13756a 1e2c       cmp       r4, #0x1e
0x2c13756c e7e7       b         #0x2c13753e
0x2c13756e 1e2c       cmp       r4, #0x1e
0x2c137570 fce7       b         #0x2c13756c
0x2c137572 1e2c       cmp       r4, #0x1e
0x2c137574 00e9       .byte     0x00, 0xe9
0x2c137576 1e2c       cmp       r4, #0x1e
