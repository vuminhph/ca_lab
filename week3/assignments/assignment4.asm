#Laboratory Week 3, Assignment 3
#Pham Vu Minh

# if s1, s2 have same sign
# s3 = s1 + s2
# if s3 doesn;t have same sign with either s1 or s2
# => overflow

.text
	li	$s1, 0x092189e2
	li	$s2, 0xf6de761d
	
start:
	li	$t0, 0				#Default to be not overflow
	xor	$t1, $s1, $s2			#check if s1, s2 have the same sign
	beqz	$t1, exit
		
		addu	$s3, $s1, $s2		#s3 = s1 + s2
		xor	$t2, $s3, $s1		#check if s3, s1 have the same sign
		xor 	$t3, $s3, $s2		#check if s3, s2 have the same sign
		and	$t4, $t2, $t3		#if s3 has different sign to either s1, s2 then overflow
		beqz 	$t4, OVERFLOW
		
		b exit
OVERFLOW:
	li	$t0, 1
exit:
	li 	$v0, 10
	syscall