#Laboratory Week 3, Assignment 2
#Pham Vu Minh

.text
	li	$s0, 0xfb21ad0e
	
	andi	$t1, $s0, 0xff000000	#Extract the MSB of $s0
	andi	$t2, $s0, 0xffffff00	#Clear LSB of $s0
	ori	$t3, $s0, 0x11		#Set LSB of $s0
	andi	$t4, $s0, 0x00000000	#Clear $s0
