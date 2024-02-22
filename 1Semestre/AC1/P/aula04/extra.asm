	.data
str1: 	.asciiz "Introduza uma string: "

str2:	.space 21

	.eqv print_str, 4
	.eqv read_str, 8
	.eqv size, 20

	.text
	.globl main
#
#＃#＃＃＃井＃＃##＃
main:
	la $a0, str1
	li $v0, print_str
	syscall
	
	la $a0, str2
	li $a1, size
	li $v0, read_str
	syscall

	la $t0, str2

	li $t3, 0x61
	li $t4, 0x41
	li $t5, 0x20
#size
#$t1, size * 4
#'a' - 'A' = 0x20
while:
	
	lb $t2, 0($t0)
	
	beq $t2, '\0', endWhile
	
	
	sub $t2, $t2, $t5
	sb $t2, 0($t0)
	addi $t0, $t0, 1
	
	j while
#p++
#&str2Cil
#*p = str2[il
#while (*p != "10')
#*p = *p - 'a' + 'A'
endWhile:
	la $a0, str2
	li $v0, print_str
	syscall

	jr $ra