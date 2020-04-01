.data
	output1: .asciiz "\nValid conversion: "
	output2: .asciiz "\nInvalid conversion, nothing is printed: "
	
.text
.globl main
main:
	ori $v0, $zero, 4
	la $a0, output1
	syscall			
	
	ori $t0, $zero, 0x41	# t0 = 65 ('A')
	addi $a0, $t0, 0x20	# a0 = 65 + 32 = 97 ('a')
	ori $v0, $zero, 11
	
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $t0, $zero, 0x61	# t0 = 97 ~ 'a'
	addi $a0, $t0, 0x20	# t0 = 97 + 32 = 129 not an asciiz char
	ori $v0, $zero, 11
	syscall
	
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	ori $t0, $zero, 0x41	# t0 = 65 ~ 'A'
	ori $a0, $t0, 0x20	# a0 = 97 ~ 'a'
	ori $v0, $zero, 11
	syscall
	
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	ori $t0, $zero, 0x61	# t0 = 97 ~ 'a'
	ori $a0, $t0, 0x20	# t0 = 97 ~ 'a'
	ori $v0, $zero, 11
	syscall
	
	ori $v0, $zero, 10
	syscall
	
	
	