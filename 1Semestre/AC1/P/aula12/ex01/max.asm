		.data
	
		.eqv off_first_name, 4
		.eqv off_last_name, 22
		.eqv off_grade, 40
		.eqv size_first_name, 17
		.eqv size_last_name, 14
		.eqv size_student, 48
		
max_grade:	.float -20.0

		.text
		.globl max
	
#id_number -> 0
#first_name -> 4
#last_name  -> 22
#grade -> 40
#student -> 48

#a0 = st
#a1 = ns
#f12 = media
#t0 = p
#t1 = pmax
#f2 = sum
#f4 = max_grade
#f6 = p->grade
#f8 = ns
	
##############################

max:

	move $t0, $a0  	#t0 = p = st
	
	move $t1, $t0	#t1 = pmax
	
	sll $t4, $a1, 2	#$t1 = ns * 4
	
	add $t2, $a0, $t4	#t2 = st + ns
	
	la $t3, max_grade	#t3 = max_grade
	l.s $f4, 0($t3)		#f4 = max_grade
	
	
for:
	bge $t0, $t2, endFor	#for(p = st; p < (st + ns); p++)
					#t0 = p
	
	lw $t5, 0($t0)
	l.s $f6, off_grade($t5)		#p->grade
	
	add.s $f2, $f2, $f6		#sum += p->grade
	
if:
	c.le.s $f6, $f4
	bc1t endIf			#if(p->grade > max_grade)
	
	mov.s $f4, $f6			#max_grade = p->grade;
	
	move $t1, $t5			#pmax = p;
	
	
endIf:
	addiu $t0, $t0, 4	#p++
	
	j for
	
	
	
endFor:
	mtc1 $a1, $f8			#f8 = ns
	cvt.s.w $f8, $f8		#f8 = (float)ns
	
	div.s $f8, $f2, $f8		#media = sum / (float)ns
	
	s.s $f8, 0($a2)		#*media
	
	
	move $v0, $t1			#return pmax;
	
	jr $ra
	
	
	
	
	
