     ::::   0x2c131a96      cmp.w r8, 2                                ; 2
    ,=====< 0x2c131a9a      bne   0x2c131b1e
    |::::   0x2c131a9c      movs  r2, 0x18
    |::::   0x2c131a9e      movs  r1, 0
    |::::   0x2c131aa0      add   r0, sp, 0x14
    |::::   0x2c131aa2      bl    0x2c143058
    |::::   0x2c131aa6      ldrb  r3, [r4, 0xd]
    |::::   0x2c131aa8      ldr   r1, [0x2c131bbc]                     ; [0x2c131bbc:4]=0x2c1b45cf "[%s] current vol:%d"
    |::::   0x2c131aaa      strb.w r3, [sp, 0x14]
    |::::   0x2c131aae      ldr   r3, [r4, 4]
    |::::   0x2c131ab0      movs  r0, 0x43                             ; 'C'
    |::::   0x2c131ab2      str   r3, [sp, 0x18]
    |::::   0x2c131ab4      ldrb  r3, [r4, 0xc]
    |::::   0x2c131ab6      strb.w r3, [sp, 0x1c]
    |::::   0x2c131aba      ldr   r3, [r4, 8]
    |::::   0x2c131abc      str   r3, [sp, 0x20]
    |::::   0x2c131abe      ldrb  r3, [r4, 0x17]
    |::::   0x2c131ac0      lsls  r2, r3, 1
    |::::   0x2c131ac2      orr   r2, r2, 1
    |::::   0x2c131ac6      strb.w r2, [sp, 0x24]
    |::::   0x2c131aca      ldrb  r2, [r4, 0xf]
    |::::   0x2c131acc      strb.w r2, [sp, 0x25]
    |::::   0x2c131ad0      ldr   r2, [0x2c131ba4]                     ; [0x2c131ba4:4]=0x2c1b4e83 "af_stream_setup"
    |::::   0x2c131ad2      bl    0x2c142e98
    |::::   0x2c131ad6      mov   r0, r7
    |::::   0x2c131ad8      add   r1, sp, 0x14
    |::::   0x2c131ada      bl    0x2c07c98c
    |::::   0x2c131ade      movs  r4, 0
    |:::`=< 0x2c131ae0      b     0x2c1319dc
    |:::    0x2c131ae2      mov   r2, r4
    |:::    0x2c131ae4      mov   r1, r5
    |:::    0x2c131ae6      mov   r0, r7
    |:::    0x2c131ae8      bl    0x2c130ca0
    |::`==< 0x2c131aec      b     0x2c131a60
    |::     0x2c131aee      strd  r2, r7, [sp]
    |::     0x2c131af2      movs  r0, 0x45                             ; 'E'
    |::     0x2c131af4      ldr   r2, [0x2c131ba4]                     ; [0x2c131ba4:4]=0x2c1b4e83 "af_stream_setup"
    |::     0x2c131af6      ldr   r1, [0x2c131bc0]                     ; [0x2c131bc0:4]=0x2c1b4556 "[%s] Change sample rate from %d to %d for stream %d"
    |::     0x2c131af8      bl    0x2c142e98
    |::     0x2c131afc      ldrb  r3, [r5, 2]
    |::     0x2c131afe      lsls  r3, r3, 0x1d
    |:: ,=< 0x2c131b00      bpl   0x2c131b10
    |:: |   0x2c131b02      str   r7, [sp]
    |:: |   0x2c131b04      ldr   r3, [r4, 4]
    |:: |   0x2c131b06      ldr   r2, [r5, 0x1c]
    |:: |   0x2c131b08      ldr   r1, [0x2c131ba4]                     ; [0x2c131ba4:4]=0x2c1b4e83 "af_stream_setup"
    |:: |   0x2c131b0a      ldr   r0, [0x2c131bc4]                     ; [0x2c131bc4:4]=0x2c1b458a "[%s] ERROR: Change sample rate from %d to %d while stream %d started"
    |:: |   0x2c131b0c      bl    0x2c142c98
    |:: `-> 0x2c131b10      ldr   r2, [r5, 0x1c]
    |::     0x2c131b12      ldr   r3, [r4, 4]
    |::     0x2c131b14      cmp   r2, r3
    |:`===< 0x2c131b16      beq   0x2c131a68
    |:      0x2c131b18      mov.w lr, 1
    |`====< 0x2c131b1c      b     0x2c131a76
    `-----> 0x2c131b1e      cmp.w r8, 3                                ; 3
        ,=< 0x2c131b22      bne   0x2c131b68
        |   0x2c131b24      movs  r2, 0x18
        |   0x2c131b26      movs  r1, 0
        |   0x2c131b28      add   r0, sp, 0x14
        :   0x2c1343ce      bl    0x2c058e68
        :   0x2c1343d2      strb.w r0, [sp, 0x4f]
        `=< 0x2c1343d6      b     0x2c1342c4
            0x2c1343d8      ldrsb r0, [r0, r0]
            0x2c1343da      movs  r0, 0
            0x2c1343dc      strh  r4, [r0, 0x36]
            0x2c1343de      movs  r0, 5
            0x2c1343e0      strh  r7, [r0, r2]
            0x2c1343e2      cmp   r4, 0x18                             ; 24
            0x2c1343e4      ldrb  r5, [r3, 0xa]
            0x2c1343e6      cmp   r4, 0x18                             ; 24
            0x2c1343e8      ldrsb r6, [r6, r0]
            0x2c1343ea      cmp   r4, 0x1b                             ; 27
            0x2c1343ec      ldrsb r6, [r5, r0]
      :::   0x2c134474      sub.w r3, r4, 0x32
      :::   0x2c134478      cmp   r3, 1                                ; 1
      ::`=< 0x2c13447a      bhi.w 0x2c1342c4
      ::    0x2c13447e      bl    0x2c049534
      ::    0x2c134482      cmp   r0, 0xc                              ; 12
      ::    0x2c134484      it    hs
      ::    0x2c134486      movhs r0, 0xc
      `===< 0x2c134488      b     0x2c1343d2
       :    0x2c13448a      movs  r4, 0
       `==< 0x2c13448c      b     0x2c134352
            0x2c13448e      vmov.f32 s0, 1.000000e+00
            0x2c134492      bl    0x2c131924
            0x2c134496      vldr  s0, [0x2c134474]
            0x2c13449a      mov   r0, r5
            0x2c13449c      bl    0x2c132838
