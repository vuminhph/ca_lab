# Assignment 5
# Pham Vu Minh
# Reverse string

.data
string:		.space		20
reversed_string:.space		20
Message1:	.asciiz 	"Input string "
Message2:	.asciiz		"Reversed string: "
.text
main:
get_string:	
	li	$v0, 54
	la	$a0, Message1
	la	$a1, string
	li	$a2, 20
	syscall
	
get_length: 
	la	$a0, string		# a0 = Address(string[0])
	xor	$v0, $zero, $zero	# v0 = lenght = 0
	xor 	$t0, $zero, $zero	# t0 = i = 0
check_char:
	add	$t1, $a0, $t0		# t1 = a0 + t0
					# address of (string[0] + i)
	lb	$t2, 0($t1)		# t2 = string[i]
	beq	$t2, $zero, end_of_str	# Check if null char
	addi	$v0, $v0, 1		# length++
	addi	$t0, $t0, 1		# i++
	j	check_char
end_of_str:
	move	$a1, $t1		#assign a1 to the end of input string
	la	$a0, reversed_string
reverse:
	addi	$s0, $zero, -1		# so = i = 0
L1:
	add	$t1, $s0, $a1		# t1 = s0 + a1 = i + y[0]
					#    = address of y[i]
	lb	$t2, 0($t1)		# t2 = value at t1 = y[i]
	not	$s1, $s0
	addi	$s1, $s1, 1
	add	$t3, $a0, $s1		# t3 = s0 + a0 = i + x[0]
					#    = address of x[i]
	sb	$t2, 0($t3)		# x[i] = t2 = y[i]
	beq	$t2, $zero, end_of_reverse # if y[i] == 0, exit
	nop
	addi	$s0, $s0, -1		# s0 -= 1
	j 	L1
	nop
end_of_reverse: 
	addi	$a1, $a0, 1
	la	$a0, Message2
	li	$v0, 59
	syscall