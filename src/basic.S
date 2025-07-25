.data
	hello: .asciz "Hello World from assembly \n"

.text
	.globl __print, hello

__print:
	lui $a0, %hi(hello)
	addiu $a0, $a0, %lo(hello)
	jal printf

