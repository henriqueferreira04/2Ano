# int main(void) #{
# printStr("AC2 – Aulas praticas\n");
# return 0; #}

	.equ PRINT_STR,8
	.data

msg: .asciiz "AC2–Aulaspraticas\n"
// system call
	.text 
	.globl main
main: 
	la $a0,msg
	li $v0,PRINT_STR
syscall
li $v0,0 
jr $ra

# printStr("AC2 – Aulas praticas\n");
# return 0;
