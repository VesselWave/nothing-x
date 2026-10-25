0x2c131280 87b0       sub       sp, #0x1c
0x2c131282 002b       cmp       r3, #0
0x2c131284 00f0e582   beq.w     #0x2c131852
0x2c131288 6378       ldrb      r3, [r4, #1]
0x2c13128a 4520       movs      r0, #0x45
0x2c13128c cde900a3   strd      sl, r3, [sp]
0x2c131290 8b6b       ldr       r3, [r1, #0x38]
0x2c131292 91f82420   ldrb.w    r2, [r1, #0x24]
0x2c131296 df49       ldr       r1, [pc, #0x37c] ; [0x2c131614]=0x2c1b4361 'fadeout num:%d size:%d len:%d cnt:%d'
0x2c131298 11f0fefd   bl        #0x2c142e98
0x2c13129c 96f82470   ldrb.w    r7, [r6, #0x24]
0x2c1312a0 96f82530   ldrb.w    r3, [r6, #0x25]
0x2c1312a4 e668       ldr       r6, [r4, #0xc]
0x2c1312a6 9feddc7a   vldr      s14, [pc, #0x370] ; [0x2c131618]=0x461c4000
0x2c1312aa 002e       cmp       r6, #0
0x2c1312ac 3ad1       bne       #0x2c131324
0x2c1312ae d4ed057a   vldr      s15, [r4, #0x14]
0x2c1312b2 67ee877a   vmul.f32  s15, s15, s14
0x2c1312b6 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1312ba d84a       ldr       r2, [pc, #0x360] ; [0x2c13161c]=0x2c1b4ef4 'af_stream_fadeout'
0x2c1312bc cded017a   vstr      s15, [sp, #4]
0x2c1312c0 d749       ldr       r1, [pc, #0x35c] ; [0x2c131620]=0x2c1b4386 '%s end, fade ch:%d bit:%d weight:%d(/10000)'
0x2c1312c2 0093       str       r3, [sp]
0x2c1312c4 4520       movs      r0, #0x45
0x2c1312c6 3b46       mov       r3, r7
0x2c1312c8 11f0e6fd   bl        #0x2c142e98
0x2c1312cc 5246       mov       r2, sl
0x2c1312ce 3146       mov       r1, r6
0x2c1312d0 2846       mov       r0, r5
0x2c1312d2 11f0c1fe   bl        #0x2c143058
0x2c1312d6 6378       ldrb      r3, [r4, #1]
0x2c1312d8 0133       adds      r3, #1
0x2c1312da 6370       strb      r3, [r4, #1]
0x2c1312dc 5544       add       r5, sl
0x2c1312de 35f9023c   ldrsh     r3, [r5, #-0x2]
0x2c1312e2 4420       movs      r0, #0x44
0x2c1312e4 0093       str       r3, [sp]
0x2c1312e6 35f9043c   ldrsh     r3, [r5, #-0x4]
0x2c1312ea 35f9062c   ldrsh     r2, [r5, #-0x6]
0x2c1312ee cd49       ldr       r1, [pc, #0x334] ; [0x2c131624]=0x2c1b43e4 'process ret:%d %d %d'
0x2c1312f0 11f0d2fd   bl        #0x2c142e98
0x2c1312f4 002e       cmp       r6, #0
0x2c1312f6 40f0ac82   bne.w     #0x2c131852
0x2c1312fa 1820       movs      r0, #0x18
0x2c1312fc 00fb0b99   mla       sb, r0, fp, sb
0x2c131300 99f80130   ldrb.w    r3, [sb, #1]
0x2c131304 022b       cmp       r3, #2
0x2c131306 40f0a482   bne.w     #0x2c131852
0x2c13130a c749       ldr       r1, [pc, #0x31c] ; [0x2c131628]=0x2c1b43f9 'fadeout_process end'
0x2c13130c 4120       movs      r0, #0x41
0x2c13130e 11f0c3fd   bl        #0x2c142e98
0x2c131312 4ff40041   mov.w     r1, #0x8000
0x2c131316 d9f80400   ldr.w     r0, [sb, #4]
0x2c13131a 07b0       add       sp, #0x1c
0x2c13131c bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c131320 07f0f8bb   b.w       #0x2c138b14
0x2c131324 102b       cmp       r3, #0x10
0x2c131326 33d1       bne       #0x2c131390
0x2c131328 bafbf7f8   udiv      r8, sl, r7
0x2c13132c 4fea5808   lsr.w     r8, r8, #1
0x2c131330 1824       movs      r4, #0x18
0x2c131332 04fb0b94   mla       r4, r4, fp, sb
0x2c131336 d4ed057a   vldr      s15, [r4, #0x14]
0x2c13133a 67ee877a   vmul.f32  s15, s15, s14
0x2c13133e 4645       cmp       r6, r8
0x2c131340 28bf       it        hs
0x2c131342 4646       movhs     r6, r8
0x2c131344 fdeee77a   vcvt.s32.f32 s15, s15
0x2c131348 3a46       mov       r2, r7
0x2c13134a cded027a   vstr      s15, [sp, #8]
0x2c13134e 4620       movs      r0, #0x46
0x2c131350 cde90068   strd      r6, r8, [sp]
0x2c131354 b549       ldr       r1, [pc, #0x2d4] ; [0x2c13162c]=0x2c1b43b2 'fade ch:%d bit:%d samples:%d/%d weight:%d(/10000)'
0x2c131356 0593       str       r3, [sp, #0x14]
0x2c131358 11f09efd   bl        #0x2c142e98
0x2c13135c 059b       ldr       r3, [sp, #0x14]
0x2c13135e 102b       cmp       r3, #0x10
0x2c131360 40f06881   bne.w     #0x2c131634
0x2c131364 012f       cmp       r7, #1
0x2c131366 35d1       bne       #0x2c1313d4
0x2c131368 2b46       mov       r3, r5
0x2c13136a 05eb4602   add.w     r2, r5, r6, lsl #1
0x2c13136e 9342       cmp       r3, r2
0x2c131370 17d1       bne       #0x2c1313a2
0x2c131372 3246       mov       r2, r6
0x2c131374 0023       movs      r3, #0
0x2c131376 08fb07f7   mul       r7, r8, r7
0x2c13137a ba42       cmp       r2, r7
0x2c13137c c0f04681   blo.w     #0x2c13160c
0x2c131380 1823       movs      r3, #0x18
0x2c131382 03fb0b93   mla       r3, r3, fp, sb
0x2c131386 da68       ldr       r2, [r3, #0xc]
0x2c131388 921b       subs      r2, r2, r6
0x2c13138a da60       str       r2, [r3, #0xc]
0x2c13138c 5646       mov       r6, sl
0x2c13138e a5e7       b         #0x2c1312dc
0x2c131390 0f2b       cmp       r3, #0xf
0x2c131392 8abf       itet      hi
0x2c131394 bafbf7f8   udivhi    r8, sl, r7
0x2c131398 4ff00008   movls.w   r8, #0
0x2c13139c 4fea9808   lsrhi.w   r8, r8, #2
0x2c1313a0 c6e7       b         #0x2c131330
0x2c1313a2 b3f90010   ldrsh.w   r1, [r3]
0x2c1313a6 94ed057a   vldr      s14, [r4, #0x14]
0x2c1313aa 07ee901a   vmov      s15, r1
0x2c1313ae f8eee77a   vcvt.f32.s32 s15, s15
0x2c1313b2 67ee877a   vmul.f32  s15, s15, s14
0x2c1313b6 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1313ba 17ee901a   vmov      r1, s15
0x2c1313be 23f8021b   strh      r1, [r3], #2
0x2c1313c2 d4ed057a   vldr      s15, [r4, #0x14]
0x2c1313c6 94ed047a   vldr      s14, [r4, #0x10]
0x2c1313ca 77eec77a   vsub.f32  s15, s15, s14
0x2c1313ce c4ed057a   vstr      s15, [r4, #0x14]
0x2c1313d2 cce7       b         #0x2c13136e
0x2c1313d4 022f       cmp       r7, #2
0x2c1313d6 32d1       bne       #0x2c13143e
0x2c1313d8 2b46       mov       r3, r5
0x2c1313da 0021       movs      r1, #0
0x2c1313dc 7200       lsls      r2, r6, #1
0x2c1313de 9142       cmp       r1, r2
0x2c1313e0 03f10403   add.w     r3, r3, #4
0x2c1313e4 c6d2       bhs       #0x2c131374
0x2c1313e6 33f9040c   ldrsh     r0, [r3, #-0x4]
0x2c1313ea 94ed057a   vldr      s14, [r4, #0x14]
0x2c1313ee 07ee900a   vmov      s15, r0
0x2c1313f2 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1313f6 67ee877a   vmul.f32  s15, s15, s14
0x2c1313fa fdeee77a   vcvt.s32.f32 s15, s15
0x2c1313fe 17ee900a   vmov      r0, s15
0x2c131402 23f8040c   strh      r0, [r3, #-0x4]
0x2c131406 33f9020c   ldrsh     r0, [r3, #-0x2]
0x2c13140a 94ed057a   vldr      s14, [r4, #0x14]
0x2c13140e 07ee900a   vmov      s15, r0
0x2c131412 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131416 67ee877a   vmul.f32  s15, s15, s14
0x2c13141a fdeee77a   vcvt.s32.f32 s15, s15
0x2c13141e 17ee900a   vmov      r0, s15
0x2c131422 23f8020c   strh      r0, [r3, #-0x2]
0x2c131426 d4ed057a   vldr      s15, [r4, #0x14]
0x2c13142a 94ed047a   vldr      s14, [r4, #0x10]
0x2c13142e 77eec77a   vsub.f32  s15, s15, s14
0x2c131432 0231       adds      r1, #2
0x2c131434 c4ed057a   vstr      s15, [r4, #0x14]
0x2c131438 d1e7       b         #0x2c1313de
0x2c13143a 0022       movs      r2, #0
0x2c13143c 9ae7       b         #0x2c131374
0x2c13143e 042f       cmp       r7, #4
0x2c131440 50d1       bne       #0x2c1314e4
0x2c131442 2b46       mov       r3, r5
0x2c131444 0022       movs      r2, #0
0x2c131446 b100       lsls      r1, r6, #2
0x2c131448 8a42       cmp       r2, r1
0x2c13144a 03f10803   add.w     r3, r3, #8
0x2c13144e 91d2       bhs       #0x2c131374
0x2c131450 33f9080c   ldrsh     r0, [r3, #-0x8]
0x2c131454 94ed057a   vldr      s14, [r4, #0x14]
0x2c131458 07ee900a   vmov      s15, r0
0x2c13145c f8eee77a   vcvt.f32.s32 s15, s15
0x2c131460 67ee877a   vmul.f32  s15, s15, s14
0x2c131464 fdeee77a   vcvt.s32.f32 s15, s15
0x2c131468 17ee900a   vmov      r0, s15
0x2c13146c 23f8080c   strh      r0, [r3, #-0x8]
0x2c131470 33f9060c   ldrsh     r0, [r3, #-0x6]
0x2c131474 94ed057a   vldr      s14, [r4, #0x14]
0x2c131478 07ee900a   vmov      s15, r0
0x2c13147c f8eee77a   vcvt.f32.s32 s15, s15
0x2c131480 67ee877a   vmul.f32  s15, s15, s14
0x2c131484 fdeee77a   vcvt.s32.f32 s15, s15
0x2c131488 17ee900a   vmov      r0, s15
0x2c13148c 23f8060c   strh      r0, [r3, #-0x6]
0x2c131490 33f9040c   ldrsh     r0, [r3, #-0x4]
0x2c131494 94ed057a   vldr      s14, [r4, #0x14]
0x2c131498 07ee900a   vmov      s15, r0
0x2c13149c f8eee77a   vcvt.f32.s32 s15, s15
0x2c1314a0 67ee877a   vmul.f32  s15, s15, s14
0x2c1314a4 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1314a8 17ee900a   vmov      r0, s15
0x2c1314ac 23f8040c   strh      r0, [r3, #-0x4]
0x2c1314b0 33f9020c   ldrsh     r0, [r3, #-0x2]
0x2c1314b4 94ed057a   vldr      s14, [r4, #0x14]
0x2c1314b8 07ee900a   vmov      s15, r0
0x2c1314bc f8eee77a   vcvt.f32.s32 s15, s15
0x2c1314c0 67ee877a   vmul.f32  s15, s15, s14
0x2c1314c4 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1314c8 17ee900a   vmov      r0, s15
0x2c1314cc 23f8020c   strh      r0, [r3, #-0x2]
0x2c1314d0 d4ed057a   vldr      s15, [r4, #0x14]
0x2c1314d4 94ed047a   vldr      s14, [r4, #0x10]
0x2c1314d8 77eec77a   vsub.f32  s15, s15, s14
0x2c1314dc 0432       adds      r2, #4
0x2c1314de c4ed057a   vstr      s15, [r4, #0x14]
0x2c1314e2 b1e7       b         #0x2c131448
0x2c1314e4 082f       cmp       r7, #8
0x2c1314e6 a8d1       bne       #0x2c13143a
0x2c1314e8 2b46       mov       r3, r5
0x2c1314ea 0022       movs      r2, #0
0x2c1314ec f100       lsls      r1, r6, #3
0x2c1314ee 8a42       cmp       r2, r1
0x2c1314f0 03f11003   add.w     r3, r3, #0x10
0x2c1314f4 bff43eaf   bhs.w     #0x2c131374
0x2c1314f8 33f9100c   ldrsh     r0, [r3, #-0x10]
0x2c1314fc 94ed057a   vldr      s14, [r4, #0x14]
0x2c131500 07ee900a   vmov      s15, r0
0x2c131504 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131508 67ee877a   vmul.f32  s15, s15, s14
0x2c13150c fdeee77a   vcvt.s32.f32 s15, s15
0x2c131510 17ee900a   vmov      r0, s15
0x2c131514 23f8100c   strh      r0, [r3, #-0x10]
0x2c131518 33f90e0c   ldrsh     r0, [r3, #-0xe]
0x2c13151c 94ed057a   vldr      s14, [r4, #0x14]
0x2c131520 07ee900a   vmov      s15, r0
0x2c131524 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131528 67ee877a   vmul.f32  s15, s15, s14
0x2c13152c fdeee77a   vcvt.s32.f32 s15, s15
0x2c131530 17ee900a   vmov      r0, s15
0x2c131534 23f80e0c   strh      r0, [r3, #-0xe]
0x2c131538 33f90c0c   ldrsh     r0, [r3, #-0xc]
0x2c13153c 94ed057a   vldr      s14, [r4, #0x14]
0x2c131540 07ee900a   vmov      s15, r0
0x2c131544 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131548 67ee877a   vmul.f32  s15, s15, s14
0x2c13154c fdeee77a   vcvt.s32.f32 s15, s15
0x2c131550 17ee900a   vmov      r0, s15
0x2c131554 23f80c0c   strh      r0, [r3, #-0xc]
0x2c131558 33f90a0c   ldrsh     r0, [r3, #-0xa]
0x2c13155c 94ed057a   vldr      s14, [r4, #0x14]
0x2c131560 07ee900a   vmov      s15, r0
0x2c131564 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131568 67ee877a   vmul.f32  s15, s15, s14
0x2c13156c fdeee77a   vcvt.s32.f32 s15, s15
0x2c131570 17ee900a   vmov      r0, s15
0x2c131574 23f80a0c   strh      r0, [r3, #-0xa]
0x2c131578 33f9080c   ldrsh     r0, [r3, #-0x8]
0x2c13157c 94ed057a   vldr      s14, [r4, #0x14]
0x2c131580 07ee900a   vmov      s15, r0
0x2c131584 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131588 67ee877a   vmul.f32  s15, s15, s14
0x2c13158c fdeee77a   vcvt.s32.f32 s15, s15
0x2c131590 17ee900a   vmov      r0, s15
0x2c131594 23f8080c   strh      r0, [r3, #-0x8]
0x2c131598 33f9060c   ldrsh     r0, [r3, #-0x6]
0x2c13159c 94ed057a   vldr      s14, [r4, #0x14]
0x2c1315a0 07ee900a   vmov      s15, r0
0x2c1315a4 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1315a8 67ee877a   vmul.f32  s15, s15, s14
0x2c1315ac fdeee77a   vcvt.s32.f32 s15, s15
0x2c1315b0 17ee900a   vmov      r0, s15
0x2c1315b4 23f8060c   strh      r0, [r3, #-0x6]
0x2c1315b8 33f9040c   ldrsh     r0, [r3, #-0x4]
0x2c1315bc 94ed057a   vldr      s14, [r4, #0x14]
0x2c1315c0 07ee900a   vmov      s15, r0
0x2c1315c4 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1315c8 67ee877a   vmul.f32  s15, s15, s14
0x2c1315cc fdeee77a   vcvt.s32.f32 s15, s15
0x2c1315d0 17ee900a   vmov      r0, s15
0x2c1315d4 23f8040c   strh      r0, [r3, #-0x4]
0x2c1315d8 33f9020c   ldrsh     r0, [r3, #-0x2]
0x2c1315dc 94ed057a   vldr      s14, [r4, #0x14]
0x2c1315e0 07ee900a   vmov      s15, r0
0x2c1315e4 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1315e8 67ee877a   vmul.f32  s15, s15, s14
0x2c1315ec fdeee77a   vcvt.s32.f32 s15, s15
0x2c1315f0 17ee900a   vmov      r0, s15
0x2c1315f4 23f8020c   strh      r0, [r3, #-0x2]
0x2c1315f8 d4ed057a   vldr      s15, [r4, #0x14]
0x2c1315fc 94ed047a   vldr      s14, [r4, #0x10]
0x2c131600 77eec77a   vsub.f32  s15, s15, s14
0x2c131604 0832       adds      r2, #8
0x2c131606 c4ed057a   vstr      s15, [r4, #0x14]
0x2c13160a 70e7       b         #0x2c1314ee
0x2c13160c 25f81230   strh.w    r3, [r5, r2, lsl #1]
0x2c131610 0132       adds      r2, #1
0x2c131612 b2e6       b         #0x2c13137a
0x2c131614 6143       muls      r1, r4, r1
0x2c131616 1b2c       cmp       r4, #0x1b
0x2c131618 0040       ands      r0, r0
0x2c13161a 1c46       mov       r4, r3
0x2c13161c f44e       ldr       r6, [pc, #0x3d0] ; [0x2c1319f0]=0xfa86f755
0x2c13161e 1b2c       cmp       r4, #0x1b
0x2c131620 8643       bics      r6, r0
0x2c131622 1b2c       cmp       r4, #0x1b
0x2c131624 e443       mvns      r4, r4
0x2c131626 1b2c       cmp       r4, #0x1b
0x2c131628 f943       mvns      r1, r7
0x2c13162a 1b2c       cmp       r4, #0x1b
0x2c13162c b243       bics      r2, r6
0x2c13162e 1b2c       cmp       r4, #0x1b
0x2c131630 4c77       strb      r4, [r1, #0x1d]
0x2c131632 0520       movs      r0, #5
0x2c131634 0f2b       cmp       r3, #0xf
0x2c131636 7ff6a3ae   bls.w     #0x2c131380
0x2c13163a 012f       cmp       r7, #1
0x2c13163c 25d1       bne       #0x2c13168a
0x2c13163e 0023       movs      r3, #0
0x2c131640 2a1f       subs      r2, r5, #4
0x2c131642 9e42       cmp       r6, r3
0x2c131644 0ad1       bne       #0x2c13165c
0x2c131646 3246       mov       r2, r6
0x2c131648 0023       movs      r3, #0
0x2c13164a 08fb07f7   mul       r7, r8, r7
0x2c13164e ba42       cmp       r2, r7
0x2c131650 bff496ae   bhs.w     #0x2c131380
0x2c131654 45f82230   str.w     r3, [r5, r2, lsl #2]
0x2c131658 0132       adds      r2, #1
0x2c13165a f8e7       b         #0x2c13164e
0x2c13165c d2ed017a   vldr      s15, [r2, #4]
0x2c131660 94ed057a   vldr      s14, [r4, #0x14]
0x2c131664 f8eee77a   vcvt.f32.s32 s15, s15
0x2c131668 67ee877a   vmul.f32  s15, s15, s14
0x2c13166c fdeee77a   vcvt.s32.f32 s15, s15
0x2c131670 c2ed017a   vstr      s15, [r2, #4]
0x2c131674 d4ed057a   vldr      s15, [r4, #0x14]
0x2c131678 94ed047a   vldr      s14, [r4, #0x10]
0x2c13167c 77eec77a   vsub.f32  s15, s15, s14
0x2c131680 0432       adds      r2, #4
0x2c131682 c4ed057a   vstr      s15, [r4, #0x14]
0x2c131686 0133       adds      r3, #1
0x2c131688 dbe7       b         #0x2c131642
0x2c13168a 022f       cmp       r7, #2
0x2c13168c 2ad1       bne       #0x2c1316e4
0x2c13168e 2b46       mov       r3, r5
0x2c131690 0021       movs      r1, #0
0x2c131692 7200       lsls      r2, r6, #1
0x2c131694 9142       cmp       r1, r2
0x2c131696 03f10803   add.w     r3, r3, #8
0x2c13169a d5d2       bhs       #0x2c131648
0x2c13169c 53ed027a   vldr      s15, [r3, #-8]
0x2c1316a0 94ed057a   vldr      s14, [r4, #0x14]
0x2c1316a4 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1316a8 67ee877a   vmul.f32  s15, s15, s14
0x2c1316ac fdeee77a   vcvt.s32.f32 s15, s15
0x2c1316b0 43ed027a   vstr      s15, [r3, #-8]
0x2c1316b4 53ed017a   vldr      s15, [r3, #-4]
0x2c1316b8 94ed057a   vldr      s14, [r4, #0x14]
0x2c1316bc f8eee77a   vcvt.f32.s32 s15, s15
0x2c1316c0 67ee877a   vmul.f32  s15, s15, s14
0x2c1316c4 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1316c8 43ed017a   vstr      s15, [r3, #-4]
0x2c1316cc d4ed057a   vldr      s15, [r4, #0x14]
0x2c1316d0 94ed047a   vldr      s14, [r4, #0x10]
0x2c1316d4 77eec77a   vsub.f32  s15, s15, s14
0x2c1316d8 0231       adds      r1, #2
0x2c1316da c4ed057a   vstr      s15, [r4, #0x14]
0x2c1316de d9e7       b         #0x2c131694
0x2c1316e0 0022       movs      r2, #0
0x2c1316e2 b1e7       b         #0x2c131648
0x2c1316e4 042f       cmp       r7, #4
0x2c1316e6 40d1       bne       #0x2c13176a
0x2c1316e8 2b46       mov       r3, r5
0x2c1316ea 0022       movs      r2, #0
0x2c1316ec b100       lsls      r1, r6, #2
0x2c1316ee 8a42       cmp       r2, r1
0x2c1316f0 03f11003   add.w     r3, r3, #0x10
0x2c1316f4 a8d2       bhs       #0x2c131648
0x2c1316f6 53ed047a   vldr      s15, [r3, #-0x10]
0x2c1316fa 94ed057a   vldr      s14, [r4, #0x14]
0x2c1316fe f8eee77a   vcvt.f32.s32 s15, s15
0x2c131702 67ee877a   vmul.f32  s15, s15, s14
0x2c131706 fdeee77a   vcvt.s32.f32 s15, s15
0x2c13170a 43ed047a   vstr      s15, [r3, #-0x10]
0x2c13170e 53ed037a   vldr      s15, [r3, #-0xc]
0x2c131712 94ed057a   vldr      s14, [r4, #0x14]
0x2c131716 f8eee77a   vcvt.f32.s32 s15, s15
0x2c13171a 67ee877a   vmul.f32  s15, s15, s14
0x2c13171e fdeee77a   vcvt.s32.f32 s15, s15
0x2c131722 43ed037a   vstr      s15, [r3, #-0xc]
0x2c131726 53ed027a   vldr      s15, [r3, #-8]
0x2c13172a 94ed057a   vldr      s14, [r4, #0x14]
0x2c13172e f8eee77a   vcvt.f32.s32 s15, s15
0x2c131732 67ee877a   vmul.f32  s15, s15, s14
0x2c131736 fdeee77a   vcvt.s32.f32 s15, s15
0x2c13173a 43ed027a   vstr      s15, [r3, #-8]
0x2c13173e 53ed017a   vldr      s15, [r3, #-4]
0x2c131742 94ed057a   vldr      s14, [r4, #0x14]
0x2c131746 f8eee77a   vcvt.f32.s32 s15, s15
0x2c13174a 67ee877a   vmul.f32  s15, s15, s14
0x2c13174e fdeee77a   vcvt.s32.f32 s15, s15
0x2c131752 43ed017a   vstr      s15, [r3, #-4]
0x2c131756 d4ed057a   vldr      s15, [r4, #0x14]
0x2c13175a 94ed047a   vldr      s14, [r4, #0x10]
0x2c13175e 77eec77a   vsub.f32  s15, s15, s14
0x2c131762 0432       adds      r2, #4
0x2c131764 c4ed057a   vstr      s15, [r4, #0x14]
0x2c131768 c1e7       b         #0x2c1316ee
0x2c13176a 082f       cmp       r7, #8
0x2c13176c b8d1       bne       #0x2c1316e0
0x2c13176e 2b46       mov       r3, r5
0x2c131770 0022       movs      r2, #0
0x2c131772 f100       lsls      r1, r6, #3
0x2c131774 8a42       cmp       r2, r1
0x2c131776 03f12003   add.w     r3, r3, #0x20
0x2c13177a bff465af   bhs.w     #0x2c131648
0x2c13177e 53ed087a   vldr      s15, [r3, #-0x20]
0x2c131782 94ed057a   vldr      s14, [r4, #0x14]
0x2c131786 f8eee77a   vcvt.f32.s32 s15, s15
0x2c13178a 67ee877a   vmul.f32  s15, s15, s14
0x2c13178e fdeee77a   vcvt.s32.f32 s15, s15
0x2c131792 43ed087a   vstr      s15, [r3, #-0x20]
0x2c131796 53ed077a   vldr      s15, [r3, #-0x1c]
0x2c13179a 94ed057a   vldr      s14, [r4, #0x14]
0x2c13179e f8eee77a   vcvt.f32.s32 s15, s15
0x2c1317a2 67ee877a   vmul.f32  s15, s15, s14
0x2c1317a6 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1317aa 43ed077a   vstr      s15, [r3, #-0x1c]
0x2c1317ae 53ed067a   vldr      s15, [r3, #-0x18]
0x2c1317b2 94ed057a   vldr      s14, [r4, #0x14]
0x2c1317b6 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1317ba 67ee877a   vmul.f32  s15, s15, s14
0x2c1317be fdeee77a   vcvt.s32.f32 s15, s15
0x2c1317c2 43ed067a   vstr      s15, [r3, #-0x18]
0x2c1317c6 53ed057a   vldr      s15, [r3, #-0x14]
0x2c1317ca 94ed057a   vldr      s14, [r4, #0x14]
0x2c1317ce f8eee77a   vcvt.f32.s32 s15, s15
0x2c1317d2 67ee877a   vmul.f32  s15, s15, s14
0x2c1317d6 fdeee77a   vcvt.s32.f32 s15, s15
0x2c1317da 43ed057a   vstr      s15, [r3, #-0x14]
0x2c1317de 53ed047a   vldr      s15, [r3, #-0x10]
0x2c1317e2 94ed057a   vldr      s14, [r4, #0x14]
0x2c1317e6 f8eee77a   vcvt.f32.s32 s15, s15
0x2c1317ea 67ee877a   vmul.f32  s15, s15, s14
0x2c1317ee fdeee77a   vcvt.s32.f32 s15, s15
0x2c1317f2 43ed047a   vstr      s15, [r3, #-0x10]
0x2c1317f6 53ed037a   vldr      s15, [r3, #-0xc]
0x2c1317fa 94ed057a   vldr      s14, [r4, #0x14]
0x2c1317fe f8ee       .byte     0xf8, 0xee
