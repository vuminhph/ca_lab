.data 
  welc:         .asciiz "\n Welcome to the simpliest Calculator!\n" 
  p_int:        .asciiz "\n Hay nhap vao so thu nhat co do dai  4 chu so,\n VD: nhan 0021 de nhap so 21. \n"
  p_int1:       .asciiz "\n Hay nhap vao so thu hai co do dai  4 chu so,\n VD: nhan 0001 de nhap so 1. \n"
  p_num:	.asciiz "\n So ban vua nhap la :  "
  p_toantu:     .asciiz "\n Nhap vao toan tu \n - Nhan a de nhap phep cong \n - Nhan b de nhap phep tru \n - Nhan c de nhap phep nhan \n - Nhan d de nhap phep chia \n "
  ketqua:       .asciiz "\n Ket qua la :  "
  xuongdong:    .asciiz "\n"
  sb_nhan:      .asciiz "\n Ban da nhap phep nhan. \n"
  sb_chia:      .asciiz "\n Ban da nhap phep chia.  \n"
  sb_cong :     .asciiz "\n Ban da nhap phep cong.\n"
  sb_tru:       .asciiz "\n Ban da nhap phep tru. \n"
  sb_daubang:   .asciiz "\n Nhap f de hien thi ket qua" 
  err:          .asciiz "Khong chia duoc so 0"
  goodbye:	.asciiz "\n Chuong trinh ket thuc. Tam biet. \n"
  
.eqv ZERO                   0x3F  # Gia tri byte hien thi so 0 tren den LED
.eqv ONE                    0x06  # Gia tri byte hien thi so 1 tren den LED
.eqv TWO                    0x5B  # Gia tri byte hien thi so 2 tren den LED
.eqv THREE                  0x4F  # Gia tri byte hien thi so 3 tren den LED
.eqv FOUR                   0x66  # Gia tri byte hien thi so 4 tren den LED
.eqv FIVE                   0x6D  # Gia tri byte hien thi so 6 tren den LED
.eqv SIX                    0x7D  # Gia tri byte hien thi so 6 tren den LED
.eqv SEVEN                  0x07  # Gia tri byte hien thi so 7 tren den LED 
.eqv EIGHT                  0x7F  # Gia tri byte hien thi so 8 tren den LED
.eqv NINE                   0x6F  # Gia tri byte hien thi so 9 tren den LED
.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan trai.
.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan phai
.eqv IN_KEYBOARD 0xFFFF0012
.eqv OUT_KEYBOARD 0xFFFF0014


.data


.macro num_seg (%num)
li $t9 %num
li $t8 SEVENSEG_LEFT
li $t7 SEVENSEG_RIGHT
lb $t0 0($t7)
sb $t0 0($t8)
sb $t9 0($t7)
.end_macro

.text
main: 

start:
	la $a0,welc
    	li $v0, 4     
    	syscall
     	la $a0,p_int
     	li $v0, 4     
     	syscall
  
    #----------------------------------------------------------------------
    # ######### Kich hoat interupt -----------------
    #----------------------------------------------------------------------
  
  	li $t1,IN_KEYBOARD   
  	li $t3,0x80     # Kich hoat interupt tu ban phim hexa
  	sb $t3,0($t1)
  
    #----------------------------------------------------------------------
    # Khai bao bien 
    #------------2---------------------------------------------------------
      	li $s1,0      # $s1: Gia tri lay ra
      	li $s2,0      # $s2: toan tu lay ra
      	li $s5,0      # so thu nhat
      	li $s6,0      # so thu hai
      	li $s7,0      # ket qua
      	li $s4,0      # bien dem s4
    
    #----------------------------------------------------------------------
    # Vong lap cho tin hieu  interupt so thu nhat
    #----------------------------------------------------------------------
