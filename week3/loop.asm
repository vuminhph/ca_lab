.data
	prompt: .asciiz "Enter an integer, -1 to stop: "
	message: .asciiz "You enter: "
	newline: .asciiz "\n"
.text
	la $a0, prompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	start_loop:
		sne $t1, $s0, -1 
		beqz $t1, end_loop
		
		la $a0, message
		li $v0, 4
		syscall
		move $a0, $s0
		li $v0, 1
		syscall
		la $a0, newline
		li $v0, 4
		syscall
		
		la $a0, prompt
		li $v0, 4
		syscall
		li $v0, 5
		syscall
		move $s0, $v0
	
		b start_loop
	end_loop:
		li $v0, 10
		syscall