	.data 
	.eqv False, 0
	.eqv True, 1
	.text 
	.globl median
	
#################################
median:
	
	
	addi $t2, $a1, -1	#t2 = nval - 1
do:
	li $t1, False	#houveTroca = false
	li $t0, 0	#i = 0
	
for:	
	
	bge $t0, $t2, endFor	#for(; i < nval - 1; i++) 
	sll $t3, $t0, 3		#i * 3
	addu $t3, $t3, $a0	#&array[i]	
	
if:
	l.d $f2, 0($t3)		#array[i]
	l.d $f4, 8($t3)		#array[i+1]
	
	c.le.d $f2, $f4
	bc1t endIf
	
	mov.d $f6, $f2		#aux = array[i]
	
	s.d $f4, 0($t3)	 	#array[i] = array[i+1]
	
	s.d $f6, 8($t3)		#array[i+1] = aux
	
	li $t1, True	#houveTroca = true
	
	
endIf:
	addiu $t0, $t0, 1	#i++
	
	j for
	

endFor:
	
while:
	bne $t1, True, endWhile	#while (houveTroca == True)
	
	j do
	
endWhile:

	div $t1, $a1, 2	#nval = nval / 2
	sll $t1, $t1, 3	#nval * 3
	
	addu $a0, $a0, $t1	#&array[nval / 2]
	
	l.d $f0, 0($a0)		#array[nval / 2]
	
	jr $ra