# Laboratory Week 14, Assignment 1
# Pham Vu Minh

#------------------------------------------------------
# 		col 0x1 	col 0x2 	col 0x4 	col 0x8
#
# row 0x1 	0 		1 		2 		3
# 		0x11 		0x21 		0x41 		0x81
#
# row 0x2 	4 		5 		6 		7
# 		0x12 		0x22 		0x42 		0x82
#
# row 0x4 	8 		9 		a 		b
# 		0x14 		0x24 		0x44 		0x84
#
# row 0x8 	c 		d 		e 		f
# 		0x18 		0x28 		0x48 		0x88
#	
#------------------------------------------------------
# command row number of hexadecimal keyboard (bit 0 to 3)
# Eg. 	assign 0x1, to get key button 0,1,2,3
# 	assign 0x2, to get key button 4,5,6,7
# NOTE must reassign value for this address before reading,
# eventhough you only want to scan 1 row
.eqv IN_ADDRESS_HEXA_KEYBOARD 0xFFFF0012

# receive row and column of the key pressed, 0 if not key pressed
# Eg. equal 0x11, means that key button 0 pressed.
# Eg. equal 0x28, means that key button D pressed.
.eqv OUT_ADDRESS_HEXA_KEYBOARD 0xFFFF0014

.text
	main: 
		li 	$t1, IN_ADDRESS_HEXA_KEYBOARD
 		li 	$t2, OUT_ADDRESS_HEXA_KEYBOARD
 		
 		li 	$t3, 0x01 	
 		li 	$t4, 0x02 	
 		li 	$t5, 0x04 	
 		li 	$t6, 0x08
 		
	pooling:
	 	sb 	$t3, 0($t1) 	# must reassign expected row
 		lb 	$t7, 0($t2) 	# read scan code of key button
 		bnez	$t7, got_input
 		
 		sb 	$t4, 0($t1) 	# must reassign expected row
 		lb 	$t7, 0($t2) 	# read scan code of key button
 		bnez	$t7, got_input
 		
 		sb 	$t5, 0($t1) 	# must reassign expected row
 		lb 	$t7, 0($t2) 	# read scan code of key button
 		bnez	$t7, got_input
 		
 		sb 	$t6, 0($t1) 	# must reassign expected row
 		lb 	$t7, 0($t2) 	# read scan code of key button
 		bnez	$t7, got_input
 		
 		j	pooling
 		
 		got_input:
 			bne	$t7, $t8, print
 			j	pooling
 		
 		print: 
 			move	$a0, $t7
 			li 	$v0, 34 	# print integer (hexa)
 			syscall
 			
 			nop
		sleep: 
			li 	$a0, 100 	# sleep 100ms
 			li 	$v0, 32
 			syscall
 			
 			nop
 			
		back_to_pooling: 
			li	$v0, 10
			syscall
