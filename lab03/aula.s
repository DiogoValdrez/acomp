# Programa L3.as

# ZONA I: Definicao de variaveis
.data
	x: .word 3
	y: .word 1

# ZONA II: Codigo
.text

# Programa principal: programa que recebe dois numeros inteiros positivos, x e y, e retorna o valor de x^y
	lw a0, x
	lw a1, y
	li a6, 0
	addi sp, sp, -4
	sw a6, 0(sp)
	addi sp, sp, -8
	sw a0, 4(sp)
	sw a1, 0(sp)
	jal Pow

	lw a0, 0(sp)
	addi sp, sp, 4

	li a7, 1
	ecall

	lw a0, 0(sp)
	addi sp, sp, 4
	li a7, 1
	ecall

	li a7, 10
	ecall

# Pow: Rotina que efectua o calculo de x^y, sendo x e y dois numeros inteiros positivos
# 	Entradas: 	a0 - x
#			  				a1 - y
#	Saidas:   	a0 - resultado
# 	Efeitos:  	---

Pow:
	addi sp, sp, -24
	sw ra, 20(sp)
	sw s1, 16(sp)
	sw a0, 12(sp)
	sw a1, 8(sp)
	sw a2, 4(sp)
	sw a3, 0(sp)
	
	lw a6, 32(sp)
	addi a6, a6, 1
	lw a0, 24(sp)
	beq a0, zero, yequal

	addi sp,sp, -4
	sw a0, 0(sp)
	jal Floor
	lw a1, 0(sp)
	addi sp, sp, 4

	li a2, 1
	ble a0, a2, else

	addi sp,sp, -4
	sw a0, 0(sp)
	jal Remaining
	lw a2, 0(sp)
	addi sp, sp, 4
	bne a2, zero, else

	lw a3, 28(sp) 

	addi sp, sp, -8
	sw a3, 4(sp) 
	sw a1, 0(sp) 
	jal	Pow

	lw a0, 0(sp) 
	addi sp, sp, -4
	sw a0, 0(sp)
	jal Mult 
	lw s1, 0(sp)
	addi sp, sp, 4
	j end

else:

	lw a0, 28(sp) 
	
	addi sp, sp, -8
	sw a0, 4(sp) 
	sw a1, 0(sp)
	jal Pow
	
	lw a0, 0(sp)
	addi sp, sp, -4
	sw a0, 0(sp)
	jal Mult
	lw a0, 32(sp) 
	addi sp, sp, -4
	sw a0, 0(sp)
	jal Mult
	lw s1, 0(sp)
	addi sp, sp, 4
	j end
yequal:
	li s1, 1

end:
	sw a6, 32(sp)
	sw s1, 28(sp)

	lw ra, 20(sp)
	lw s1, 16(sp)
	lw a0, 12(sp)
	lw a1, 8(sp)
	lw a2, 4(sp)
	lw a3, 0(sp)
	addi sp, sp, 28

	ret

# Mult: Rotina que efectua o calculo de a*b, sendo a e b numeros inteiros positivos
# 	Entradas:	0(sp), 4(sp) - numeros a multiplicar
#	Saidas:		0(sp) - resultado
#	Efeitos:	---

Mult:
	addi sp, sp, -12
	sw s1, 8(sp)
	sw s2, 4(sp)
	sw s3, 0(sp)

	lw s2, 16(sp)
	lw s1, 12(sp)

	li s3, 0
	beq s2, zero, OutMul
	beq s1, zero, OutMul

MulLoop:
	add s3, s3, s1
	addi, s2, s2, -1
	bne s2, zero, MulLoop

OutMul:
	sw s3, 16(sp)

	lw s3, 0(sp)
	lw s2, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 16
	ret
Floor:
	lw s4, 0(sp)
	addi sp, sp, -8
	sw s5, 0(sp)
	sw s6, 4(sp)
	li s5, 0
	li s6, 2
FloorLoop:
	blt s4, s6, EndFloorLoop
	addi s4, s4, -2
	addi s5, s5, 1
	j FloorLoop
EndFloorLoop:
	sw s5, 8(sp)
	lw s6, 4(sp)
	lw s5, 0(sp)
	addi sp, sp, 8
	ret

Remaining:
	lw s7, 0(sp)
	addi sp, sp, -8
	sw s8, 0(sp)
	sw s9, 4(sp)
	li s8, 2
	li s9, 1
RemainLoop:
	blt s7, s8, EndRemainLoop
	addi s7, s7, -2
	j RemainLoop
EndRemainLoop:
	beq s7, zero, BeZero
	li s7, 1
	j EndRemaining
BeZero:
	li s7, 0
EndRemaining:	
	sw s7, 8(sp)
	lw s9, 4(sp)
	lw s8, 0(sp)
	addi sp, sp, 8
	ret