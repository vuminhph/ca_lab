.data
	output1: .asciiz "\nAfter first xor: "
	output2: .asciiz "\nAfter second xor: "
	
.text
.globl main
main:
	ori $s0, $zero, 0x01234567
	la $a0, output1
	li $v0, 4
	syscall
	xori $s0, $s0, 0xffffffff	# every 0 bit of s0 becomes 1, 1 bit becomes 0
	move $a0, $s0
	li $v0, 34			# print integer as hex
	syscall 
	
	la $a0, output2
	li $v0, 4
	syscall
	xori $s0, $s0, 0xffffffff	# every 0 bit of s0 becomes 1, 1 bit becomes 0
	move $a0, $s0
	li $v0, 34
	syscall 
	
	ori $v0, $zero, 10
	syscall