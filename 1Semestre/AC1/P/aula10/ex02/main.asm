	.data
str:	.asciiz "Introduza um número(double): "
str2:	.asciiz "Resultado: "
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv print_str, 4
	.text
	.globl main
	
	
#########################
main:	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	la $a0, str
	li $v0, print_str
	syscall
	
	
	li $v0, read_double
	syscall
	
	mov.d $f12, $f0
	
	jal sqrt
	
	
	la $a0, str2
	li $v0, print_str
	syscall
	
	mov.d $f12, $f0
	li $v0, print_double
	syscall
	
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0
	jr $ra
	
	
	