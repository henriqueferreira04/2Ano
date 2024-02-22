		.data
		
		.eqv print_str, 4
		.eqv print_int, 1
		.eqv print_float, 2
		
		.eqv off_first_name, 4
		.eqv off_last_name, 22
		.eqv off_grade, 40
		.eqv size_first_name, 17
		.eqv size_last_name, 14
mecanografico:		.asciiz "\nN. Mec: "
first_name:	.asciiz "\nPrimeiro Nome: "
last_name:	.asciiz "\nUltimo Nome: "
grade:		.asciiz "\nNota: "

		.text
		.globl print_student
	
#id_number -> 0
#first_name -> 4
#last_name  -> 22
#grade -> 40
#student -> 48	
#########################

print_student:
		move $t0, $a0	#t0 = p
	
		
		la $a0, mecanografico
		li $v0, print_str
		syscall	
		
		lw $a0, 0($t0)	
		li $v0, print_int
		syscall		# print_intu10(p->id_number);
		
		
		la $a0,first_name
		li $v0, print_str
		syscall	
		
		addiu $a0, $t0, off_first_name
		li $v0, print_str
		syscall		#print_string(p->first_name);
		
		la $a0, last_name
		li $v0, print_str
		syscall	
		
		addiu $a0, $t0, off_last_name
		li $v0, print_str
		syscall		#print_string(p->last_name);
		
		
		la $a0, grade
		li $v0, print_str
		syscall	
		
		l.s $f12, off_grade($t0)
		li $v0, print_float
		syscall		#print_float(p->grade);
			
			
		jr $ra
		
				
		
	
