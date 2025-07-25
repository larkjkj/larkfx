.data
hello: .asciiz "Hello World"
.extern printf
__print:
 lui $a0, $hello
 jal printf
