.data
	s: .asciiz "hello\nworld"
	msg: .asciiz "ok vl\n"
.text
	la	$s0, s
	loop:
		lb	$s1, 0($s0)
		beq	$s1, '\n', exit_program
		addi	$s0, $s0, 1
		j	loop
		
	exit_program:
		la	$a0, msg
		li	$v0, 4
		syscall