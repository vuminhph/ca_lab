# Laboratory Week 11, Assignment 2
# Pham Vu Minh

# 256x256
# pixel size: 32x32

.eqv MONITOR_SCREEN 	0x10010000 		#Dia chi bat dau cua bo nho man hinh
.eqv WHITE 		0x00FFFFFF 		#Cac gia tri mau thuong su dung
.eqv BLUE 		0x0000B0FF
.eqv ORANGE 		0x00FF5722
.eqv GREEN 		0x008BC34A
.eqv D_GREEN		0x004CAF50
.eqv GREY 		0x00BDBDBD
.eqv BROWN		0x00BF360C
.eqv PURPLE		0x00AD1457

.text
	li $k0, MONITOR_SCREEN 			#Nap dia chi bat dau cua man hinh
	
	li $t0, BLUE
 	sw $t0, 0($k0)
 	nop
 	
 	li $t0, BLUE
 	sw $t0, 4($k0)
 	nop
 	
 	li $t0, ORANGE
	sw $t0, 8($k0)
 	nop

  	li $t0, GREEN
 	sw $t0, 12($k0)
	nop

	li $t0, D_GREEN
	sw $t0, 16($k0)
 	
 	li $t0, GREEN
	sw $t0, 20($k0)
 	
 	li $t0, BLUE
 	sw $t0, 24($k0)
 	
 	li $t0, BLUE
 	sw $t0, 28($k0)
 	
 	li $t0, BLUE
 	sw $t0, 32($k0)
 	
 	li $t0, ORANGE
	sw $t0, 36($k0)
 	
 	li $t0, GREEN
	sw $t0, 40($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 48($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 52($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 56($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 60($k0)
 	nop
 	
 	li $t0, BLUE
 	sw $t0, 64($k0)
 	nop
 	
 	li $t0, BLUE
 	sw $t0, 68($k0)
 	nop
 	
 	li $t0, WHITE
 	sw $t0, 72($k0)
 	nop
 	
 	li $t0, WHITE
 	sw $t0, 76($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 80($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 84($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 88($k0)
 	nop
 	
 	li $t0, GREEN
	sw $t0, 92($k0)
 	
 	li $t0, BLUE
 	sw $t0, 96($k0)
 	
 	li $t0, ORANGE
	sw $t0, 100($k0)
	
	li $t0, WHITE
 	sw $t0, 104($k0)
 	
 	li $t0, WHITE
 	sw $t0, 108($k0)
 	
 	li $t0, GREEN
	sw $t0, 112($k0)
 	
 	li $t0, GREEN
	sw $t0, 116($k0)
 	
 	li $t0, GREEN
	sw $t0, 120($k0)
 	
 	li $t0, GREEN
	sw $t0, 124($k0)	
	
	li $t0, BLUE
 	sw $t0, 128($k0)
 	
 	li $t0, BLUE
 	sw $t0, 132($k0)
 	
 	li $t0, ORANGE				# Dark orange
	sw $t0, 136($k0)	
	
	li $t0, GREY
 	sw $t0, 140($k0)	
 	
 	li $t0, WHITE
 	sw $t0, 144($k0)
 	
 	li $t0, WHITE
 	sw $t0, 148($k0)
 	
 	li $t0, WHITE
 	sw $t0, 152($k0)	
 	
 	li $t0, BLUE
 	sw $t0, 156($k0)
 	
 	li $t0, D_GREEN
	sw $t0, 160($k0)
	
	li $t0, ORANGE				# Dark orange
	sw $t0, 164($k0)
	
	li $t0, D_GREEN
	sw $t0, 168($k0)
	
	li $t0, D_GREEN
	sw $t0, 172($k0)
	
	li $t0, GREY
	sw $t0, 176($k0)
	
	li $t0, GREY
	sw $t0, 180($k0)
	
	li $t0, D_GREEN
	sw $t0, 184($k0)
	
	li $t0, BLUE
	sw $t0, 188($k0)
	
	li $t0, BLUE
 	sw $t0, 192($k0)
 	
 	li $t0, D_GREEN
	sw $t0, 196($k0)
	
	li $t0, GREEN
	sw $t0, 200($k0)
	
	li $t0, D_GREEN
	sw $t0, 204($k0)
	
	li $t0, GREY
	sw $t0, 208($k0)
	
	li $t0, GREY
	sw $t0, 212($k0)
	
	li $t0, D_GREEN
	sw $t0, 216($k0)
	
	li $t0, D_GREEN
	sw $t0, 220($k0)
	
	li $t0, BLUE
 	sw $t0, 224($k0)
 	
 	li $t0, BLUE
 	sw $t0, 228($k0)
 	
 	li $t0, BROWN
 	sw $t0, 232($k0)
 	
 	li $t0, BROWN
 	sw $t0, 236($k0)
 	
 	li $t0, BLUE
 	sw $t0, 240($k0)
 	
 	li $t0, PURPLE
 	sw $t0, 244($k0)
 	
 	li $t0, PURPLE
 	sw $t0, 248($k0)
 	
 	li $t0, BLUE
 	sw $t0, 252($k0)