	.data
	
		.eqv max_students, 4
		.eqv size_student, 48
		.eqv print_str, 4
		.eqv print_float, 2
	
st1:		.space size_student
st2:		.space size_student
st3:		.space size_student
st4:		.space size_student

st:		.word st1, st2, st3, st4
media:		.space 4

printMedia:	.asciiz "\nMedia: "


		.text
		.globl main
	

##########################

main:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	
	
	la $a0, st		#a0 = st
	li $a1, max_students	#a1 = max_students

	jal read_data		#read_data( st_array, MAX_STUDENTS );
	
	la $a2, media		#a2 = media
	li $a1, max_students	#a1 = max_students
	la $a0, st
	jal max			#max( st_array, MAX_STUDENTS, &media );
	
	move $s0, $v0		#pmax = max( st_array, MAX_STUDENTS, &media );
	
	la $a0, printMedia

	li $v0, print_str
	syscall
	
	l.s $f12, 0($a2)
	li $v0, print_float	
	syscall			#print_float(media);
	
	move $a0, $s0
	jal print_student	#print_student( pmax );
	
	
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8
	li $v0, 0
	
	jr $ra	
	
	
	
	
	
