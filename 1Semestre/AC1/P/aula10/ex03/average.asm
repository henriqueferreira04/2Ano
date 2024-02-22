	.data
	.text
	.globl average
	
###########################
average:

	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	
	addi $s0, $a1, -1	#i = n - 1
	
	li $s1, 0
	mtc1 $s1, $f2		
	cvt.d.w $f2, $f2	#sum = 0.0
	
for:
	blt $s0, 0, endFor	#for(; i >= 0; i--)
	  
	sll $s2, $s0, 3		#i * 3
	addu $s2, $a0, $s2	#&array[i]
	
	l.d $f4, 0($s2)		#array[i]
	
	add.d $f2, $f2, $f4	#sum += array[i]
	
	addiu $s0, $s0, -1	#i--
	
	j for
	
endFor:
	mtc1 $a1, $f6		#f6 = n
	cvt.d.w $f6, $f6	#f6 = (double) n
	
	div.d $f0, $f2, $f6	#sum / (double)n
	
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addiu $sp, $sp, 12

	jr $ra		#return

