	.data
	
	.eqv off_g, 16
	.eqv off_a2_0, 24
	.eqv off_a2_1, 28
	.eqv off_v, 32
	.eqv off_k, 36
	
	.eqv print_str, 4
	.eqv print_double, 3
	.eqv print_float, 2
	
	
a1:	.asciiz "St1"

g: 	.double 3.141592653589
a2:	.word 291, 756
v:	.asciiz "X"
k:	.float 1.983

uvw:	.space 40
	.text
	.globl main
	


#a1 -> 0
#g -> 16
#a2 -> 24
#v -> 32
#k -> 36
#uvw -> 40	
#############################

f1:
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	la $s0, uvw
	
	la $a0, uvw
	la $a1, a1	
	
	jal strcpy	#a1 = "St1"
	
	la $s1, g
	l.d $f2, 0($s1)
	s.d $f2, 16($s0)	#g = "3.14.."
	

	la $s1, a2
	lw $s2, 0($s1)
	sw $s2, off_a2_0($s0)	#a2[0]
	
	lw $s2, 4($s1)
	sw $s2, off_a2_1($s0)	#a2[1]
	
	
	la $s1, v
	lb $s2, 0($s1)	
	sb $s2, off_v($s0)	#v
	
	la $s1, k
	l.s $f2, 0($s1)
	s.s $f2, off_k($s0)	#k
	
	#static uvw s1 = {"St1", 3.141592653589, 291, 756, 'X', 1.983};
	
###################################
	
	lw $s1, off_a2_1($s0)
	
	mtc1 $s1, $f2	#f2 = a2[1]
	
	cvt.d.w $f2, $f2	#f2 = (double)a2[1]
	 
	l.d $f4, off_g($s0)	#f4 = g
	
	mul.d $f2, $f2, $f4	#f2 = g * (double)a2[1]
	
	l.s $f6, off_k($s0)	#f6 = k
	
	cvt.d.s $f6, $f6	#f6 = (double) k
	
	div.d $f2, $f2, $f6	#f2 = (g * (double)a2[1]) / (double) k
	
	cvt.s.d $f0, $f2	#f0 = (flloat) f2
	
	
	
	
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	
	jr $ra

#############################
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	jal f1
	
	mov.s $f12, $f0
	li $v0, print_float
	syscall
	
	
	li $v0, 0
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	
	jr $ra
