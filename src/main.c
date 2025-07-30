#include <stdio.h>
#include <stdint.h>
#include "funcs.h"

int main() {
	/* In this file we call the function */
	
/*	__asm__ inline (
		"dli $a0, %0 \n"
	:
	:"i" (0xffffff)
	:"$a0");
*/

	register uint64_t color asm ("$a0") = 0xFF00FF;

	__gs_chcolor();
	return 0;
}
