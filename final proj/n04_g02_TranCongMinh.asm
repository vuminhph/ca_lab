# Author : Tran Cong Minh
# Group : 2
# Project 4 - CNC Marsbot

#------------------------------------------------------
#-----MARSBOT------------------------------------------
.eqv HEADING 0xffff8010
.eqv MOVING 0xffff8050
.eqv LEAVETRACK 0xffff8020
.eqv WHEREX 0xffff8030
.eqv WHEREY 0xffff8040
#------------------------------------------------------
#-----Data Lab Sim-------------------------------------
.eqv IN_ADDRESS_HEXA_KEYBOARD 0xFFFF0012
.eqv OUT_ADDRESS_HEXA_KEYBOARD 0xFFFF0014
#------------------------------------------------------
.data 
PS1 : .word 135,3000,0,180,3000,1,90,1000,1,30,1180,1,0,1000,1,
            330,1180,1,270,1000,1,90,4000,0,260,1200,1,190,1000,1,
            170,1500,1,100,1200,1,0,3000,0,90,2500,0,270,1000,1,
            180,1200,1,90,1000,1,270,1000,0,180,1800,1,90,1000,1
PS2 : .word 135,3000,0,180,3000,1,0,3000,0,135,1500,1,45,1500,1,
            180,3000,1,90,1000,0,0,3000,1,90,1000,0,180,3000,1,0,
            3000,0,150,3460,1,0,3000,1,90,1000,0,180,3000,1,0,1500,0,
            90,1000,1,0,1500,0,180,3000,1
PS3 : .word 135,3000,0,180,2000,1,135,500,1,90,1000,1,45,500,1,
            0,2000,1,315,500,1,270,1000,1,225,500,1,145,2100,0,
            145,850,1,90,1000,0,0,2800,0,180,2350,1,135,500,1,
            90,1000,1,45,500,1,0,2350,1,90,1500,0,195,2850,1,
            15,2850,0,165,2850,1,0,1700,0,270,1500,1,0,1500,0,
            60,750,1,120,750,1,180,3000,0,90,1200,0,0,2750,1,
            150,3200,1,0,2750,1
            
size1 : .word 59
size2 : .word 56
size3 : .word 95
angle : .word 0
time : .word 1
track : .word 2

.text
main : 


polling : 

li $t1, IN_ADDRESS_HEXA_KEYBOARD
li $t2, OUT_ADDRESS_HEXA_KEYBOARD
li $t3, 0x01
li $t4, 0x02
li $t5, 0x04

choose0: 
sb $t3, 0($t1)
lb $a0, 0($t2)
beqz $a0, choose4
beq $a0, 0x11, DrawPS1

choose4 : 
sb $t4, 0($t1)
lb $a0, 0($t2)
beqz $a0, choose8
beq $a0, 0x12, DrawPS2

choose8 :
sb $t5, 0($t1)
lb $a0, 0($t2)
beqz $a0, back_to_polling
beq $a0, 0x14, DrawPS3

DrawPS1 :

la $t0, PS1
lw $t1, size1
lw $t2, angle
lw $t3, time
lw $t4, track

jal DRAW
j back_to_polling

DrawPS2 :
la $t0, PS2
lw $t1, size2
lw $t2, angle
lw $t3, time
lw $t4, track

jal DRAW

j back_to_polling

DrawPS3 : 
la $t0, PS3
lw $t1, size3
lw $t2, angle
lw $t3, time
lw $t4, track

jal DRAW

j back_to_polling

back_to_polling: 
li $a0, 100
li $v0, 32
j polling





#-----------------------------------------------------------
# DRAW procedure, to start drawing
# param[in] none
#-----------------------------------------------------------
DRAW : 
addi $sp, $sp, -4
sw $ra, 0($sp)
sll $t5, $t2, 2
sll $t6, $t3, 2
sll $t7, $t4, 2

addu $t5, $t5, $t0
addu $t6, $t6, $t0
addu $t7, $t7, $t0

jal UNTRACK
nop
lw $a0, 0($t5)
jal ROTATE
nop
jal GO
nop
addi $v0, $zero, 32
lw $a0, 0($t6)
syscall


# begin to draw
begin_loop : 
addi $t2, $t2, 3
addi $t3, $t3, 3
addi $t4, $t4, 3

bgt $t2, $t1, end_loop

sll $t5, $t2, 2
sll $t6, $t3, 2
sll $t7, $t4, 2

addu $t5, $t5, $t0
addu $t6, $t6, $t0
addu $t7, $t7, $t0

jal UNTRACK
nop
lw $t8, 0($t7)
beqz $t8, untrack
jal TRACK
nop
lw $a0, 0($t5)
jal ROTATE
nop
addi $v0, $zero, 32
lw $a0, 0($t6)
syscall

j begin_loop

untrack :
lw $a0, 0($t5)
jal ROTATE
nop
addi $v0, $zero, 32
lw $a0, 0($t6)
syscall

j begin_loop

end_loop : 

jal STOP
nop

lw $ra, 0($sp)
addi $sp, $sp, 4

jr $ra
nop


#-----------------------------------------------------------
# GO procedure, to start running
# param[in] none
#-----------------------------------------------------------
GO: li $at, MOVING # change MOVING port
 addi $k0, $zero,1 # to logic 1,
 sb $k0, 0($at) # to start running
 nop
 jr $ra
 nop
 
#-----------------------------------------------------------
# STOP procedure, to stop running
# param[in] none
#------------------------
STOP: li $at, MOVING # change MOVING port to 0
 sb $zero, 0($at) # to stop
 nop
 jr $ra
 nop
 
#-----------------------------------------------------------
# TRACK procedure, to start drawing line
# param[in] none
#-----------------------------------------------------------
TRACK: li $at, LEAVETRACK # change LEAVETRACK port
 addi $k0, $zero,1 # to logic 1,
 sb $k0, 0($at) # to start tracking
 nop
 jr $ra
 nop
#-----------------------------------------------------------
# UNTRACK procedure, to stop drawing line
# param[in] none
#-----------------------------------------------------------
UNTRACK:li $at, LEAVETRACK # change LEAVETRACK port to 0
 sb $zero, 0($at) # to stop drawing tail
 nop
 jr $ra
 nop
#-----------------------------------------------------------
# ROTATE procedure, to rotate the robot
# param[in] $a0, An angle between 0 and 359
# 0 : North (up)
# 90: East (right)
# 180: South (down)
# 270: West (left)
#-----------------------------------------------------------
ROTATE: li $at, HEADING # change HEADING port
 sw $a0, 0($at) # to rotate robot
 nop
 jr $ra
 nop
 
#-----------------------------------------------------------

 

