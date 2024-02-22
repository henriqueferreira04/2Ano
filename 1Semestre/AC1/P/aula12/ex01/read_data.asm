		.data
	
		.eqv max_students, 4
		.eqv print_str, 4
		.eqv read_int, 5
		.eqv read_str, 8
		.eqv read_float, 6
		.eqv size_student, 48
		
		.eqv off_first_name, 4
		.eqv off_last_name, 22
		.eqv off_grade, 40
		.eqv size_first_name, 17
		.eqv size_last_name, 14
		
nMec:		.asciiz "\nN. Mec: "
first_name:	.asciiz "\nPrimeiro Nome: "
last_name:	.asciiz "\nUltimo Nome: "
grade:		.asciiz "\nNota: "

student1:	.word 48
student2:	.word 48
student3:	.word 48
student4:	.word 48
		.text 
		.globl read_data
	

#id_number -> 0
#first_name -> 4
#last_name  -> 22
#grade -> 40
#student -> 48

#a0 = st
#a1 = ns

####################################

read_data:
		li $t0, 0	#i = 0
		move $t1, $a0	#t1 = st
		move $t3, $a1	#t3 = max_students
		
for:
		bge $t0, $t3, endFor	#for(i=0; i < ns; i++)
		
		sll $t2, $t0, 2		#i * 4
		#mul $t2, $t0, size_student	#i * 48 
		
		addu $t2, $t1, $t2	#&str[i] 
		
		lw $t2, 0($t2)
		
		
		la $a0, nMec	
		li $v0, print_str
		syscall			#print string nMec
		
		li $v0, read_int	#read_int
		syscall
		
		
		sw $v0, 0($t2)		#st[i].id_number = read_int();
		
		
		la $a0, first_name
		li $v0, print_str	#print string first_name
		syscall
		
		addiu $a0, $t2, off_first_name	#&str[i].first_name
		li $a1, size_first_name
		li $v0, read_str		#read_string(st[i].first_name, 17);
		syscall
		
		
		la $a0, last_name
		li $v0, print_str	#print string last_name
		syscall
		
		addiu $a0, $t2, off_last_name	#&str[i].last_name
		li $a1, size_last_name
		li $v0, read_str
		syscall				#read_string(st[i].last_name, 14);
		
		
		la $a0, grade
		li $v0, print_str		#print string grade
		syscall
		
		li $v0, read_float
		syscall
		
		s.s $f0, off_grade($t2)		#t[i].grade = read_float();
		
		
		addi $t0, $t0, 1	#i++
		
		j for
		
		
endFor:
		jr $ra
		
		
		
		
		
		
		
		
		
		
		
		
		
