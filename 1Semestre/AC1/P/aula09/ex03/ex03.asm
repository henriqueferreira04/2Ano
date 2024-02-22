	.data
	
a:	.space 32

str: 	.asciiz "\n"
	.eqv SIZE, 4
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv print_str, 4
	.text
	.globl main
	
	
############################ 
average:
	addi $t0, $a1, -1	#i = n - 1
	
	li $t1, 0
	mtc1 $t1, $f2		
	cvt.d.w $f2, $f2	#sum = 0.0
	
for2:
	blt $t0, 0, endFor2	#for(; i >= 0; i--)
	  
	sll $t2, $t0, 3		#i * 3
	addu $t2, $a0, $t2	#&array[i]
	
	l.d $f4, 0($t2)		#array[i]
	
	add.d $f2, $f2, $f4	#sum += array[i]
	
	addiu $t0, $t0, -1	#i--
	
	j for2
	
endFor2:
	mtc1 $a1, $f6		#f6 = n
	cvt.d.w $f6, $f6	#f6 = (double) n
	
	div.d $f0, $f2, $f6	#sum / (double)n

	jr $ra		#return


##############################
max:
	addiu $t0, $a1, -1	#$t0 = n - 1
	sll $t0, $t0, 3		#t0 * 3
	
	addu $t0, $t0, $a0	#t0 = u
	
	l.d $f2, 0($t0)		#f2 = *u
	
	l.d $f4, 0($a0)		#f4 = max
	addiu $a0, $a0, 8	#p++
	
for3:
	bgt $a0, $t0, endFor3	#for(; p <= u; p++)
	
	l.d $f6, 0($a0)		#*p
	
if:
	c.le.d $f6, $f4
	bc1t endIf
	
	mov.d $f4, $f6		#max = *p
	
endIf:
	addiu $a0, $a0, 8	#p++
	j for3
	
endFor3:
	mov.d $f0, $f4
	jr $ra
	
	
	

############################
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	li $t0, 0	#i = 0
	la $t1, a	#a
	
for:
	bge $t0, SIZE, endFor	#for (i = 0; i < size; i++)
	
	sll $t2, $t0, 3
	addu $t2, $t1, $t2	#a[i]
	
	li $v0, read_double	
	syscall
	
	s.d $f0, 0($t2)		#a[i] = read_double
	
	addi $t0, $t0, 1	#i++
	
	j for
	
endFor:
	li $t3, SIZE	#t3 = 10
	move $a0, $t1
	move $a1, $t3
	
	jal average
	
	mov.d $f12, $f0
	li $v0, print_double
	syscall
	
	la $a0, str
	li $v0, print_str
	syscall
	
	la $a0, a
	move $a1, $t3
	
	jal max
	
	mov.d $f12, $f0
	li $v0, print_double
	syscall
	
	la $a0, str
	li $v0, print_str
	syscall
	
	la $a0, a
	move $a1, $t3
	
	jal median
	
	mov.d $f12, $f0
	li $v0, print_double
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0
	jr $ra
	
	
	
	
	
	