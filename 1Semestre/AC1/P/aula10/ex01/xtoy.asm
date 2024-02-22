	.data
	.align 3
um:	.float 1.0
	.text
	.globl xtoy
	
########################################
xtoy:
	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t0, 0	#i = 0
	
	la $t1, um	#t1 = um
	
	l.d $f2, 0($t1)	#f2 = 1.0
		
	jal abs		#abs(y)
	
	
for:
	bge $t0, $v0, endFor	#for(; i < abs(y); i++)
	
if:
	ble $v0, 0, else	#if(y > 0)
	
	mul.s $f2, $f2, $f12	#result *= x;
	
	j endIf
	
else:
	div.s $f2, $f2, $f12	#result /= x;

endIf:
	mov.s $f0, $f2		#f0 = result
	
	addiu $t0, $t0, 1	#i++
	
	j for
	
endFor:
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

	
	
	