Loop: 
	beq $s4,4,nhapso2
      	nop
      	beq $s4,4,nhapso2
      	nop
      	beq $s4,4,nhapso2
      	nop
      	beq $s4,4,nhapso2
      	b Loop  
      	beq $s4,4,nhapso2    # Wait for interrupt
      	nop
      	beq $s4,4,nhapso2
      	b Loop
    #----------------------------------------------------------------------

nhapso2:
    	add $s5,$s1,$0 # luu gia tri so thu nhat vao s5
    	add $s1,$0,$0 # reset s1
    	addi $s4,$0,0 # reset bien dem s4
    	
    	la $a0, p_num
    	li $v0, 4
    	syscall
    	
    	move $a0,$s5 
    	li $v0,1
    	syscall 
    	
    	la $a0,xuongdong
  	li $v0, 4     
  	syscall
    	
    	addi $a1, $a1, 1
    	
    	
    	la $a0,p_int1
    	li $v0,4
    	syscall
    
Loop1: # VOng lap cho interupt so thu 2
     	beq $s4,4,nhaptoantu
     	nop
     	beq $s4,4,nhaptoantu
     	nop
     	beq $s4,4,nhaptoantu
     	nop
     	beq $s4,4,nhaptoantu
     	b Loop1      #Wait for interrupt
     	nop
     	beq $s4,4,nhaptoantu
     	b Loop1
     	
nhaptoantu:
  	add $s6,$s1,$0 # LUU SO THU 2 VAO S6
  	add $s1,$0,$0  #RESET S1
  	addi $s4,$0,0 #RESET BIEN DEM S4
    	la $a0,xuongdong
  	li $v0, 4     
  	syscall
  	
  	la $a0, p_num
    	li $v0, 4
    	syscall
  
  	move $a0,$s6  # IN SO THU 2
  	li $v0,1
  	syscall 
  	
  	la $a0,xuongdong
  	li $v0, 4     
  	syscall

  	la $a0,p_toantu
  	li $v0,4
  	syscall
  
Loop2:
    	beq $s4,1,nhaptoantu2
    	nop
    	beq $s4,1,nhaptoantu2
    	nop
    	beq $s4,1,nhaptoantu2
    	nop
    	beq $s4,1,nhaptoantu2
    	b Loop2    #Wait for interrupt
    	beq $s4,1,nhaptoantu2
    	nop
    	beq $s4,1,nhaptoantu2
    	b Loop2
    
nhaptoantu2:
     	add $s1,$0,$0 # reset s1
     	addi $s4,$0,0 # reset bien dem s4
     	

   cong1: bne $s2,1,tru1
    	  la $a0,sb_cong
	  li $v0, 4     
  	  syscall
  	  addu $s7,$s5,$s6 # thuc hien phep cong
  	  j baonhapdaubang
  	  
   tru1:  bne $s2,2,nhan1
   	  la $a0,sb_tru
          li $v0, 4     
          syscall
          sub $s7,$s5,$s6  # thuc hien phep tru
          j baonhapdaubang
          
   nhan1: bne $s2,3,chia1
          la $a0,sb_nhan
          li $v0,4
          syscall
          mul $s7,$s5,$s6  # thuc hien phep nhan
          j baonhapdaubang
          
   chia1: bne $s2,4,baonhapdaubang
          la $a0,sb_chia
          li $v0, 4     
          syscall
          bnez $s6 chia_duoc
          la $a0 err
          li $a1 0
          li $v0 55
          syscall
          num_seg (ZERO)
          num_seg (ZERO)
          j start
   chia_duoc:
          div $s7,$s5,$s6  # thuc hien phep chia
          j baonhapdaubang
          
baonhapdaubang:
 		la $a0,sb_daubang
  	        li $v0, 4     
                syscall
 
Loop3: # Cho nhap vao dau = de hien thi ket qua  
   	beq $s2,5,show
    	nop
    	beq $s2,5,show
    	nop
    	beq $s2,5,show
    	nop
    	beq $s2,5,show
    	b Loop2    #Wait for interrupt
    	beq $s2,5,show
    	nop
    	beq $s2,5,show
    	b Loop3
  
