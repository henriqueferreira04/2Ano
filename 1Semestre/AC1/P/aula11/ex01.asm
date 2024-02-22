		.data
		.eqv print_int, 1
		.eqv print_str, 4
		.eqv read_int, 5
		.eqv read_float, 6
		.eqv read_str, 8
		.eqv print_float, 2
		.eqv off_first, 4
		.eqv off_last, 22
str1:		.asciiz "\nN. Mec: "
str2:		.asciiz "\nNome: "
space:		.asciiz " "
str3:		.asciiz "\nNota: "
str4:		.asciiz "\nÚltimo nome: "
stg_n: 		.word 72343
		.align 2
stg_fi:		.asciiz "Napoleao"
stg_la:		.asciiz "Bonaparte"




grade:		.float 5.1
student:	.word 0:43
student2:	.word 0:43
	
		.text
		.globl main
	
#0 = nº Mec
#4 = first_name
#22 = last_name
#40 = grade
###################################
main:
	la $t0, student
	
	la $t1, stg_n
	
	lw $t2, 0($t1)	#72343
	sw $t2, 0($t0)	#nºMec = 72343
	
	
	la $t1, stg_fi
	
	sw $t1, 4($t0)	#first_name = Napoleao
	
	
	la $t1, stg_la
	sw $t1, 24($t0)	#last_name = Bonaparte
	
	
	la $t1, grade	
	
	l.s $f2, 0($t1)	
	s.s $f2, 40($t0)	#grade = 5.1
	
	#############
	la $a0, str1
	li $v0, print_str
	syscall
	
	lw $t1, 0($t0)
	move $a0, $t1
	li $v0, print_int
	syscall
	##############
	
	la $a0, str2
	li $v0, print_str
	syscall
	
	lw $t1, 4($t0)
	move $a0, $t1
	li $v0, print_str
	syscall
	
	la $a0, space
	li $v0, print_str
	syscall
	
	lw $t1, 24($t0)
	move $a0, $t1
	li $v0, print_str
	syscall
	
	##############
	
	la $a0, str3
	li $v0, print_str
	syscall
	
	
	mov.s $f12, $f2
	li $v0, print_float
	syscall
	##############
	
#############################################################
	
	la $t0, student2
	
	la $a0, str1
	li $v0, print_str
	syscall
	
	li $v0, read_int
	syscall
	
	sw $v0, 0($t0)		#nº mec: read_int
	
	######################
	la $a0, str2
	li $v0, print_str
	syscall
	
	addiu $a0, $t0, off_first
	li $a1, 17
	li $v0, read_str		#first_name: read_str
	syscall
	
	#########################
	la $a0, str4
	li $v0, print_str
	syscall
	
	addiu $a0, $t0, off_last
	li $a1, 14
	li $v0, read_str		#last_name: read_str
	syscall	
	
	########################
	la $a0, str3
	li $v0, print_str
	syscall
	
	li $v0, read_float
	syscall
	
	s.s $f0, 40($t0)	#grade: read_float
	
	
#######################################3
	la $a0, str1
	li $v0, print_str
	syscall
	
	lw $a0, 0($t0)
	li $v0, print_int	#print nºMec
	syscall
	
	
	la $a0, str2
	li $v0, print_str
	syscall
	
	addiu $a0, $t0, off_first
	li $v0, print_str	#print first_name
	syscall
	
	
	la $a0, space
	li $v0, print_str
	syscall
	
	
	addiu $a0, $t0, off_last
	li $v0, print_str	#print last_name
	syscall
	
	la $a0, str3
	li $v0, print_str
	syscall
	
	l.s $f12, 40($t0)
	li $v0, print_float	#print grade
	syscall	
	
	
	li $v0, 0
	jr $ra
	
