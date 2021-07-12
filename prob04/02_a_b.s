.data

on: .word 0

.text


int:
	addi sp, sp, -8
	sw x1, 4(sp)
	sw x10, 0(sp)
	
	csrrw x10, scause, zero

	addi x10, x10, -3
	bne x10, zero, next
	jal checkTemp
	


next:
	# ...
	lw x1, 4(sp)
	lw x10, 0(sp)
	addi sp, sp, 8
	sret

checkTemp:
	addi sp, sp, -8
	sw x10, 4(sp)
	sw x11, 0(sp)
	


	lw x10, on
	beq x10, x0, off

	li x11, 40
	li x10, 0xffff000c
	lw x10, 0(x10)

	bgt x10, x11, end
	li x10, 0xffff000a
	sw zero, 0(x10) # desliga ventoinha
	j end

off:
	li x11, 50
	li x10, 0xffff000c
	lw x10, 0(x10)
	
	blt x10, x11, end
	li x11, 1
	li x10, 0xffff000a
	sw x11, 0(x10) # ligar ventoinha

end:
	lw x10, 4(sp)
	lw x11, 0(sp)
	addi sp, sp, 8
	ret
	
	
#5c

#scause <- 3
#sepc <- 0x58 ou 0x64
#pc <- stvect
#spie <- GIE
#GIE <- 0

#depois da interrupção terminar
#pc <- sepc
#GIE <- spie


