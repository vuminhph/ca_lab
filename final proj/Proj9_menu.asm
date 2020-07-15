# Final Project 9
# Working with graphics
# Pham Vu Minh

.data
dce:			.asciiz	"                                              *************       \n **************                              *3333333333333*      \n *222222222222222*                           *33333********       \n *22222******222222*                         *33333*              \n *22222*      *22222*                        *33333********       \n *22222*       *22222*       *************   *3333333333333*      \n *22222*       *22222*     **11111*****111*  *33333********       \n *22222*       *22222*   **1111**       **   *33333*              \n *22222*      *222222*   *1111*              *33333********       \n *22222*******222222*   *11111*              *3333333333333*      \n *2222222222222222*     *11111*               *************       \n ***************        *11111*                                   \n      ---                *1111**                                  \n    / o o \\                *1111****   *****                      \n    \\   > /                 **111111***111*                       \n     -----                   ***********     dce.hust.edu.vn      \n"
white_c: 		.asciiz " "

d_space:		.space 	25
e_space:		.space	25

display_msg:		.asciiz "\n\nDisplaying graphic...\n"
remove_color_msg:	.asciiz "\n\nRemoving color from graphic...\n"
swap_chars_msg:		.asciiz	"\n\nSwapping DCE...\n"
recolor_msg:		.asciiz "\n\nRecoloring graphic...\n"

d_colors:		.space	800
c_colors:		.space	800
e_colors:		.space	800

c_color_prompt:		.asciiz	"Input the color of C"
d_color_prompt:		.asciiz	"Input the color of D"
e_color_prompt:		.asciiz	"Input the color of E"

c_recolor:		.asciiz	"1"
d_recolor:		.asciiz	"2"
e_recolor:		.asciiz "3"

menu_msg:			.asciiz "\n\n MENU\n 1. Display graphics\n2. Remove colors\n3. Swap letters\n4.Recolor\n5.Exit\n"
choice_msg:			.asciiz "Your choice: "

.text	
	la	$s0, dce		# load graphic into $s0
	la	$s1, white_c
	lb	$s2, 0($s1)
	
# MENU
menu:
	la	$a0, menu_msg
	li	$v0, 4
	syscall
	
	la	$a0, choice_msg
	li	$v0, 51
	syscall
	
	beq	$a0, 1, display_graphic
	beq	$a0, 2, remove_color
	beq	$a0, 3, swap_chars
	beq	$a0, 4, recolor
	beq	$a0, 5, exit
	
	j	menu
	
			
# Display graphic
display_graphic:
	la	$a0, display_msg	# print display message
	li	$v0, 4
	syscall
	add	$a0, $zero, $s0	
	li	$v0, 4
	syscall   
	
	j	menu   

# Remove graphic color
remove_color:
	la	$t4, c_recolor
	lb	$t7, 0($t4)
	
	la	$t5, d_recolor
	lb	$t8, 0($t5)
	
	la	$t6, e_recolor
	lb	$t9, 0($t6)
	
	la	$s1, white_c
	lb	$s2, 0($s1)
	
	la	$a0, remove_color_msg		# Display message
	li	$v0, 4
	syscall
	
	la	$s3, c_colors			# array to store addresses of c's colors
	la	$s4, d_colors			# array to store addresses of d's colors
	la	$s5, e_colors			# array to store addresses of e's colors
	
	add	$t1, $zero, $s0			# load pointer to $t1
	loop:
		lb	$t0, 0($t1)		# load value of pointer $t1 to $t0
		beq	$t0, $t7, c_char
		beq	$t0, $t8, d_char
		beq	$t0, $t9, e_char
		check_done:
			addi	$t1, $t1, 1
			beq	$t1, $s1, color_removed	
			j	loop			
		
	c_char:
		sw	$t1, 0($s3)		# store address to pointer $t1 
		addi	$s3, $s3, 4
		j	replace_char
	d_char:
		addi	$t3, $t1, 44
		sw	$t3, 0($s4)
		addi	$s4, $s4, 4
		j	replace_char
	e_char:
		addi	$t3, $t1, -44
		sw	$t3, 0($s5)
		addi	$s5, $s5, 4
		j	replace_char
	
	replace_char:
		sb	$s2, 0($t1)		# $s2 stores white character ' '
		j	check_done

color_removed:
	add	$a0, $zero, $s0	
	li	$v0, 4
	syscall  
	
	j	menu

swap_chars:
	la	$a0, swap_chars_msg
	li	$v0, 4
	syscall
	
	add	$s3, $zero, $s0			# Set pointer $s3 at start of $s1
	
	line_loop:
		bge	$s3, $s1, done_swapping
		li	$t0, 0			# set counter at $t0 = 0
		addi	$s5, $s3, 0		# store address at beginning of line to $s5
		
		char_loop:
			addi	$s4, $s3, 44	# address of character to swap
			lb	$t1, 0($s3)
			lb	$t2, 0($s4)
			
			sb	$t2, 0($s3)	# swap 2 characters 
			sb	$t1, 0($s4)
			
			addi	$s3, $s3, 1
			addi	$t0, $t0, 1
			beq	$t0, 22, end_char_loop
			
			j	char_loop
		end_char_loop:
			addi	$s3, $s5, 67
			j	line_loop

	done_swapping:
		add	$a0, $zero, $s0	
		li	$v0, 4
		syscall     
			
		j	menu

	
recolor:
	la	$a0, recolor_msg
	li	$v0, 4
	syscall
	
	la	$s2, c_recolor
	la	$s3, d_recolor
	la	$s4, e_recolor
	
	la	$a0, c_color_prompt
	addi	$a1, $s2, 0
	li	$a2, 2
	li	$v0, 54
	syscall
	
	la	$a0, d_color_prompt
	addi	$a1, $s3, 0
	li	$a2, 2
	li	$v0, 54
	syscall
	
	la	$a0, e_color_prompt
	addi	$a1, $s4, 0
	li	$a2, 2
	li	$v0, 54
	syscall
	
	la	$t2, c_colors
	la	$t3, d_colors
	la	$t4, e_colors
	
	addi	$t0, $s0, 0		# Set pointer at start of graphic 
	
	color_loop:
		lw	$t5, 0($t2)
		beq	$t0, $t5, color_c
		
		lw	$t5, 0($t3)
		beq	$t0, $t5, color_d
		
		lw	$t5, 0($t4)
		beq	$t0, $t5, color_e
		
		done_coloring:
			addi	$t0, $t0, 1
			beq	$t0, $s1, end_color_loop
			j	color_loop
			
		color_c:
			lb	$s7, 0($s2)
			sb	$s7, 0($t0)
			addi	$t2, $t2, 4
			j	done_coloring
		color_d:				
			lb	$s7, 0($s3)
			sb	$s7, 0($t0)
			addi	$t3, $t3, 4
			j	done_coloring
		color_e:
			lb	$s7, 0($s4)
			sb	$s7, 0($t0)
			addi	$t4, $t4, 4
			j	done_coloring
			
		end_color_loop:
			add	$a0, $zero, $s0	
			li	$v0, 4
			syscall   
			
			j	menu
		
exit:
	li	$v0, 10
	syscall
