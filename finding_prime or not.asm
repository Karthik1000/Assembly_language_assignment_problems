.data
	primeMsg: .asciiz "Prime\n"
	notPrimeMsg: .asciiz "Not Prime\n"
	string1: .asciiz "Prime Numbers are:\n"
	Input: .asciiz "Enter size of array:"
	InputNums: .asciiz "Enter the numbers...\n"
	Enter: .byte '\n'
.text
	la $v0, primeMsg
	move $s3, $v0
	
	la $v0, notPrimeMsg
	move $s4, $v0
	
	add $s1, $zero, 2
	add $s2, $zero, 1    ##$s2 stores the result of primFunc
	
	##$s0 will hold the argument for primeFunc
	
	li $v0, 4
	la $a0, Input
	syscall

	li $v0, 5
	syscall
	move $t0, $v0   ##$t0 holds the size of the array
	move $t2, $t0
	move $t3, $t0 ## another copy of the size of the array
	mul $t3, $t3, 4
	
	mul $t0, $t0, 4  ## $t0 now holds the number of bytes required
	
	move $a0, $t0
	li $v0, 9
	syscall
	
	move $t0, $v0
	move $t1, $t0
	
	li $v0, 4
	la $a0, InputNums
	syscall
	
	input:
		loop:
			blez $t2, compute
			
			li $v0, 5
			syscall
			sw $v0, ($t0)
			
			add $t0, $t0, 4
			sub $t2, $t2, 1
			
			b loop
			
	compute:
	li $v0, 4
	la $a0, string1
	syscall
		Compute:
		blez $t3, end
		
		lw $s0, ($t1)

		j primeFunc
		
		continue:
			beq $s2, 1, PrimeRes
			
			#li $v0, 4
			#move $a0, $s4
			#syscall
			##printing the message 'not prime'
			
			add $s2, $zero, 1  ##resetting $s2 to hold the value 1
			j continue2
		
			PrimeRes:    ##block to run if the number is prime
				#move $a0, $s3
				#li $v0, 4
				#syscall
				## printing the message 'prime'
				
				li $v0, 1
				move $a0, $s0
				syscall
				
				li $v0, 4
				la $a0, Enter
				syscall
		continue2:
			add $s1, $zero, 2
			add $t1, $t1, 4
			sub $t3, $t3, 4
			b Compute

	end:
		li $v0, 10
		syscall
	
	primeFunc:
		loop1:##internal loop in the "function"
			bge $s1, $s0, continue
			rem $t2, $s0, $s1
			beq $t2, 0, reassign
		
			add $s1, $s1, 1
			b loop1
		
			reassign:
				move $s2, $zero
				j continue