.data
	num: .word -5
	PositiveNumber: .asciiz "Number is positive"
	NegativeNumber: .asciiz "Number is negative"
.text 
	lw $t0, num
	sgt $t1, $t0, $zero
	beqz $t1, else
		#if block
		la $a0, PositiveNumber
		li $v0, 4
		syscall
		b end_if
		#else block
	else:
		la $a0, NegativeNumber
		li $v0, 4
		syscall
		
end_if:

li $v0, 10
syscall