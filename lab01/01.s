	.data
a:	.word 1, 1 #first 2 numbers


	.text
	la x10, a #load adress to x10
	li x11, 2 #load value 2 because there are already 2 values of the list
	li x12, 10 #load value 10 to decide the last value of the list

						
for:bge x11, x12, end #start the loop with a condition to check if we already got the last member of the list 
	lw x13, 0(x10)	#load the number from the first adress(n)
	lw x14, 4(x10)	#load the number to the second adress(n+1)
	
	add x14, x14, x13 #add the values of the 2 member of the list
	sw x14, 8(x10) #store the value in the third member of the list(n+2)
	addi x11, x11, 1 #add 1 to x11 to continue or end the loop
	addi x10, x10, 4 #add 4 to x10, so next loop the first number is n+1
	j for #go back to the loop


end:li x17, 10 #end the program
	ecall