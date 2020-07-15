.data
dce:	.asciiz	"                                              *************       \n"
line2:	.asciiz " **************                              *3333333333333*      \n"
line3:	.asciiz " *222222222222222*                           *33333********       \n"
line4:	.asciiz " *22222******222222*                         *33333*              \n"
line5:	.asciiz " *22222*      *22222*                        *33333********       \n"
line6:	.asciiz " *22222*       *22222*       *************   *3333333333333*      \n"
line7:	.asciiz " *22222*       *22222*     **11111*****111*  *33333********       \n"
line8: 	.asciiz	" *22222*       *22222*   **1111**       **   *33333*              \n"
line9: 	.asciiz	" *22222*      *222222*   *1111*              *33333********       \n"
line10:	.asciiz	" *22222*******222222*   *11111*              *3333333333333*      \n"
line11:	.asciiz	" *2222222222222222*     *11111*               *************       \n"
line12:	.asciiz	" ***************        *11111*                                   \n"
line13:	.asciiz	"      ---                *1111**                                  \n"
line14:	.asciiz	"    / o o \\                *1111****   *****                      \n"
line15:	.asciiz	"    \\   > /                 **111111***111*                       \n"
line16:	.asciiz	"     -----                   ***********     dce.hust.edu.vn      \n"
      
.text
store_dce:
	
print_label:
	la	$a0, line1
	li	$v0, 4
	syscall
	la	$a0, line2
	li	$v0, 4
	syscall
	la	$a0, line3
	li	$v0, 4
	syscall
	la	$a0, line4
	li	$v0, 4
	syscall
	la	$a0, line5
	li	$v0, 4
	syscall
	la	$a0, line6
	li	$v0, 4
	syscall
	la	$a0, line7
	li	$v0, 4
	syscall
	la	$a0, line8
	li	$v0, 4
	syscall
	la	$a0, line9
	li	$v0, 4
	syscall
	la	$a0, line10
	li	$v0, 4
	syscall
	la	$a0, line11
	li	$v0, 4
	syscall
	la	$a0, line12
	li	$v0, 4
	syscall
	la	$a0, line13
	li	$v0, 4
	syscall
	la	$a0, line14
	li	$v0, 4
	syscall
	la	$a0, line15
	li	$v0, 4
	syscall
	la	$a0, line16
	li	$v0, 4
	syscall
	
line_process:
	
