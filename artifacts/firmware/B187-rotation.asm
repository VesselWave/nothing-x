0x2c059568 a0f11a03   sub.w     r3, r0, #0x1a
0x2c05956c 012b       cmp       r3, #1
0x2c05956e 37b5       push      {r0, r1, r2, r4, r5, lr}
0x2c059570 0546       mov       r5, r0
0x2c059572 24d8       bhi       #0x2c0595be
0x2c059574 134b       ldr       r3, [pc, #0x4c] ; [0x2c0595c4]=0x2c14b333 'qc_box_control_rotary_volume'
0x2c059576 144a       ldr       r2, [pc, #0x50] ; [0x2c0595c8]=0x2c14b2ee 'QC_BOX_CTRL'
0x2c059578 1449       ldr       r1, [pc, #0x50] ; [0x2c0595cc]=0x2c14b350 '[%s] %s eve:%d '
0x2c05957a 0090       str       r0, [sp]
0x2c05957c 41f24460   movw      r0, #0x1644
0x2c059580 e9f08afc   bl        #0x2c142e98
0x2c059584 0120       movs      r0, #1
0x2c059586 fff719f9   bl        #0x2c0587bc
0x2c05958a 0120       movs      r0, #1
0x2c05958c fff722f9   bl        #0x2c0587d4
0x2c059590 eff7d0ff   bl        #0x2c049534
0x2c059594 1a2d       cmp       r5, #0x1a
0x2c059596 0446       mov       r4, r0
0x2c059598 08d1       bne       #0x2c0595ac
0x2c05959a 0f28       cmp       r0, #0xf
0x2c05959c 0fd8       bhi       #0x2c0595be
0x2c05959e 0021       movs      r1, #0
0x2c0595a0 3220       movs      r0, #0x32
0x2c0595a2 03b0       add       sp, #0xc
0x2c0595a4 bde83040   pop.w     {r4, r5, lr}
0x2c0595a8 dbf098b9   b.w       #0x2c1348dc
0x2c0595ac 38b1       cbz       r0, #0x2c0595be
0x2c0595ae f0f7fbfd   bl        #0x2c04a1a8
0x2c0595b2 08b1       cbz       r0, #0x2c0595b8
0x2c0595b4 012c       cmp       r4, #1
0x2c0595b6 02d0       beq       #0x2c0595be
0x2c0595b8 0021       movs      r1, #0
0x2c0595ba 3320       movs      r0, #0x33
0x2c0595bc f1e7       b         #0x2c0595a2
0x2c0595be 03b0       add       sp, #0xc
0x2c0595c0 30bd       pop       {r4, r5, pc}
