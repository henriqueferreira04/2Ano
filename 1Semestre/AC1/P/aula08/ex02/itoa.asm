	.data
	.text
	.globl itoa
	
############################

itoa:

	addiu $sp, $sp, -24
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	sw $s4, 20($sp)
	
	move $s4, $a2
	lb $s0, 0($a2)	#*p = s
	li $s1, 0	#digit
	
	move $s2, $a0	#n
	move $s3, $a1 	#b 

do:
	div $s2, $s3	# n 
	mfhi $s1	# digit = n % b
	mflo $s2	# n = n / b
	
	move $a0, $s1
	
	jal toascii
	
	addi $a2, $a2, 1	#s++
	
	ble $s2, 0, endDo	#while (n > 0)
	
	j do
	
endDo:

	sb $0, 0($a2)	#*p = '\0'
	
	move $a0, $a2
	
	jal strrev
	
	move $v0, $s4
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	addiu $sp, $sp, 24
	
	jr $ra
	
	
	
