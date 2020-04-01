.text
.globl main
main:
	ori $t0, $zero, 15
	ori $t1, $zero, 3
	add $t1, $zero, $t1
	sub $t2, $t0, $t1
	sra $t2, $t2, 2
	mult $t0, $t1
	mflo $a0
	ori $v0, $zero, 1
	syscall
	addi $v0, $zero, 10
	syscall
.data
	result: .asciiz "15 * 3 is "