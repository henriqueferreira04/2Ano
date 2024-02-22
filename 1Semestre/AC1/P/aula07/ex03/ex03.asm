	.data
	
	.eqv print_str, 4
	.eqv print_int10, 1
	.eqv STR_MAX_SIZE, 30

str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space 31
str3:	.asciiz "\n"
str4:	.asciiz "String too long: "

	.text
	.globl main
	
#####################################

strlen:
	li $v0, 0	#len = 0
	
while1:
	lb $t0, 0($a0)	#*s = str[i]
	addiu $a0, $a0, 1	#s++
	
	beq $t0, '\0', endWhile1	#while(*s++ != '\0')
	
	addi $v0, $v0, 1	#len++
	
	j while1
	
endWhile1:
	jr $ra
	
######################################

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
	
	
while2:
	lb $t1, 0($s2) 	#*p2 = p2
	beq $t1, '\0', endWhile2
	
	addi $s2, $s2, 1	#p2++
	
	j while2
	
endWhile2:
	addi $s2, $s2, -1	#p2--
	
	
while3:
	bge $s1, $s2, endWhile3	#while (p1 < p2)
	
	move $a0, $s1	#$a0 = p1
	move $a1, $s2	#$a1 = p2
	
	jal exchange
	
	addi $s1, $s1, 1	#$p1++
	addi $s2, $s2, -1	#p2--
	
	
	j while3
	
endWhile3:
	move $v0, $s0
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	
	jr $ra
	
	
####################################

strcpy:
	li $t0, 0	#i = 0
	move $t3, $a0
	
	addu $a0, $a0, $t0
	addu $a1, $a1, $t0

do:
	lb $t1, 0($a0)	#dst[i]
	lb $t2, 0($a1)	#src[i]
	
	sb $t2, 0($a0)	#dst[i] = src[i]
	
while4:
	beq $t2, '\0', endDoWhile
	
	addi $t0, $t0, 1	#i++
	
	j while4
	
endDoWhile:
	move $v0, $a0
	
	jr $ra

####################################

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str1
	jal strlen
	
	move $t1, $v0
	
if:
	bgt $t1, STR_MAX_SIZE, else	#if(strlen(str1) <= STR_MAX_SIZE)
	
	la $a0, str2
	la $a1, str1
	jal strcpy		#strcpy(str2, str1)
	
	move $a0, $v0
	li $v0, print_str	#print str2
	syscall
	
	la $a0, str3
	li $v0, print_str	#print "\n"
	syscall
	
	la $a0, str2
	jal strrev
	
	move $a0, $v0
	li $v0, print_str	#print str2
	
	li $t0 , 0	#exit_value = 0
	
	j endif
	
else:
	la $a0, str3
	li $v0, print_str	#print str3
	syscall
	
	la $a0, str1
	jal strlen
	
	move $a0, $v0
	li $v0, print_int10	#print strlen(str1)
	syscall
	
	li $t0, -1	#exit_value = -1
	
endif:
	move $v0, $t0
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra
	
	
	
	
	