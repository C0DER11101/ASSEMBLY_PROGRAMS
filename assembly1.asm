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
		la $a0, prompt  # loading the string in prompt
		syscall
		
		li $v0,5  # taking integer input from the user
		syscall
		sw $v0,n1  # storing the integer value stored in $v0 into the variable n1
		
		li $v0,5 # again taking integer input
		syscall
		sw $v0,n2
		
		li $v0,4
		la $a0, prompt2
		syscall
		
		li $v0,4
		la $a0,p1
		syscall
		
		li $v0,1  # displaying the integer
		lw $a0,n1
		syscall
		
		li $v0,4
		la $a0,newLine  # displaying new-line
		syscall
		
		li $v0,4
		la $a0,p2
		syscall
		
		li $v0,1
		lw $a0,n2
		syscall
		
		lw $a1,n1  # 'a' registers are basically arguments of functions/procedures
		lw $a2,n2   # $a0 is used for printing integers, characters and strings
		
		li $v0,4
		la $a0,newLine
		syscall
		
		jal swap # function call/procedure call -> jump and link(jal) swap
		
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
	
		li $t0,0  # immediately loading the value 0 into register $t0
		
		move $t0,$a1  # swapping takes place here!!
		move $a1,$a2
		move $a2,$t0
		
		jr $ra # go back to main