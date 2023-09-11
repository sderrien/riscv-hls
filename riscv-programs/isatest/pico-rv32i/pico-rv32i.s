
	.text
  .globl _start
_start:
	li x1, 0x1
	bne x1,x0, test_opi

error_branch:
  	bne x1,x0, error_branch

error_opi:
  	bne x1,x0,error_opi

error_op:
  	bne x1,x0,error_op

error_lw:
  	bne x1,x0, error_lw

error_sw:
  	bne x1,x0, error_sw



test_opi:
	li x1, 123
	addi x2, x1, -123
	bne x2,x0, error_opi
	xori x4, x1, 0xFF
	addi x4, x4, -123
	bne x2,x0, error_opi

test_op:
	li x1, 0xFF
	li x2, 0x01
	add x3, x1, x2  # 0x2
	li x4, 0x100
	bne x3,x4, error_op
	
	
#	add x1, x1, x1  # 0x2
#	add x1, x1, x1  # 0x2
#	add x1, x1, x1  # 0x2
#	li x2, 0x120
#	bne x8,x7, error_op
#		sub x6, x5, x1  # 1
#	add x7, x5, x6  # 3
#	li x8, 0x3
	

test_lw:
	la x9, data
	lw x10, (x9)
	lw x11, 4(x9)
	xor x12,x10,x11
	li x13, 0x64134421
	bne x12,x13, error_lw

#
#test_sw:
#	la x9, data
#	la x11, 0x12345678
#	sw x10, 12(x9)
#	lw x12, 12(x9)
#	bne x12,x11, error_sw


test_loop:
	li x10,0
	li x13,128
	li x15,0
#	la x9,data

loop_i:
	lw x11,(x9)
	addi x9,x9,4
	add x15,x15, x11
	addi x10,x10,1
	bne x10,x13, loop_i


success:
  	bne x1,x0,success

	.data
	.align 4
data:
	.word 0xDEADBEEF
	.word 0xBABEFACE
	.word 0x1BADCAFE
