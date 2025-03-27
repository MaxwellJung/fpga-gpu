	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/maxwelljung/programming/fpga-gpu" "./src/main.c"
	.align	2
	.globl	initColorPalette
	.type	initColorPalette, @function
initColorPalette:
.LFB1:
	.file 1 "./src/main.c"
	.loc 1 29 25
	.cfi_startproc
	.loc 1 30 5
	.loc 1 31 5
	.loc 1 33 5
.LBB2:
	.loc 1 33 10
.LVL0:
	.loc 1 33 23 discriminator 1
.LBE2:
	.loc 1 29 25 is_stmt 0
	li	a2,-1073737728
.LBB3:
	.loc 1 33 14
	li	a4,0
	.loc 1 37 21
	li	a1,4096
	addi	a1,a1,-512
	.loc 1 33 23 discriminator 1
	li	a0,256
.LVL1:
.L2:
	.loc 1 34 9 is_stmt 1
	.loc 1 35 9
	.loc 1 36 9
	.loc 1 37 9
	.loc 1 39 9
	.loc 1 37 21 is_stmt 0
	slli	a5,a4,4
	and	a5,a5,a1
	.loc 1 37 32
	slli	a3,a4,3
	andi	a3,a3,224
	.loc 1 37 27
	or	a5,a5,a3
	.loc 1 37 43
	slli	a3,a4,2
	andi	a3,a3,12
	.loc 1 37 16
	or	a5,a5,a3
	.loc 1 39 47
	sw	a5,0(a2)
	.loc 1 33 41 is_stmt 1 discriminator 3
	addi	a4,a4,1
.LVL2:
	.loc 1 33 23 discriminator 1
	addi	a2,a2,2
	bne	a4,a0,.L2
.LBE3:
	.loc 1 41 1 is_stmt 0
	ret
	.cfi_endproc
.LFE1:
	.size	initColorPalette, .-initColorPalette
	.align	2
	.globl	initFrameBuffer
	.type	initFrameBuffer, @function
initFrameBuffer:
.LFB2:
	.loc 1 43 24 is_stmt 1
	.cfi_startproc
	.loc 1 44 5
.LBB4:
	.loc 1 44 10
.LVL3:
	.loc 1 44 42 discriminator 1
.LBE4:
	.loc 1 43 24 is_stmt 0
	li	a3,118784
	addi	a3,a3,1216
	li	a1,118784
	addi	a1,a1,816
.LBB9:
.LBB5:
.LBB6:
	.loc 1 47 63
	li	a2,-1073610752
.LVL4:
.L5:
.LBE6:
	.loc 1 45 27 is_stmt 1 discriminator 1
.LBE5:
.LBE9:
	.loc 1 43 24 is_stmt 0
	mv	a5,a1
.LVL5:
.L6:
.LBB10:
.LBB8:
.LBB7:
	.loc 1 46 13 is_stmt 1
	.loc 1 47 13
	.loc 1 47 63 is_stmt 0
	add	a4,a2,a5
	sw	a5,0(a4)
.LBE7:
	.loc 1 45 48 is_stmt 1 discriminator 3
	.loc 1 45 27 discriminator 1
	addi	a5,a5,1
.LVL6:
	bne	a5,a3,.L6
.LBE8:
	.loc 1 44 48 discriminator 2
	.loc 1 44 42 discriminator 1
	addi	a1,a1,-400
	addi	a3,a3,-400
	bne	a3,zero,.L5
.LBE10:
	.loc 1 50 1 is_stmt 0
	ret
	.cfi_endproc
.LFE2:
	.size	initFrameBuffer, .-initFrameBuffer
	.align	2
	.globl	isStartBitHigh
	.type	isStartBitHigh, @function
isStartBitHigh:
.LFB3:
	.loc 1 52 23 is_stmt 1
	.cfi_startproc
	.loc 1 53 5
.LVL7:
	.loc 1 54 5
	.loc 1 56 5
	.loc 1 54 26 is_stmt 0
	li	a5,-1073741824
	.loc 1 56 23
	lw	a0,4(a5)
	.loc 1 57 1
	andi	a0,a0,1
	ret
	.cfi_endproc
.LFE3:
	.size	isStartBitHigh, .-isStartBitHigh
	.align	2
	.globl	setBusyStatus
	.type	setBusyStatus, @function
setBusyStatus:
.LFB4:
	.loc 1 59 22 is_stmt 1
	.cfi_startproc
	.loc 1 60 5
.LVL8:
	.loc 1 61 5
	.loc 1 61 21 is_stmt 0
	li	a4,-1073741824
	lw	a5,0(a4)
	ori	a5,a5,1
	sw	a5,0(a4)
	.loc 1 62 1
	ret
	.cfi_endproc
.LFE4:
	.size	setBusyStatus, .-setBusyStatus
	.align	2
	.globl	clearStartBit
	.type	clearStartBit, @function
