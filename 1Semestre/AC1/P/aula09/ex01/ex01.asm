	.data
	
	.eqv read_int, 5
	.eqv print_float, 2
value:	.float 2.59375
	.text
	
	.globl main
	
	
#####################
main:
	

do:
	li $v0, read_int
	syscall
	
	mtc1 $v0, $f4	#val = f4
	
	cvt.s.w $f0, $f4	#f0 = (float)val
	
	 
	la $t1, value		#t1 = 2.59375
	l.s $f12, 0($t1)		#f1 = t1
	
	mul.s $f2, $f0, $f12	#res = (float)val * 2.59375
	
	mov.s $f12, $f2
	li $v0, print_float
	syscall
	
	c.eq.s $f2, $f6		#while(res != 0.0)
	bc1t endDo
	
	j do
	
endDo:
	li $v0, 0
	jr $ra

	
	
	