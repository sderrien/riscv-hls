	.text
  .globl _start
  .globl _exception
_start:
	add x0,x0,x0
	csrw mtvec, x1
	lla x1, _exception
	li sp, 0x100000-4

    mv fp, sp

	call main

	add x0,x0,x0
end:
	ebreak



_exception:
	call exception_handler

loop:
  	j loop



