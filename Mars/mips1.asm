.data 
x: .word 0x10
message: .asciiz "Hello world"

.text
	la $a0, message
	li $v0, 4
	syscall
	
	addi $t1, $zero, 10
	addi $t2, $zero, 20
	add $t3, $t1, $t2 
