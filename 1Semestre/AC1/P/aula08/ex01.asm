	.data
	
str:	.asciiz "2020 e 2024 sao anos bissextos"
str2:	.space 20

	.eqv print_str, 4
	.eqv print_int10, 1
	.text
	.globl main
	
########################################

atoi:
	li $v0, 0	#res = 0
	li $t2, '0'	#$t2 = '0'
	li $t3, 0	#$t3 = true
	la $t4, str2
	
while:
	lb $t0, 0($a0)	#*s = str[]
	
if:
	bne $t0, '0', elsif
	
	j endif
elsif:
	bne $t0, '1', else
	
	sb $t0, 0($t4)	#str2[] = bit
	addiu $t4, $t4, 1	
	
	j endif

else:
	li $t3, 1	#$t3 = false
	
endif:
	blt $t0, '0', endWhile
	bgt $t0, '9', endWhile
	
	subu $t1, $t0, $t2	#digit = *s - '0'
	addiu $a0, $a0, 1	#*s++
	
	mulu $v0, $v0, 10	#res = res * 10
	addu $v0, $v0, $t1	#res = res + digit
	
	j while
	
endWhile:

if2:
	bne $t3, 0, endif2
	
	la $a0, str2
	li $v0, print_str
	syscall
	
endif2:
	
	jr $ra		#return res
	
	
	
##################################################

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	jal atoi	#atoi(str)
	
	move $a0, $v0			#print(atoi(str))
	li $v0, print_int10
	syscall
	
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0	
	jr $ra
