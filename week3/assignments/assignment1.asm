# Laboratory Week 3, Assignment 1
# Pham Vu Minh

.data
	prompt: .asciiz "\nEnter the value of i: "
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
start:
	slt	$t0, $s2, $s1		# j < i
	bne  	$t0, $zero, else	# branch to else if j < i
	addi	$t1, $t1, 1		#then part: x = x + 1
	addi	$t3, $zero, 1		# z = 1
	j	endif			# skip "else" part
else: 	addi	$t2, $t2, -1		# begin else part: y = y - 1
	add 	$t3, $t3, $t3		# z = 2 * z
endif:
	li	$v0, 10
	syscall 
