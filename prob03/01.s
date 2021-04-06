	.data
x:	.word 20
y:	.word 0

	.text
	lw x10, x
	lw x11, y

	li x12, 10
	li x13, 1

	ble x10, x12, else
	bge x11, x12, end
	addi x10, x10, -10
	j end


else:
	addi x10, x10, 10

end:
	la x12, x
	sw x10, 0(x12)

	li x17, 1
	ecall
	li x17, 10
	ecall