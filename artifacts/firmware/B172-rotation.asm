0x2c179500 2046       mov       r0, r4
0x2c179502 fbf73dfa   bl        #0x2c174980
0x2c179506 a3e7       b         #0x2c179450
0x2c179508 48f7f4fe   bl        #0x2c0c22f4
0x2c17950c 0128       cmp       r0, #1
0x2c17950e 03d0       beq       #0x2c179518
0x2c179510 2946       mov       r1, r5
0x2c179512 3820       movs      r0, #0x38
0x2c179514 e6f7baf8   bl        #0x2c15f68c
0x2c179518 0124       movs      r4, #1
0x2c17951a ebe7       b         #0x2c1794f4
0x2c17951c f6f7b0fc   bl        #0x2c16fe80
0x2c179520 0b28       cmp       r0, #0xb
0x2c179522 10d1       bne       #0x2c179546
0x2c179524 2649       ldr       r1, [pc, #0x98] ; [0x2c1795c0]=0x2c257660 'WEARSDK_SIRI'
0x2c179526 4120       movs      r0, #0x41
0x2c179528 26f0a6fd   bl        #0x2c1a0078
0x2c17952c 77f7bdfb   bl        #0x2c0f0caa
0x2c179530 71f762fb   bl        #0x2c0eabf8
0x2c179534 90f8ce30   ldrb.w    r3, [r0, #0xce]
0x2c179538 1bb9       cbnz      r3, #0x2c179542
0x2c17953a 0120       movs      r0, #1
0x2c17953c 6ff7a8fc   bl        #0x2c0e8e90
0x2c179540 86e7       b         #0x2c179450
0x2c179542 2046       mov       r0, r4
0x2c179544 fae7       b         #0x2c17953c
0x2c179546 f6f79bfc   bl        #0x2c16fe80
0x2c17954a 1f28       cmp       r0, #0x1f
0x2c17954c 80d1       bne       #0x2c179450
0x2c17954e f9f7bdfd   bl        #0x2c1730cc
0x2c179552 7de7       b         #0x2c179450
0x2c179554 f6f7c4fc   bl        #0x2c16fee0
0x2c179558 1a28       cmp       r0, #0x1a
0x2c17955a 05d1       bne       #0x2c179568
0x2c17955c 072c       cmp       r4, #7
0x2c17955e 0dd1       bne       #0x2c17957c
0x2c179560 0920       movs      r0, #9
0x2c179562 6ef707ff   bl        #0x2c0e8374
0x2c179566 73e7       b         #0x2c179450
0x2c179568 f2f7defc   bl        #0x2c16bf28
0x2c17956c 0028       cmp       r0, #0
0x2c17956e f5d1       bne       #0x2c17955c
0x2c179570 f7f79cfa   bl        #0x2c170aac
0x2c179574 0128       cmp       r0, #1
0x2c179576 7ff46baf   bne.w     #0x2c179450
0x2c17957a efe7       b         #0x2c17955c
0x2c17957c 0a2c       cmp       r4, #0xa
0x2c17957e 01d1       bne       #0x2c179584
0x2c179580 1120       movs      r0, #0x11
0x2c179582 eee7       b         #0x2c179562
0x2c179584 a4f10803   sub.w     r3, r4, #8
0x2c179588 012b       cmp       r3, #1
0x2c17958a e9d9       bls       #0x2c179560
0x2c17958c 0c2c       cmp       r4, #0xc
0x2c17958e f7d0       beq       #0x2c179580
0x2c179590 102c       cmp       r4, #0x10
0x2c179592 3ff65daf   bhi.w     #0x2c179450
0x2c179596 4ff4a430   mov.w     r0, #0x14800
0x2c17959a 20fa04f4   lsr.w     r4, r0, r4
0x2c17959e e307       lsls      r3, r4, #0x1f
0x2c1795a0 ded4       bmi       #0x2c179560
0x2c1795a2 55e7       b         #0x2c179450
0x2c1795a4 03b0       add       sp, #0xc
0x2c1795a6 30bd       pop       {r4, r5, pc}
0x2c1795a8 d876       strb      r0, [r3, #0x1b]
0x2c1795aa 252c       cmp       r4, #0x25
0x2c1795ac a876       strb      r0, [r5, #0x1a]
0x2c1795ae 252c       cmp       r4, #0x25
0x2c1795b0 1876       strb      r0, [r3, #0x18]
0x2c1795b2 252c       cmp       r4, #0x25
0x2c1795b4 3c76       strb      r4, [r7, #0x18]
0x2c1795b6 252c       cmp       r4, #0x25
0x2c1795b8 2976       strb      r1, [r5, #0x18]
0x2c1795ba 252c       cmp       r4, #0x25
0x2c1795bc 4e76       strb      r6, [r1, #0x19]
0x2c1795be 252c       cmp       r4, #0x25
0x2c1795c0 6076       strb      r0, [r4, #0x19]
0x2c1795c2 252c       cmp       r4, #0x25
0x2c1795c4 13b5       push      {r0, r1, r4, lr}
0x2c1795c6 3c4b       ldr       r3, [pc, #0xf0] ; [0x2c1796b8]=0x2c257708
0x2c1795c8 1b68       ldr       r3, [r3]
0x2c1795ca 0193       str       r3, [sp, #4]
0x2c1795cc 4ff00003   mov.w     r3, #0
0x2c1795d0 6ff7ecf8   bl        #0x2c0e87ac
0x2c1795d4 0023       movs      r3, #0
0x2c1795d6 0446       mov       r4, r0
0x2c1795d8 adf80030   strh.w    r3, [sp]
0x2c1795dc 48f78afe   bl        #0x2c0c22f4
0x2c1795e0 0128       cmp       r0, #1
0x2c1795e2 0ed1       bne       #0x2c179602
0x2c1795e4 f6f7defb   bl        #0x2c16fda4
0x2c1795e8 1128       cmp       r0, #0x11
0x2c1795ea 0ad0       beq       #0x2c179602
0x2c1795ec 4120       movs      r0, #0x41
0x2c1795ee 3349       ldr       r1, [pc, #0xcc] ; [0x2c1796bc]=0x2c2576dc 'slave and long cmd is not game mode,return'
0x2c1795f0 26f042fd   bl        #0x2c1a0078
0x2c1795f4 304b       ldr       r3, [pc, #0xc0] ; [0x2c1796b8]=0x2c257708
0x2c1795f6 1a68       ldr       r2, [r3]
0x2c1795f8 019b       ldr       r3, [sp, #4]
0x2c1795fa 5a40       eors      r2, r3
0x2c1795fc 59d0       beq       #0x2c1796b2
0x2c1795fe 2af781fb   bl        #0x2c0a3d04
0x2c179602 f6f7cffb   bl        #0x2c16fda4
0x2c179606 1128       cmp       r0, #0x11
0x2c179608 27d1       bne       #0x2c17965a
0x2c17960a 0cb1       cbz       r4, #0x2c179610
0x2c17960c 062c       cmp       r4, #6
0x2c17960e f1d1       bne       #0x2c1795f4
0x2c179610 2b49       ldr       r1, [pc, #0xac] ; [0x2c1796c0]=0x2c25764e 'WEARSDK_GAME_MODE'
0x2c179612 4120       movs      r0, #0x41
0x2c179614 26f030fd   bl        #0x2c1a0078
0x2c179618 f9f7a0f9   bl        #0x2c17295c
0x2c17961c 0446       mov       r4, r0
0x2c17961e 90b1       cbz       r0, #0x2c179646
0x2c179620 48f768fe   bl        #0x2c0c22f4
0x2c179624 0128       cmp       r0, #1
0x2c179626 03d0       beq       #0x2c179630
0x2c179628 0021       movs      r1, #0
0x2c17962a 3920       movs      r0, #0x39
0x2c17962c e6f72ef8   bl        #0x2c15f68c
0x2c179630 0024       movs      r4, #0
0x2c179632 6846       mov       r0, sp
0x2c179634 0621       movs      r1, #6
0x2c179636 8df80040   strb.w    r4, [sp]
0x2c17963a ebf78df9   bl        #0x2c164958
0x2c17963e 2046       mov       r0, r4
0x2c179640 fbf79ef9   bl        #0x2c174980
0x2c179644 d6e7       b         #0x2c1795f4
0x2c179646 48f755fe   bl        #0x2c0c22f4
0x2c17964a 0128       cmp       r0, #1
0x2c17964c 03d0       beq       #0x2c179656
0x2c17964e 2146       mov       r1, r4
0x2c179650 3820       movs      r0, #0x38
0x2c179652 e6f71bf8   bl        #0x2c15f68c
0x2c179656 0124       movs      r4, #1
0x2c179658 ebe7       b         #0x2c179632
0x2c17965a f6f7a3fb   bl        #0x2c16fda4
0x2c17965e 0b28       cmp       r0, #0xb
0x2c179660 10d1       bne       #0x2c179684
0x2c179662 1849       ldr       r1, [pc, #0x60] ; [0x2c1796c4]=0x2c257660 'WEARSDK_SIRI'
0x2c179664 4120       movs      r0, #0x41
0x2c179666 26f007fd   bl        #0x2c1a0078
0x2c17966a 77f71efb   bl        #0x2c0f0caa
0x2c17966e 71f7c3fa   bl        #0x2c0eabf8
0x2c179672 90f8ce30   ldrb.w    r3, [r0, #0xce]
0x2c179676 1bb9       cbnz      r3, #0x2c179680
0x2c179678 0120       movs      r0, #1
0x2c17967a 6ff709fc   bl        #0x2c0e8e90
0x2c17967e b9e7       b         #0x2c1795f4
0x2c179680 0020       movs      r0, #0
0x2c179682 fae7       b         #0x2c17967a
0x2c179684 f6f78efb   bl        #0x2c16fda4
0x2c179688 1f28       cmp       r0, #0x1f
0x2c17968a 02d1       bne       #0x2c179692
0x2c17968c f9f71efd   bl        #0x2c1730cc
0x2c179690 b0e7       b         #0x2c1795f4
0x2c179692 f6f787fb   bl        #0x2c16fda4
0x2c179696 0128       cmp       r0, #1
0x2c179698 02d0       beq       #0x2c1796a0
0x2c17969a f0f71dff   bl        #0x2c16a4d8
0x2c17969e a9e7       b         #0x2c1795f4
0x2c1796a0 f2f742fc   bl        #0x2c16bf28
0x2c1796a4 0028       cmp       r0, #0
0x2c1796a6 f8d1       bne       #0x2c17969a
0x2c1796a8 f7f700fa   bl        #0x2c170aac
0x2c1796ac 0128       cmp       r0, #1
0x2c1796ae a1d1       bne       #0x2c1795f4
0x2c1796b0 f3e7       b         #0x2c17969a
0x2c1796b2 02b0       add       sp, #8
0x2c1796b4 10bd       pop       {r4, pc}
0x2c1796b6 00bf       nop       
0x2c1796b8 0877       strb      r0, [r1, #0x1c]
0x2c1796ba 252c       cmp       r4, #0x25
0x2c1796bc dc76       strb      r4, [r3, #0x1b]
0x2c1796be 252c       cmp       r4, #0x25
0x2c1796c0 4e76       strb      r6, [r1, #0x19]
0x2c1796c2 252c       cmp       r4, #0x25
0x2c1796c4 6076       strb      r0, [r4, #0x19]
0x2c1796c6 252c       cmp       r4, #0x25
0x2c1796c8 014b       ldr       r3, [pc, #4] ; [0x2c1796d0]=0x200a5e3e
0x2c1796ca 1878       ldrb      r0, [r3]
0x2c1796cc 7047       bx        lr
0x2c1796ce 00bf       nop       
0x2c1796d0 3e5e       ldrsh     r6, [r7, r0]
0x2c1796d2 0a20       movs      r0, #0xa
0x2c1796d4 034b       ldr       r3, [pc, #0xc] ; [0x2c1796e4]=0x200a5e3e
0x2c1796d6 1a78       ldrb      r2, [r3]
0x2c1796d8 8242       cmp       r2, r0
0x2c1796da 02d0       beq       #0x2c1796e2
0x2c1796dc 1870       strb      r0, [r3]
0x2c1796de f2f70dba   b.w       #0x2c16bafc
0x2c1796e2 7047       bx        lr
0x2c1796e4 3e5e       ldrsh     r6, [r7, r0]
0x2c1796e6 0a20       movs      r0, #0xa
0x2c1796e8 2de9f04f   push.w    {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c1796ec 8146       mov       sb, r0
0x2c1796ee 8a46       mov       sl, r1
0x2c1796f0 1e46       mov       r6, r3
0x2c1796f2 1446       mov       r4, r2
0x2c1796f4 85b0       sub       sp, #0x14
0x2c1796f6 32b9       cbnz      r2, #0x2c179706
0x2c1796f8 af49       ldr       r1, [pc, #0x2bc] ; [0x2c1799b8]=0x2c25770c 'BLE buf NULL return '
0x2c1796fa 4120       movs      r0, #0x41
0x2c1796fc 05b0       add       sp, #0x14
0x2c1796fe bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c179702 26f0b9bc   b.w       #0x2c1a0078
0x2c179706 062b       cmp       r3, #6
0x2c179708 01d8       bhi       #0x2c17970e
0x2c17970a ac49       ldr       r1, [pc, #0x2b0] ; [0x2c1799bc]=0x2c257721 'BLE buf len error return '
0x2c17970c f5e7       b         #0x2c1796fa
0x2c17970e 1378       ldrb      r3, [r2]
0x2c179710 a12b       cmp       r3, #0xa1
0x2c179712 01d0       beq       #0x2c179718
0x2c179714 aa49       ldr       r1, [pc, #0x2a8] ; [0x2c1799c0]=0x2c25773b 'BLE head error return '
0x2c179716 f0e7       b         #0x2c1796fa
0x2c179718 5379       ldrb      r3, [r2, #5]
0x2c17971a 5a2b       cmp       r3, #0x5a
0x2c17971c 01d0       beq       #0x2c179722
0x2c17971e a949       ldr       r1, [pc, #0x2a4] ; [0x2c1799c4]=0x2c257752 'BLE tail error return '
0x2c179720 ebe7       b         #0x2c1796fa
0x2c179722 b11e       subs      r1, r6, #2
0x2c179724 1046       mov       r0, r2
0x2c179726 92f801b0   ldrb.w    fp, [r2, #1]
0x2c17972a 92f80380   ldrb.w    r8, [r2, #3]
0x2c17972e 1779       ldrb      r7, [r2, #4]
0x2c179730 f2f700fc   bl        #0x2c16bf34
0x2c179734 c0f30f25   ubfx      r5, r0, #8, #0x10
0x2c179738 2b46       mov       r3, r5
0x2c17973a c2b2       uxtb      r2, r0
0x2c17973c a249       ldr       r1, [pc, #0x288] ; [0x2c1799c8]=0x2c257769 'ble_crc_l: %2x ble_crc_h: %2x'
0x2c17973e 4320       movs      r0, #0x43
0x2c179740 2644       add       r6, r4
0x2c179742 0392       str       r2, [sp, #0xc]
0x2c179744 26f098fc   bl        #0x2c1a0078
0x2c179748 16f8013c   ldrb      r3, [r6, #-0x1]
0x2c17974c edb2       uxtb      r5, r5
0x2c17974e ab42       cmp       r3, r5
0x2c179750 04d1       bne       #0x2c17975c
0x2c179752 16f8023c   ldrb      r3, [r6, #-0x2]
0x2c179756 039a       ldr       r2, [sp, #0xc]
0x2c179758 9342       cmp       r3, r2
0x2c17975a 01d0       beq       #0x2c179760
0x2c17975c 9b49       ldr       r1, [pc, #0x26c] ; [0x2c1799cc]=0x2c257787 'CRC error return '
0x2c17975e cce7       b         #0x2c1796fa
0x2c179760 4b46       mov       r3, sb
0x2c179762 4320       movs      r0, #0x43
0x2c179764 9a4a       ldr       r2, [pc, #0x268] ; [0x2c1799d0]=0x2c257799 'user_box_ble_receive_handle'
0x2c179766 9b49       ldr       r1, [pc, #0x26c] ; [0x2c1799d4]=0x2c2577b5 '[%s]:conidx:0x%x'
0x2c179768 26f086fc   bl        #0x2c1a0078
0x2c17976c baf1000f   cmp.w     sl, #0
0x2c179770 02d1       bne       #0x2c179778
0x2c179772 4846       mov       r0, sb
0x2c179774 fff7aeff   bl        #0x2c1796d4
0x2c179778 48f7bcfd   bl        #0x2c0c22f4
0x2c17977c 964a       ldr       r2, [pc, #0x258] ; [0x2c1799d8]=0x200a5e3e
0x2c17977e 0346       mov       r3, r0
0x2c179780 1278       ldrb      r2, [r2]
0x2c179782 9649       ldr       r1, [pc, #0x258] ; [0x2c1799dc]=0x2c2577c6 '[%s]:role:%d, condix: %d'
0x2c179784 0092       str       r2, [sp]
0x2c179786 4420       movs      r0, #0x44
0x2c179788 914a       ldr       r2, [pc, #0x244] ; [0x2c1799d0]=0x2c257799 'user_box_ble_receive_handle'
0x2c17978a 26f075fc   bl        #0x2c1a0078
0x2c17978e f9f7d3f8   bl        #0x2c172938
0x2c179792 08b1       cbz       r0, #0x2c179798
0x2c179794 9249       ldr       r1, [pc, #0x248] ; [0x2c1799e0]=0x2c2577df 'user_box_ble_receive_handle, now is ears checking, quit...'
0x2c179796 b0e7       b         #0x2c1796fa
0x2c179798 48f7acfd   bl        #0x2c0c22f4
0x2c17979c 0128       cmp       r0, #1
0x2c17979e 06d1       bne       #0x2c1797ae
0x2c1797a0 0521       movs      r1, #5
0x2c1797a2 2046       mov       r0, r4
0x2c1797a4 05b0       add       sp, #0x14
0x2c1797a6 bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c1797aa ebf7d5b8   b.w       #0x2c164958
0x2c1797ae bbf1270f   cmp.w     fp, #0x27
0x2c1797b2 05d0       beq       #0x2c1797c0
0x2c1797b4 bbf1280f   cmp.w     fp, #0x28
0x2c1797b8 56d0       beq       #0x2c179868
0x2c1797ba 05b0       add       sp, #0x14
0x2c1797bc bde8f08f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, pc}
0x2c1797c0 884b       ldr       r3, [pc, #0x220] ; [0x2c1799e4]=0x200fe0b0
0x2c1797c2 93f83530   ldrb.w    r3, [r3, #0x35]
0x2c1797c6 0bb9       cbnz      r3, #0x2c1797cc
0x2c1797c8 8749       ldr       r1, [pc, #0x21c] ; [0x2c1799e8]=0x2c25781a 'user box ble no open return '
0x2c1797ca 96e7       b         #0x2c1796fa
0x2c1797cc f6f764fb   bl        #0x2c16fe98
0x2c1797d0 1728       cmp       r0, #0x17
0x2c1797d2 08d0       beq       #0x2c1797e6
0x2c1797d4 f2f7a8fb   bl        #0x2c16bf28
0x2c1797d8 28b9       cbnz      r0, #0x2c1797e6
0x2c1797da f7f767f9   bl        #0x2c170aac
0x2c1797de 0128       cmp       r0, #1
0x2c1797e0 01d0       beq       #0x2c1797e6
0x2c1797e2 8249       ldr       r1, [pc, #0x208] ; [0x2c1799ec]=0x2c257837 'ROTATION no open return '
0x2c1797e4 89e7       b         #0x2c1796fa
0x2c1797e6 824c       ldr       r4, [pc, #0x208] ; [0x2c1799f0]=0x200ea134
0x2c1797e8 2378       ldrb      r3, [r4]
0x2c1797ea 0bb1       cbz       r3, #0x2c1797f0
0x2c1797ec 8149       ldr       r1, [pc, #0x204] ; [0x2c1799f4]=0x2c257850 'volume on going return'
0x2c1797ee 84e7       b         #0x2c1796fa
0x2c1797f0 f6f752fb   bl        #0x2c16fe98
0x2c1797f4 0128       cmp       r0, #1
0x2c1797f6 05d0       beq       #0x2c179804
0x2c1797f8 0523       movs      r3, #5
0x2c1797fa 0121       movs      r1, #1
0x2c1797fc 1a46       mov       r2, r3
0x2c1797fe a120       movs      r0, #0xa1
0x2c179800 fcf724fb   bl        #0x2c175e4c
0x2c179804 012f       cmp       r7, #1
0x2c179806 11d1       bne       #0x2c17982c
0x2c179808 48f774fd   bl        #0x2c0c22f4
0x2c17980c 0128       cmp       r0, #1
0x2c17980e d4d0       beq       #0x2c1797ba
0x2c179810 7949       ldr       r1, [pc, #0x1e4] ; [0x2c1799f8]=0x2c257867 'positive volume up'
0x2c179812 4120       movs      r0, #0x41
0x2c179814 26f030fc   bl        #0x2c1a0078
0x2c179818 2770       strb      r7, [r4]
0x2c17981a fff7a3fb   bl        #0x2c178f64
0x2c17981e fff7bffb   bl        #0x2c178fa0
0x2c179822 05b0       add       sp, #0x14
0x2c179824 bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c179828 fff750bb   b.w       #0x2c178ecc
0x2c17982c 002f       cmp       r7, #0
0x2c17982e c4d1       bne       #0x2c1797ba
0x2c179830 f6f732fb   bl        #0x2c16fe98
0x2c179834 1728       cmp       r0, #0x17
0x2c179836 0ed1       bne       #0x2c179856
0x2c179838 48f75cfd   bl        #0x2c0c22f4
0x2c17983c 0128       cmp       r0, #1
0x2c17983e bcd0       beq       #0x2c1797ba
0x2c179840 6e49       ldr       r1, [pc, #0x1b8] ; [0x2c1799fc]=0x2c25787a 'nagetive volume down'
0x2c179842 4120       movs      r0, #0x41
0x2c179844 26f018fc   bl        #0x2c1a0078
0x2c179848 fff78cfb   bl        #0x2c178f64
0x2c17984c 0123       movs      r3, #1
0x2c17984e 2370       strb      r3, [r4]
0x2c179850 fff7f2fb   bl        #0x2c179038
0x2c179854 e5e7       b         #0x2c179822
0x2c179856 f2f767fb   bl        #0x2c16bf28
0x2c17985a 0028       cmp       r0, #0
0x2c17985c ecd1       bne       #0x2c179838
0x2c17985e f7f725f9   bl        #0x2c170aac
0x2c179862 0128       cmp       r0, #1
0x2c179864 e8d0       beq       #0x2c179838
0x2c179866 bce7       b         #0x2c1797e2
0x2c179868 012f       cmp       r7, #1
0x2c17986a 17d1       bne       #0x2c17989c
0x2c17986c 4120       movs      r0, #0x41
0x2c17986e 6449       ldr       r1, [pc, #0x190] ; [0x2c179a00]=0x2c25788f 'long press '
0x2c179870 26f002fc   bl        #0x2c1a0078
0x2c179874 5b4b       ldr       r3, [pc, #0x16c] ; [0x2c1799e4]=0x200fe0b0
0x2c179876 93f83530   ldrb.w    r3, [r3, #0x35]
0x2c17987a 002b       cmp       r3, #0
0x2c17987c a4d0       beq       #0x2c1797c8
0x2c17987e f6f791fa   bl        #0x2c16fda4
0x2c179882 0128       cmp       r0, #1
0x2c179884 05d0       beq       #0x2c179892
0x2c179886 0423       movs      r3, #4
0x2c179888 0522       movs      r2, #5
0x2c17988a 3946       mov       r1, r7
0x2c17988c a120       movs      r0, #0xa1
0x2c17988e fcf7ddfa   bl        #0x2c175e4c
0x2c179892 05b0       add       sp, #0x14
0x2c179894 bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c179898 fff794be   b.w       #0x2c1795c4
0x2c17989c 022f       cmp       r7, #2
0x2c17989e 31d1       bne       #0x2c179904
0x2c1798a0 5849       ldr       r1, [pc, #0x160] ; [0x2c179a04]=0x2c25789b 'USER_BOX_BLE_CMD_KEY_CLICK_AND_LONGPRESS '
0x2c1798a2 4120       movs      r0, #0x41
0x2c1798a4 26f0e8fb   bl        #0x2c1a0078
0x2c1798a8 f6f7c6fa   bl        #0x2c16fe38
0x2c1798ac 0128       cmp       r0, #1
0x2c1798ae 08d0       beq       #0x2c1798c2
0x2c1798b0 4c4c       ldr       r4, [pc, #0x130] ; [0x2c1799e4]=0x200fe0b0
0x2c1798b2 94f83510   ldrb.w    r1, [r4, #0x35]
0x2c1798b6 e9b9       cbnz      r1, #0x2c1798f4
0x2c1798b8 3d20       movs      r0, #0x3d
0x2c1798ba e5f7e7fe   bl        #0x2c15f68c
0x2c1798be 0123       movs      r3, #1
0x2c1798c0 1de0       b         #0x2c1798fe
0x2c1798c2 f6f7f5fa   bl        #0x2c16feb0
0x2c1798c6 0128       cmp       r0, #1
0x2c1798c8 f2d1       bne       #0x2c1798b0
0x2c1798ca f6f7d9fa   bl        #0x2c16fe80
0x2c1798ce 0128       cmp       r0, #1
0x2c1798d0 eed1       bne       #0x2c1798b0
0x2c1798d2 f6f7e1fa   bl        #0x2c16fe98
0x2c1798d6 0128       cmp       r0, #1
0x2c1798d8 ead1       bne       #0x2c1798b0
0x2c1798da f6f763fa   bl        #0x2c16fda4
0x2c1798de 0128       cmp       r0, #1
0x2c1798e0 e6d1       bne       #0x2c1798b0
0x2c1798e2 f6f7f1fa   bl        #0x2c16fec8
0x2c1798e6 0128       cmp       r0, #1
0x2c1798e8 e2d1       bne       #0x2c1798b0
0x2c1798ea f6f7f9fa   bl        #0x2c16fee0
0x2c1798ee 0128       cmp       r0, #1
0x2c1798f0 ded1       bne       #0x2c1798b0
0x2c1798f2 62e7       b         #0x2c1797ba
0x2c1798f4 0021       movs      r1, #0
0x2c1798f6 3c20       movs      r0, #0x3c
0x2c1798f8 e5f7c8fe   bl        #0x2c15f68c
0x2c1798fc 0023       movs      r3, #0
0x2c1798fe 84f83530   strb.w    r3, [r4, #0x35]
0x2c179902 5ae7       b         #0x2c1797ba
0x2c179904 002f       cmp       r7, #0
0x2c179906 54d1       bne       #0x2c1799b2
0x2c179908 364b       ldr       r3, [pc, #0xd8] ; [0x2c1799e4]=0x200fe0b0
0x2c17990a 93f83530   ldrb.w    r3, [r3, #0x35]
0x2c17990e 002b       cmp       r3, #0
0x2c179910 3ff45aaf   beq.w     #0x2c1797c8
0x2c179914 6ef74aff   bl        #0x2c0e87ac
0x2c179918 3b49       ldr       r1, [pc, #0xec] ; [0x2c179a08]=0x2c2578c5 'hfcall_machine:%d'
0x2c17991a 0246       mov       r2, r0
0x2c17991c 0446       mov       r4, r0
0x2c17991e 4220       movs      r0, #0x42
0x2c179920 26f0aafb   bl        #0x2c1a0078
0x2c179924 b8f1010f   cmp.w     r8, #1
0x2c179928 13d1       bne       #0x2c179952
0x2c17992a 3849       ldr       r1, [pc, #0xe0] ; [0x2c179a0c]=0x2c2578f7 'click '
0x2c17992c 4120       movs      r0, #0x41
0x2c17992e 26f0a3fb   bl        #0x2c1a0078
0x2c179932 f6f7bdfa   bl        #0x2c16feb0
0x2c179936 0128       cmp       r0, #1
0x2c179938 05d0       beq       #0x2c179946
0x2c17993a 0123       movs      r3, #1
0x2c17993c 0522       movs      r2, #5
0x2c17993e 1946       mov       r1, r3
0x2c179940 a120       movs      r0, #0xa1
0x2c179942 fcf783fa   bl        #0x2c175e4c
0x2c179946 2046       mov       r0, r4
0x2c179948 05b0       add       sp, #0x14
0x2c17994a bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c17994e fff7d7bb   b.w       #0x2c179100
0x2c179952 b8f1020f   cmp.w     r8, #2
0x2c179956 13d1       bne       #0x2c179980
0x2c179958 2d49       ldr       r1, [pc, #0xb4] ; [0x2c179a10]=0x2c2578d7 'doubleclick '
0x2c17995a 4120       movs      r0, #0x41
0x2c17995c 26f08cfb   bl        #0x2c1a0078
0x2c179960 f6f76afa   bl        #0x2c16fe38
0x2c179964 0128       cmp       r0, #1
0x2c179966 05d0       beq       #0x2c179974
0x2c179968 0223       movs      r3, #2
0x2c17996a 0522       movs      r2, #5
0x2c17996c 0121       movs      r1, #1
0x2c17996e a120       movs      r0, #0xa1
0x2c179970 fcf76cfa   bl        #0x2c175e4c
0x2c179974 2046       mov       r0, r4
0x2c179976 05b0       add       sp, #0x14
0x2c179978 bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c17997c fff768bc   b.w       #0x2c179250
0x2c179980 b8f1030f   cmp.w     r8, #3
0x2c179984 13d1       bne       #0x2c1799ae
0x2c179986 2349       ldr       r1, [pc, #0x8c] ; [0x2c179a14]=0x2c2578e4 'tripleclick '
0x2c179988 4120       movs      r0, #0x41
0x2c17998a 26f075fb   bl        #0x2c1a0078
0x2c17998e f6f777fa   bl        #0x2c16fe80
0x2c179992 0128       cmp       r0, #1
0x2c179994 05d0       beq       #0x2c1799a2
0x2c179996 4346       mov       r3, r8
0x2c179998 0522       movs      r2, #5
0x2c17999a 0121       movs      r1, #1
0x2c17999c a120       movs      r0, #0xa1
0x2c17999e fcf755fa   bl        #0x2c175e4c
0x2c1799a2 2046       mov       r0, r4
0x2c1799a4 05b0       add       sp, #0x14
0x2c1799a6 bde8f04f   pop.w     {r4, r5, r6, r7, r8, sb, sl, fp, lr}
0x2c1799aa fff73bbd   b.w       #0x2c179424
0x2c1799ae 1a49       ldr       r1, [pc, #0x68] ; [0x2c179a18]=0x2c2578f1 'error click '
0x2c1799b0 a3e6       b         #0x2c1796fa
0x2c1799b2 1a49       ldr       r1, [pc, #0x68] ; [0x2c179a1c]=0x2c2578fe 'error key '
0x2c1799b4 a1e6       b         #0x2c1796fa
0x2c1799b6 00bf       nop       
0x2c1799b8 0c77       strb      r4, [r1, #0x1c]
0x2c1799ba 252c       cmp       r4, #0x25
0x2c1799bc 2177       strb      r1, [r4, #0x1c]
0x2c1799be 252c       cmp       r4, #0x25
0x2c1799c0 3b77       strb      r3, [r7, #0x1c]
0x2c1799c2 252c       cmp       r4, #0x25
0x2c1799c4 5277       strb      r2, [r2, #0x1d]
0x2c1799c6 252c       cmp       r4, #0x25
0x2c1799c8 6977       strb      r1, [r5, #0x1d]
0x2c1799ca 252c       cmp       r4, #0x25
0x2c1799cc 8777       strb      r7, [r0, #0x1e]
0x2c1799ce 252c       cmp       r4, #0x25
0x2c1799d0 9977       strb      r1, [r3, #0x1e]
0x2c1799d2 252c       cmp       r4, #0x25
0x2c1799d4 b577       strb      r5, [r6, #0x1e]
0x2c1799d6 252c       cmp       r4, #0x25
0x2c1799d8 3e5e       ldrsh     r6, [r7, r0]
0x2c1799da 0a20       movs      r0, #0xa
0x2c1799dc c677       strb      r6, [r0, #0x1f]
0x2c1799de 252c       cmp       r4, #0x25
0x2c1799e0 df77       strb      r7, [r3, #0x1f]
0x2c1799e2 252c       cmp       r4, #0x25
0x2c1799e4 b0e0       b         #0x2c179b48
0x2c1799e6 0f20       movs      r0, #0xf
0x2c1799e8 1a78       ldrb      r2, [r3]
0x2c1799ea 252c       cmp       r4, #0x25
0x2c1799ec 3778       ldrb      r7, [r6]
0x2c1799ee 252c       cmp       r4, #0x25
0x2c1799f0 34a1       adr       r1, #0xd0
0x2c1799f2 0e20       movs      r0, #0xe
0x2c1799f4 5078       ldrb      r0, [r2, #1]
0x2c1799f6 252c       cmp       r4, #0x25
0x2c1799f8 6778       ldrb      r7, [r4, #1]
0x2c1799fa 252c       cmp       r4, #0x25
0x2c1799fc 7a78       ldrb      r2, [r7, #1]
0x2c1799fe 252c       cmp       r4, #0x25
