.data
	result1: .asciiz "\nshift left logical 4 by 2 bits is: "
	result2: .asciiz "\nshift right logical 16 by 2 bits is: "
	result3: .asciiz "\nshift right arithmetic 34 by 2 bits is: "
	result4: .asciiz "\nshift right arithmetic -34 by 2 bits is: "
	result5: .asciiz "\nrotate right 0xffffffe1 by 2 bits is: "
	result6: .asciiz "\nrotate left 0xffffffe1 by 2 bits is: "	
	
.text
.globl main
main:
	addi $t0, $zero, 4
	sll $s0, $t0, 2		# 0000 0100 becomes 0001 0000 (16)
	addi $v0, $zero, 4
	la $a0, result1
	syscall
	addi $v0, $zero, 1
	move $a0, $s0
	syscall
	
	addi $t0, $zero, 16
	srl $s0, $t0, 2		# 0001 0000 becomes 0000 0100 (4)
	addi $v0, $zero, 4
	la $a0, result2
	syscall
	addi $v0, $zero, 1
	move $a0, $s0
	syscall
	
	addi $t0, $zero, 34
	sra $s0, $t0, 2		# 0010 0010 becomes 0000 1000 (8)
	addi $v0, $zero, 4
	la $a0, result3
	syscall
	addi $v0, $zero, 1	
	move $a0, $s0
	syscall
	
	addi $t0, $zero, -34
	sra $s0, $t0, 2		# 1101 1110 becomes 1111 0111 (-9)		
	addi $v0, $zero, 4
	la $a0, result4
	syscall
	addi $v0, $zero, 1
	move $a0, $s0
	syscall
	
	ori $t0, $zero, 0xffffffe1
	ror $s0, $t0, 2		#  1st byte becomes 0111 1111 (0x7f), last byte becomes 1111 1000 (0xf8)
	li $v0, 4
	la $a0, result5
	syscall
	li $v0, 34
	move $a0, $s0
	syscall
	
	ori $t0, $zero, 0xffffffe1
	rol $s0, $t0, 2		# last byte becomes 1000 0111 (0x87)
	li $v0, 4
	la $a0, result6
	syscall
	li $v0, 34
	move $a0, $s0
	syscall
	
	addi $v0, $zero, 10
	syscall