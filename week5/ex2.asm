.data
Message: .asciiz "So nguyen la "
.text
	li $v0, 56
	la $a0, Message
	li $a1, 0x307
	syscall
