.eqv KEY_CODE 0xFFFF0004 	# ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 	# =1 if has a new keycode ?
 				# Auto clear after lw
 				
.eqv DISPLAY_CODE 0xFFFF000C 	# ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008	# =1 if the display has already to do
 				# Auto clear after sw
.data
	cmd:	 .space 20
	exit_cmd: .asciiz "exit"
	message:  .asciiz "what"
	
.text
 	li 	$k0, KEY_CODE
 	li 	$k1, KEY_READY

 	li 	$s0, DISPLAY_CODE
 	li 	$s1, DISPLAY_READY
 	
	la	$s2, exit_cmd		# exit string
	la	$s3, cmd		# cmd store
	li	$s4, 0			# cmd store index
	j	loop
	
cmd_watch:
	addi	$t3, $s3, 0
	addi	$t4, $s2, 0
	cmp_loop:
		lb	$t5, 0($t3)	
		lb	$t6, 0($t4)
		bne	$t5, $t6, new_cmd

		addi	$t3, $t3, 1
		addi	$t4, $t4, 1
		
		beq	$t6, 't', cmd_execute
		j 	cmp_loop

	cmd_execute:
		li	$v0, 10
		syscall	
	
	new_cmd:
		la	$a0, message
		li	$v0, 4
		syscall
		
		addi	$s4, $s4, 1	
		add	$s3, $s3, $s4	# s3 = s3 + s4
		li	$s4, 0		# reset cmd index
		j	WaitForDis
 	
loop: 
	nop	
	
WaitForKey: 
	lw 	$t1, 0($k1) 		# $t1 = [$k1] = KEY_READY
 	nop
 	beq 	$t1, $zero, WaitForKey 	# if $t1 == 0 then Polling
	nop	
 #-----------------------------------------------------
ReadKey: 
	lw 	$t0, 0($k0) 		# $t0 = [$k0] = KEY_CODE

	add	$t3, $s3, $s4		# t3 = A[$s4]
	sb	$t0, 0($t3)		# save cmd keycode
	addi	$s4, $s4, 1		# s4 += 1
	
	beq	$t0, '\n', cmd_watch
	
 	nop
 #-----------------------------------------------------
WaitForDis: 
	lw 	$t2, 0($s1) 		# $t2 = [$s1] = DISPLAY_READY
 	nop
 	beq 	$t2, $zero, WaitForDis 	# if $t2 == 0 then Polling
	nop
 #-----------------------------------------------------
 # Encrypt: 
 #     	addi 	$t0, $t0, 1 		# change input key
 #-----------------------------------------------------
ShowKey: 
	sw 	$t0, 0($s0) 		# show key
 	nop
 #-----------------------------------------------------
 	j loop
 	nop
