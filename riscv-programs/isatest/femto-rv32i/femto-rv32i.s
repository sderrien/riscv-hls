	.text
  .globl _start
_start:
#	li x0, 0x0
	li x7, 0x10

#	add x8, x8,x0
#loop:
#	addi x8,x8,1
#	bne x8,x7, loop

#	li x9, 0x1
end:
	bne x8,x7, end



