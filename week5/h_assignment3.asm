# Home Assignment 3
# Pham Vu Minh

.data
string:		.space		50
Message1:	.asciiz 	"Nhap xau: "
Message2:	.asciiz		"Do dai la: "
.text
main:
get_string:	
	la	$a0, Message1		# Get string from user
	li	$v0, 4
	syscall
	li	$v0, 8
	la	$a0, string
	li	$a1, 50
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
print_number:
	subi	$v0, $v0, 1
	move	$s0, $v0
	la	$a0, Message2
	li 	$v0, 4
	syscall
	move	$a0, $s0
	li	$v0, 1
	syscall