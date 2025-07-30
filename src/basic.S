#include "regs.h"
.globl __start, hello

.data
	hello:		.asciz "Hello World from assembly \n"
	GS_REGLIST:	.dword 0x0E080700
	GS_PMODE_VALUE:	.dword 0x21
	GS_TADR_VALUE:	.dword 0x15000000
	GS_COLOR_VALUE:	.dword 0xFFFFFF

.text

__start:
	.align 4
	sync
	
	dli $t6, 0x12100000 
	dli $t5, G_PMODE
	dli $t1, G_DISPLAY1
	dli $t2, G_DISPFB1
	dli $t3, G_BGCOL

	ori $t0, $zero, GS_PMODE_VALUE
	sd $t0, 0($t5)

	dli $t0, 0
	dli $t0, GS_D_640x480
	sd $t0, 0($t1)

	dli $t0, 0
	dli $t0, GS_M_PSMCT16S
	sd $t0, 0($t2)

	dli $t0, 0
	lui $t0, %hi(GS_COLOR_VALUE)
	ori $t0, $t0, %lo(GS_COLOR_VALUE)
	sd $t0, 0($t3)

	dli $t7, GS_GIFTAG_PLACEHOLDER //giftag
	dli $t4, GS_REGLIST

	sd $t7, 0($t6)
	sd $t4, 8($t6)
	sd $t1, 16($t6)
	sd $t2, 24($t6)
	sd $t5, 32($t6)
	sd $t3, 40($t6)

	dli $t8, GS_DMA_TADR
	sd $t6, 0($t8)

	dli $t7, GS_DMA_QWC
	ori $t5, $zero, 5
	sw $t5, 0($t7)

	dli $t9, GS_DMA_CHCR
	ori $t8, $zero, 0x101
	sd $t8, 0($t9)

	sync
	nop

