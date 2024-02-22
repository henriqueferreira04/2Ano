	.data
	.text
	.globl abs
	
#################################

abs:
	move $v0, $a0
if:	
	bge $a0, 0, endIf	#if(val < 0)
	
	mul $v0, $a0, -1	#val = -val
	
endIf:
	jr $ra		#return val


