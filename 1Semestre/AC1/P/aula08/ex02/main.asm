	.data
	
str:	.space 33
	.eqv print_char, 11
	.eqv print_int10, 1
	.eqv read_int10, 5
	.eqv print_str, 4
	.text
	.globl main
	
###################################

main:
	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
do:	
	la $s0, str	#s0 = str
	li $v0, read_int10
	syscall
	
	move $s1, $v0	#s1 = read_int
	
	move $a0, $s1	#a0 = read_int
	li $a1, 2	#a1 = 2
	move $a2, $s0	#a2 = str
	
	jal itoa
	
	li $v0, print_str
	syscall
	
	li $a1, 8
	jal itoa
	li $v0, print_str
	syscall
	
	li $a1, 16
	jal itoa
	li $v0, print_str
	syscall
	
	beq $s1, 0, endDo	#while (val != 0)
	
	j do
	
endDo:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addiu $sp, $sp, 12
	
	li $v0, 0
	
	jr $ra
