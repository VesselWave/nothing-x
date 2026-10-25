0x2c178c00 8bfd2068   stc2      p8, c6, [fp, #0x80]
0x2c178c04 1ff0b8fd   bl        #0x2c198778
0x2c178c08 2560       str       r5, [r4]
0x2c178c0a 38bd       pop       {r3, r4, r5, pc}
0x2c178c0c 3ca1       adr       r1, #0xf0
0x2c178c0e 0e20       movs      r0, #0xe
0x2c178c10 b473       strb      r4, [r6, #0xe]
0x2c178c12 252c       cmp       r4, #0x25
0x2c178c14 34a1       adr       r1, #0xd0
0x2c178c16 0e20       movs      r0, #0xe
0x2c178c18 08b5       push      {r3, lr}
0x2c178c1a 0a4a       ldr       r2, [pc, #0x28] ; [0x2c178c44]=0x2c2573d1 'app_dfu_key_handler'
0x2c178c1c 0a49       ldr       r1, [pc, #0x28] ; [0x2c178c48]=0x2c1d151d
0x2c178c1e 4220       movs      r0, #0x42
0x2c178c20 27f02afa   bl        #0x2c1a0078
0x2c178c24 4ff0ff30   mov.w     r0, #-1
0x2c178c28 17f7dcfa   bl        #0x2c0901e4
0x2c178c2c 4ff49060   mov.w     r0, #0x480
0x2c178c30 17f7b8fa   bl        #0x2c0901a4
0x2c178c34 0120       movs      r0, #1
0x2c178c36 1cf7a3ff   bl        #0x2c095b80
0x2c178c3a bde80840   pop.w     {r3, lr}
0x2c178c3e 1df746be   b.w       #0x2c0968ce
0x2c178c42 00bf       nop       
0x2c178c44 d173       strb      r1, [r2, #0xf]
0x2c178c46 252c       cmp       r4, #0x25
0x2c178c48 1d15       asrs      r5, r3, #0x14
0x2c178c4a 1d2c       cmp       r4, #0x1d
0x2c178c4c 08b5       push      {r3, lr}
0x2c178c4e 094a       ldr       r2, [pc, #0x24] ; [0x2c178c74]=0x2c2573e5 'app_gfps_battery_show_timeout_timer_cb'
0x2c178c50 0949       ldr       r1, [pc, #0x24] ; [0x2c178c78]=0x2c1eb74f
0x2c178c52 4220       movs      r0, #0x42
0x2c178c54 27f010fa   bl        #0x2c1a0078
0x2c178c58 72f798fd   bl        #0x2c0eb78c
0x2c178c5c 20b1       cbz       r0, #0x2c178c68
0x2c178c5e bde80840   pop.w     {r3, lr}
0x2c178c62 0420       movs      r0, #4
0x2c178c64 53f74eb8   b.w       #0x2c0cbd04
0x2c178c68 72f7affd   bl        #0x2c0eb7ca
0x2c178c6c 0028       cmp       r0, #0
0x2c178c6e f6d1       bne       #0x2c178c5e
0x2c178c70 08bd       pop       {r3, pc}
0x2c178c72 00bf       nop       
0x2c178c74 e573       strb      r5, [r4, #0xf]
0x2c178c76 252c       cmp       r4, #0x25
0x2c178c78 4fb7       .byte     0x4f, 0xb7
0x2c178c7a 1e2c       cmp       r4, #0x1e
0x2c178c7c 10b5       push      {r4, lr}
0x2c178c7e 0446       mov       r4, r0
0x2c178c80 f2f760fe   bl        #0x2c16b944
0x2c178c84 60b1       cbz       r0, #0x2c178ca0
0x2c178c86 4c23       movs      r3, #0x4c
0x2c178c88 2370       strb      r3, [r4]
0x2c178c8a 2d23       movs      r3, #0x2d
0x2c178c8c 6370       strb      r3, [r4, #1]
0x2c178c8e 2ff745fa   bl        #0x2c0a811c
0x2c178c92 60b9       cbnz      r0, #0x2c178cae
0x2c178c94 4d23       movs      r3, #0x4d
0x2c178c96 a370       strb      r3, [r4, #2]
0x2c178c98 2f23       movs      r3, #0x2f
0x2c178c9a 0420       movs      r0, #4
0x2c178c9c e370       strb      r3, [r4, #3]
0x2c178c9e 10bd       pop       {r4, pc}
0x2c178ca0 f2f758fe   bl        #0x2c16b954
0x2c178ca4 08b1       cbz       r0, #0x2c178caa
0x2c178ca6 5223       movs      r3, #0x52
0x2c178ca8 eee7       b         #0x2c178c88
0x2c178caa 5523       movs      r3, #0x55
0x2c178cac ece7       b         #0x2c178c88
0x2c178cae 0128       cmp       r0, #1
0x2c178cb0 0cbf       ite       eq
0x2c178cb2 5323       moveq     r3, #0x53
0x2c178cb4 5523       movne     r3, #0x55
0x2c178cb6 eee7       b         #0x2c178c96
0x2c178cb8 08b5       push      {r3, lr}
0x2c178cba 084a       ldr       r2, [pc, #0x20] ; [0x2c178cdc]=0x2c25740c 'app_staying_at_highest_freq_timeout_timer_cb'
0x2c178cbc 0849       ldr       r1, [pc, #0x20] ; [0x2c178ce0]=0x2c1eb74f
0x2c178cbe 4220       movs      r0, #0x42
0x2c178cc0 27f0daf9   bl        #0x2c1a0078
0x2c178cc4 0021       movs      r1, #0
0x2c178cc6 1b20       movs      r0, #0x1b
0x2c178cc8 03f05cfc   bl        #0x2c17c584
0x2c178ccc bde80840   pop.w     {r3, lr}
0x2c178cd0 0021       movs      r1, #0
0x2c178cd2 0120       movs      r0, #1
0x2c178cd4 034a       ldr       r2, [pc, #0xc] ; [0x2c178ce4]=0xc0f362d
0x2c178cd6 7af749ba   b.w       #0x2c0f316c
0x2c178cda 00bf       nop       
0x2c178cdc 0c74       strb      r4, [r1, #0x10]
0x2c178cde 252c       cmp       r4, #0x25
0x2c178ce0 4fb7       .byte     0x4f, 0xb7
0x2c178ce2 1e2c       cmp       r4, #0x1e
0x2c178ce4 2d36       adds      r6, #0x2d
0x2c178ce6 0f0c       lsrs      r7, r1, #0x10
0x2c178ce8 08b5       push      {r3, lr}
0x2c178cea 25f7affe   bl        #0x2c09ea4c
0x2c178cee 7af7f1fd   bl        #0x2c0f38d4
0x2c178cf2 1ef0a9fc   bl        #0x2c197648
0x2c178cf6 0000       movs      r0, r0
0x2c178cf8 08b5       push      {r3, lr}
0x2c178cfa 52f7c7fd   bl        #0x2c0cb88c
0x2c178cfe 0122       movs      r2, #1
0x2c178d00 024b       ldr       r3, [pc, #8] ; [0x2c178d0c]=0x200a5e40
0x2c178d02 5a74       strb      r2, [r3, #0x11]
0x2c178d04 0022       movs      r2, #0
0x2c178d06 9a74       strb      r2, [r3, #0x12]
0x2c178d08 08bd       pop       {r3, pc}
0x2c178d0a 00bf       nop       
0x2c178d0c 405e       ldrsh     r0, [r0, r1]
0x2c178d0e 0a20       movs      r0, #0xa
0x2c178d10 08b5       push      {r3, lr}
0x2c178d12 52f78bfd   bl        #0x2c0cb82c
0x2c178d16 58b1       cbz       r0, #0x2c178d30
0x2c178d18 4120       movs      r0, #0x41
0x2c178d1a 0649       ldr       r1, [pc, #0x18] ; [0x2c178d34]=0x2c257439 '[FP]exit fast pair mode'
0x2c178d1c 27f0acf9   bl        #0x2c1a0078
0x2c178d20 0022       movs      r2, #0
0x2c178d22 054b       ldr       r3, [pc, #0x14] ; [0x2c178d38]=0x200a5e40
0x2c178d24 5a74       strb      r2, [r3, #0x11]
0x2c178d26 9a74       strb      r2, [r3, #0x12]
0x2c178d28 bde80840   pop.w     {r3, lr}
0x2c178d2c 52f7bebd   b.w       #0x2c0cb8ac
0x2c178d30 08bd       pop       {r3, pc}
0x2c178d32 00bf       nop       
0x2c178d34 3974       strb      r1, [r7, #0x10]
0x2c178d36 252c       cmp       r4, #0x25
0x2c178d38 405e       ldrsh     r0, [r0, r1]
0x2c178d3a 0a20       movs      r0, #0xa
0x2c178d3c fff7e8bf   b.w       #0x2c178d10
0x2c178d40 034b       ldr       r3, [pc, #0xc] ; [0x2c178d50]=0x200a5e40
0x2c178d42 03ebc000   add.w     r0, r3, r0, lsl #3
0x2c178d46 0023       movs      r3, #0
0x2c178d48 4370       strb      r3, [r0, #1]
0x2c178d4a 8370       strb      r3, [r0, #2]
0x2c178d4c 7047       bx        lr
0x2c178d4e 00bf       nop       
0x2c178d50 405e       ldrsh     r0, [r0, r1]
0x2c178d52 0a20       movs      r0, #0xa
0x2c178d54 034b       ldr       r3, [pc, #0xc] ; [0x2c178d64]=0x200a5e40
0x2c178d56 03ebc000   add.w     r0, r3, r0, lsl #3
0x2c178d5a 0123       movs      r3, #1
0x2c178d5c 4370       strb      r3, [r0, #1]
0x2c178d5e 0023       movs      r3, #0
0x2c178d60 8370       strb      r3, [r0, #2]
0x2c178d62 7047       bx        lr
0x2c178d64 405e       ldrsh     r0, [r0, r1]
0x2c178d66 0a20       movs      r0, #0xa
0x2c178d68 38b5       push      {r3, r4, r5, lr}
0x2c178d6a 0446       mov       r4, r0
0x2c178d6c 084d       ldr       r5, [pc, #0x20] ; [0x2c178d90]=0x200ea12e
0x2c178d6e 0346       mov       r3, r0
0x2c178d70 2a78       ldrb      r2, [r5]
0x2c178d72 4320       movs      r0, #0x43
0x2c178d74 0749       ldr       r1, [pc, #0x1c] ; [0x2c178d94]=0x2c257451 'app_notify_stack_ready %d %d'
0x2c178d76 27f07ff9   bl        #0x2c1a0078
0x2c178d7a 2878       ldrb      r0, [r5]
0x2c178d7c 2043       orrs      r0, r4
0x2c178d7e 0328       cmp       r0, #3
0x2c178d80 2870       strb      r0, [r5]
0x2c178d82 03d1       bne       #0x2c178d8c
0x2c178d84 bde83840   pop.w     {r3, r4, r5, lr}
0x2c178d88 12f784ba   b.w       #0x2c08b294
0x2c178d8c 38bd       pop       {r3, r4, r5, pc}
0x2c178d8e 00bf       nop       
0x2c178d90 2ea1       adr       r1, #0xb8
0x2c178d92 0e20       movs      r0, #0xe
0x2c178d94 5174       strb      r1, [r2, #0x11]
0x2c178d96 252c       cmp       r4, #0x25
0x2c178d98 024b       ldr       r3, [pc, #8] ; [0x2c178da4]=0x200ea12e
0x2c178d9a 1878       ldrb      r0, [r3]
0x2c178d9c c31e       subs      r3, r0, #3
0x2c178d9e 5842       rsbs      r0, r3, #0
0x2c178da0 5841       adcs      r0, r3
0x2c178da2 7047       bx        lr
0x2c178da4 2ea1       adr       r1, #0xb8
0x2c178da6 0e20       movs      r0, #0xe
0x2c178da8 7047       bx        lr
0x2c178daa 0000       movs      r0, r0
0x2c178dac 08b5       push      {r3, lr}
0x2c178dae 064a       ldr       r2, [pc, #0x18] ; [0x2c178dc8]=0x2c25746e 'user_poweron_factorymode'
0x2c178db0 0649       ldr       r1, [pc, #0x18] ; [0x2c178dcc]=0x2c1eb74f
0x2c178db2 4220       movs      r0, #0x42
0x2c178db4 27f060f9   bl        #0x2c1a0078
0x2c178db8 4ff48030   mov.w     r0, #0x10000
0x2c178dbc 17f712fa   bl        #0x2c0901e4
0x2c178dc0 bde80840   pop.w     {r3, lr}
0x2c178dc4 fef72ebc   b.w       #0x2c177624
0x2c178dc8 6e74       strb      r6, [r5, #0x11]
0x2c178dca 252c       cmp       r4, #0x25
0x2c178dcc 4fb7       .byte     0x4f, 0xb7
0x2c178dce 1e2c       cmp       r4, #0x1e
0x2c178dd0 08b5       push      {r3, lr}
0x2c178dd2 73f737f9   bl        #0x2c0ec044
0x2c178dd6 f6f77dff   bl        #0x2c16fcd4
0x2c178dda 30f7f7fc   bl        #0x2c0a97cc
0x2c178dde 30f7c9fc   bl        #0x2c0a9774
0x2c178de2 bde80840   pop.w     {r3, lr}
0x2c178de6 5cf7d1bc   b.w       #0x2c0d578c
0x2c178dea 0000       movs      r0, r0
0x2c178dec 08b5       push      {r3, lr}
0x2c178dee 0749       ldr       r1, [pc, #0x1c] ; [0x2c178e0c]=0x2c257487 'app_enter_dut_mode1'
0x2c178df0 4120       movs      r0, #0x41
0x2c178df2 27f041f9   bl        #0x2c1a0078
0x2c178df6 0649       ldr       r1, [pc, #0x18] ; [0x2c178e10]=0x2c25749b 'app_enter_dut_mode2'
0x2c178df8 4120       movs      r0, #0x41
0x2c178dfa 27f03df9   bl        #0x2c1a0078
0x2c178dfe bde80840   pop.w     {r3, lr}
0x2c178e02 0021       movs      r1, #0
0x2c178e04 0846       mov       r0, r1
0x2c178e06 fff7c9be   b.w       #0x2c178b9c
0x2c178e0a 00bf       nop       
0x2c178e0c 8774       strb      r7, [r0, #0x12]
0x2c178e0e 252c       cmp       r4, #0x25
0x2c178e10 9b74       strb      r3, [r3, #0x12]
0x2c178e12 252c       cmp       r4, #0x25
0x2c178e14 08b5       push      {r3, lr}
0x2c178e16 f6f7a3fa   bl        #0x2c16f360
0x2c178e1a 0849       ldr       r1, [pc, #0x20] ; [0x2c178e3c]=0x2c2574af 'app_single_dld_mode_enter'
0x2c178e1c 4120       movs      r0, #0x41
0x2c178e1e 27f02bf9   bl        #0x2c1a0078
0x2c178e22 4ff48030   mov.w     r0, #0x10000
0x2c178e26 17f7ddf9   bl        #0x2c0901e4
0x2c178e2a 4ff08060   mov.w     r0, #0x4000000
0x2c178e2e 17f7b9f9   bl        #0x2c0901a4
0x2c178e32 bde80840   pop.w     {r3, lr}
0x2c178e36 1df74abd   b.w       #0x2c0968ce
0x2c178e3a 00bf       nop       
0x2c178e3c af74       strb      r7, [r5, #0x12]
0x2c178e3e 252c       cmp       r4, #0x25
0x2c178e40 70b5       push      {r4, r5, r6, lr}
0x2c178e42 1a4b       ldr       r3, [pc, #0x68] ; [0x2c178eac]=0x2c2574f0
0x2c178e44 92b0       sub       sp, #0x48
0x2c178e46 3d22       movs      r2, #0x3d
0x2c178e48 0021       movs      r1, #0
0x2c178e4a 01a8       add       r0, sp, #4
0x2c178e4c 1b68       ldr       r3, [r3]
0x2c178e4e 1193       str       r3, [sp, #0x44]
0x2c178e50 4ff00003   mov.w     r3, #0
0x2c178e54 27f038fb   bl        #0x2c1a04c8
0x2c178e58 5bf724fa   bl        #0x2c0d42a4
0x2c178e5c 144a       ldr       r2, [pc, #0x50] ; [0x2c178eb0]=0x2c2574c9 'app_ibrt_nvrecord_get_mobile_record'
0x2c178e5e 0446       mov       r4, r0
0x2c178e60 0346       mov       r3, r0
0x2c178e62 1449       ldr       r1, [pc, #0x50] ; [0x2c178eb4]=0x2c254571 '%s-->paired_dev_count[%d]!!!'
0x2c178e64 4320       movs      r0, #0x43
0x2c178e66 27f007f9   bl        #0x2c1a0078
0x2c178e6a 0025       movs      r5, #0
0x2c178e6c 124e       ldr       r6, [pc, #0x48] ; [0x2c178eb8]=0x2c1c8625 '%02x '
0x2c178e6e 013c       subs      r4, #1
0x2c178e70 002c       cmp       r4, #0
0x2c178e72 11db       blt       #0x2c178e98
0x2c178e74 01a9       add       r1, sp, #4
0x2c178e76 a0b2       uxth      r0, r4
0x2c178e78 5bf730fa   bl        #0x2c0d42dc
0x2c178e7c 0622       movs      r2, #6
0x2c178e7e 0121       movs      r1, #1
0x2c178e80 01ab       add       r3, sp, #4
0x2c178e82 3046       mov       r0, r6
0x2c178e84 27f010fd   bl        #0x2c1a08a8
0x2c178e88 01a8       add       r0, sp, #4
0x2c178e8a 33f769f9   bl        #0x2c0ac160
0x2c178e8e 0228       cmp       r0, #2
0x2c178e90 08bf       it        eq
0x2c178e92 0135       addeq     r5, #1
0x2c178e94 013c       subs      r4, #1
0x2c178e96 ebe7       b         #0x2c178e70
0x2c178e98 044b       ldr       r3, [pc, #0x10] ; [0x2c178eac]=0x2c2574f0
0x2c178e9a 1a68       ldr       r2, [r3]
0x2c178e9c 119b       ldr       r3, [sp, #0x44]
0x2c178e9e 5a40       eors      r2, r3
0x2c178ea0 01d0       beq       #0x2c178ea6
0x2c178ea2 2af72fff   bl        #0x2c0a3d04
0x2c178ea6 2846       mov       r0, r5
0x2c178ea8 12b0       add       sp, #0x48
0x2c178eaa 70bd       pop       {r4, r5, r6, pc}
0x2c178eac f074       strb      r0, [r6, #0x13]
0x2c178eae 252c       cmp       r4, #0x25
0x2c178eb0 c974       strb      r1, [r1, #0x13]
0x2c178eb2 252c       cmp       r4, #0x25
0x2c178eb4 7145       cmp       r1, lr
0x2c178eb6 252c       cmp       r4, #0x25
0x2c178eb8 2586       strh      r5, [r4, #0x30]
0x2c178eba 1c2c       cmp       r4, #0x1c
0x2c178ebc 10b5       push      {r4, lr}
0x2c178ebe 5bf7f1f9   bl        #0x2c0d42a4
0x2c178ec2 0446       mov       r4, r0
0x2c178ec4 fff7bcff   bl        #0x2c178e40
0x2c178ec8 201a       subs      r0, r4, r0
0x2c178eca 10bd       pop       {r4, pc}
0x2c178ecc 10b5       push      {r4, lr}
0x2c178ece 1c4b       ldr       r3, [pc, #0x70] ; [0x2c178f40]=0x2c257534
0x2c178ed0 86b0       sub       sp, #0x18
0x2c178ed2 1b68       ldr       r3, [r3]
0x2c178ed4 0593       str       r3, [sp, #0x14]
0x2c178ed6 4ff00003   mov.w     r3, #0
0x2c178eda 32f7c1ff   bl        #0x2c0abe60
0x2c178ede 30b3       cbz       r0, #0x2c178f2e
0x2c178ee0 77f7e3fe   bl        #0x2c0f0caa
0x2c178ee4 0446       mov       r4, r0
0x2c178ee6 73f7e2fa   bl        #0x2c0ec4ae
0x2c178eea 40b1       cbz       r0, #0x2c178efe
0x2c178eec 2046       mov       r0, r4
0x2c178eee 73f7defa   bl        #0x2c0ec4ae
0x2c178ef2 0346       mov       r3, r0
0x2c178ef4 0068       ldr       r0, [r0]
0x2c178ef6 0390       str       r0, [sp, #0xc]
0x2c178ef8 9b88       ldrh      r3, [r3, #4]
0x2c178efa adf81030   strh.w    r3, [sp, #0x10]
0x2c178efe 2046       mov       r0, r4
0x2c178f00 75f722fd   bl        #0x2c0ee948
0x2c178f04 8df81200   strb.w    r0, [sp, #0x12]
0x2c178f08 2046       mov       r0, r4
0x2c178f0a 70f70ff8   bl        #0x2c0e8f2c
0x2c178f0e 0d4a       ldr       r2, [pc, #0x34] ; [0x2c178f44]=0x2c2574f4 'app_ibrt_sync_volume_info'
0x2c178f10 0d49       ldr       r1, [pc, #0x34] ; [0x2c178f48]=0x2c25750e '%s, sync a2dp_vol: %d, hfp_vol: %d'
0x2c178f12 8df81300   strb.w    r0, [sp, #0x13]
0x2c178f16 0090       str       r0, [sp]
0x2c178f18 9df81230   ldrb.w    r3, [sp, #0x12]
0x2c178f1c 4420       movs      r0, #0x44
0x2c178f1e 27f0abf8   bl        #0x2c1a0078
0x2c178f22 0822       movs      r2, #8
0x2c178f24 48f21800   movw      r0, #0x8018
0x2c178f28 03a9       add       r1, sp, #0xc
0x2c178f2a 3bf7fbfe   bl        #0x2c0b4d24
0x2c178f2e 044b       ldr       r3, [pc, #0x10] ; [0x2c178f40]=0x2c257534
0x2c178f30 1a68       ldr       r2, [r3]
0x2c178f32 059b       ldr       r3, [sp, #0x14]
0x2c178f34 5a40       eors      r2, r3
0x2c178f36 01d0       beq       #0x2c178f3c
0x2c178f38 2af7e4fe   bl        #0x2c0a3d04
0x2c178f3c 06b0       add       sp, #0x18
0x2c178f3e 10bd       pop       {r4, pc}
0x2c178f40 3475       strb      r4, [r6, #0x14]
0x2c178f42 252c       cmp       r4, #0x25
0x2c178f44 f474       strb      r4, [r6, #0x13]
0x2c178f46 252c       cmp       r4, #0x25
0x2c178f48 0e75       strb      r6, [r1, #0x14]
0x2c178f4a 252c       cmp       r4, #0x25
0x2c178f4c 014b       ldr       r3, [pc, #4] ; [0x2c178f54]=0x200fe0b0
0x2c178f4e 93f83500   ldrb.w    r0, [r3, #0x35]
0x2c178f52 7047       bx        lr
0x2c178f54 b0e0       b         #0x2c1790b8
0x2c178f56 0f20       movs      r0, #0xf
0x2c178f58 014b       ldr       r3, [pc, #4] ; [0x2c178f60]=0x200fe0b0
0x2c178f5a 83f83500   strb.w    r0, [r3, #0x35]
0x2c178f5e 7047       bx        lr
0x2c178f60 b0e0       b         #0x2c1790c4
0x2c178f62 0f20       movs      r0, #0xf
0x2c178f64 10b5       push      {r4, lr}
0x2c178f66 0b4c       ldr       r4, [pc, #0x2c] ; [0x2c178f94]=0x200ea13c
0x2c178f68 4120       movs      r0, #0x41
0x2c178f6a 0b49       ldr       r1, [pc, #0x2c] ; [0x2c178f98]=0x2c257538 'user_apps_volume_going_timer_start'
0x2c178f6c 27f084f8   bl        #0x2c1a0078
0x2c178f70 2268       ldr       r2, [r4]
0x2c178f72 72b9       cbnz      r2, #0x2c178f92
0x2c178f74 1146       mov       r1, r2
0x2c178f76 0948       ldr       r0, [pc, #0x24] ; [0x2c178f9c]=0x2c257fd8
0x2c178f78 1cf009fb   bl        #0x2c19558e
0x2c178f7c 2060       str       r0, [r4]
0x2c178f7e 40b1       cbz       r0, #0x2c178f92
0x2c178f80 1ff0cafb   bl        #0x2c198718
0x2c178f84 2068       ldr       r0, [r4]
0x2c178f86 4ff49671   mov.w     r1, #0x12c
0x2c178f8a bde81040   pop.w     {r4, lr}
0x2c178f8e 1ff0a7bb   b.w       #0x2c1986e0
0x2c178f92 10bd       pop       {r4, pc}
0x2c178f94 3ca1       adr       r1, #0xf0
0x2c178f96 0e20       movs      r0, #0xe
0x2c178f98 3875       strb      r0, [r7, #0x14]
0x2c178f9a 252c       cmp       r4, #0x25
0x2c178f9c d87f       ldrb      r0, [r3, #0x1f]
0x2c178f9e 252c       cmp       r4, #0x25
0x2c178fa0 38b5       push      {r3, r4, r5, lr}
0x2c178fa2 77f782fe   bl        #0x2c0f0caa
0x2c178fa6 0546       mov       r5, r0
0x2c178fa8 6ff700fc   bl        #0x2c0e87ac
0x2c178fac 08b1       cbz       r0, #0x2c178fb2
0x2c178fae 0628       cmp       r0, #6
0x2c178fb0 20d1       bne       #0x2c178ff4
0x2c178fb2 4120       movs      r0, #0x41
0x2c178fb4 1e49       ldr       r1, [pc, #0x78] ; [0x2c179030]=0x2c25755b 'set a2dp volume up'
0x2c178fb6 27f05ff8   bl        #0x2c1a0078
0x2c178fba 2846       mov       r0, r5
0x2c178fbc eaf7a2fc   bl        #0x2c163904
0x2c178fc0 18b9       cbnz      r0, #0x2c178fca
0x2c178fc2 bde83840   pop.w     {r3, r4, r5, lr}
0x2c178fc6 2ff703ba   b.w       #0x2c0a83d0
0x2c178fca 2846       mov       r0, r5
0x2c178fcc 75f7bcfc   bl        #0x2c0ee948
0x2c178fd0 0130       adds      r0, #1
0x2c178fd2 c4b2       uxtb      r4, r0
0x2c178fd4 0f2c       cmp       r4, #0xf
0x2c178fd6 0bd8       bhi       #0x2c178ff0
0x2c178fd8 0021       movs      r1, #0
0x2c178fda 3220       movs      r0, #0x32
0x2c178fdc e6f756fb   bl        #0x2c15f68c
0x2c178fe0 2146       mov       r1, r4
0x2c178fe2 2846       mov       r0, r5
0x2c178fe4 75f7e4fe   bl        #0x2c0eedb0
0x2c178fe8 bde83840   pop.w     {r3, r4, r5, lr}
0x2c178fec 76f71fb8   b.w       #0x2c0ef02e
0x2c178ff0 1024       movs      r4, #0x10
0x2c178ff2 f5e7       b         #0x2c178fe0
0x2c178ff4 0f49       ldr       r1, [pc, #0x3c] ; [0x2c179034]=0x2c25756e 'set hfp volume up'
0x2c178ff6 4120       movs      r0, #0x41
0x2c178ff8 27f03ef8   bl        #0x2c1a0078
0x2c178ffc 2846       mov       r0, r5
0x2c178ffe 6ff795ff   bl        #0x2c0e8f2c
0x2c179002 0828       cmp       r0, #8
0x2c179004 0fd0       beq       #0x2c179026
0x2c179006 441c       adds      r4, r0, #1
0x2c179008 e4b2       uxtb      r4, r4
0x2c17900a 0f2c       cmp       r4, #0xf
0x2c17900c 0dd8       bhi       #0x2c17902a
0x2c17900e 0021       movs      r1, #0
0x2c179010 3220       movs      r0, #0x32
0x2c179012 e6f73bfb   bl        #0x2c15f68c
0x2c179016 2146       mov       r1, r4
0x2c179018 2846       mov       r0, r5
0x2c17901a 70f702f8   bl        #0x2c0e9022
0x2c17901e bde83840   pop.w     {r3, r4, r5, lr}
0x2c179022 70f7ffb8   b.w       #0x2c0e9224
0x2c179026 0a24       movs      r4, #0xa
0x2c179028 f1e7       b         #0x2c17900e
0x2c17902a 1024       movs      r4, #0x10
0x2c17902c f3e7       b         #0x2c179016
0x2c17902e 00bf       nop       
0x2c179030 5b75       strb      r3, [r3, #0x15]
0x2c179032 252c       cmp       r4, #0x25
0x2c179034 6e75       strb      r6, [r5, #0x15]
0x2c179036 252c       cmp       r4, #0x25
0x2c179038 38b5       push      {r3, r4, r5, lr}
0x2c17903a 77f736fe   bl        #0x2c0f0caa
0x2c17903e 0546       mov       r5, r0
0x2c179040 6ff7b4fb   bl        #0x2c0e87ac
0x2c179044 08b1       cbz       r0, #0x2c17904a
0x2c179046 0628       cmp       r0, #6
0x2c179048 22d1       bne       #0x2c179090
0x2c17904a 4120       movs      r0, #0x41
0x2c17904c 2849       ldr       r1, [pc, #0xa0] ; [0x2c1790f0]=0x2c257580 'set a2dp volume down'
0x2c17904e 27f013f8   bl        #0x2c1a0078
0x2c179052 2846       mov       r0, r5
0x2c179054 eaf756fc   bl        #0x2c163904
0x2c179058 18b9       cbnz      r0, #0x2c179062
0x2c17905a bde83840   pop.w     {r3, r4, r5, lr}
0x2c17905e 2ff7c5b9   b.w       #0x2c0a83ec
0x2c179062 2846       mov       r0, r5
0x2c179064 75f770fc   bl        #0x2c0ee948
0x2c179068 831e       subs      r3, r0, #2
0x2c17906a dbb2       uxtb      r3, r3
0x2c17906c 0f2b       cmp       r3, #0xf
0x2c17906e 0dd8       bhi       #0x2c17908c
0x2c179070 441e       subs      r4, r0, #1
0x2c179072 0021       movs      r1, #0
0x2c179074 3320       movs      r0, #0x33
0x2c179076 e4b2       uxtb      r4, r4
0x2c179078 e6f708fb   bl        #0x2c15f68c
0x2c17907c 2146       mov       r1, r4
0x2c17907e 2846       mov       r0, r5
0x2c179080 75f796fe   bl        #0x2c0eedb0
0x2c179084 bde83840   pop.w     {r3, r4, r5, lr}
0x2c179088 75f7d1bf   b.w       #0x2c0ef02e
0x2c17908c 0024       movs      r4, #0
0x2c17908e f5e7       b         #0x2c17907c
0x2c179090 1849       ldr       r1, [pc, #0x60] ; [0x2c1790f4]=0x2c257595 'set hfp volume down'
0x2c179092 4120       movs      r0, #0x41
0x2c179094 26f0f0ff   bl        #0x2c1a0078
0x2c179098 2846       mov       r0, r5
0x2c17909a 6ff747ff   bl        #0x2c0e8f2c
0x2c17909e 0446       mov       r4, r0
0x2c1790a0 0246       mov       r2, r0
0x2c1790a2 1549       ldr       r1, [pc, #0x54] ; [0x2c1790f8]=0x2c2575a9 'set hfp volume down hfp_volume_local_get %d'
0x2c1790a4 4220       movs      r0, #0x42
0x2c1790a6 26f0e7ff   bl        #0x2c1a0078
0x2c1790aa 2cb1       cbz       r4, #0x2c1790b8
0x2c1790ac 0a2c       cmp       r4, #0xa
0x2c1790ae 0ebf       itee      eq
0x2c1790b0 0824       moveq     r4, #8
0x2c1790b2 04f1ff34   addne.w   r4, r4, #-1
0x2c1790b6 e4b2       uxtbne    r4, r4
0x2c1790b8 a31e       subs      r3, r4, #2
0x2c1790ba dbb2       uxtb      r3, r3
0x2c1790bc 0e2b       cmp       r3, #0xe
0x2c1790be 4ff00001   mov.w     r1, #0
0x2c1790c2 10d9       bls       #0x2c1790e6
0x2c1790c4 3420       movs      r0, #0x34
0x2c1790c6 e6f7e1fa   bl        #0x2c15f68c
0x2c1790ca 0124       movs      r4, #1
0x2c1790cc 2246       mov       r2, r4
0x2c1790ce 0b49       ldr       r1, [pc, #0x2c] ; [0x2c1790fc]=0x2c2575d5 'set hfp volume down %d'
0x2c1790d0 4220       movs      r0, #0x42
0x2c1790d2 26f0d1ff   bl        #0x2c1a0078
0x2c1790d6 2146       mov       r1, r4
0x2c1790d8 2846       mov       r0, r5
0x2c1790da 6ff7a2ff   bl        #0x2c0e9022
0x2c1790de bde83840   pop.w     {r3, r4, r5, lr}
0x2c1790e2 70f79fb8   b.w       #0x2c0e9224
0x2c1790e6 3320       movs      r0, #0x33
0x2c1790e8 e6f7d0fa   bl        #0x2c15f68c
0x2c1790ec eee7       b         #0x2c1790cc
0x2c1790ee 00bf       nop       
0x2c1790f0 8075       strb      r0, [r0, #0x16]
0x2c1790f2 252c       cmp       r4, #0x25
0x2c1790f4 9575       strb      r5, [r2, #0x16]
0x2c1790f6 252c       cmp       r4, #0x25
0x2c1790f8 a975       strb      r1, [r5, #0x16]
0x2c1790fa 252c       cmp       r4, #0x25
0x2c1790fc d575       strb      r5, [r2, #0x17]
0x2c1790fe 252c       cmp       r4, #0x25
