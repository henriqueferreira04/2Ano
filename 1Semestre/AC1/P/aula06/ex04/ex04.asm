	.data
	
str1:	.asciiz "Nr parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "

	.eqv print_str, 4
	.eqv print_int, 1
	.text
	.globl main
	
######################################

main:
	move $t1, $a0		#argc
				
	move $t2, $a1		#argv
	
	li $t0, 0		#i = 0
	
	la $a0, str1
	li $v0, print_str	#print str1
	syscall
	
	move $a0, $t1
	li $v0, print_int	#print n Arg
	syscall	
	
	
for:
	bge $t0, $t1, endFor	#for(i=0; i < argc; i++)
	
	sll $t3, $t0, 2		#i * 4
	addu $t3, $t3, $t2	#&argv[i]
	
	la $a0, str2
	li $v0, print_str
	syscall			#print str2
	
	move $a0, $t0		
	li $v0, print_int	#print i
	syscall
	
	la $a0, str3
	li $v0, print_str
	syscall			#print str3
	
	lw $a0, 0($t3)		#argv[i]
	li $v0, print_str
	syscall			#print argv[i]
	
	addi $t0, $t0, 1	#i++
	
	j for
	
endFor:
	li $v0, 0
	jr $ra
	
	
	
