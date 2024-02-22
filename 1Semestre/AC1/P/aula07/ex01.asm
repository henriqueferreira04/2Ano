	.data
	
str:	.asciiz "Aula de Ac1"
	
	.eqv print_int10, 1
	.text
	.globl main
	
####################################
	
strlen:
	li $v0, 0	#len = 0
	
while:
	lb $t0, 0($a0)	#*s = str[i]
	addiu $a0, $a0, 1	#s++
	
	beq $t0, '\0', endWhile	#while(*s++ != '\0')
	
	addi $v0, $v0, 1	#len++
	
	j while
	
endWhile:
	jr $ra
	
	
#########################################

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	la $a0, str
	
	jal strlen
	

	li $v0, print_int10	#print len
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0	#return 0
	
	jr $ra

 
	
	