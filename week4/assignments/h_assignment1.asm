#Laboratory Week 3, Home Assignment 1
.data
	num1:	.word	0xf92189e2
	num2:	.word	0x09281b2a
.text
	
	lw	$s1,	num1
	lw	$s2,	num2
	add	$s3,	$s1, $s2
start:
	li	$t0, 0			#No Overflow is default status
	addu	$s3, $s1, $s2		# s3 = s1 + s2
	xor 	$t1, $s1, $s2		#Test if $s1 and $s2 have the same sign
	
	beqz	$t1, EXIT		#If not, exit
	slt	$t2, $s3, $s1	
	bltz	$s1, NEGATIVE		#Test if $s1 and $s2 is negative
	beq	$t2, $zero, EXIT	#s1 and s2 are positive, so if s3 is not less than s1
					#the result is not overlow
	j	OVERFLOW
NEGATIVE:
	bne	$t2, $zero, EXIT	#s1 and s2 are negative, so if s3 is less than s1 and s2
					#the result is not overflow
OVERFLOW:
	li	$t0, 1			#The result is overflow
EXIT:					
	