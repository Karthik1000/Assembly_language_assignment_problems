.data

.text
	li $v0, 5
	syscall
	move $t0, $v0   ## $t0 holds the first number
	
	li $v0, 5
	syscall
	move $t1, $v0   ## $t1 holds the second number and also represents remainder
	
	loop:
		blez $t1, end
		
		rem $t2, $t0, $t1
		
		move $t0, $t1
		move $t1, $t2
		
		b loop
	
	end:
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 10
		syscall