clearStartBit:
.LFB5:
	.loc 1 64 22 is_stmt 1
	.cfi_startproc
	.loc 1 65 5
.LVL9:
	.loc 1 66 5
	.loc 1 66 22 is_stmt 0
	li	a5,-1073741824
	lw	a4,4(a5)
	andi	a4,a4,-2
	sw	a4,4(a5)
	.loc 1 67 1
	ret
	.cfi_endproc
.LFE5:
	.size	clearStartBit, .-clearStartBit
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB0:
	.loc 1 13 13 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 14 5
	call	initColorPalette
.LVL10:
	.loc 1 15 5
	call	initFrameBuffer
.LVL11:
.L15:
	.loc 1 18 17 is_stmt 0 discriminator 1
	call	isStartBitHigh
.LVL12:
.L13:
	.loc 1 18 16 is_stmt 1 discriminator 1
	beq	a0,zero,.L13
	.loc 1 20 9
	call	setBusyStatus
.LVL13:
	.loc 1 21 9
	call	clearStartBit
.LVL14:
	.loc 1 23 9
.LBB11:
	.loc 1 23 14
	.loc 1 23 27 discriminator 1
.LBE11:
	.loc 1 21 9 is_stmt 0
	li	a5,999424
	addi	a5,a5,576
.LVL15:
.L14:
.LBB12:
	.loc 1 23 38 is_stmt 1 discriminator 3
	.loc 1 23 27 discriminator 1
	addi	a5,a5,-1
.LVL16:
	bne	a5,zero,.L14
	j	.L15
.LBE12:
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "/tools/Xilinx/Vitis/2024.2/gnu/riscv/lin/riscv64-unknown-elf/riscv32-xilinx-elf/usr/include/machine/_default_types.h"
	.file 3 "/tools/Xilinx/Vitis/2024.2/gnu/riscv/lin/riscv64-unknown-elf/riscv32-xilinx-elf/usr/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x21c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x55
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x40
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa8
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x41
	.4byte	0xa8
	.sleb128 -1073741820
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x78
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3b
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd2
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x3c
	.4byte	0xa8
	.sleb128 -1073741824
	.byte	0
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x1
	.byte	0x34
	.byte	0x6
	.4byte	0x113
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x113
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x35
	.4byte	0xa8
	.sleb128 -1073741820
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x36
	.byte	0xe
	.4byte	0x78
	.uleb128 0xa
	.byte	0x11
	.sleb128 -1073741820
	.byte	0x6
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.byte	0
	.uleb128 0x1
	.byte	0x1
	.byte	0x2
	.4byte	.LASF18
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x2b
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16a
	.uleb128 0x5
	.4byte	.LLRL6
	.uleb128 0x2
	.string	"y"
	.byte	0x2c
	.byte	0xe
	.4byte	0x6a
	.4byte	.LLST7
	.uleb128 0x5
	.4byte	.LLRL8
	.uleb128 0x2
	.string	"x"
	.byte	0x2d
	.byte	0x12
	.4byte	0x6a
	.4byte	.LLST9
	.uleb128 0x5
	.4byte	.LLRL10
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x2e
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c8
	.uleb128 0x2
	.string	"r"
	.byte	0x1e
	.byte	0xe
	.4byte	0x78
	.4byte	.LLST0
	.uleb128 0x2
	.string	"g"
	.byte	0x1e
	.byte	0x11
	.4byte	0x78
	.4byte	.LLST1
	.uleb128 0x2
	.string	"b"
	.byte	0x1e
	.byte	0x14
	.4byte	0x78
	.4byte	.LLST2
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x1f
	.byte	0xe
	.4byte	0x78
	.4byte	.LLST3
	.uleb128 0x5
	.4byte	.LLRL4
	.uleb128 0x2
	.string	"i"
	.byte	0x21
	.byte	0xe
	.4byte	0x6a
	.4byte	.LLST5
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LLRL12
	.4byte	0x1f1
	.uleb128 0x2
	.string	"i"
	.byte	0x17
	.byte	0x12
	.4byte	0x6a
	.4byte	.LLST13
	.byte	0
	.uleb128 0x3
	.4byte	.LVL10
	.4byte	0x16a
	.uleb128 0x3
	.4byte	.LVL11
	.4byte	0x11a
	.uleb128 0x3
	.4byte	.LVL12
	.4byte	0xd2
	.uleb128 0x3
	.4byte	.LVL13
	.4byte	0xae
	.uleb128 0x3
	.4byte	.LVL14
	.4byte	0x84
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST7:
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL4-.Ltext0
	.uleb128 0x4
	.byte	0xa
	.2byte	0x12b
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x4
	.uleb128 .LVL4-.Ltext0
	.uleb128 .LVL5-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x4
	.uleb128 .LVL5-.Ltext0
	.uleb128 .LVL6-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL6-.Ltext0
	.uleb128 .LFE2-.Ltext0
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
.LLST0:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL2-.Ltext0
	.uleb128 0x7
	.byte	0x7e
	.sleb128 0
	.byte	0x35
	.byte	0x26
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LFE1-.Ltext0
	.uleb128 0x7
	.byte	0x7e
	.sleb128 -1
	.byte	0x35
	.byte	0x26
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL2-.Ltext0
	.uleb128 0x7
	.byte	0x7e
	.sleb128 0
	.byte	0x32
	.byte	0x26
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LFE1-.Ltext0
	.uleb128 0x7
	.byte	0x7e
	.sleb128 -1
	.byte	0x32
	.byte	0x26
	.byte	0x37
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL2-.Ltext0
	.uleb128 0x5
	.byte	0x7e
	.sleb128 0
	.byte	0x33
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LFE1-.Ltext0
	.uleb128 0x5
	.byte	0x7e
	.sleb128 -1
	.byte	0x33
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL2-.Ltext0
	.uleb128 0x1c
	.byte	0x7e
	.sleb128 0
	.byte	0x35
	.byte	0x26
	.byte	0x39
	.byte	0x24
	.byte	0xa
	.2byte	0xe00
	.byte	0x1a
	.byte	0x7e
	.sleb128 0
	.byte	0x32
	.byte	0x26
	.byte	0x35
	.byte	0x24
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x7e
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x3c
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LFE1-.Ltext0
	.uleb128 0x1c
	.byte	0x7e
	.sleb128 -1
	.byte	0x35
	.byte	0x26
	.byte	0x39
	.byte	0x24
	.byte	0xa
	.2byte	0xe00
	.byte	0x1a
	.byte	0x7e
	.sleb128 -1
	.byte	0x32
	.byte	0x26
	.byte	0x35
	.byte	0x24
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x7e
	.sleb128 -1
	.byte	0x32
	.byte	0x24
	.byte	0x3c
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL1-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LFE1-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LLST13:
	.byte	0x4
	.uleb128 .LVL14-.Ltext0
	.uleb128 .LVL15-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.Ltext0
	.uleb128 .LVL16-.Ltext0
	.uleb128 0x9
	.byte	0xc
	.4byte	0xf4241
	.byte	0x7f
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.Ltext0
	.uleb128 .LFE0-.Ltext0
	.uleb128 0x9
	.byte	0xc
	.4byte	0xf4240
	.byte	0x7f
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL4:
	.byte	0x4
	.uleb128 .LBB2-.Ltext0
	.uleb128 .LBE2-.Ltext0
	.byte	0x4
	.uleb128 .LBB3-.Ltext0
	.uleb128 .LBE3-.Ltext0
	.byte	0
