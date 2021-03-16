	.data


	.text
	#count the number of 1's in teh word 0xD
	li x11, 0xD

	andi x10, x11, 1
	srli x11, x11, 1
	add x10, x10, x12

	andi x10, x11, 1
	srli x11, x11, 1
	add x10, x10, x12

	andi x10, x11, 1
	srli x11, x11, 1
	add x10, x10, x12


	li x17,1
	ecall

	li x17,10
	ecall