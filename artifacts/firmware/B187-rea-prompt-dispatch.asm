            0x2c059568      sub.w r3, r0, 0x1a
            0x2c05956c      cmp   r3, 1                                ; 1
            0x2c05956e      push  {r0, r1, r2, r4, r5, lr}
            0x2c059570      mov   r5, r0
        ,=< 0x2c059572      bhi   0x2c0595be
        |   0x2c059574      ldr   r3, [0x2c0595c4]                     ; [0x2c0595c4:4]=0x2c14b333 "qc_box_control_rotary_volume"
        |   0x2c059576      ldr   r2, [0x2c0595c8]                     ; [0x2c0595c8:4]=0x2c14b2ee "QC_BOX_CTRL"
        |   0x2c059578      ldr   r1, [0x2c0595cc]                     ; [0x2c0595cc:4]=0x2c14b350 "[%s] %s eve:%d "
        |   0x2c05957a      str   r0, [sp]
        |   0x2c05957c      movw  r0, 0x1644
        |   0x2c059580      bl    0x2c142e98
        |   0x2c059584      movs  r0, 1
        |   0x2c059586      bl    0x2c0587bc
        |   0x2c05958a      movs  r0, 1
        |   0x2c05958c      bl    0x2c0587d4
        |   0x2c059590      bl    0x2c049534
        |   0x2c059594      cmp   r5, 0x1a                             ; 26
        |   0x2c059596      mov   r4, r0
       ,==< 0x2c059598      bne   0x2c0595ac
       ||   0x2c05959a      cmp   r0, 0xf                              ; 15
      ,===< 0x2c05959c      bhi   0x2c0595be
      |||   0x2c05959e      movs  r1, 0
      |||   0x2c0595a0      movs  r0, 0x32                             ; '2'
     .----> 0x2c0595a2      add   sp, 0xc
     :|||   0x2c0595a4      pop.w {r4, r5, lr}
    ,=====< 0x2c0595a8      b.w   0x2c1348dc
   ,===`--> 0x2c0595ac      cbz   r0, 0x2c0595be
   ||:| |   0x2c0595ae      bl    0x2c04a1a8
   ||:|,==< 0x2c0595b2      cbz   r0, 0x2c0595b8
   ||:|||   0x2c0595b4      cmp   r4, 1                                ; 1
  ,=======< 0x2c0595b6      beq   0x2c0595be
  |||:|`--> 0x2c0595b8      movs  r1, 0
  |||:| |   0x2c0595ba      movs  r0, 0x33                             ; '3'
  |||`====< 0x2c0595bc      b     0x2c0595a2
  ``--`-`-> 0x2c0595be      add   sp, 0xc
    |       0x2c0595c0      pop   {r4, r5, pc}
    |       0x2c0595c2      nop
    |   ,=< 0x2c0595c4      cbz   r3, 0x2c059614
    |   |   0x2c0595c6      cmp   r4, 0x14                             ; 20
    |   |   0x2c0595c8      uxtb  r6, r5
    |   |   0x2c0595ca      cmp   r4, 0x14                             ; 20
    |  ,==< 0x2c0595cc      cbz   r0, 0x2c059624
    |  ||   0x2c0595ce      cmp   r4, 0x14                             ; 20
    |  ||   0x2c0595d0      ldr   r3, [0x2c0595e4]                     ; [0x2c0595e4:4]=0x20021824
    |  ||   0x2c0595d2      ldr   r2, [0x2c0595e8]                     ; [0x2c0595e8:4]=0x2c14b360 "QC_BOX_ADV"
    |  ||   0x2c0595d4      strb  r0, [r3]
    |  ||   0x2c0595d6      ldr   r1, [0x2c0595ec]                     ; [0x2c0595ec:4]=0x2c14b36b "[%s] connect state %d"
     ::::   0x2c1348dc      push  {r0, r1, r2, r3, r4, r5, r6, lr}
     ::::   0x2c1348de      ldr   r3, [0x2c1349c4]                     ; [0x2c1349c4:4]=0x20005600
     ::::   0x2c1348e0      mov   r4, r0
     ::::   0x2c1348e2      mov   r5, r1
     ::::   0x2c1348e4      ldr   r3, [r3]
     ::::   0x2c1348e6      str   r3, [sp, 0xc]
     ::::   0x2c1348e8      mov.w r3, 0
     ::::   0x2c1348ec      bl    0x2c04a2a4
    ,=====< 0x2c1348f0      cbz   r0, 0x2c134912
    |::::   0x2c1348f2      ldr   r3, [0x2c1349c4]                     ; [0x2c1349c4:4]=0x20005600
    |::::   0x2c1348f4      ldr   r2, [r3]
    |::::   0x2c1348f6      ldr   r3, [sp, 0xc]
    |::::   0x2c1348f8      eors  r2, r3
    |::::   0x2c1348fa      mov.w r3, 0
   ,======< 0x2c1348fe      beq   0x2c134904
  .-------> 0x2c134900      bl    0x2c086f00
  :`------> 0x2c134904      movs  r0, 0x41                             ; 'A'
  : |::::   0x2c134906      ldr   r1, [0x2c1349c8]                     ; [0x2c1349c8:4]=0x2c1b5908
  : |::::   0x2c134908      add   sp, 0x10
  : |::::   0x2c13490a      pop.w {r4, r5, r6, lr}
  :,======< 0x2c13490e      b.w   0x2c142e98
  :|`-----> 0x2c134912      ldr   r2, [0x2c1349cc]                     ; [0x2c1349cc:4]=0x2c1b5920
  :| ::::   0x2c134914      ldr   r1, [0x2c1349d0]                     ; [0x2c1349d0:4]=0x2c1b5930
  :| ::::   0x2c134916      mov   r3, r4
  :| ::::   0x2c134918      movs  r0, 0x44                             ; 'D'
  :| ::::   0x2c13491a      str   r4, [sp]
  :| ::::   0x2c13491c      bl    0x2c142e98
  :| ::::   0x2c134920      mov   r1, r5
  :| ::::   0x2c134922      mov   r0, r4
  :| ::::   0x2c134924      ldr   r2, [0x2c1349d4]                     ; [0x2c1349d4:4]=0xc1348dd
  :| ::::   0x2c134926      bl    0x2c134724
  :| ::::   0x2c13492a      cmp   r0, 0
  :|,=====< 0x2c13492c      beq   0x2c1349b0
  :||::::   0x2c13492e      mov   r0, r4
  :||::::   0x2c134930      bl    0x2c13336c
  :||::::   0x2c134934      mov   r6, r0
  :||::::   0x2c134936      bl    0x2c0b8744
  ========< 0x2c13493a      cbz   r0, 0x2c13499e
  ========< 0x2c13493c      cbnz  r6, 0x2c13499e
  :||::::   0x2c13493e      bl    0x2c0b7450
  :||::::   0x2c134942      cmp   r0, 1                                ; 1
  ========< 0x2c134944      bne   0x2c134972
  :||::::   0x2c134946      mov   r2, r5
  :||::::   0x2c134948      mov   r1, r6
  :||::::   0x2c13494a      uxth  r0, r4
  :||::::   0x2c13494c      bl    0x2c1331ec
  ========< 0x2c134950      cbz   r0, 0x2c13499e
  :||::::   0x2c134952      ldr   r3, [0x2c1349c4]                     ; [0x2c1349c4:4]=0x20005600
  :||::::   0x2c134954      ldr   r2, [r3]
  :||::::   0x2c134956      ldr   r3, [sp, 0xc]
  :||::::   0x2c134958      eors  r2, r3
  :||::::   0x2c13495a      mov.w r3, 0
  ========< 0x2c13495e      bne   0x2c134900
  :||::::   0x2c134960      mov   r3, r6
  :||::::   0x2c134962      mov   r2, r5
  :||::::   0x2c134964      mov   r1, r4
  :||::::   0x2c134966      movs  r0, 0xa
  :||::::   0x2c134968      add   sp, 0x10
  :||::::   0x2c13496a      pop.w {r4, r5, r6, lr}
  :||`====< 0x2c13496e      b.w   0x2c1347b4
  ---,====< 0x2c134972      cbnz  r0, 0x2c13499e
  :|||:::   0x2c134974      uxtb  r3, r4
  :|||:::   0x2c134976      cmp   r3, 0x1c                             ; 28
  ========< 0x2c134978      beq   0x2c13499e
  :|||:::   0x2c13497a      ldr   r3, [0x2c1349d8]                     ; [0x2c1349d8:4]=0x200586d0
  :|||:::   0x2c13497c      ldrb  r3, [r3]
  ========< 0x2c13497e      cbnz  r3, 0x2c13499e
  :|||:::   0x2c134980      cmp   r4, 0x25                             ; '%' ; 37
  ========< 0x2c134982      beq   0x2c13499e
  :|||:::   0x2c134984      mov   r2, r4
  :|||:::   0x2c134986      ldr   r1, [0x2c1349dc]                     ; [0x2c1349dc:4]=0x2c1b5947
  :|||:::   0x2c134988      movs  r0, 0x42                             ; 'B'
  :|||:::   0x2c13498a      str   r4, [sp, 8]
  :|||:::   0x2c13498c      bl    0x2c142e98
  :|||:::   0x2c134990      movs  r2, 4
  :|||:::   0x2c134992      movw  r0, 0x803d
  :|||:::   0x2c134996      add   r1, sp, 8
  :|||:::   0x2c134998      bl    0x2c0b7e00
  ========< 0x2c13499c      cbz   r0, 0x2c1349b0
  ---`----> 0x2c13499e      mov   r3, r6
  :|| :::   0x2c1349a0      mov   r2, r5
  :|| :::   0x2c1349a2      mov   r1, r4
  :|| :::   0x2c1349a4      movs  r0, 0
  :|| :::   0x2c1349a6      bl    0x2c1347b4
  :|| :::   0x2c1349aa      movs  r2, 0
  :|| :::   0x2c1349ac      ldr   r3, [0x2c1349e0]                     ; [0x2c1349e0:4]=0x200586cc
  :|| :::   0x2c1349ae      strb  r2, [r3]
  --`-----> 0x2c1349b0      ldr   r3, [0x2c1349c4]                     ; [0x2c1349c4:4]=0x20005600
  :|  :::   0x2c1349b2      ldr   r2, [r3]
  :|  :::   0x2c1349b4      ldr   r3, [sp, 0xc]
  :|  :::   0x2c1349b6      eors  r2, r3
  :|  :::   0x2c1349b8      mov.w r3, 0
  `=======< 0x2c1349bc      bne   0x2c134900
   |  :::   0x2c1349be      add   sp, 0x10
   |  :::   0x2c1349c0      pop   {r4, r5, r6, pc}
   |  :::   0x2c1349c2      nop
   |  :::   0x2c1349c4      ldrsb r0, [r0, r0]
   |  :::   0x2c1349c6      movs  r0, 0
   |  :::   0x2c1349c8      ldr   r0, [r1, r4]
   |  :::   0x2c1349ca      cmp   r4, 0x1b                             ; 27
   |  :::   0x2c1349cc      ldr   r0, [r4, r4]
   |  :::   0x2c1349ce      cmp   r4, 0x1b                             ; 27
   |  :::   0x2c1349d0      ldr   r0, [r6, r4]
   |  :::   0x2c1349d2      cmp   r4, 0x1b                             ; 27
   |  :::   0x2c1349d4      ldr   r0, [0x2c134d4c]                     ; [0x2c134d4c:4]=0xf7fbfd09
   |  :::   0x2c1349d6      lsrs  r3, r2, 0x10
   |  :::   0x2c1349d8      strh  r0, [r2, 0x36]
   |  :::   0x2c1349da      movs  r0, 5
   |  :::   0x2c1349dc      ldr   r7, [r0, r5]
   |  :::   0x2c1349de      cmp   r4, 0x1b                             ; 27
   |  :::   0x2c1349e0      strh  r4, [r1, 0x36]
   |  :::   0x2c1349e2      movs  r0, 5
   |  :::   0x2c1349e4      push  {r4, r5, r6, lr}
   |  :::   0x2c1349e6      ldr   r2, [0x2c134a38]                     ; [0x2c134a38:4]=0xc1349e5
   |  :::   0x2c1349e8      mov   r4, r0
   |  :::   0x2c1349ea      mov   r5, r1
   |  :::   0x2c1349ec      bl    0x2c134724
   | ,====< 0x2c1349f0      cbz   r0, 0x2c134a1a
   | |:::   0x2c1349f2      cmp   r4, 0x25                             ; '%' ; 37
   |,=====< 0x2c1349f4      bne   0x2c1349fa
   |||:::   0x2c1349f6      bl    0x2c0af248
   |`-----> 0x2c1349fa      mov   r0, r4
   | |:::   0x2c1349fc      bl    0x2c13336c
   | |:::   0x2c134a00      mov   r6, r0
   | |:::   0x2c134a02      bl    0x2c0b8744
   |,=====< 0x2c134a06      cbnz  r0, 0x2c134a1c
  .-------> 0x2c134a08      mov   r3, r6
  :|||:::   0x2c134a0a      mov   r2, r5
  :|||:::   0x2c134a0c      mov   r1, r4
  :|||:::   0x2c134a0e      movs  r0, 3
  :|||:::   0x2c134a10      bl    0x2c1347b4
  :|||:::   0x2c134a14      movs  r2, 0
  :|||:::   0x2c134a16      ldr   r3, [0x2c134a3c]                     ; [0x2c134a3c:4]=0x200586cc
  :|||:::   0x2c134a18      strb  r2, [r3]
  ---`----> 0x2c134a1a      pop   {r4, r5, r6, pc}
  :|`-----> 0x2c134a1c      cmp   r6, 0
  ========< 0x2c134a1e      bne   0x2c134a08
  :|  :::   0x2c134a20      bl    0x2c0b7450
  :|  :::   0x2c134a24      cmp   r0, 1                                ; 1
  ========< 0x2c134a26      bne   0x2c134a08
  :|  :::   0x2c134a28      mov   r2, r5
  :|  :::   0x2c134a2a      movs  r1, 3
  :|  :::   0x2c134a2c      uxth  r0, r4
  :|  :::   0x2c134a2e      bl    0x2c1331ec
  :|  :::   0x2c134a32      cmp   r0, 0
  `=======< 0x2c134a34      beq   0x2c134a08
  ========< 0x2c134a36      b     0x2c134a1a
   |  :::   0x2c134a38      ldr   r1, [0x2c134dd0]                     ; [0x2c134dd0:4]=0x681b4604
   |  :::   0x2c134a3a      lsrs  r3, r2, 0x10
   |  :::   0x2c134a3c      strh  r4, [r1, 0x36]
   |  :::   0x2c134a3e      movs  r0, 5
   |  :::   0x2c134a40      push  {r0, r1, r2, r4, r5, lr}
   |  :::   0x2c134a42      ldr   r2, [0x2c134a74]                     ; [0x2c134a74:4]=0xc134a41
   |  :::   0x2c134a44      mov   r4, r0
   |  :::   0x2c134a46      mov   r5, r1
   |  :::   0x2c134a48      bl    0x2c134724
   | ,====< 0x2c134a4c      cbz   r0, 0x2c134a6e
   | |:::   0x2c134a4e      mov   r3, r4
   | |:::   0x2c134a50      ldr   r2, [0x2c134a78]                     ; [0x2c134a78:4]=0x2c1b5965
   | |:::   0x2c134a52      ldr   r1, [0x2c134a7c]                     ; [0x2c134a7c:4]=0x2c1b5930
   | |:::   0x2c134a54      movs  r0, 0x44                             ; 'D'
   | |:::   0x2c134a56      str   r4, [sp]
   | |:::   0x2c134a58      bl    0x2c142e98
   | |:::   0x2c134a5c      movs  r3, 1
   | |:::   0x2c134a5e      mov   r2, r5
   | |:::   0x2c134a60      mov   r0, r3
   | |:::   0x2c134a62      mov   r1, r4
   | |:::   0x2c134a64      bl    0x2c1347b4
   | |:::   0x2c134a68      movs  r2, 0
   | |:::   0x2c134a6a      ldr   r3, [0x2c134a80]                     ; [0x2c134a80:4]=0x200586cc
   | |:::   0x2c134a6c      strb  r2, [r3]
   | `----> 0x2c134a6e      add   sp, 0xc
   |  :::   0x2c134a70      pop   {r4, r5, pc}
   |  :::   0x2c134a72      nop
   |  :::   0x2c134a74      ldr   r2, [0x2c134b7c]                     ; [0x2c134b7c:4]=0xe7ec2004
   |  :::   0x2c134a76      lsrs  r3, r2, 0x10
   |  :::   0x2c134a78      ldr   r5, [r4, r5]
   |  :::   0x2c134a7a      cmp   r4, 0x1b                             ; 27
   |  :::   0x2c134a7c      ldr   r0, [r6, r4]
   |  :::   0x2c134a7e      cmp   r4, 0x1b                             ; 27
   |  :::   0x2c134a80      strh  r4, [r1, 0x36]
   |  :::   0x2c134a82      movs  r0, 5
   |  :::   0x2c134a84      push  {r0, r1, r2, lr}
   |  :::   0x2c134a86      ldr   r3, [r0, 8]
   |  :::   0x2c134a88      ands  r2, r3, 1
   | ,====< 0x2c134a8c      beq   0x2c134a94
   |.-----> 0x2c134a8e      bl    0x2c1338ec
  ,=======< 0x2c134a92      b     0x2c134ab8
  ||:`----> 0x2c134a94      ands  r1, r3, 2
  ||:,====< 0x2c134a98      beq   0x2c134ad8
  ||:|:::   0x2c134a9a      str   r2, [sp, 4]
  ||:|:::   0x2c134a9c      bl    0x2c1335b8
  ||:|:::   0x2c134aa0      ldr   r3, [0x2c134af0]                     ; [0x2c134af0:4]=0x200586ea
  ||:|:::   0x2c134aa2      ldrb  r3, [r3]
  ========< 0x2c134aa4      cbz   r3, 0x2c134ac0
  ||:|:::   0x2c134aa6      ldr   r3, [0x2c134af4]                     ; [0x2c134af4:4]=0x2001ede4
  ||:|:::   0x2c134aa8      ldr   r1, [r3]
  ||:|:::   0x2c134aaa      adds  r0, r1, 1
  ========< 0x2c134aac      beq   0x2c134ac0
  ||:|:::   0x2c134aae      movs  r3, 1
  ||:|:::   0x2c134ab0      movs  r0, 7
  ||:|:::   0x2c134ab2      ldr   r2, [sp, 4]
  --------> 0x2c134ab4      bl    0x2c1347b4
  `-------> 0x2c134ab8      movs  r0, 0
   |:|:::   0x2c134aba      add   sp, 0xc
   |:|:::   0x2c134abc      ldr   pc, [sp], 4
  --------> 0x2c134ac0      ldr   r3, [0x2c134af8]                     ; [0x2c134af8:4]=0x200586e9
   |:|:::   0x2c134ac2      ldrb  r3, [r3]
   |:|:::   0x2c134ac4      cmp   r3, 0
  ========< 0x2c134ac6      beq   0x2c134ab8
   |:|:::   0x2c134ac8      ldr   r3, [0x2c134af4]                     ; [0x2c134af4:4]=0x2001ede4
   |:|:::   0x2c134aca      ldr   r1, [r3]
   |:|:::   0x2c134acc      adds  r2, r1, 1
  ========< 0x2c134ace      beq   0x2c134ab8
   |:|:::   0x2c134ad0      movs  r3, 0
   |:|:::   0x2c134ad2      movs  r0, 6
   |:|:::   0x2c134ad4      mov   r2, r3
  ========< 0x2c134ad6      b     0x2c134ab4
   |:`----> 0x2c134ad8      lsls  r3, r3, 0x1d
  ========< 0x2c134ada      bpl   0x2c134ab8
   |: :::   0x2c134adc      mov.w r2, -1
   |: :::   0x2c134ae0      ldr   r3, [0x2c134afc]                     ; [0x2c134afc:4]=0x200586d0
   |: :::   0x2c134ae2      strb  r1, [r3]
   |: :::   0x2c134ae4      ldr   r3, [0x2c134b00]                     ; [0x2c134b00:4]=0x200586e0
   |: :::   0x2c134ae6      str   r2, [r3]
   |: :::   0x2c134ae8      bl    0x2c133620
   |`=====< 0x2c134aec      b     0x2c134a8e
   |  :::   0x2c134aee      nop
   |  :::   0x2c134af0      strh  r2, [r5, 0x36]
   |  :::   0x2c134af2      movs  r0, 5
   |  :::   0x2c134af4      stcl  p0, c2, [r4, 4]!
   |  :::   0x2c134af8      strh  r1, [r5, 0x36]
   |  :::   0x2c134afa      movs  r0, 5
   |  :::   0x2c134afc      strh  r0, [r2, 0x36]
   |  :::   0x2c134afe      movs  r0, 5
   |  :::   0x2c134b00      strh  r0, [r4, 0x36]
   |  :::   0x2c134b02      movs  r0, 5
   |  :::   0x2c134b04      ldr   r3, [0x2c134b18]                     ; [0x2c134b18:4]=0x200586d0
   |  :::   0x2c134b06      ldrb  r2, [r3]
   |  :::   0x2c134b08      movs  r3, 0x56                             ; 'V'
   | .----> 0x2c134b0a      subs  r3, 1
   |,=====< 0x2c134b0c      beq   0x2c134b16
   ||::::   0x2c134b0e      cmp   r2, 0
   ||`====< 0x2c134b10      bne   0x2c134b0a
   || :`==< 0x2c134b12      b.w   0x2c1345e8
   |`-----> 0x2c134b16      bx    lr
   |  : :   0x2c134b18      strh  r0, [r2, 0x36]
   |  : :   0x2c134b1a      movs  r0, 5
   |  : :   0x2c134b1c      push  {r0, r1, r2, r3, r4, lr}
   |  : :   0x2c134b1e      ldr   r3, [0x2c134b94]                     ; [0x2c134b94:4]=0x20005600
   |  : :   0x2c134b20      ldr   r3, [r3]
   |  : :   0x2c134b22      str   r3, [sp, 0xc]
   |  : :   0x2c134b24      mov.w r3, 0
   |  : :   0x2c134b28      movw  r3, 0x801f
   |  :.--> 0x2c134b2c      cmp   r0, r3
   | ,====< 0x2c134b2e      bne   0x2c134b80
   | |:::   0x2c134b30      ldr   r0, [r1]
   | |:::   0x2c134b32      ldrh  r3, [r1, 4]
   | |:::   0x2c134b34      lsrs  r1, r0, 0x10
   | |:::   0x2c134b36      cmp   r1, 0x25                             ; '%' ; 37
   | |:::   0x2c134b38      str   r0, [sp, 4]
   | |:::   0x2c134b3a      strh.w r3, [sp, 8]
   |,=====< 0x2c134b3e      bne   0x2c134b64
   |||:::   0x2c134b40      ldr   r3, [0x2c134b94]                     ; [0x2c134b94:4]=0x20005600
   |||:::   0x2c134b42      ldr   r2, [r3]
   |||:::   0x2c134b44      ldr   r3, [sp, 0xc]
   |||:::   0x2c134b46      eors  r2, r3
   |||:::   0x2c134b48      mov.w r3, 0
  ,=======< 0x2c134b4c      beq   0x2c134b52
  --------> 0x2c134b4e      bl    0x2c086f00
  `-------> 0x2c134b52      movs  r3, 1
   |||:::   0x2c134b54      movs  r0, 3
   |||:::   0x2c134b56      ldrb.w r2, [sp, 4]
  .-------> 0x2c134b5a      add   sp, 0x14
  :|||:::   0x2c134b5c      ldr   lr, [sp], 4
  :|||`===< 0x2c134b60      b.w   0x2c1347b4
  :|`-.---> 0x2c134b64      cmp   r1, 0x1c                             ; 28
  :|,=====< 0x2c134b66      bne   0x2c134b80
  :|||:::   0x2c134b68      ldr   r3, [0x2c134b94]                     ; [0x2c134b94:4]=0x20005600
  :|||:::   0x2c134b6a      ldr   r2, [r3]
  :|||:::   0x2c134b6c      ldr   r3, [sp, 0xc]
  :|||:::   0x2c134b6e      eors  r2, r3
  :|||:::   0x2c134b70      mov.w r3, 0
  ========< 0x2c134b74      bne   0x2c134b4e
  :|||:::   0x2c134b76      movs  r3, 1
  :|||:::   0x2c134b78      movs  r0, 0
  :|||:::   0x2c134b7a      ldrb.w r2, [sp, 4]
  `=======< 0x2c134b7e      b     0x2c134b5a
   |``----> 0x2c134b80      ldr   r3, [0x2c134b94]                     ; [0x2c134b94:4]=0x20005600
   |  :::   0x2c134b82      ldr   r2, [r3]
   |  :::   0x2c134b84      ldr   r3, [sp, 0xc]
   |  :::   0x2c134b86      eors  r2, r3
   |  :::   0x2c134b88      mov.w r3, 0
  ========< 0x2c134b8c      bne   0x2c134b4e
   |  :::   0x2c134b8e      add   sp, 0x14
   |  :::   0x2c134b90      ldr   pc, [sp], 4
   |  :::   0x2c134b94      ldrsb r0, [r0, r0]
   |  :::   0x2c134b96      movs  r0, 0
   | .----> 0x2c134b98      ldrsb.w r2, [r0]
   | ::::   0x2c134b9c      mov   r3, r0
   |.-----> 0x2c134b9e      adds  r0, 1
   |:::::   0x2c134ba0      cmp   r2, 0
   |:`====< 0x2c134ba2      bne   0x2c134b98
   |:.----> 0x2c134ba4      ldrsb r2, [r1], 1
   |:::::   0x2c134ba8      mov   r0, r3
   |:::::   0x2c134baa      strb  r2, [r3], 1
   |:::::   0x2c134bae      cmp   r2, 0
   |:`====< 0x2c134bb0      bne   0x2c134ba4
   |: :::   0x2c134bb2      bx    lr
   |: :::   0x2c134bb4      cmp   r0, 1                                ; 1
   |:,====< 0x2c134bb6      bne   0x2c134bc2
   |:|:::   0x2c134bb8      cmp   r1, 1                                ; 1
   |:|:::   0x2c134bba      ittt  eq
   |:|:::   0x2c134bbc      moveq r2, 0
   |:|:::   0x2c134bbe      ldreq r3, [0x2c134bc4]                     ; [0x2c134bc4:4]=0x20058838
   |:|:::   0x2c134bc0      streq r2, [r3]
   |:`----> 0x2c134bc2      bx    lr
   |: :::   0x2c134bc4      ldrh  r0, [r7]
   |: :::   0x2c134bc6      movs  r0, 5
   |: :::   0x2c134bc8      push  {r4, lr}
   |: :::   0x2c134bca      mov   r4, r0
   |: :::   0x2c134bcc      mov   r3, r0
   |: :::   0x2c134bce      ldr   r2, [0x2c134be0]                     ; [0x2c134be0:4]=0x2c1ed9a4 "bt_set_playback_triggered"
   |: :::   0x2c134bd0      movs  r0, 0x43                             ; 'C'
   |: :::   0x2c134bd2      ldr   r1, [0x2c134be4]                     ; [0x2c134be4:4]=0x2c1ed9be "%s isEnable %d"
   |: :::   0x2c134bd4      bl    0x2c142e98
   |: :::   0x2c134bd8      ldr   r3, [0x2c134be8]                     ; [0x2c134be8:4]=0x200587cc
   |: :::   0x2c134bda      strb  r4, [r3]
   |: :::   0x2c134bdc      pop   {r4, pc}
   |: :::   0x2c134bde      nop
   |: :`==< 0x2c134be0      bls   0x2c134b2c
   |: : :   0x2c134be2      cmp   r4, 0x1e                             ; 30
   |: `===< 0x2c134be4      bls   0x2c134b64
   |:   :   0x2c134be6      cmp   r4, 0x1e                             ; 30
   |:   :   0x2c134be8      strh  r4, [r1, 0x3e]
   |:   :   0x2c134bea      movs  r0, 5
   |:   :   0x2c134bec      push  {r3, lr}
   |:   :   0x2c134bee      ldr   r2, [0x2c134c00]                     ; [0x2c134c00:4]=0x2c1ed9cd "app_multipoint_timer_handler"
   |:   :   0x2c134bf0      movs  r0, 0x42                             ; 'B'
   |:   :   0x2c134bf2      ldr   r1, [0x2c134c04]                     ; [0x2c134c04:4]=0x2c148a06 "%s"
   |:   :   0x2c134bf4      bl    0x2c142e98
   |:   :   0x2c134bf8      movs  r2, 0
   |:   :   0x2c134bfa      ldr   r3, [0x2c134c08]                     ; [0x2c134c08:4]=0x20058832
   |:   :   0x2c134bfc      strb  r2, [r3]
   |:   :   0x2c134bfe      pop   {r3, pc}
   |`=====< 0x2c134c00      bls   0x2c134b9e
   |    :   0x2c134c02      cmp   r4, 0x1e                             ; 30
   |    :   0x2c134c04      ldrh  r6, [r0, 0x10]
   |    :   0x2c134c06      cmp   r4, 0x14                             ; 20
   |    :   0x2c134c08      ldrh  r2, [r6]
   |    :   0x2c134c0a      movs  r0, 5
   |    :   0x2c134c0c      push  {r4, lr}
   |    :   0x2c134c0e      mov   r4, r1
   |    :   0x2c134c10      movs  r0, 2
   |    :   0x2c134c12      bl    0x2c0b013c
   |    :   0x2c134c16      mov   r0, r4
   |    :   0x2c134c18      pop   {r4, pc}
   |    :   0x2c134c1a      movs  r0, r0
   |    :   0x2c134c1c      push  {r3, r4, r5, lr}
   |    :   0x2c134c1e      mov   r4, r0
   |    :   0x2c134c20      mov   r5, r1
   |    :   0x2c134c22      bl    0x2c04a4c8
   |  ,===< 0x2c134c26      cbz   r0, 0x2c134c40
   |  |::   0x2c134c28      bl    0x2c04a190
   |  |::   0x2c134c2c      mov   r1, r0
   | ,====< 0x2c134c2e      cbnz  r0, 0x2c134c40
   | ||::   0x2c134c30      mov   r2, r5
   | ||::   0x2c134c32      mov   r0, r4
   | ||::   0x2c134c34      bl    0x2c143058
   | ||::   0x2c134c38      movs  r0, 0x41                             ; 'A'
   | ||::   0x2c134c3a      ldr   r1, [0x2c134c4c]                     ; [0x2c134c4c:4]=0x2c1ed9ea "QC inbox sco mute ^^^^^"
   | ||::   0x2c134c3c      bl    0x2c142e98
   | ``---> 0x2c134c40      mov   r1, r5
   |   ::   0x2c134c42      mov   r0, r4
   |   ::   0x2c134c44      pop.w {r3, r4, r5, lr}
   |   :`=< 0x2c134c48      b.w   0x2c133300
   |   `==< 0x2c134c4c      bls   0x2c134c24
   |        0x2c134c4e      cmp   r4, 0x1e                             ; 30
   |        0x2c134c50      push  {r3, lr}
   |        0x2c134c52      ldr   r1, [0x2c134c6c]                     ; [0x2c134c6c:4]=0xc0aaa91
   |        0x2c134c54      movs  r0, 1
   |        0x2c134c56      bl    0x2c046a00
   |        0x2c134c5a      invalid
