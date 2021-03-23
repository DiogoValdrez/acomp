.data
numeros: .word 1, 1

.text

la x12, numeros #load numeros adress do x12
lw x10, 0(x12) #load 1 as x to x10
lw x11, 4(x12) #load 1 as y to x11


#this is where to loop starts
addi x12, x12, 4
li x13, 2
li x14, 10
forloop:
#teste de condi��o
bge x13, x14, fim
addi x12, x12, 4 #add for to numeros adress
add x15, x0, x11 #z = y
add x11, x11, x10 #y=y+x
add x10, x0, x15 #x = z

sw x11, 0(x12) #store thevalue of numeros as y 
addi x13, x13, 1

j forloop

fim:
li x17, 10
ecall