# Laboratory Week 3, Assignment 4
# Pham Vu Minh

.data
	prompt: .asciiz "\nEnter the value of i: "
	prompt_for_m: .asciiz "\nEnter the value of m: "
	prompt_for_n: .asciiz "\nEnter the value of n: "	
.text
	li 	$s2, 1			# j = 1 by default
	li	$t1, 1			# x = 1
	li	$t2, 2			# y = 2
	li	$t3, 3			# z = 3
	
	la 	$a0, prompt		# prompt user for the value of i
	li	$v0, 4
	syscall
	move	$a0, $a1
	li	$v0, 5
	syscall
	move	$s1, $v0
	
#	b	start_b
#	b	start_c
	b	start_d
	
start_a:
	slt	$t0, $s1, $s2		# i < j
	beqz  	$t0, else		# branch to else if i >= j
	addi	$t1, $t1, 1		#then part: x = x + 1
	addi	$t3, $zero, 1		# z = 1
	j	endif			# skip "else" part
start_b:
	slt	$t0, $s1, $s2		# i < j
	bnez  	$t0, else		# branch to else if i < j
	addi	$t1, $t1, 1		#then part: x = x + 1
	addi	$t3, $zero, 1		# z = 1
	j	endif			# skip "else" part
start_c:
	add	$t4, $s1, $s2		# t4 = i + j
	sgt	$t0, $t4, $zero		# check if i + j > 0
	bnez 	$t0, else 		# branch to else if i + j > 0
	addi	$t1, $t1, 1		#then part: x = x + 1
	addi	$t3, $zero, 1		# z = 1
	j	endif			# skip "else" part
start_d:
	la 	$a0, prompt_for_m	#get value of m from user
	li	$v0, 4
	syscall
	move 	$a0, $a1
	li	$v0, 5
	syscall
	move	$s3, $v0		#store m in s3

	la 	$a0, prompt_for_n	#get value of n from user
	li	$v0, 4
	syscall
	move 	$a0, $a1
	li	$v0, 5
	syscall
	move	$s4, $v0		#store n in s4
	
	
	add	$t4, $s1, $s2		# t4 = i + j
	add	$t5, $s3, $s4		# t5 = m + n
	sgt	$t0, $t4, $t5		# if i + j > m + n
	beqz  	$t0, else		# branch to else if i + j > m + n
	addi	$t1, $t1, 1		#then part: x = x + 1
	addi	$t3, $zero, 1		# z = 1
	j	endif			# skip "else" part
	
else: 	addi	$t2, $t2, -1		# begin else part: y = y - 1
	add 	$t3, $t3, $t3		# z = 2 * z
endif:
	li	$v0, 10
	syscall 