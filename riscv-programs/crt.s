	.text
  .globl _start
  .globl _exception
_start:
	add x0,x0,x0
	csrw mtvec, x1
	lla x1, _exception
	li sp, 0x10000-4

	li a0, 256
	li a1, 0xdeadbeef
	sw a1,(a0)
	lw a2,(a0)
	call main

	add x0,x0,x0
end:
	ebreak



_exception:
	csrr a0, mcause
loop:
  	j loop



