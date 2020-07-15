# Laboratory Week 7, Home Assignment 2
# Pham Vu Minh

.data
	output: .asciiz "Max: "
.text
main:	
	li	$a0, 2		# Load test input
	li	$a1, 6
	li	$a2, 9
	jal	max		# Call max procedure
	nop
	la	$a0, output
	move	$a1, $v0
	jal	PrintInt
	li	$v0, 10
	syscall

# Procedure max: find the largest of three integers
# param[in] 	$a0 integer
# param[in]	$a1 integer
# param[in] 	$a2 integer
# return 	$v0 the largest value

.text
max:
	add 	$v0, $a0, $zero	# Copy (a0) in v0
	sub	$t0, $a1, $v0	# compute (a1) - (v0)
	bltz	$t0, okay	# if (a1) - (v0) < 0 then no change
	nop
	add	$v0, $a1, $zero	# else (a1) is largest thus far

okay:
	sub	$t0, $a2, $v0	# compute (a2) - (v0)
	bltz	$t0, done	# if (a2) - (v0) < 0 then no change
	nop
	add	$v0, $a2, $zero	# else (a2) is largest overall
done:	jr	$ra		# return to calling program

.include "utils.asm"