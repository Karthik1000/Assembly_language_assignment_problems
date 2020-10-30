.data
   in1: .asciiz "enter the first number\n" 
   in2: .asciiz "enter the second number\n"
   gcd:  .asciiz "result of GCD of above numbers is\n"
.text
    li $v0, 4
    la $a0, in1
    syscall
	
    li $v0, 5
    syscall
    move $t0, $v0   ## $t0 holds the first number

    li $v0, 4
    la $a0, in2
    syscall
	
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
    	li $v0, 4
    	la $a0, gcd
    	syscall
	li $v0, 1
	move $a0, $t0
	syscall
		
	li $v0, 10
	syscall