.LLRL6:
	.byte	0x4
	.uleb128 .LBB4-.Ltext0
	.uleb128 .LBE4-.Ltext0
	.byte	0x4
	.uleb128 .LBB9-.Ltext0
	.uleb128 .LBE9-.Ltext0
	.byte	0x4
	.uleb128 .LBB10-.Ltext0
	.uleb128 .LBE10-.Ltext0
	.byte	0
.LLRL8:
	.byte	0x4
	.uleb128 .LBB5-.Ltext0
	.uleb128 .LBE5-.Ltext0
	.byte	0x4
	.uleb128 .LBB8-.Ltext0
	.uleb128 .LBE8-.Ltext0
	.byte	0
.LLRL10:
	.byte	0x4
	.uleb128 .LBB6-.Ltext0
	.uleb128 .LBE6-.Ltext0
	.byte	0x4
	.uleb128 .LBB7-.Ltext0
	.uleb128 .LBE7-.Ltext0
	.byte	0
.LLRL12:
	.byte	0x4
	.uleb128 .LBB11-.Ltext0
	.uleb128 .LBE11-.Ltext0
	.byte	0x4
	.uleb128 .LBB12-.Ltext0
	.uleb128 .LBE12-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"initFrameBuffer"
.LASF16:
	.string	"status_reg_ptr"
.LASF24:
	.string	"isStartBitHigh"
.LASF3:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF13:
	.string	"clearStartBit"
.LASF23:
	.string	"GNU C17 13.3.0 -mabi=ilp32 -misa-spec=20191213 -march=rv32i -g -O1"
.LASF11:
	.string	"__uint32_t"
.LASF25:
	.string	"main"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF14:
	.string	"setBusyStatus"
.LASF20:
	.string	"pixel_index"
.LASF21:
	.string	"initColorPalette"
.LASF8:
	.string	"long long int"
.LASF17:
	.string	"start_bit"
.LASF4:
	.string	"short int"
.LASF12:
	.string	"uint32_t"
.LASF6:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF22:
	.string	"rgb444"
.LASF18:
	.string	"_Bool"
.LASF15:
	.string	"control_reg_ptr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"./src/main.c"
.LASF1:
	.string	"/home/maxwelljung/programming/fpga-gpu"
	.ident	"GCC: (GNU) 13.3.0"
