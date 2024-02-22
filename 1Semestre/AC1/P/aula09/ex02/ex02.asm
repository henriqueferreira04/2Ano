	.data
	
cinco:	.double 5.0
trDois: .double 32.0

nove:	.double 9.0

	.eqv read_int, 5
	.eqv print_double, 3
	.text
	.globl main
	
#############################
double:
	la $t0, cinco
	l.d $f2, 0($t0)		#f2 = 5.0
	
	la $t0, nove	
	l.d $f4, 0($t0)		#f4 = 9.0
	
	la $t0, trDois
	l.d $f6, 0($t0)		#f6 = 32.0
	
	
	sub.d $f12, $f12, $f6	#f12 = ft - 32.0
	
	div.d $f2, $f2, $f4	#f2 = 5.0 / 9.0
	
	mul.d $f0, $f2, $f12	#f0 = f2 * f12
	
	jr $ra


#############################
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $v0, read_int
	syscall
	
	mtc1 $v0, $f0	#f0 = $v0
	cvt.d.w $f12, $f0	#f12 = (double) f0
	
	jal double
	
	mov.d $f12, $f0
	li $v0, print_double
	syscall
	
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	li $v0, 0
	jr $ra

	
	