show:
     	la $a0,ketqua
        li $v0,4
        syscall 
                
        move $a0,$s7
        li $v0,1
        syscall 
        
        la $a0, xuongdong
        li $v0, 4
        syscall
        
        addi $s1,$zero,0 # reset $s1
        addi $a1,$a1,1
	li $t9,0
        li $t8,0
        slt $k1,$s7,$0 # kiem tra ket  qua la so am hay khong
        bne $k1, 1, napgiatricho_Led
        mul $s7,$s7,-1
        div $t8,$s7,10
        mfhi $t9
             
        bnez $t8,napgiatricho_Led
        
        li $t2,SEVENSEG_RIGHT   # hien thi den LED phai
        add $s0,$zero,$t9 # truyen bien right
        jal hienthi
        nop
        
        li $t2,SEVENSEG_LEFT  # hien thi den LED trai
	li $t4, 64
	sb $t4, 0($t2)
	j endmain	
        nop
        
napgiatricho_Led: 
	div $t8,$s7,10
        mfhi $t9
	div $t8,$t8,10
        mfhi $t8
        
        li $t2,SEVENSEG_RIGHT   # hien thi den LED phai
        add $s0,$zero,$t9 # truyen bien right
        jal hienthi
        nop
        
        li $t2,SEVENSEG_LEFT  # hien thi den LED trai
        add $s0,$zero,$t8 # truyen bien left
        jal hienthi
        nop
endmain:
       	j start
       	nop
       	
END:
	la $a0, goodbye
      	li $v0, 4     
      	syscall

      	la $v0, 10   
      	syscall    
      

       
hienthi:    
showleds_0: bne $s0,0,showleds_1  # case $s0 = 0
      li $t4,ZERO
      j napgiatri
showleds_1: bne $s0,1,showleds_2  # case $s0 = 1
      li $t4,ONE
      j napgiatri
showleds_2: bne $s0,2,showleds_3  # case $s0 = 2
      li $t4,TWO
      j napgiatri
showleds_3: bne $s0,3,showleds_4  # case $s0 = 3
      li $t4,THREE
      j napgiatri
showleds_4: bne $s0,4,showleds_5  # case $s0 = 4
      li $t4,FOUR
      j napgiatri
showleds_5: bne $s0,5,showleds_6  # case $s0 = 5
      li $t4,FIVE
      j napgiatri
showleds_6: bne $s0,6,showleds_7  # case $s0 = 6
      li $t4,SIX
      j napgiatri
showleds_7: bne $s0,7,showleds_8  # case $s0 = 7
      li $t4,SEVEN
      j napgiatri
showleds_8: bne $s0,8,showleds_9  # case $s0 = 8
      li $t4,EIGHT
      j napgiatri
showleds_9: bne $s0,9,showleds_df # case $s0 = 9
      li $t4,NINE
      j napgiatri
showleds_df:  jr $ra
napgiatri:    sb $t4,0($t2)
	      jr $ra
	      
   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Xu ly khi xay ra interupt
# Hien thi so vua bam len den led 7 doan
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.ktext 0x80000180

  #--------------------------------------------------------------------------
  # SAVE the current REG FILE to stack
  #--------------------------------------------------------------------------

IntSR:
	addi $sp,$sp,4    # Save $ra because we may change it later
      	sw $ra,0($sp)
      	addi $sp,$sp,4    # Save $ra because we may change it later
      	sw  $at,0($sp)
      	addi $sp,$sp,4    # Save $ra because we may change it later
      	sw $v0,0($sp)
      	addi $sp,$sp,4    # Save $a0, because we may change it later
      	sw $a0,0($sp)
      	addi $sp,$sp,4    # Save $t1, because we may change it later
      	sw $t1,0($sp)
      	addi $sp,$sp,4    # Save $t3, because we may change it later
      	sw $t3,0($sp)
      	addi $sp,$sp,4 
      	sw $s4,0($sp)
      	
  # ----------------------------------------------------------------------
  # Processing
  # ----------------------------------------------------------------------
      	addi $s4,$s4,1
      	jal getInt1
      	nop
      	jal getInt2
      	nop
      	jal getInt3
      	nop
      	jal getInt4
      	nop
