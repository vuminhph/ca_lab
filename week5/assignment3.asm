# Assignment 3
# Pham Vu Minh

.data
x: .space 1000
y: .space 1000
message1: .asciiz "Enter a string to be copied: "
message2: .asciiz "The copied string: "

.text
	la	$a0, message1
	li	$v0, 4
	syscall
	li	$v0, 8
	la	$a0, y
	li	$a1, 1000
	syscall
	
	move	$a1, $a0		# copied string at a1 (y)
	la	$a0, x			# copy of string at a0 (x)
	
strcpy:
	add 	$s0, $zero, $zero	# so = i = 0
L1:
	add	$t1, $s0, $a1		# t1 = s0 + a1 = i + y[0]
					#    = address of y[i]
	lb	$t2, 0($t1)		# t2 = value at t1 = y[i]
	add	$t3, $s0, $a0		# t3 = s0 + a0 = i + x[0]
					#    = address of x[i]
	sb	$t2, 0($t3)		# x[i] = t2 = y[i]
	beq	$t2, $zero, end_of_strcpy # if y[i] == 0, exit
	nop
	addi	$s0, $s0, 1		# s0 += 1 
	j 	L1
	nop
end_of_strcpy:	
	move 	$s0, $a0
	
	la	$a0, message2
	li	$v0, 4
	syscall
	move	$a0, $s0
	li	$v0, 4
	syscall		
