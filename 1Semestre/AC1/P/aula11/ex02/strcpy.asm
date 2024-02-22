	.data
	.text
	.globl strcpy

	
###################################	
strcpy:
	li $t0, 0	#i = 0
	
	move $t1, $a0	#dst
	move $t2, $a1	#src
do:
	addu $t1, $a0, $t0	#&dst[i]
	addu $t2, $a1, $t0	#&src[i]
	
	lb $t3, 0($t2)	#src[i]
	
	sb $t3, 0($t1)	#dst[i] = src[i]
	
while:
	beq $t3, '\0', endDoWhile
	
	addi $t0, $t0, 1	#i++
	
	j do
	
endDoWhile:
	move $v0, $a0
	
	jr $ra