# Laboratory Week 7, Home Assigment 1
# Pham Vu Minh

.data
	output: .asciiz "Absolute value: "
.text
main:
	li	$a0, -45	#load input parameters
	jal	abs		# jump and link to abs procedure
	nop
	la	$a0, output
	move	$a1, $v0
	jal	PrintInt
	
	li	$v0, 10		# terminate
	syscall
	
endmain:
# function abs
# param(in)	$a1	the integer need to be gained the absolute
# value
# return 	$v0	absolute value

abs:
	sub	$v0, $zero, $a0		# put -(a0) in v0;
	bgtz	$v0, done		# if (v0) > 0 then done
	nop 
	add	$v0, $a0, $zero		# else put (a0) in v0
done:
	jr 	$ra

.include	"utils.asm"