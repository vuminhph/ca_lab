.data
	prompt: .asciiz "Enter the value to calculate the sum up to: "
	output: .asciiz "The final result is:  "
.text
	la $a0, prompt
	li $v0, 4
	syscall
	move $a0, $a1
	li $v0, 5
	syscall
	move $s1, $v0 

	li $s0, 0
	li $s2, 0
	
	start_loop:
		sle $t1, $s0, $s1
		beqz $t1 end_loop
		#code
		add $s2, $s2, $s0
		addi $s0, $s0, 1
		b start_loop	
	end_loop:
		la $a0, output
		li $v0, 4
		syscall
		
		move $a0, $s2
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		