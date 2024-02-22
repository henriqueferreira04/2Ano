	.data
	
str1: 	.asciiz "Introduza um  numero"
str2:   .asciiz "\nValor em codigo Gray: "
str3:	.asciiz "\nValor em binario: "

	.eqv print_int10, 1
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv print_inBinary, 35
	
	.text
	.globl main
	
###############3

main:

	li $t0 ,0	#gray = 0
	li $t1, 0 	#bin = 0
	li $t2, 0 	#mask = 0
	
	la $a0, str1
	li $v0, print_str
	syscall
	
	li $v0, read_int
	syscall
	
	move $t0, $v0	#gray = read_int
	
	srl $t2, $t0, 1	#mask = gray >> 1
	
	move $t1, $t0	#bin = gray
	
while:
	beq $t2, 0, endWhile	#while (mask != 0)
	
	xor $t1, $t1, $t2	#bin = bin ^ mask
	
	srl $t2, $t2, 1		#mask = mask >> 1
	
	j while
	
endWhile:
	la $a0, str2
	li $v0, print_str	#print str2
	syscall
	
	move $a0, $t0
	li $v0, print_int10	#print gray
	syscall
	
	la $a0, str3
	li $v0, print_str	#print str3
	syscall
	
	move $a0, $t1
	li $v0, print_inBinary	#print bin
	syscall
	
	jr $ra