next_pc:    
	mfc0 $at,$14    # $at <= Copro0.$14 = Coproc0.epc
      	addi $at,$at,4    # $at = $at + 4
      	mtc0 $at,$14    #Coproc0.$14 = Coproc0.epc <= $at
      
  #-----------------------------------------------------------------------
  # RESTORE the REG FILE from STACK
  #-----------------------------------------------------------------------
restore:    
      	lw $t3,0($sp)
      	addi $sp,$sp,-4
      	lw $t1,0($sp)
      	addi $sp,$sp,-4
      	lw $a0,0($sp)
      	addi $sp,$sp,-4
      	lw $v0,0($sp)
      	addi $sp,$sp,-4
      	lw $ra,0($sp)
      	addi $sp,$sp,-4
      	lw $t4,0($sp)
      	addi $sp,$sp,-4
back_main:  
	eret

  #------------------------------------------------------------------------
  # Thu tuc quet cac phim o hang 1 va xu ly
  # Tham so truyen vao: 
  # Tra ve:
  #------------------------------------------------------------------------
getInt1: 
	addi $sp,$sp,4
      	sw $ra,0($sp) 
      	li $t1,IN_KEYBOARD
      	li $t3,0x81     # Kich hoat interrupt, cho phep bam phim o hang 1
      	sb $t3,0($t1)
      	li $t1,OUT_KEYBOARD
      	lb $t3,0($t1)   # Nhan byte the hien vi tri cua phim duoc bam trong hang 1
      	
      	bne $a1, 1, case_0
      	num_seg (ZERO)      # reset den
    	num_seg (ZERO) 
    	addi $a1, $a1, 1
    	
    	bne $a1, 3, case_0
      	num_seg (ZERO)      # reset den
    	num_seg (ZERO) 
    	li $a1 0
    	
case_0:   
	li $t5,0x11
      	bne $t3,$t5,case_1  # case 0x11
      	mul $s1,$s1,10
      	addi $s1,$s1, 0   # factor=factor*10+right
      	num_seg (ZERO)
case_1:   
	li $t5,0x21
      	bne $t3,$t5,case_2  # case 0x21
      	mul $s1,$s1,10
      	addi $s1,$s1,1 # factor=factor*10+right
      	num_seg (ONE)
case_2:   
	li $t5,0x41
      	bne $t3,$t5,case_3  # case 0x41
      	mul $s1,$s1,10
      	addi $s1,$s1, 2 # factor=factor*10+right
      	num_seg (TWO)
case_3:   
	li $t5,0xffffff81
      	bne $t3,$t5,case_default1  # case 0xffffff81
      	mul $s1,$s1,10
      	addi $s1,$s1, 3 # factor=factor*10+right
      	num_seg (THREE)

case_default1:
	nop   
	b getIntRt

    
  #------------------------------------------------------------------------
  # Thu tuc quet cac phim o hang 2 va xu ly
  # Tham so truyen vao: 
  # Tra ve:
  #------------------------------------------------------------------------
getInt2: 
	addi $sp,$sp,4
      	sw $ra,0($sp) 
      	li $t1,IN_KEYBOARD
      	li $t3,0x82     # Kich hoat interrupt, cho phep bam phim o hang 1
      	sb $t3,0($t1)
      	li $t1,OUT_KEYBOARD
      	lb $t3,0($t1)   # Nhan byte the hien vi tri cua phim duoc bam trong hang 1
      	
      	bne $a1, 1, case_4
      	num_seg (ZERO)      # reset den
    	num_seg (ZERO) 
    	addi $a1, $a1, 1
    	
    	bne $a1, 3, case_4
      	num_seg (ZERO)      # reset den
    	num_seg (ZERO) 
    	li $a1 0
    	
