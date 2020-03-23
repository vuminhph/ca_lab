.data
x:	.word	2
z:	.word	5
y:	.word	

.text
la	$t8,	x
la	$t9,	z
lw	$t1,	0($t8)
lw	$t2, 	0($t9)
add	$t0,$t1,$t2

la	$t3,	y
add	$t3,	$zero,	$t0
syscall

