	.data
str:	.asciiz "Introduza um número(float): "
str2:	.asciiz "Introduza um número(int): "
str3:	.asciiz "Resultado: "

	.eqv read_int, 5
	.eqv read_float, 6
	.eqv print_float, 2
	.eqv print_str, 4
	.text
	.globl main
	
################################
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	la $a0, str
	li $v0, print_str
	syscall
	
	li $v0, read_float
	syscall
	
	mov.s $f12, $f0
	
	la $a0, str2
	li $v0, print_str
	syscall
	
	li $v0, read_int
	syscall
	
	move $a0, $v0
	
	jal xtoy	#xtoy($f12, $a0)
	
	la $a0, str3
	li $v0, print_str
	syscall
	
	mov.s $f12, $f0
	li $v0, print_float
	syscall
	
	
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0
	jr $ra
	
	
	
	