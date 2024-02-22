	.data
um:	.double 1.0
umMeio:	.double 0.5
	.text
	.globl sqrt

##########################

sqrt:
	addiu $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	
	la $s0, um
	l.d $f2, 0($s0)		#f2 = 1.0 = xn
	
	la $s0, umMeio
	l.d $f10, 0($s0)	#f10 = 0.5
	
	mov.d $f6, $f12		#f6 = val
	
	li $s1, 0		#i = 0
	
if:
	c.le.d $f6, $f8	#if(val > 0.0)
	bc1t else
	
do:
	mov.d $f4, $f2		#f4 = f2 = aux
	
	div.d $f8, $f6, $f2	#f8 = val/xn
	
	add.d $f8, $f2, $f8	 #f8 = xn + val/xn
	
	mul.d $f2, $f10, $f8	#xn = 0.5 * (xn + val/xn)
	

while:
	c.eq.d $f4, $f2		#(aux != xn)
	bc1t endDo
	
	addi $s1, $s1, 1	#i++
	bge $s1, 25, endDo	#(++i < 25)
	
	j do
	
else:
	mov.d $f2, $f8		#xn = 0.0
endDo:
	mov.d $f0, $f2
	
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addiu $sp, $sp, 8
	
	jr $ra
	
	
	