case_4:   
	li $t5,0x12
      	bne $t3,$t5,case_5  # case 0x12
      	mul $s1,$s1,10
      	add $s1,$s1,4   # factor=factor*10+right
      	num_seg (FOUR)
case_5:   
	li $t5,0x22
      	bne $t3,$t5,case_6  # case 0x22
      	mul $s1,$s1,10
      	add $s1,$s1,5   # factor=factor*10+right
      	num_seg (FIVE)
case_6:   
	li $t5,0x42
      	bne $t3,$t5,case_7  # case 0x42
      	mul $s1,$s1,10
      	add $s1,$s1,6   # factor=factor*10+right
      	num_seg (SIX)
case_7:   
	li $t5,0xffffff82
      	bne $t3,$t5,case_default2  # case 0xffffff82
      	mul $s1,$s1,10
      	add $s1,$s1,7 # factor=factor*10+right
      	num_seg (SEVEN)
case_default2:   
	nop
	b getIntRt

  #------------------------------------------------------------------------
  # Thu tuc quet cac phim o hang 3 va xu ly
  # Tham so truyen vao: 
  # Tra ve:
  #------------------------------------------------------------------------
getInt3: 
 	addi $sp,$sp,4
      	sw $ra,0($sp) 
      	li $t1,IN_KEYBOARD
      	li $t3,0x84     # Kich hoat interrupt, cho phep bam phim o hang 3
      	sb $t3,0($t1)
      	li $t1,OUT_KEYBOARD
      	lb $t3,0($t1)   # Nhan byte the hien vi tri cua phim duoc bam trong hang 3
      	
      	bne $a1, 1, case_8
      	num_seg (ZERO)      # reset den
    	num_seg (ZERO) 
    	addi $a1, $a1, 1
    	
    	bne $a1, 3, case_8
      	num_seg (ZERO)      # reset den
    	num_seg (ZERO) 
    	li $a1 0
    	
case_8:   
	li $t5,0x00000014
      	bne $t3,$t5,case_9  # case 0x14
      	mul $s1,$s1,10
      	add $s1,$s1,8  # factor=factor*10+right
      	num_seg (EIGHT)
case_9:   
	li $t5,0x00000024
      	bne $t3,$t5,case_a  # case 0x24
      	mul $s1,$s1,10
      	add $s1,$s1,9   # factor=factor*10+right
      	num_seg (NINE)
      	
case_a:   
	li $t5,0x44
        bne $t3,$t5,case_b # case 0x44
        addi $s2,$0,1
        j case_default3
      
case_b:   
	li $t5,0xffffff84
    	bne $t3,$t5,case_default3 # case 0xffffff84
    	addi $s2,$0,2
  	j  case_default3

case_default3:   
	nop
	b getIntRt

  #------------------------------------------------------------------------
  # Thu tuc quet cac phim o hang 3 va xu ly
  # Tham so truyen vao: 
  # Tra ve:
  #------------------------------------------------------------------------
getInt4: 
	addi $sp,$sp,4
      	sw $ra,0($sp) 
      	li $t1,IN_KEYBOARD
      	li $t3,0x88     # Kich hoat interrupt, cho phep bam phim o hang 4
      	sb $t3,0($t1)
      	li $t1,OUT_KEYBOARD
      	lb $t3,0($t1)   # Nhan byte the hien vi tri cua phim duoc bam trong hang 4

case_c:   
	li $t5,0x18
        bne $t3,$t5,case_d # case 0x18
        addi $s2,$0,3
        j case_default4
      
case_d:   
	li $t5,0x28
        bne $t3,$t5,case_f # case 0x28
        addi $s2,$0,4
        j case_default4

case_f:   
	li $t5,0xffffff88 
        bne $t3,$t5,case_default4 # case 0xffffff88
        addi $s2,$0,5
        j case_default4
  

case_default4:   
	j getIntRt

getIntRt: 
	lw $ra,0($sp)
      	addi $sp,$sp,-4
      	jr $ra

