	.text
  .globl _start
  .globl _exception
_start:
	li sp, 0x88000000
	slli a2, sp, 1
	srli a3, sp, 1
	srai a4, sp, 1
	ebreak

loop:
  	j loop



