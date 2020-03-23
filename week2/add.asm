li $t1, 100
li $t2, 50
add $t0, $t1, $t2

move $a0, $t0
li $v0, 1
syscall

addi $t0, $t0, 50
move $a0, $t0
li $v0, 1
syscall

add $t0, $t0, 50
move $a0, $t0
li $v0, 1
syscall

addiu $t0, $t2, -300
move $a0, $t0
li $v0, 1
syscall

addi $t1, $t2, 5647123
move $a0, $t1
li $v0, 1
syscall