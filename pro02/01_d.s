.text
	#switch the 9th bit of the number 824
	li x10,824

	xori x10,x10,0x100

	li x17,1
	ecall

	li x17,10
	ecall