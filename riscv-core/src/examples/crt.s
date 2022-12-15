	.text
  .globl _start
  .globl _exception
_start:
	addi sp,sp, 1024
	lla x1, _exception
 	csrw mtvec, x1
	call main
	ebreak

	addi sp,sp, -1024
	add x0,x0,x0
	j _start

_exception:
	csrr a0, mcause
loop:
  	j loop



