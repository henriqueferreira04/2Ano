	.data
	
	.eqv off_a1, 0
	.eqv off_i, 16
	.eqv off_g, 24
	.eqv off_a2, 28
	.eqv struct_SIZE, 45
	.eqv print_double, 3

a1:	.asciiz "Str_1"
i:	.word 2023
g:	.double 2.718281828459045
a2:	.asciiz "Str_2"
value:	.double 0.35

xyz:	.space struct_SIZE
	.text
	.globl main
	
	
#a1 -> 0
#i  -> 16
#g  -> 24
#a2 -> 28
#xyz -> 45

#s0 = xyz
###############################

f2:
	lw $t0, off_i($a0)	#t0 = i
	
	mtc1 $t0, $f2		#f2 = i
	cvt.d.w $f2, $f2	#f2 = (double) i
	
	l.d $f4, off_g($s0)	#f4 = g
	mul.d $f2, $f2, $f4	#f2 = (double) i * g
	
	
	la $t1, value		#t1 = value
	l.d $f6, 0($t1)		#f6 = 0.35
	
	div.d $f0, $f2, $f6	#f0 = (double) i * g / 0.35
	
	jr $ra
	
	



#################################

main:
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	
	la $s0, xyz	#s2	
	
	move $a0, $s0
	la $a1, a1
	
	jal strcpy	#a1 check
	
	
	la $s1, i
	lw $s2, 0($s1)
	sw $s2, off_i($s0)	#i check
	
	
	la $s1, g
	l.d $f2, 0($s1)
	s.d $f2, off_g($s0)	#g check
	
	
	move $a0, $s0
	la $a1, a2
	
	jal strcpy		#a2 check
	
	move $a0, $s0
	jal f2
	
	mov.d $f12, $f0
	li $v0, print_double
	syscall
	
	
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	
	li $v0, 0
	jr $ra








