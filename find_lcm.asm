# MIPS PROGRAM TO CALCULATE LCM OF TWO NUMBERS

.data
	n1: .word 0
	n2: .word 0
	prompt1: .asciiz "enter number-1: "
	prompt2: .asciiz "enter number-2: "
	result: .asciiz "the lcm of the numbers is: "
.text

	.globl main
	
	main:
		li $v0,4
		la $a0, prompt1
		syscall
		
		li $v0,5
		syscall
		
		sw $v0,n1
		
		li $v0,4
		la $a0,prompt2
		syscall
		
		li $v0,5
		syscall
		
		sw $v0,n2
		
		lw $a1,n1
		lw $a2,n2
		
		jal lcm
		
		li $v0,4
		la $a0,result
		syscall
		
		move $a0,$v1
		
		li $v0,1
		syscall
		
		
		
		li $v0,10
		syscall
		
	lcm:
		li $t4,0 # multiple
		li $t0,1 # div1
		li $t1,1 # div2
		
		while:
			addi $t4,$t4,1
			div $t5,$t4,$a1
			mfhi $t5
			div $t6,$t4,$a2
			mfhi $t6
			
			
			
			beq $t5,$zero,And
			
			
			
			j while
			
			
			
			
		And:
			beq $t6,$zero,rslt
			
			
			
			j while
			
	
	rslt:
		move $v1,$t4
		
		jr $ra