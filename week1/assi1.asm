.data
message:	.asciiz	"Tìm giá tr? hàm s? y = x+z\n"
result_message:	.asciiz	"y = "
x:		.word	2
z:		.word	5
y:		.word	

.text
la	$a0,	message

li	$v0,	4
syscall

la	$a1,	x
lw	$a1,	0($a1)
la	$a2,	z
lw	$a2,	0($a2)
la	$a3,	y

add	$a3, $a1, $a2

la	$a0,	result_message
li	$v0,	4
syscall

li	$v0,	1
move	$a0, 	$a3
syscall

li	$v0,	10
syscall


