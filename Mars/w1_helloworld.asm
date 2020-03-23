.data
	x: .word 0x001234
	message: .asciiz "Hello World"
.text
	la $a0, message
	li $v0, 4
	syscall
	
	addi $t1, $zero, 0x0A
	addi $t2, $zero, 20
	
	add $t3, $t1, $t2
	
	
	
	