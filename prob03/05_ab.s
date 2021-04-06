	.data

	.text


	addi sp, sp, -12 
	li x10, 4
	sw x10, 8(sp)
	li x10, 7
	sw x10, 4(sp)
	li x10, 7
	sw x10, 0(sp)
	jal soma3
	lw x10, 0(sp)
	addi sp, sp, 4

	addi sp, sp, -8
	sw, x10, 4(sp)
	li x10, 3
	sw x10, 0(sp)
	jal subtrai
	lw x10, 0(sp)
	addi sp, sp, 4
	


end:
	li x17, 1
	ecall
	li x17, 10
	ecall

soma: 
	add x10, x10, x11
	ret

subtrai:
	lw x10, 4(sp)
	lw x11, 0(sp)
	
	sub x10, x10, x11
	addi sp, sp, 4 #libertar uma das posições da pilha
	sw x10, 0(sp) #escrever na posição livre
	ret

soma3:
	#salvaguarda de contexto
	addi, sp, sp, -8
	sw, x1, 4(sp)
	sw x18, 0(sp)

	#ler argumentos
	lw x10, 16(sp) #8+8, adicionar mais 3 args á pilha
	lw x11, 12(sp)
	lw x18, 8(sp)
	
	jal soma
	mv x11, x18
	jal soma
	
	#reposição de contexto
	lw, x1, 4(sp)
	lw x18, 0(sp)
	addi sp, sp, 16 #inicial mais 2 argumentos
	
	#resultado
	sw x10, 0(sp)

	ret

	
	
