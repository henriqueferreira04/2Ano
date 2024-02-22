	.data
	
str:	.asciiz "ITED - orieVa ed edadisrevinU"
	.eqv print_str, 4
	.text
	.globl main
	
##########################################

exchange:
	lb $t0, 0($a0)	#*c1
	lb $t1, 0($a1)	#*c2
	
	move $t2, $t0	#aux = *c1
	
	sb $t1, 0($a0)	#*c1 = *c2
	sb $t2, 0($a1)	#*c2 = aux
	
	jr $ra
	
##########################################

strrev:
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0	#s0 = &str
	move $s1, $a0	#p1 = &str
	move $s2, $a0	#p2 = &str
	
	
while:
	lb $t1, 0($s2) 	#*p2 = p2
	beq $t1, '\0', endWhile
	
	addi $s2, $s2, 1	#p2++
	
	j while
	
endWhile:
	addi $s2, $s2, -1	#p2--
	
	
while2:
	bge $s1, $s2, endWhile2	#while (p1 < p2)
	
	move $a0, $s1	#$a0 = p1
	move $a1, $s2	#$a1 = p2
	
	jal exchange
	
	addi $s1, $s1, 1	#$p1++
	addi $s2, $s2, -1	#p2--
	
	
	j while2
	
endWhile2:
	move $v0, $s0
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	
	jr $ra


#########################################

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	la $a0, str
	
	jal strrev
	
	move $a0, $v0
	li $v0, print_str
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0	
	
	jr $ra
	
	
