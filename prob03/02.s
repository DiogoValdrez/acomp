	.data
x: 	.word 0x0F0F
	.text

	lw x11, x
	li x10, 0
	li x12, 32
	li x14, 1

loop:
	ble x12, zero, end
	andi x13, x11, 1 #check the less significative bit
	add x10, x10, x13
	srli x11, x11, 1 #go to the next bit
	sub x12, x12, x14
	j loop
	



end:
	li x17, 1
	ecall
	li x17, 10
	ecall