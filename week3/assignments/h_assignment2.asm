#Laboratory Week 3, Home Assignment 2
#Pham Vu Minh
#Extract the LSB and the 10 bit of $S0

.text
	li	$s0, 0x0563		#Load test value for these function
	andi	$t0, $s0, 0xff		#Extract the LSB of $s0
	andi	$t1, $s0, 0x0400 	#Extract bit 10 of $s0