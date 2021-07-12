# Computer Architectures
# Lab: Pipelining
# Nuno.Roma@ist.utl.pt
# IST, Lisbon-Portugal, 2020-05-04

# The following program processes two arbitrarily sized one-dimensional
# vectors composed by N integer elements, in order to execute
# the following pseudo-code algorithm:
 
#    int a[N] = { ..... }
#    int b[N] = { ..... }
#    int x = 1;
#    int n = 0;
#    register int i = 0;
#    while (b[i]>0){
#        x *= a[i] + a[N-1-i];
#        n += (N-1-i) - i;
#        i ++;
#    }

# Data section
        .data
# IMPORTANT: do not change this section
a:		.word  1, 5, 6, 6, 7, 2, 5, 2, 3, 2, 3, 4 	#0x10000000
b:		.word  4, 3, 1, 7, 2, 4, 9, -3, 5, 8, 1, 9  #0x10000030
x: 		.word  1
n:		.word  0   

# Program section
		.text
		                           
		addi    x11, x3, 0			

		lw 		x14, 100(x3)		#codigo editado para Q1.7
		lw		x15, 96(x3)			
		li 		x16, 0	
			
		addi    x13, x11, 48		

		nop
		nop
		nop

		addi	x12, x13, -4		
		
		
while:	add		x20, x13, x16		

		lw 		x22, 0(x11)
		nop
		lw 		x23, 0(x12)		

		lw		x21, 0(x20)
	
		nop
		nop
		add		x22, x22, x23

		blez	x21, end			
			
		nop	
		nop		
		sub		x22, x12, x11

		mul 	x15, x15, x22
		
		nop
		addi	a7, x0, 10
				
		srai	x22, x22, 2

		addi 	x16, x16, 4			
		addi	x11, x11, 4
		addi	x12, x12, -4	

		add		x14, x14, x22		

		
		jal 	x0, while

end:	
		sw 		x14, 100(x3)		
		sw 		x15, 96(x3)			

		ecall


# Expected result: M[x] = 1270080 = 136140h
#                  M[n] = 35      = 23h
