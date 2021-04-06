	.data

	.text
	li x10, 4
	li x11, 5

	addi sp,sp,-8
	sw x10,4(sp) #push
	sw x11,0(sp) #push

	lw x10,0(sp) #pop
	lw x11,4(sp) #pop
	addi sp,sp,8


end:li x17, 10 #end the program
	ecall