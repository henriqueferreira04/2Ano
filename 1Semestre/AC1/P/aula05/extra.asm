	.data
	
str1: 	.asciiz "\nIntroduza um numero: "

	.align 2
lista:  .space 40

	.eqv size, 10
	.eqv print_str, 4
	.eqv print_int10, 1
	.eqv read_int, 5
	
	.text
	.globl main
	
###################3

main:
	li $t0, 0	#i = 0
	la $t1, lista	#p = lista
	
for:
	bge $t0, size, endfor	#for(;i < size)
	
	la $a0, str1
	li $v0, print_str	#print str1
	syscall
	
	sll $t2, $t0 , 2	#i * 4
	addu $t2, $t1, $t2	#&lista[i]
	
	li $v0, read_int
	syscall			#read_int
	
	sw $v0, 0($t2)		#lista[i] = read_int
	
	addi $t0, $t0, 1	#i++
	
	j for
	
endfor:
	li $t0, 0	#i = 0
	li $t3, size
	addi $t3, $t3, -1 	#$t3 = size - 1
	
for2:
	bge $t0, $t3, endfor2	#for (i < size - 1)
	
	addi $t4, $t0, 1	#j = i + 1
	

for3:
	bge $t4, size, endfor3	#for (j < size)
	
	sll $t2, $t0, 2		#i * 4
	sll $t8, $t4, 2		#j * 4
	
	addu $t8, $t1, $t8	#&lista[j]
	
	addu $t2, $t1, $t2	#&lista[i]
	
	lw $t5, 0($t2)		#lista[i]
	lw $t6, 0($t8)		#lista[j]
	

if:	
	ble $t5, $t6, endif	#if(lista[i] > lista[j])
	
	move $t7, $t5		#aux = lista[i]
	
	sw $t6, 0($t2)		#lista[i] = lista[j]
	sw $t7, 0($t8)   	#lista[j] = aux
	
endif:
	addi $t4, $t4, 1	#j++
	
	j for3
	

endfor3:
	addi $t0, $t0, 1	#i++
	
	j for2
	
	
endfor2:
	
	jr $ra
	
	

	
	
	