.data

.text
	li $v0, 5
	syscall
	move $t0, $v0    ##$t0 holds the size of array
	
	move $t1, $zero   ##$t1 will hold the sum
	
	loop:
		blez $t0, end
		
		li $v0, 5
		syscall
		move $t2, $v0    ##$t2 holds the temporary value of the elements
		
		add $t1, $t1, $t2
		
		sub $t0, $t0, 1
		
		b loop
	
	end:
		move $a0, $t1
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall