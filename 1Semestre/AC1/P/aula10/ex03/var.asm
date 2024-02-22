	.data
	.text
	.globl var

#a0 = array
#a1 = nval
#f2 = media
#f4 = soma
#s0 = array
#t0 = i
#t1 = nval
#f4 = array[i]		
##############################

var:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)

	
	move $s0, $a0	#s0 = array
	
	jal average
	
	cvt.s.d $f2, $f0	#f2 = average(array, nval) = media
	
	li $t0, 0	#i = 0
	move $t1, $a1	#t1 = nval
	
for:
	bge $t0, $t1, endFor	#for(i=0, soma=0.0; i < nval; i++)
	
	l.d $f4, 0($s0)		#array[i]
	
	cvt.s.d $f4, $f4	#(float)array[i]
	
	sub.s $f12, $f4, $f2	#f12 = (float)array[i] - media
	
	li $a0, 2
			
	jal xtoy 		#xtoy ((float)array[i] - media, 2)
	
	add.s $f4, $f4, $f0	#soma += xtoy
	
	
	addi $t0, $t0, 8	#i++
	
	j for
	
	
endFor:

	cvt.d.s $f4, $f4	#(double)soma
	
	mtc1 $t1, $f6		#f6 = nval
	cvt.d.w $f6, $f6	#(double)nval
	
	div.d $f0, $f4, $f6	#(double)soma / (double)nval
	
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8
	jr $ra

	
	
	
	
	