	.data
vals: .word 3, 7, 4, 6

	.text
	#arithmetic average
	la x11, vals

	lw x10, 0(x11)

	#add 4 bits to get the value 7
	addi x11, x11, 4
	#load the value 7 to a register
	lw x12, 0(x11)
	#3+7
	add x10, x10, x12

	addi x11, x11, 4
	lw x12, 0(x11)
	add x10, x10, x12

	addi x11, x11, 4
	lw x12, 0(x11)
	add x10, x10, x12

	srai x10, x10, 2

	li x17,1
	ecall

	li x17,10
	ecall