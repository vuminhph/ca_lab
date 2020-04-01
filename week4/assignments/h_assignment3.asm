#Laboratory Week 3, Home Assignment 3
#Pham Vu Minh
#Move the bits of $s0 by 2 to the left

.text
	li	$s0, 1
	sll	$s1, $s0, 2		

#Move the first bit of s0 to the left by 2 position, so the value stored in s1 is 4
#This is equivilent to multiplying it by 4
	