	.data

	nvalores: .word 9
	valores: .word 1,2,3,4,5,6,7,8,9
	.text
	la a0,nvalores
	lw a1,0(a0)

	function:
	lw a3,4(a0)
	add a2,a2,a3
	addi a4,a4,1
	beq a4,a1,end
	addi a0,a0,4
	jal function

end:li x17, 10 #end the program
	ecall