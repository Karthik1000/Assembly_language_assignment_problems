.data
   input: .asciiz "Enter a number (armstrong number): "
   int: .space 4
   arms: .asciiz " Armstrong Nuumber"
   not_arms: .asciiz "not an Armstrong Number"

.text
main:
   li $v0, 4
   la $a0, input
   syscall
   li $v0, 5
   la $t0, int
   syscall
	
   move $t1, $v0
   move $t2, $v0
   move $t3, $v0
   li $t9, 10

loop1:
   beq $t2, 0, temp
   addi $t4, $t4, 1
   div $t2, $t9
   mflo $t2
   j loop1
temp:
   move $t5, $t4
   j loop2
	
loop2:
   beq $t4, 0, print
   addi $t4, $t4, -1
   div $t3, $t9
   mflo $t3
   mfhi $t6
   move $t7, $t5
   move $t8, $t6
   j loop3
loop3:
   beq $t7, 1, sum
   addi $t7, $t7, -1
   mult $t8, $t6
   mflo $t6
   j loop3
sum:
   add $t2, $t2, $t6
   j loop2
print:
   beq $t1, $t2, string1
   bne $t1, $t2, string2
string1:
     li $v0, 4
     la $a0, arms
     syscall
     li $v0, 10
     syscall
string2:
   li $v0, 4
   la $a0, not_arms
   syscall
   li $v0, 10
   syscall
