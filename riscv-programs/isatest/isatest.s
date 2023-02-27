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



test_opi:
	li x1, 0x1
	addi x2, x1, 0x1F
	addi x3, x2, -1
	xori x4, x3, 0x1F
	bne x4,x0, error_opi

test_op:
	add x5, x1, x1  # 0x2
	sub x6, x5, x1  # 1
	xor x7, x5, x6  # 3
	li x8, 0x3
	bne x8,x7, error_op

test_lw:
	la x9, data
	lw x10, (x9)
	andi x11, x10, 0x1FF
	li x12, 0x1EF
	bne x12,x11, error_lw

success:
  	bne x1,x0,success

	.data
	.align 4
data:
	.word 0xDEADBEEF
	.word 0xBABEFACE
	.word 0x1BADCAFE



