/* Basically the GS REGISTERS macros */
#ifndef REGS 
#define G_PMODE		0x12000000
#define G_SMODE1	0x12000010
#define G_SMODE2	0x12000020
#define G_SRFSH		0x12000030
#define G_SYNCH1	0x12000040
#define G_SYNCH2	0x12000050
#define G_SYNCV		0x12000060
#define G_DISPFB1	0x12000070
#define G_DISPLAY1	0x12000080
#define G_DISPFB2	0x12000090
#define G_DISPLAY2	0x120000A0
#define G_EXTBUT	0x120000B0
#define G_EXTDATA	0x120000C0
#define G_EXTWRITE	0x120000D0
#define G_BGCOL		0x120000E0
#define G_GSCSR		0x12001000
#define G_GSIMR		0x12001010
#define G_BUSDIR	0x12001040
#define G_SIGLBLID	0x12001080

#define zero	0
#define at	1

#define v0	2
#define v1	3

#define a0	4
#define a1	5
#define a2	6
#define a3	7

#define t0	8
#define t1	9
#define t2	10
#define t3	11
#define t4	12
#define t5	13
#define t6	14
#define t7	15

#define s0	16
#define s1	17
#define s2	18
#define s3	19
#define s4	20
#define s5	21
#define s6	22
#define s7	23

#define t8	24
#define t9	25

#define k0	26
#define k1	27

#define gp	28
#define sp	29
#define fp	30
#define ra	31

/* Remember to setup all them correctly
 * with fixed values ! */
#define VCK_UNITS	0x00
#define GS_D_640x480	(0x0000000000000000 | \
			(0x1E0 << 32) | \
			(0x280 << 44))

#define GS_D_720x480	(0x0000000000000000 | \
			(0x2D0 << 32) | \
			(0x1E0 << 44))

#define GS_M_PSMCT32	(0x00000000) 
#define GS_M_PSMCT24	(0x01 << 24)
#define GS_M_PSMCT16	(0x02 << 24)

/* Replace 280 with the value of
 * the screen width */

#define GS_M_PSMCT16S	((0x0000000000000000) | \
			(0x00 / 2048) | \
			((0x280 / 64) << 9) | \
			(0xA << 15))

#define GS_M_PSMZ32	(0x30 << 24)
#define GS_M_PSMZ24	(0x31 << 24)
#define GS_M_PSMZ16	(0x32 << 24)
#define GS_M_PSMZ16S	(0x3A << 24)

#define GS_DMA_CHCR	0x1000A000
#define GS_DMA_MADR	0x1000A010
#define GS_DMA_QWC	0x1000A020
#define GS_DMA_TADR	0x1000A030


#define GS_GIFTAG_PLACEHOLDER ((0x0000000000000000) | \
				(1 << 0) | \
				(1 << 15) | \
				(0 << 16) | \
				(0 << 46) | \
				(1 << 56) | \
				(5 << 58) | \
				(4 << 60))
				/* Something important about giftags
				 * We put the total of regs, not the value
				 * itself */

#define GS_GIFTAG(x)	(0x100000000 | x)
#endif
