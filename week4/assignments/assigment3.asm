#Laboratory Week 3, Assignment 3
#Pham Vu Minh

#Pseudo instructions
#a. abs
#$s0,s1
#s0 <= | $s1 |
#b. move $s0,s1
#s0 <= $s1
#c. not
#$s0
#s0 <= bit invert (s0)
#d. ble
#$s1,s2,L


.text
	li	$s1,-100
#	b	ques_a
#	b	ques_b
#	b	ques_c
	b	ques_d

######################################
	#a. Find absolute value
ques_a:
	slti	$t1, $s1, 0
	beqz	$t1, POSITIVE
		addi 	$t2, $s1, -1
		not	$s0, $t2
		add 	$a0, $s0, $zero
		li	$v0, 1
		syscall
POSITIVE:
	add	$s0, $s1, $zero
	add	$a0, $s0, $zero
	li	$v0, 1
	syscall
	
b Exit	
	
######################################
	#b. move
ques_b:
	add	$s0, $s1, $zero
b Exit
######################################
	#c. not
ques_c:
	addi	$s3, $zero, 0xffffffff
	sub	$s0, $s3, $s1
	add	$a0, $s0, $zero
	li	$v0, 1
	syscall

b Exit
######################################
	#d. ble
ques_d:
	li	$s2, 50
	slt	$t1, $s1, $s2	#check if s2 < s1
	seq	$t2, $s1, $s2	#check if s2 == s1
	or	$t3, $t1, $t2
	beqz	$t3, L
		b Exit

L:
	# in case s1 <= s2
	li 	$a0, 13
	li	$v0, 1
	syscall
	
b Exit	
	
######################################
Exit:
	li 	$v0, 10
	syscall
