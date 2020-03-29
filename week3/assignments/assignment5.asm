#Laboratory Week 3, Home Assignment 1
#Pham Vu Minh

#multiply by small power of 2

.data
prompt: 	.asciiz "Enter the number to be multiplied: "
prompt2:	.asciiz "Enter an small exponent: "
output:		.asciiz	"Result: "
new_line:	.asciiz  "\n"

.text
start:
	la 	$a0, prompt		#get input for the number to be multiplied s0
	li	$v0, 4
	syscall
	move	$a0, $a1
	li	$v0, 5
	syscall
	move	$s0, $v0
	
	la	$a0, prompt2		#get input for exponent of 2 s1
	li	$v0, 4
	syscall
	move	$a0, $a1
	li 	$v0, 5
	syscall
	move	$s1, $v0
	
	beqz	$s1, zero_exp
	li	$s2, 2
	start_loop			#s2 = 2 ** s1
		addi	$s1, $s1, -1
		mul	$a2, $s2, 2
		mflo	$s2
		
		seq	$t1, $s1, 1
		bnez	$t1, calculate
		
		b start_loop
zero_exp:
	li	$s2, 1
	
calculate:
	la	$a0, output
	li	$v0, 4
	syscall
	
	mul	$s3, $s0, $s2		#s3 = s1 * s2
	mflo	$a0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
	