	.data
	
	.eqv SIZE, 3
	.eqv print_double, 3
	.eqv read_double, 7
	.eqv print_str, 4
	
array:	.space 24
str:	.asciiz "\n"
	
	.text
	.globl main

#s0 = array	
#t0 = i
#t1 = &array[i]
#t2 = size
##################################
main:
	
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0 ,4($sp)
	
	la $s0, array
	li $t0, 0	#i = 0
	move $t1, $s0	#t1 = array
	
for:
	bge $t0, SIZE, endFor	#for(i=0; i < SIZE; i++)
	sll $t1, $t0, 3		#i*3 
	addu $t1, $s0, $t1	#&array[i]
	
	li $v0, read_double
	syscall
	
	s.d $f0, 0($t1)		#array[i] = read_double
	
	
	addi $t0, $t0, 1	#i++
	j for

endFor:
	li $t2, SIZE		#t2 = size
	
	move $a0, $s0		#a0 = array
	move $a1, $t2		#a1 = size
	
	jal average		#average(arr, SIZE)
	
	la $a0, str
	li $v0, print_str
	syscall
	
	mov.d $f12, $f0		
	li $v0, print_double
	syscall
	
	
	jal var			#var(arr, SIZE)
	
	la $a0, str
	li $v0, print_str
	syscall
	
	mov.d $f12, $f0		
	li $v0, print_double
	syscall
	
	
	jal stdev		#stdev(arr, SIZE)
	
	la $a0, str
	li $v0, print_str
	syscall
	
	mov.d $f12, $f0		
	li $v0, print_double
	syscall
	
	
	
	lw $ra, 0($sp)
	lw $s0 ,4($sp)
	addiu $sp, $sp, 8
	
	li $v0, 0
	jr $ra
	
	
	
	
