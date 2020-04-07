# Assignment 2
# Pham Vu Minh

.data
message1:	.asciiz "The sum of "
and_mes:	.asciiz " and "
is_mes:		.asciiz " is "
.text
	li	$s0, 99
	li	$s1, 100
	add	$s2, $s0, $s1 	# s2 = s1 + s2
	
	la	$a0, message1
	li	$v0, 4
	syscall
	move	$a0, $s0
	li	$v0, 1
	syscall
	la	$a0, and_mes
	li	$v0, 4
	syscall
	move	$a0, $s1
	li	$v0, 1
	syscall
	la	$a0, is_mes
	li	$v0, 4
	syscall
	move	$a0, $s2
	li	$v0, 1
	syscall
	
	