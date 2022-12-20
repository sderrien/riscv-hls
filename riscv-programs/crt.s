	.text
  .globl _start
  .globl _exception
_start:
	add x0,x0,x0
	csrw mtvec, x1
	lla x1, _exception

	call main

	addi sp,sp, -1024
	add x0,x0,x0
end:
	j end



_exception:
	csrr a0, mcause
loop:
  	j loop



