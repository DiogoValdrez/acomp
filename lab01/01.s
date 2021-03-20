	.data
a:	.word 1, 1


	.text
	la x10, a
	li x11, 2
	li x12, 10


for:bge x11, x12, end
	lw x13, 0(x10)
	lw x14, 4(x10)
	
	add x14, x14, x13
	sw x14, 8(x10)
	addi x11, x11, 1
	addi x10, x10, 4
	j for


end:li x17, 10
	ecall