	.data
	.text
	
	li x10, 7
	li x11, 5
	jal power

end:
	li x17, 1
	ecall
	li x17, 10
	ecall

multiplica:
	mul x10, x10, x11
	ret

power:
	#salvaguarda de contexto
	addi sp, sp, -16 #x1, x, n, i
	sw x1, 12(sp)
	sw x18, 8(sp)
	sw x19, 4(sp)
	sw x20, 0(sp)
	
	li x10, 1 #y
	mv x18, x10
	mv x19, x11
	mv x20, x11
	
loop:
	ble x20, zero, power_end	
	mv x11, x18
	jal multiplica
	addi x20, x20, -1
	j loop	

power_end:
	#reposição de contexto
	lw x1, 12(sp)
	lw x18, 8(sp)
	lw x19, 4(sp)
	lw x20, 0(sp)
	addi sp, sp, 16
	ret