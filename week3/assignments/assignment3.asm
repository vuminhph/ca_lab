# Laboratory Week 3, Assignment 3
# Pham Vu Minh

.data
prompt:		.asciiz "\nEnter a number from 0 to 2: "
exit_message:	.asciiz	"\nInvalid input"

.text
	li $s2, 0		# a = 0
	li $s3, 1		# b = 1
	
	la $a0, prompt
	li $v0, 4
	syscall
	move $a0, $a1
	li $v0, 5
	syscall
	move $s1, $v0

	li $t0, 0 		# load value for test case
	li $t1, 1
	li $t2, 2
	beq $s1, $t0, case_0
	beq $s1, $t1, case_1
	beq $s1, $t2, case_2
	j default
case_0: addi $s2, $s2, 1 	# a=a+1
	j continue
case_1: sub $s2, $s2, $t1 	# a=a-1
	j continue
case_2: add $s3, $s3, $s3  	# b=2*b
	j continue
default:
	la $a0, exit_message
	li $v0, 4
	syscall
continue:
	li $v0, 10
	syscall
