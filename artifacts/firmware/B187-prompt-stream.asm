0x2c1340f8 2de9f04f   push.w    {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c1340fc 0027       movs      r7, #0
0x2c1340fe b64b       ldr       r3, [pc, #0x2d8] ; [0x2c1343d8]=0x20005600
0x2c134100 b64e       ldr       r6, [pc, #0x2d8] ; [0x2c1343dc]=0x200586c4
0x2c134102 b74a       ldr       r2, [pc, #0x2dc] ; [0x2c1343e0]=0x2c185287 'start'
0x2c134104 051e       subs      r5, r0, #0
0x2c134106 99b0       sub       sp, #0x64
0x2c134108 1b68       ldr       r3, [r3]
0x2c13410a 1793       str       r3, [sp, #0x5c]
0x2c13410c 4ff00003   mov.w     r3, #0
0x2c134110 96f800c0   ldrb.w    ip, [r6]
0x2c134114 b34b       ldr       r3, [pc, #0x2cc] ; [0x2c1343e4]=0x2c187a9d
0x2c134116 0c46       mov       r4, r1
0x2c134118 18bf       it        ne
0x2c13411a 1346       movne     r3, r2
0x2c13411c b249       ldr       r1, [pc, #0x2c8] ; [0x2c1343e8]=0x2c1b5636
0x2c13411e b34a       ldr       r2, [pc, #0x2cc] ; [0x2c1343ec]=0x2c1b562e 'Running'
0x2c134120 4320       movs      r0, #0x43
0x2c134122 bc45       cmp       ip, r7
0x2c134124 08bf       it        eq
0x2c134126 0a46       moveq     r2, r1
0x2c134128 b149       ldr       r1, [pc, #0x2c4] ; [0x2c1343f0]=0x2c1b563b 'Audio prompt stream state %s, to %s it'
0x2c13412a 0897       str       r7, [sp, #0x20]
0x2c13412c 0ef0b4fe   bl        #0x2c142e98
0x2c134130 3378       ldrb      r3, [r6]
0x2c134132 ab42       cmp       r3, r5
0x2c134134 00f08680   beq.w     #0x2c134244
0x2c134138 dff82493   ldr.w     sb, [pc, #0x324] ; [0x2c134460]=0x2001eddc
0x2c13413c 002d       cmp       r5, #0
0x2c13413e 00f0a681   beq.w     #0x2c13448e
0x2c134142 0721       movs      r1, #7
0x2c134144 1420       movs      r0, #0x14
0x2c134146 77f733f8   bl        #0x2c0ab1b0
0x2c13414a d4f808b0   ldr.w     fp, [r4, #8]
0x2c13414e a94b       ldr       r3, [pc, #0x2a4] ; [0x2c1343f4]=0x200586ea
0x2c134150 1bf4805f   tst.w     fp, #0x1000
0x2c134154 93f80080   ldrb.w    r8, [r3]
0x2c134158 cbf30033   ubfx      r3, fp, #0xc, #1
0x2c13415c 18bf       it        ne
0x2c13415e 9846       movne     r8, r3
0x2c134160 0bf4c043   and       r3, fp, #0x6000
0x2c134164 5ffa8bf4   uxtb.w    r4, fp
0x2c134168 a9f80030   strh.w    r3, [sb]
0x2c13416c a24b       ldr       r3, [pc, #0x288] ; [0x2c1343f8]=0x200586ce
0x2c13416e 2046       mov       r0, r4
0x2c134170 1c80       strh      r4, [r3]
0x2c134172 fff75ff8   bl        #0x2c133234
0x2c134176 b9f80020   ldrh.w    r2, [sb]
0x2c13417a 0bf47f4a   and       sl, fp, #0xff00
0x2c13417e 0346       mov       r3, r0
0x2c134180 cde900a2   strd      sl, r2, [sp]
0x2c134184 4520       movs      r0, #0x45
0x2c134186 5a46       mov       r2, fp
0x2c134188 9c49       ldr       r1, [pc, #0x270] ; [0x2c1343fc]=0x2c1b5662 'aud_id:%04x %s aud_pram:%04x chnlsel:%d'
0x2c13418a 0ef085fe   bl        #0x2c142e98
0x2c13418e 162c       cmp       r4, #0x16
0x2c134190 9b4b       ldr       r3, [pc, #0x26c] ; [0x2c134400]=0x200586c8
0x2c134192 30d1       bne       #0x2c1341f6
0x2c134194 0122       movs      r2, #1
0x2c134196 1a60       str       r2, [r3]
0x2c134198 9a4b       ldr       r3, [pc, #0x268] ; [0x2c134404]=0x2005862c
0x2c13419a 1968       ldr       r1, [r3]
0x2c13419c 11b1       cbz       r1, #0x2c1341a4
0x2c13419e 9a48       ldr       r0, [pc, #0x268] ; [0x2c134408]=0x2c1b5459 'media map invalide'
0x2c1341a0 0ef07afd   bl        #0x2c142c98
0x2c1341a4 994b       ldr       r3, [pc, #0x264] ; [0x2c13440c]=0x20058668
0x2c1341a6 9a4a       ldr       r2, [pc, #0x268] ; [0x2c134410]=0x2c1c6050
0x2c1341a8 dff8b892   ldr.w     sb, [pc, #0x2b8] ; [0x2c134464]=0x20058630
0x2c1341ac 1a60       str       r2, [r3]
0x2c1341ae 4846       mov       r0, sb
0x2c1341b0 2022       movs      r2, #0x20
0x2c1341b2 0591       str       r1, [sp, #0x14]
0x2c1341b4 0ef050ff   bl        #0x2c143058
0x2c1341b8 9648       ldr       r0, [pc, #0x258] ; [0x2c134414]=0x200586b0
0x2c1341ba 0cf075fd   bl        #0x2c140ca8
0x2c1341be 0599       ldr       r1, [sp, #0x14]
0x2c1341c0 4f46       mov       r7, sb
0x2c1341c2 0a46       mov       r2, r1
0x2c1341c4 dff84cb2   ldr.w     fp, [pc, #0x24c] ; [0x2c134414]=0x200586b0
0x2c1341c8 47f80c0b   str       r0, [r7], #0xc
0x2c1341cc d9f80000   ldr.w     r0, [sb]
0x2c1341d0 9149       ldr       r1, [pc, #0x244] ; [0x2c134418]=0x2c1b568a 'media_PlayNumber, pCont_context.g_play_continue_array[%d] = %d, total =%d'
0x2c1341d2 9042       cmp       r0, r2
0x2c1341d4 28d9       bls       #0x2c134228
0x2c1341d6 142a       cmp       r2, #0x14
0x2c1341d8 26d0       beq       #0x2c134228
0x2c1341da 1bf9013b   ldrsb     r3, [fp], #1
0x2c1341de 0592       str       r2, [sp, #0x14]
0x2c1341e0 303b       subs      r3, #0x30
0x2c1341e2 dbb2       uxtb      r3, r3
0x2c1341e4 07f8013b   strb      r3, [r7], #1
0x2c1341e8 0090       str       r0, [sp]
0x2c1341ea 4420       movs      r0, #0x44
0x2c1341ec 0ef054fe   bl        #0x2c142e98
0x2c1341f0 059a       ldr       r2, [sp, #0x14]
0x2c1341f2 0132       adds      r2, #1
0x2c1341f4 eae7       b         #0x2c1341cc
0x2c1341f6 894a       ldr       r2, [pc, #0x224] ; [0x2c13441c]=0x20058670
0x2c1341f8 2046       mov       r0, r4
0x2c1341fa 1760       str       r7, [r2]
0x2c1341fc 8849       ldr       r1, [pc, #0x220] ; [0x2c134420]=0x2005866c
0x2c1341fe 894a       ldr       r2, [pc, #0x224] ; [0x2c134424]=0x2005867c
0x2c134200 1f60       str       r7, [r3]
0x2c134202 fff787fc   bl        #0x2c133b14
0x2c134206 282c       cmp       r4, #0x28
0x2c134208 09d0       beq       #0x2c13421e
0x2c13420a 2e2c       cmp       r4, #0x2e
0x2c13420c 0cd1       bne       #0x2c134228
0x2c13420e 6ef7a9fa   bl        #0x2c0a2764
0x2c134212 0122       movs      r2, #1
0x2c134214 844b       ldr       r3, [pc, #0x210] ; [0x2c134428]=0x200586e9
0x2c134216 1a70       strb      r2, [r3]
0x2c134218 844b       ldr       r3, [pc, #0x210] ; [0x2c13442c]=0x2001ede4
0x2c13421a 1c60       str       r4, [r3]
0x2c13421c 04e0       b         #0x2c134228
0x2c13421e 6df719fe   bl        #0x2c0a1e54
0x2c134222 3846       mov       r0, r7
0x2c134224 6df710fe   bl        #0x2c0a1e48
0x2c134228 814b       ldr       r3, [pc, #0x204] ; [0x2c134430]=0x2001edd8
0x2c13422a dff8f891   ldr.w     sb, [pc, #0x1f8] ; [0x2c134424]=0x2005867c
0x2c13422e 1c60       str       r4, [r3]
0x2c134230 d9f80030   ldr.w     r3, [sb]
0x2c134234 83b9       cbnz      r3, #0x2c134258
0x2c134236 0122       movs      r2, #1
0x2c134238 0721       movs      r1, #7
0x2c13423a 3270       strb      r2, [r6]
0x2c13423c 8020       movs      r0, #0x80
0x2c13423e 1a46       mov       r2, r3
0x2c134240 77f7e6ff   bl        #0x2c0ac210
0x2c134244 644b       ldr       r3, [pc, #0x190] ; [0x2c1343d8]=0x20005600
0x2c134246 1a68       ldr       r2, [r3]
0x2c134248 179b       ldr       r3, [sp, #0x5c]
0x2c13424a 5a40       eors      r2, r3
0x2c13424c 4ff00003   mov.w     r3, #0
0x2c134250 00f06181   beq.w     #0x2c134516
0x2c134254 52f754fe   bl        #0x2c086f00
0x2c134258 764f       ldr       r7, [pc, #0x1d8] ; [0x2c134434]=0x20058674
0x2c13425a 2821       movs      r1, #0x28
0x2c13425c 0220       movs      r0, #2
0x2c13425e fef76bfa   bl        #0x2c132738
0x2c134262 77f753fe   bl        #0x2c0abf0c
0x2c134266 fff75dfa   bl        #0x2c133724
0x2c13426a 3868       ldr       r0, [r7]
0x2c13426c 0ef0c4fb   bl        #0x2c1429f8
0x2c134270 6b4b       ldr       r3, [pc, #0x1ac] ; [0x2c134420]=0x2005866c
0x2c134272 09a9       add       r1, sp, #0x24
0x2c134274 1b68       ldr       r3, [r3]
0x2c134276 3868       ldr       r0, [r7]
0x2c134278 0993       str       r3, [sp, #0x24]
0x2c13427a b9f80030   ldrh.w    r3, [sb]
0x2c13427e adf82830   strh.w    r3, [sp, #0x28]
0x2c134282 adf82a30   strh.w    r3, [sp, #0x2a]
0x2c134286 0ff09ff8   bl        #0x2c1433c8
0x2c13428a 0ba9       add       r1, sp, #0x2c
0x2c13428c 3868       ldr       r0, [r7]
0x2c13428e 0ef04bff   bl        #0x2c143128
0x2c134292 2422       movs      r2, #0x24
0x2c134294 0021       movs      r1, #0
0x2c134296 0ea8       add       r0, sp, #0x38
0x2c134298 0ef0defe   bl        #0x2c143058
0x2c13429c 664b       ldr       r3, [pc, #0x198] ; [0x2c134438]=0x2001ede0
0x2c13429e 372c       cmp       r4, #0x37
0x2c1342a0 1b68       ldr       r3, [r3]
0x2c1342a2 0f93       str       r3, [sp, #0x3c]
0x2c1342a4 654b       ldr       r3, [pc, #0x194] ; [0x2c13443c]=0xb031801
0x2c1342a6 1193       str       r3, [sp, #0x44]
0x2c1342a8 4ff00603   mov.w     r3, #6
0x2c1342ac 8df84f30   strb.w    r3, [sp, #0x4f]
0x2c1342b0 40f0e080   bne.w     #0x2c134474
0x2c1342b4 3af734fb   bl        #0x2c06e920
0x2c1342b8 0128       cmp       r0, #1
0x2c1342ba 40f08880   bne.w     #0x2c1343ce
0x2c1342be 1023       movs      r3, #0x10
0x2c1342c0 8df84f30   strb.w    r3, [sp, #0x4f]
0x2c1342c4 4ff40071   mov.w     r1, #0x200
0x2c1342c8 5d4b       ldr       r3, [pc, #0x174] ; [0x2c134440]=0xc133d91
0x2c1342ca 5e48       ldr       r0, [pc, #0x178] ; [0x2c134444]=0x20058678
0x2c1342cc 1493       str       r3, [sp, #0x50]
0x2c1342ce 5e4b       ldr       r3, [pc, #0x178] ; [0x2c134448]=0x200586f4
0x2c1342d0 1960       str       r1, [r3]
0x2c1342d2 4ff40063   mov.w     r3, #0x800
0x2c1342d6 1693       str       r3, [sp, #0x58]
0x2c1342d8 77f730fe   bl        #0x2c0abf3c
0x2c1342dc 1699       ldr       r1, [sp, #0x58]
0x2c1342de 08a8       add       r0, sp, #0x20
0x2c1342e0 77f72cfe   bl        #0x2c0abf3c
0x2c1342e4 089b       ldr       r3, [sp, #0x20]
0x2c1342e6 23f08063   bic       r3, r3, #0x4000000
0x2c1342ea 1593       str       r3, [sp, #0x54]
0x2c1342ec 70f752fd   bl        #0x2c0a4d94
0x2c1342f0 0228       cmp       r0, #2
0x2c1342f2 06d0       beq       #0x2c134302
0x2c1342f4 70f74efd   bl        #0x2c0a4d94
0x2c1342f8 0328       cmp       r0, #3
0x2c1342fa 02d0       beq       #0x2c134302
0x2c1342fc 0720       movs      r0, #7
0x2c1342fe 70f7bbfc   bl        #0x2c0a4c78
0x2c134302 169b       ldr       r3, [sp, #0x58]
0x2c134304 514a       ldr       r2, [pc, #0x144] ; [0x2c13444c]=0x2c1b56d4 'app_play_audio_onoff'
0x2c134306 0393       str       r3, [sp, #0xc]
0x2c134308 9df84430   ldrb.w    r3, [sp, #0x44]
0x2c13430c 5049       ldr       r1, [pc, #0x140] ; [0x2c134450]=0x2c1b56e9 '[%s]: aud %d sample rate: %d, bits: %d, channel number: %d, data size:%d'
0x2c13430e 0293       str       r3, [sp, #8]
0x2c134310 9df84530   ldrb.w    r3, [sp, #0x45]
0x2c134314 4720       movs      r0, #0x47
0x2c134316 0193       str       r3, [sp, #4]
0x2c134318 0f9b       ldr       r3, [sp, #0x3c]
0x2c13431a 0093       str       r3, [sp]
0x2c13431c 2346       mov       r3, r4
0x2c13431e 0ef0bbfd   bl        #0x2c142e98
0x2c134322 0021       movs      r1, #0
0x2c134324 0320       movs      r0, #3
0x2c134326 0eaa       add       r2, sp, #0x38
0x2c134328 fdf750fc   bl        #0x2c131bcc
0x2c13432c 9fed500a   vldr      s0, [pc, #0x140] ; [0x2c134470]=0x0
0x2c134330 0020       movs      r0, #0
0x2c134332 fef781fa   bl        #0x2c132838
0x2c134336 b8f1000f   cmp.w     r8, #0
0x2c13433a 40f0a680   bne.w     #0x2c13448a
0x2c13433e 454b       ldr       r3, [pc, #0x114] ; [0x2c134454]=0x2c1b5998
0x2c134340 2046       mov       r0, r4
0x2c134342 1b88       ldrh      r3, [r3]
0x2c134344 5146       mov       r1, sl
0x2c134346 07aa       add       r2, sp, #0x1c
0x2c134348 adf81c30   strh.w    r3, [sp, #0x1c]
0x2c13434c 83f7bcf8   bl        #0x2c0b74c8
0x2c134350 0446       mov       r4, r0
0x2c134352 294b       ldr       r3, [pc, #0xa4] ; [0x2c1343f8]=0x200586ce
0x2c134354 1888       ldrh      r0, [r3]
0x2c134356 fff7c5fe   bl        #0x2c1340e4
0x2c13435a 002c       cmp       r4, #0
0x2c13435c 0cbf       ite       eq
0x2c13435e 0122       moveq     r2, #1
0x2c134360 0022       movne     r2, #0
0x2c134362 3d4b       ldr       r3, [pc, #0xf4] ; [0x2c134458]=0x200586eb
0x2c134364 1a70       strb      r2, [r3]
0x2c134366 03d1       bne       #0x2c134370
0x2c134368 2146       mov       r1, r4
0x2c13436a 0320       movs      r0, #3
0x2c13436c fdf7a0fd   bl        #0x2c131eb0
0x2c134370 0024       movs      r4, #0
0x2c134372 2746       mov       r7, r4
0x2c134374 3570       strb      r5, [r6]
0x2c134376 dff8f080   ldr.w     r8, [pc, #0xf0] ; [0x2c134468]=0x2c1b5732 'Blocked user %d can be processed when prompt is completed'
0x2c13437a 384e       ldr       r6, [pc, #0xe0] ; [0x2c13445c]=0x20058680
0x2c13437c dff8ec90   ldr.w     sb, [pc, #0xec] ; [0x2c13446c]=0x2c1b576c 'Post prompt handling of user %d done'
0x2c134380 3378       ldrb      r3, [r6]
0x2c134382 7bb1       cbz       r3, #0x2c1343a4
0x2c134384 7368       ldr       r3, [r6, #4]
0x2c134386 3770       strb      r7, [r6]
0x2c134388 63b1       cbz       r3, #0x2c1343a4
0x2c13438a 2246       mov       r2, r4
0x2c13438c 4146       mov       r1, r8
0x2c13438e 4220       movs      r0, #0x42
0x2c134390 0ef082fd   bl        #0x2c142e98
0x2c134394 e0b2       uxtb      r0, r4
0x2c134396 7368       ldr       r3, [r6, #4]
0x2c134398 9847       blx       r3
0x2c13439a 2246       mov       r2, r4
0x2c13439c 4946       mov       r1, sb
0x2c13439e 4220       movs      r0, #0x42
0x2c1343a0 0ef07afd   bl        #0x2c142e98
0x2c1343a4 0134       adds      r4, #1
0x2c1343a6 062c       cmp       r4, #6
0x2c1343a8 06f10806   add.w     r6, r6, #8
0x2c1343ac e8d1       bne       #0x2c134380
0x2c1343ae 002d       cmp       r5, #0
0x2c1343b0 7ff448af   bne.w     #0x2c134244
0x2c1343b4 b7ee000a   vmov.f32  s0, #1.000000e+00
0x2c1343b8 fdf7b4fa   bl        #0x2c131924
0x2c1343bc 0e4b       ldr       r3, [pc, #0x38] ; [0x2c1343f8]=0x200586ce
0x2c1343be 1888       ldrh      r0, [r3]
0x2c1343c0 fff786fe   bl        #0x2c1340d0
0x2c1343c4 2946       mov       r1, r5
0x2c1343c6 1420       movs      r0, #0x14
0x2c1343c8 76f7f2fe   bl        #0x2c0ab1b0
0x2c1343cc 3ae7       b         #0x2c134244
0x2c1343ce 24f74bfd   bl        #0x2c058e68
0x2c1343d2 8df84f00   strb.w    r0, [sp, #0x4f]
0x2c1343d6 75e7       b         #0x2c1342c4
0x2c1343d8 0056       ldrsb     r0, [r0, r0]
0x2c1343da 0020       movs      r0, #0
0x2c1343dc c486       strh      r4, [r0, #0x36]
0x2c1343de 0520       movs      r0, #5
0x2c1343e0 8752       strh      r7, [r0, r2]
0x2c1343e2 182c       cmp       r4, #0x18
0x2c1343e4 9d7a       ldrb      r5, [r3, #0xa]
0x2c1343e6 182c       cmp       r4, #0x18
0x2c1343e8 3656       ldrsb     r6, [r6, r0]
0x2c1343ea 1b2c       cmp       r4, #0x1b
0x2c1343ec 2e56       ldrsb     r6, [r5, r0]
0x2c1343ee 1b2c       cmp       r4, #0x1b
0x2c1343f0 3b56       ldrsb     r3, [r7, r0]
0x2c1343f2 1b2c       cmp       r4, #0x1b
0x2c1343f4 ea86       strh      r2, [r5, #0x36]
0x2c1343f6 0520       movs      r0, #5
0x2c1343f8 ce86       strh      r6, [r1, #0x36]
0x2c1343fa 0520       movs      r0, #5
0x2c1343fc 6256       ldrsb     r2, [r4, r1]
0x2c1343fe 1b2c       cmp       r4, #0x1b
0x2c134400 c886       strh      r0, [r1, #0x36]
0x2c134402 0520       movs      r0, #5
0x2c134404 2c86       strh      r4, [r5, #0x30]
0x2c134406 0520       movs      r0, #5
0x2c134408 5954       strb      r1, [r3, r1]
0x2c13440a 1b2c       cmp       r4, #0x1b
0x2c13440c 6886       strh      r0, [r5, #0x32]
0x2c13440e 0520       movs      r0, #5
0x2c134410 5060       str       r0, [r2, #4]
0x2c134412 1c2c       cmp       r4, #0x1c
0x2c134414 b086       strh      r0, [r6, #0x34]
0x2c134416 0520       movs      r0, #5
0x2c134418 8a56       ldrsb     r2, [r1, r2]
0x2c13441a 1b2c       cmp       r4, #0x1b
0x2c13441c 7086       strh      r0, [r6, #0x32]
0x2c13441e 0520       movs      r0, #5
0x2c134420 6c86       strh      r4, [r5, #0x32]
0x2c134422 0520       movs      r0, #5
0x2c134424 7c86       strh      r4, [r7, #0x32]
0x2c134426 0520       movs      r0, #5
0x2c134428 e986       strh      r1, [r5, #0x36]
0x2c13442a 0520       movs      r0, #5
0x2c13442c e4ed0120   stcl      p0, c2, [r4, #4]!
0x2c134430 d8ed0120   ldcl      p0, c2, [r8, #4]
0x2c134434 7486       strh      r4, [r6, #0x32]
0x2c134436 0520       movs      r0, #5
0x2c134438 e0ed0120   stcl      p0, c2, [r0, #4]!
0x2c13443c 0118       adds      r1, r0, r0
0x2c13443e 030b       lsrs      r3, r0, #0xc
0x2c134440 913d       subs      r5, #0x91
0x2c134442 130c       lsrs      r3, r2, #0x10
0x2c134444 7886       strh      r0, [r7, #0x32]
0x2c134446 0520       movs      r0, #5
0x2c134448 f486       strh      r4, [r6, #0x36]
0x2c13444a 0520       movs      r0, #5
0x2c13444c d456       ldrsb     r4, [r2, r3]
0x2c13444e 1b2c       cmp       r4, #0x1b
0x2c134450 e956       ldrsb     r1, [r5, r3]
0x2c134452 1b2c       cmp       r4, #0x1b
0x2c134454 9859       ldr       r0, [r3, r6]
0x2c134456 1b2c       cmp       r4, #0x1b
0x2c134458 eb86       strh      r3, [r5, #0x36]
0x2c13445a 0520       movs      r0, #5
0x2c13445c 8086       strh      r0, [r0, #0x34]
0x2c13445e 0520       movs      r0, #5
0x2c134460 dced0120   ldcl      p0, c2, [ip, #4]
0x2c134464 3086       strh      r0, [r6, #0x30]
0x2c134466 0520       movs      r0, #5
0x2c134468 3257       ldrsb     r2, [r6, r4]
0x2c13446a 1b2c       cmp       r4, #0x1b
0x2c13446c 6c57       ldrsb     r4, [r5, r5]
0x2c13446e 1b2c       cmp       r4, #0x1b
0x2c134470 0000       movs      r0, r0
0x2c134472 0000       movs      r0, r0
0x2c134474 a4f13203   sub.w     r3, r4, #0x32
0x2c134478 012b       cmp       r3, #1
0x2c13447a 3ff623af   bhi.w     #0x2c1342c4
0x2c13447e 15f759f8   bl        #0x2c049534
0x2c134482 0c28       cmp       r0, #0xc
0x2c134484 28bf       it        hs
0x2c134486 0c20       movhs     r0, #0xc
0x2c134488 a3e7       b         #0x2c1343d2
