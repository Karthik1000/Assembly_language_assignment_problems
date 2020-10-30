.data
   input: .asciiz "enter the number to get fibonacci\n"
   comma: .asciiz "--> "
.text
    li $v0, 4
    la $a0, input
    syscall
    li $v0, 5
    syscall
    move $t0,$v0
	
    move $t1,$zero
    move $a0,$t1
    li $v0, 1
    syscall    #print T1
	
    li $v0, 4
    la $a0, comma
    syscall    #print seperator
	
    move $t2,$zero
    add $t2,$t2,1
    move $a0,$t2
    li $v0, 1  
    syscall    #print T2
	
    li $v0, 4
    la $a0, comma
    syscall    #print seperator
	
##T1 and T2 are first two terms 
	
   loop:
	ble $t0, 2, end    #exit loop once we print all the terms
		
	add $t3, $t2, $t1
	move $a0, $t3
	li $v0,1
	syscall
		
	la $a0, comma
	li $v0, 4
	syscall    #print seperator
		
	move $t1, $t2
	move $t2, $t3
		
	sub $t0, $t0, 1
		
	b loop   #to run loop again
	
   end:
	li $v0,10
	syscall
