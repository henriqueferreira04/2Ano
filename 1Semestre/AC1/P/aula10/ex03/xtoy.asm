	.data
	.align 3
um:	.float 1.0
	.text
	.globl xtoy
	
########################################
xtoy:
	
	addiu $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	li $s0, 0	#i = 0
	
	la $s1, um	#t1 = um
	
	l.d $f2, 0($s1)	#f2 = 1.0
		
	jal abs		#abs(y)
	
	
for:
	bge $s0, $v0, endFor	#for(; i < abs(y); i++)
	
if:
	ble $v0, 0, else	#if(y > 0)
	
	mul.s $f2, $f2, $f12	#result *= x;
	
	j endIf
	
else:
	div.s $f2, $f2, $f12	#result /= x;

endIf:
	mov.s $f0, $f2		#f0 = result
	
	addiu $s0, $s0, 1	#i++
	
	j for
	
endFor:
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addiu $sp, $sp, 12
	jr $ra

	
	
	
