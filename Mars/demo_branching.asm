.data
.text
	li $t0, 20  #i = 10
	li $t1, 10  #j = 20
	
	li $t2, 0  #z = 1
	
	
	slt $s0, $t0, $t1
	beq $s0, $zero, else
	nop
	addi $t2, $zero, 10
	j endif
else:
	addi $t2, $zero, 20
endif:

 
	
	