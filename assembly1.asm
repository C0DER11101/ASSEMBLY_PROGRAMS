# CODE TO SIMPLEY SWAP VALUES OF TWO VARIABLES
.data
	n1: .word 0
	n2: .word 0
	prompt: .asciiz "Enter value of two numbers\n\n"
	prompt2: .asciiz "The values of the two numbers are\n\n"
	p1: .asciiz "number1: "
	newLine: .asciiz "\n"
	p2: .asciiz "number2: "
	result: .asciiz "The swapped values of the two numbers are\n\n"
	
.text
	.globl main
	
	main:
		li $v0,4
		la $a0, prompt
		syscall
		
		li $v0,5
		syscall
		sw $v0,n1
		
		li $v0,5
		syscall
		sw $v0,n2
		
		li $v0,4
		la $a0, prompt2
		syscall
		
		li $v0,4
		la $a0,p1
		syscall
		
		li $v0,1
		lw $a0,n1
		syscall
		
		li $v0,4
		la $a0,newLine
		syscall
		
		li $v0,4
		la $a0,p2
		syscall
		
		li $v0,1
		lw $a0,n2
		syscall
		
		lw $a1,n1
		lw $a2,n2
		
		li $v0,4
		la $a0,newLine
		syscall
		
		jal swap # function call/procedure call
		
		li $v0,4
		la $a0,result
		syscall
		
		li $v0,4
		la $a0,newLine
		syscall
		
		li $v0,4
		la $a0,p1
		syscall
		
		
		move $a0,$a1
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,newLine
		syscall
		
		li $v0,4
		la $a0,p2
		syscall
		
		
		move $a0,$a2
		li $v0,1
		syscall
		
		
		li $v0,10  # end the program
		syscall
		
		
	swap:
	
		li $t0,0
		
		move $t0,$a1  # swapping takes place here!!
		move $a1,$a2
		move $a2,$t0
		
		jr $ra # go back to main