            0x2c0d5080      movs  r0, 0
            0x2c0d5082      bx    lr
            0x2c0d5084      movs  r0, 0
            0x2c0d5086      bx    lr
            0x2c0d5088      mov.w r0, 0x1f0000
            0x2c0d508c      bx    lr
            0x2c0d508e      movs  r0, r0
            0x2c0d6700      push  {r4, lr}
            0x2c0d6702      ldr   r3, [0x2c0d6798]                     ; [0x2c0d6798:4]=0x20005600
            0x2c0d6704      sub   sp, 0x20
            0x2c0d6706      ldr   r3, [r3]
            0x2c0d6708      str   r3, [sp, 0x1c]
            0x2c0d670a      mov.w r3, 0
            0x2c0d670e      movs  r1, 0
            0x2c0d6710      movs  r3, 0x14
            0x2c0d6712      movs  r0, 2
            0x2c0d6714      add   r2, sp, 8
            0x2c0d6716      bl    0x2c143168
            0x2c0d671a      mov.w r3, 0x5a5a5a5a                       ; 'ZZZZ'
            0x2c0d671e      ldr   r4, [0x2c0d679c]                     ; [0x2c0d679c:4]=0x2004321c
            0x2c0d6720      str   r3, [sp, 8]
            0x2c0d6722      ldr   r3, [r4, 0x20]
            0x2c0d6724      str   r3, [sp, 0x10]
            0x2c0d6726      ldr   r3, [r4, 0x10]
            0x2c0d6728      str   r3, [sp, 0xc]
            0x2c0d672a      bl    0x2c0d5080
        ,=< 0x2c0d672e      cbz   r0, 0x2c0d674c
        |   0x2c0d6730      ldr   r3, [sp, 0x18]
        |   0x2c0d6732      movw  r0, 0xbd3
        |   0x2c0d6736      ldr   r2, [0x2c0d67a0]                     ; [0x2c0d67a0:4]=0x2c19a778 "app_update_ota_boot_info"
        |   0x2c0d6738      ldr   r1, [0x2c0d67a4]                     ; [0x2c0d67a4:4]=0x2c19a791 "%s boot_word 0x%x"
        |   0x2c0d673a      bl    0x2c142e98
        |   0x2c0d673e      ldr   r3, [sp, 0x18]
        |   0x2c0d6740      cmp.w r3, -0x44444445                      ; 0xbbbbbbbb
       ,==< 0x2c0d6744      bne   0x2c0d6752
       ||   0x2c0d6746      mov.w r3, -0x55555556
       ||   0x2c0d674a      str   r3, [sp, 0x18]
       |`-> 0x2c0d674c      ldr   r3, [r4, 4]
       |    0x2c0d674e      str   r3, [sp, 0x14]
       |,=< 0x2c0d6750      b     0x2c0d675e
       `--> 0x2c0d6752      mov.w r3, -0x44444445
        |   0x2c0d6756      str   r3, [sp, 0x18]
        |   0x2c0d6758      bl    0x2c0d5084
        |   0x2c0d675c      str   r0, [sp, 0x14]
        `-> 0x2c0d675e      ldr   r2, [sp, 0x14]
            0x2c0d6760      ldr   r1, [0x2c0d67a8]                     ; [0x2c0d67a8:4]=0x2c19a7a3 "new image flash offset 0x%x"
            0x2c0d6762      movs  r0, 0x42                             ; 'B'
            0x2c0d6764      bl    0x2c142e98
            0x2c0d6768      movs  r1, 0
            0x2c0d676a      movs  r0, 2
            0x2c0d676c      bl    0x2c142fa8
            0x2c0d6770      movs  r3, 1
            0x2c0d6772      add   r2, sp, 8
            0x2c0d6774      str   r3, [sp]
            0x2c0d6776      movs  r1, 0
            0x2c0d6778      movs  r3, 0x14
            0x2c0d677a      movs  r0, 2
            0x2c0d677c      bl    0x2c1430f8
            0x2c0d6780      ldr   r3, [0x2c0d6798]                     ; [0x2c0d6798:4]=0x20005600
            0x2c0d6782      ldr   r2, [r3]
            0x2c0d6784      ldr   r3, [sp, 0x1c]
            0x2c0d6786      eors  r2, r3
            0x2c0d6788      mov.w r3, 0
        ,=< 0x2c0d678c      beq   0x2c0d6792
        |   0x2c0d678e      bl    0x2c086f00
        `-> 0x2c0d6792      add   sp, 0x20
            0x2c0d6794      pop   {r4, pc}
            0x2c0d6796      nop
            0x2c0d6798      ldrsb r0, [r0, r0]
            0x2c0d679a      movs  r0, 0
            0x2c0d679c      adds  r2, 0x1c
            0x2c0d679e      movs  r0, 4
            0x2c0d67a0      adr   r7, 0x1e0                            ; 0x2c0d6984
            0x2c0d67a2      cmp   r4, 0x19                             ; 25
            0x2c0d67a4      adr   r7, 0x244                            ; 0x2c0d69ec
            0x2c0d67a6      cmp   r4, 0x19                             ; 25
            0x2c0d67a8      adr   r7, 0x28c                            ; 0x2c0d6a38
            0x2c0d67aa      cmp   r4, 0x19                             ; 25
            0x2c0d68c0      push  {r3, r4, r5, lr}
            0x2c0d68c2      ldr   r5, [0x2c0d68f8]                     ; [0x2c0d68f8:4]=0x28001000
            0x2c0d68c4      ldr   r2, [0x2c0d68fc]                     ; [0x2c0d68fc:4]=0x2c19a847 "ota_common_get_boot_info_flash_offset"
            0x2c0d68c6      ldr   r4, [r5]
            0x2c0d68c8      ldr   r1, [0x2c0d6900]                     ; [0x2c0d6900:4]=0x2c19a86d "[%s],otaBootInfo.magicNumber = 0x%04X"
            0x2c0d68ca      mov   r3, r4
            0x2c0d68cc      movw  r0, 0xbd3
            0x2c0d68d0      bl    0x2c142e98
            0x2c0d68d4      mov   r2, r5
            0x2c0d68d6      movw  r0, 0xbd2
            0x2c0d68da      ldr   r1, [0x2c0d6904]                     ; [0x2c0d6904:4]=0x2c1477f6 "0x%02x "
            0x2c0d68dc      bl    0x2c142e98
            0x2c0d68e0      ldr   r3, [0x2c0d6908]                     ; [0x2c0d6908:4]=0xbe57ec1c
            0x2c0d68e2      cmp   r4, r3
        ,=< 0x2c0d68e4      beq   0x2c0d68f2
        |   0x2c0d68e6      cmp.w r4, 0x5a5a5a5a
       ,==< 0x2c0d68ea      beq   0x2c0d68f2
       ||   0x2c0d68ec      ldr   r0, [0x2c0d690c]                     ; [0x2c0d690c:4]=0x2c19a893 "OTA bootinfo addr is wrong"
       ||   0x2c0d68ee      bl    0x2c142c98
       ``-> 0x2c0d68f2      ldr   r0, [0x2c0d68f8]                     ; [0x2c0d68f8:4]=0x28001000
            0x2c0d68f4      pop   {r3, r4, r5, pc}
            0x2c0d68f6      nop
            0x2c0d68f8      asrs  r0, r0, 0x20
            0x2c0d68fa      cmp   r0, 0
            0x2c0d68fc      add   r0, sp, 0x11c
            0x2c0d68fe      cmp   r4, 0x19                             ; 25
            0x2c0d6900      add   r0, sp, 0x1b4
            0x2c0d6902      cmp   r4, 0x19                             ; 25
            0x2c0d6904      strb  r6, [r6, 0x1f]
            0x2c0d6906      cmp   r4, 0x14                             ; 20
            0x2c0d6908      invalid
            0x2c0d690c      add   r0, sp, 0x24c
            0x2c0d690e      cmp   r4, 0x19                             ; 25
