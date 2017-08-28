##############################################################
# Homework #3
# name: SAI_ANDE
# sbuid: 109832603
##############################################################
.text

    
.macro address_finder(%x, %y, %num, %result)
li %num, 10
mult %x, %num
mflo %result
add %result, %result, %y
li %num, 2
mult %result, %num
mflo %result
.end_macro

.macro row_col(%position, %num, %r, %c)
li %num, 10
div %position, %num
mflo %r
mfhi %c
.end_macro

##############################
# PART 1 FUNCTIONS
##############################

smiley:
	li $t0, 0		#counter
	li $t4, 2
	la $t1, 0xffff0000

    	smiley_loop:
    	beq $t0, 200, all_black_done
    	div $t0, $t4
    	mfhi $t3
    	beqz $t3, first_byte
    	j second_byte
    	
    	first_byte:
    	li $t2, '\0'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	addi $t0, $t0, 1
    	j smiley_loop
    	
    	second_byte:
    	li $t2, 0x0f
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	addi $t0, $t0, 1
    	j smiley_loop
    	
    	all_black_done:
    	li $t0, 2
    	li $t1, 3
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'b'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0xb7
    	sb $t2, ($t1)
    	
    	li $t0, 3
    	li $t1, 3
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'b'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0xb7
    	sb $t2, ($t1)
    	
    	li $t0, 2
    	li $t1, 6
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'b'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0xb7
    	sb $t2, ($t1)
    	
    	li $t0, 3
    	li $t1, 6
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'b'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0xb7
    	sb $t2, ($t1)
    	
    	li $t0, 6
    	li $t1, 2
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'e'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0x1f
    	sb $t2, ($t1)
    	
    	li $t0, 7
    	li $t1, 3
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'e'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0x1f
    	sb $t2, ($t1)
    	
    	li $t0, 8
    	li $t1, 4
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'e'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0x1f
    	sb $t2, ($t1)
    	
    	li $t0, 8
    	li $t1, 5
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'e'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0x1f
    	sb $t2, ($t1)
    	
    	li $t0, 7
    	li $t1, 6
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'e'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0x1f
    	sb $t2, ($t1)
    	
    	li $t0, 6
    	li $t1, 7
    	address_finder($t0, $t1, $t2, $t3)
    	li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	li $t2, 'e'
    	sb $t2, ($t1)
    	addi $t1, $t1, 1
    	li $t2, 0x1f
    	sb $t2, ($t1)
    	 
    	 jr $ra

##############################
# PART 2 FUNCTIONS
##############################

open_file:
    	
	li $a1, 0
	li $a2, 0
	li $v0,	13
	syscall
	
    jr $ra

close_file:

    	li $v0, 16
    	syscall
    	
    jr $ra

load_map:

addi $sp, $sp, -36
    sw $s0, ($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)
    sw $s4, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $a1, 28($sp)
    sw $ra, 32($sp)
    
    li $t0, 0
    move $s6, $a1
    
    load_map_init:
    bgt $t0, 99, load_map_next		#intializing cells array to all 0's
    sb $0, ($a1)
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_init
    
    load_map_next:
    move $a1, $s6
    li $s4, 0				#boolean
    li $s2, 0				#row
    li $s3, 0				#column
    li $t0, 0
    li $t7, 0
   
    load_map_loop_row:
    la $a1, string			#loading the address of string into $a1, which is the input buffer
    li $a2, 1
    li $v0, 14
    syscall				#reads the character
    
    beqz $v0, maybe_error		#if there are no more characters to be read, you're done
    
    lb $s1, ($a1)			#storing byte in $s1
    
    
    beq $s1, 48, number_row		#checking if number
    beq $s1, 49, number_row
    beq $s1, 50, number_row
    beq $s1, 51, number_row
    beq $s1, 52, number_row
    beq $s1, 53, number_row
    beq $s1, 54, number_row
    beq $s1, 55, number_row
    beq $s1, 56, number_row
    beq $s1, 57, number_row
    beq $s1, 32, space_row
    beq $s1, '\t', space_row		#checking if space
    beq $s1, '\r', non_number_row	#checking if non- number
    beq $s1, '\n', new_line_row		#checking if new line
    j load_map_error
    
    
    space_row:
    beqz $t7, load_map_loop_row		#after space go to column
    li $t5, 0
    j load_map_loop_column
    
    non_number_row:
    j load_map_loop_row
    
    new_line_row:
    beqz $t7, load_map_loop_row
    j load_map_loop_column
    
   
    number_row:				#converting to integer value
    beqz $t7 , adding
    adding:
    addi $t7, $t7, 1
    li $t0, 10 
    mult $s2, $t0
    mflo $s2
    addi $s1, $s1, -48
    add $s2, $s2, $s1
    bgt $s2, 9, load_map_error		#if integer greater than 9, go to error
    j load_map_loop_row
    
    maybe_error:
    bnez $t7, load_map_error
    j before
    
    maybe_error_second:
    beqz $t6, load_map_error
    j before
    
    load_map_loop_column:
    
    la $a1, string			#loading the address of string into $a1, which is the input buffer
    li $a2, 1
    li $v0, 14
    syscall				#reads the character
    
    beqz $v0, maybe_error_second		#if there are no more characters to be read, you're done
    
    lb $s1, ($a1)			#storing byte in $s1
    
    
    beq $s1, 48, number			#checking if number
    beq $s1, 49, number
    beq $s1, 50, number
    beq $s1, 51, number
    beq $s1, 52, number
    beq $s1, 53, number
    beq $s1, 54, number
    beq $s1, 55, number
    beq $s1, 56, number
    beq $s1, 57, number
    beq $s1, 32, space
    beq $s1, '\t', space		#checking if space
    beq $s1, '\r', non_number		#check if non- number
    beq $s1, '\n', new_line		#check if new line
    j load_map_error
    
    space:
    beqz $t6, load_map_loop_column
    addi $t5, $t5, 1				
    j load_map_bomb
    
    non_number:
    j load_map_loop_row
    
    new_line:
    beqz $t6, load_map_loop_column
    j load_map_bomb
    
   
    number:
    beqz $t6, adding_column
    adding_column:	
    addi $t6, $t6, 1
    li $t0, 10
    mult $s3, $t0
    mflo $s3
    addi $s1, $s1, -48
    add $s3, $s3, $s1
    bgt $s3, 9, load_map_error
    j load_map_loop_column
    
    load_map_bomb:			#loading last 4 bits into positions in cells array
    li $t2, 2
    li $t4, 32
    li $t7, 0
    li $t6, 0
    address_finder($s2, $s3, $t2, $t3)
    la $t0, ($s6)
    div $t3, $t2
    mflo $t3
    add $t0, $t0, $t3
    sb $t4, ($t0)
    li $s2, 0
    li $s3, 0
    li $s4, 0
    j load_map_loop_row
    
  before:
  li $t0, 0
  addi $a1, $a1, -100
    load_map_done:
    bgt $t0, 99, load_map_really_done		#checking cells arrary for bombs
    lb $s1, ($a1)
    j bomb
  
    
    bomb:
    li $t7, 0	
    li $t6, 0			#checking position of bomb 
    sub $t1, $a1, $s6
    beqz $t1, upper_left_corner_plus_one
    beq $t1, 9, upper_right_corner_neg_one
    beq $t1, 90, lower_left_corner_neg_ten
    beq $t1, 99, lower_right_corner_neg_eleven
    beq $t1, 1, top_border_neg_one
    beq $t1, 2, top_border_neg_one
    beq $t1, 3, top_border_neg_one
    beq $t1, 4, top_border_neg_one
    beq $t1, 5, top_border_neg_one
    beq $t1, 6, top_border_neg_one
    beq $t1, 7, top_border_neg_one
    beq $t1, 8, top_border_neg_one
    beq $t1, 10, left_border_neg_ten
    beq $t1, 20, left_border_neg_ten
    beq $t1, 30, left_border_neg_ten
    beq $t1, 40, left_border_neg_ten
    beq $t1, 50, left_border_neg_ten
    beq $t1, 60, left_border_neg_ten
    beq $t1, 70, left_border_neg_ten
    beq $t1, 80, left_border_neg_ten
    beq $t1, 19, right_border_neg_ten
    beq $t1, 29, right_border_neg_ten
    beq $t1, 39, right_border_neg_ten
    beq $t1, 49, right_border_neg_ten
    beq $t1, 59, right_border_neg_ten
    beq $t1, 69, right_border_neg_ten
    beq $t1, 79, right_border_neg_ten
    beq $t1, 89, right_border_neg_ten
    beq $t1, 91, bottom_border_neg_eleven
    beq $t1, 92, bottom_border_neg_eleven
    beq $t1, 93, bottom_border_neg_eleven
    beq $t1, 94, bottom_border_neg_eleven
    beq $t1, 95, bottom_border_neg_eleven
    beq $t1, 96, bottom_border_neg_eleven
    beq $t1, 97, bottom_border_neg_eleven
    beq $t1, 98, bottom_border_neg_eleven
 
    
    middle_neg_eleven:			#middle neg 11
    li $t5, 32
    addi $t2, $a1, -11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_neg_eleven
    
    middle_neg_ten:			#middle neg 10
    li $t5, 32
    addi $t2, $a1, -10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_neg_ten
     
    middle_neg_nine:			#middle neg 9
    li $t5, 32
    addi $t2, $a1, -9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_neg_nine
    
    middle_neg_one:			#middle neg 1
    li $t5, 32
    addi $t2, $a1, -1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_neg_one

    middle_plus_one:			#middle plus 1
    li $t5, 32
   addi $t2, $a1, 1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_plus_one
    
    middle_plus_nine:			#middl plus 9
    li $t5, 32
    addi $t2, $a1, 9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_plus_nine
  
    middle_plus_ten:			#middle plus 10
     li $t5, 32
    addi $t2, $a1, 10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_plus_ten
   
    middle_plus_eleven:			#middle plus 11
     li $t5, 32
    addi $t2, $a1, 11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bomb_plus_eleven
    j adding_bomb			#after done, goes to add bomb to bits in cells arrray
    
    bomb_neg_eleven:			#adding to bombs
    addi $t7, $t7, 1
    j middle_neg_ten
    
    bomb_neg_ten:
    addi $t7, $t7, 1
    j middle_neg_nine
    
    bomb_neg_nine:
    addi $t7, $t7, 1
    j middle_neg_one
    
     bomb_neg_one:
    addi $t7, $t7, 1
    j middle_plus_one
    
    bomb_plus_one:
    addi $t7, $t7, 1
    j middle_plus_nine
    
    bomb_plus_nine:
    addi $t7, $t7, 1
    j middle_plus_ten
    
    bomb_plus_ten:
    addi $t7, $t7, 1
    j middle_plus_eleven
    
    bomb_plus_eleven:
    addi $t7, $t7, 1
    j adding_bomb			#after done, goes to add bomb to bits in cells arrray
   
    
    upper_left_corner_plus_one:			#upper left corner
     li $t5, 32
    addi $t2, $a1, 1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, upper_left_corner_bomb_plus_one
 
    upper_left_corner_plus_ten:
    li $t5, 32
    addi $t2, $a1, 10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, upper_left_corner_bomb_plus_ten
 
    upper_left_corner_plus_eleven:
    li $t5, 32
    addi $t2, $a1, 11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, upper_left_corner_bomb_plus_eleven
    j adding_bomb
    
    upper_left_corner_bomb_plus_one:		#adding upper left corner bombs
    addi $t7, $t7, 1
    j upper_left_corner_plus_ten
    upper_left_corner_bomb_plus_ten:
    addi $t7, $t7, 1
    j upper_left_corner_plus_eleven
    upper_left_corner_bomb_plus_eleven:
    addi $t7, $t7, 1
    j adding_bomb
    
    upper_right_corner_neg_one:			#upper right corner
    li $t5, 32
    addi $t2, $a1, -1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, upper_right_corner_bomb_neg_one
 
    upper_right_corner_plus_nine:
    li $t5, 32
    addi $t2, $a1, 9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, upper_right_corner_bomb_plus_nine

    upper_right_corner_plus_ten:
    li $t5, 32
    addi $t2, $a1, 10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, upper_right_corner_bomb_plus_ten
 
    j adding_bomb
    
    upper_right_corner_bomb_neg_one:		#adding bombs to upper right corner
    addi $t7, $t7, 1
    j upper_right_corner_plus_nine
    upper_right_corner_bomb_plus_nine:
    addi $t7, $t7, 1
    j upper_right_corner_plus_ten
    upper_right_corner_bomb_plus_ten:
    addi $t7, $t7, 1
    j adding_bomb
    
    
    lower_left_corner_neg_ten:			#lower left corner
    li $t5, 32
    addi $t2, $a1, -10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, lower_left_corner_bomb_neg_ten

    lower_left_corner_neg_nine:
    li $t5, 32
    addi $t2, $a1, -9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, lower_left_corner_bomb_neg_nine
  
    lower_left_corner_plus_one:
    li $t5, 32
    addi $t2, $a1, 1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, lower_left_corner_bomb_plus_one
  
    j adding_bomb
    
    lower_left_corner_bomb_neg_ten:		#adding bombs to lower left corner
    addi $t7, $t7, 1
    j lower_left_corner_neg_nine
    lower_left_corner_bomb_neg_nine:
    addi $t7, $t7, 1
    j lower_left_corner_plus_one
    lower_left_corner_bomb_plus_one:
    addi $t7, $t7, 1
    j adding_bomb
    
    lower_right_corner_neg_eleven:		#lower right corner
    li $t5, 32
    addi $t2, $a1, -11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, lower_right_corner_bomb_neg_eleven
 
    lower_right_corner_neg_ten:
     li $t5, 32
    addi $t2, $a1, -10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, lower_right_corner_bomb_neg_ten

    lower_right_corner_neg_one:
     li $t5, 32
    addi $t2, $a1, -1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, lower_right_corner_bomb_neg_one
 
    j adding_bomb
    
    lower_right_corner_bomb_neg_eleven:			#adding bombs to lower right corner
    addi $t7, $t7, 1
    j lower_right_corner_neg_ten 
    lower_right_corner_bomb_neg_ten:
    addi $t7, $t7, 1
    j lower_right_corner_neg_one
    lower_right_corner_bomb_neg_one:
    addi $t7, $t7, 1
    j adding_bomb
    
    top_border_neg_one:
    li $t5, 32				#top border
    addi $t2, $a1, -1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, top_border_bomb_neg_one
    #bge $t3, 4, top_border_bomb_neg_one
    
    top_border_plus_one:
    li $t5, 32
    addi $t2, $a1, 1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, top_border_bomb_plus_one
    #bge $t3, 4, top_border_bomb_plus_one
   
    top_border_plus_nine:
    li $t5, 32
    addi $t2, $a1, 9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, top_border_bomb_plus_nine
    #bge $t3, 4, top_border_bomb_plus_nine
    top_border_plus_ten:
    li $t5, 32	
    addi $t2, $a1, 10
    lb $t3, 0($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, top_border_bomb_plus_ten
    #bge $t3, 4, top_border_bomb_plus_ten
    top_border_plus_eleven:
    li $t5, 32
    addi $t2, $a1, 11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, top_border_bomb_plus_eleven
    #bge $t3, 4, top_border_bomb_plus_eleven
    j adding_bomb
    
    top_border_bomb_neg_one:			#adding bombs to top border
    addi $t7, $t7, 1
    j top_border_plus_one
    top_border_bomb_plus_one:
    addi $t7, $t7, 1
    j top_border_plus_nine
    top_border_bomb_plus_nine:
    addi $t7, $t7, 1
    j top_border_plus_ten
    top_border_bomb_plus_ten:
    addi $t7, $t7, 1
    j top_border_plus_eleven
    top_border_bomb_plus_eleven:
    addi $t7, $t7, 1
    j adding_bomb
    
    left_border_neg_ten:			#left border
    li $t5, 32	
    addi $t2, $a1, -10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, left_border_bomb_neg_ten

    left_border_neg_nine:
    li $t5, 32
    addi $t2, $a1, -9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, left_border_bomb_neg_nine
   
    left_border_plus_one:
    li $t5, 32	
    addi $t2, $a1, 1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, left_border_bomb_plus_one
   
    left_border_plus_eleven:
    li $t5, 32	
    addi $t2, $a1, 11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, left_border_bomb_plus_eleven
   
    left_border_plus_ten:
    li $t5, 32
    addi $t2, $a1, 10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, left_border_bomb_plus_ten
   j adding_bomb
    
    left_border_bomb_neg_ten:				#adding bombs to left border
    addi $t7, $t7, 1
    j left_border_neg_nine
    left_border_bomb_neg_nine:
    addi $t7, $t7, 1
    j left_border_plus_one
    left_border_bomb_plus_one:
    addi $t7, $t7, 1
    j left_border_plus_eleven
    left_border_bomb_plus_eleven:
    addi $t7, $t7, 1
    j left_border_plus_ten
    left_border_bomb_plus_ten:
    addi $t7, $t7, 1
    j adding_bomb
    
    right_border_neg_ten:				#right border
    li $t5, 32	
    addi $t2, $a1, -10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, right_border_bomb_neg_ten
   
    right_border_neg_eleven:
    li $t5, 32	
    addi $t2, $a1, -11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, right_border_bomb_neg_eleven
     
    right_border_neg_one:
    li $t5, 32	
    addi $t2, $a1, -1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, right_border_bomb_neg_one
  
    right_border_plus_nine:
    li $t5, 32
    addi $t2, $a1, 9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, right_border_bomb_plus_nine

    right_border_plus_ten:
    li $t5, 32	
    addi $t2, $a1, 10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, right_border_bomb_plus_ten

    j adding_bomb
    
    right_border_bomb_neg_ten:			#adding bombs to right border
    addi $t7, $t7, 1
    j right_border_neg_eleven
    right_border_bomb_neg_eleven:
    addi $t7, $t7, 1
    j right_border_neg_one
    right_border_bomb_neg_one:
    addi $t7, $t7, 1
    j right_border_plus_nine
    right_border_bomb_plus_nine:
    addi $t7, $t7, 1
    j right_border_plus_ten
    right_border_bomb_plus_ten:
    addi $t7, $t7, 1
    j adding_bomb
    
    bottom_border_neg_eleven:			#bottom border
    li $t5, 32
    addi $t2, $a1, -11
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bottom_border_bomb_neg_eleven

    bottom_border_neg_ten:
    li $t5, 32	
    addi $t2, $a1, -10
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bottom_border_bomb_neg_ten

    bottom_border_neg_nine:
    li $t5, 32	
    addi $t2, $a1, -9
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bottom_border_bomb_neg_nine

    bottom_border_neg_one:
    li $t5, 32
    addi $t2, $a1, -1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bottom_border_bomb_neg_one
 
    bottom_border_plus_one:
    li $t5, 32	
    addi $t2, $a1, 1
    lb $t3, ($t2)
    andi $t3, $t3, 32
    beq $t3, $t5, bottom_border_bomb_plus_one

    j adding_bomb
    
    bottom_border_bomb_neg_eleven:			#adding bombs to bottom border
    addi $t7, $t7, 1
    j bottom_border_neg_ten
    bottom_border_bomb_neg_ten:
    addi $t7, $t7, 1
    j bottom_border_neg_nine
    bottom_border_bomb_neg_nine:
    addi $t7, $t7, 1
    j bottom_border_neg_one
    bottom_border_bomb_neg_one:
    addi $t7, $t7, 1
    j bottom_border_plus_one
    bottom_border_bomb_plus_one:
    addi $t7, $t7, 1
    j adding_bomb
    
    adding_bomb:
    beq $t7, 0, final_bit_adding_zero
    beq $t7, 1, final_bit_adding_one
    beq $t7, 2, final_bit_adding_two
    beq $t7, 3, final_bit_adding_three
    beq $t7, 4, final_bit_adding_four
    beq $t7, 5, final_bit_adding_five
    beq $t7, 6, final_bit_adding_six
    beq $t7, 7, final_bit_adding_seven
    beq $t7, 8, final_bit_adding_eight
    
    final_bit_adding_zero:
    lb $t4, ($a1)
    addi $t4, $t4, 0
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_one:
    lb $t4, ($a1)
    addi $t4, $t4, 1
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_two:
    lb $t4, ($a1)
    addi $t4, $t4, 2
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_three:
    lb $t4, ($a1)
    addi $t4, $t4, 3
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_four:
    lb $t4, ($a1)
    addi $t4, $t4, 4
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_five:
    lb $t4, ($a1)
    addi $t4, $t4, 5
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_six:
    lb $t4, ($a1)
    addi $t4, $t4, 6
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_seven:
    lb $t4, ($a1)
    addi $t4, $t4, 7
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    final_bit_adding_eight:
    lb $t4, ($a1)
    addi $t4, $t4, 8
    sb $t4, ($a1)
    li $t7, 0
    addi $a1, $a1, 1
    addi $t0, $t0, 1
    j load_map_done
    
    
 
    
    load_map_error:
   li $v0, -1
   lw $s0, ($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $s4, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a1, 28($sp)
    lw $ra, 32($sp)
    addi $sp, $sp, 36
    
    jr $ra
    
    load_map_really_done:
    li $v0, 0
    lw $s0, ($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $s4, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a1, 28($sp)
    lw $ra, 32($sp)
    addi $sp, $sp, 36
    
    jr $ra

##############################
# PART 3 FUNCTIONS
##############################

init_display:
li $t0, 0
li $t1, 0
li $t7, 0		#counter

init_display_loop:
    address_finder($t0, $t1, $t2, $t3)
    bgt $t7, 99, next
    beq $t1, 10, add_one
    li $t4, 0xffff0000
    add $t4, $t4, $t3
    li $t2, '\0'
    sb $t2, ($t4)
    addi $t4, $t4, 1
    li $t2, 0x77
    sb $t2, ($t4)
    addi $t1, $t1, 1
    addi $t7, $t7, 1 
    j init_display_loop
    add_one:
    addi $t0, $t0, 1
    li $t1, 0
    j init_display_loop
    
    next:
    lb $t0, cursor_row
    lb $t1, cursor_col
    address_finder($t0, $t1, $t2, $t3)
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	li $t2, 0xb7
    	sb $t2, ($t1)
    jr $ra

set_cell:
lb $t0, ($sp)
addi $sp, $sp, -48
    sw $s4, ($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)
    sw $s3, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $a0, 28($sp)
    sw $a1, 32($sp)
    sw $a2, 36($sp)
    sw $a3, 40($sp)
    sw $ra, 44($sp)
    
    #row, col, ch, FG, BG
    move $s0, $a0
    move $s1, $a1
    move $s2, $a2
    move $s3, $a3
    move $s5, $s4
    
    bgt $s0, 9, set_cell_error
    blt $s0, 0, set_cell_error
    bgt $s1, 9, set_cell_error
    blt $s1, 0, set_cell_error
    bgt $s3, 15, set_cell_error
    blt $s3, 0, set_cell_error
    bgt $s5, 15, set_cell_error
    blt $s5, 0 set_cell_error
    
    address_finder($s0, $s1, $t2, $t3)
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	sb $s2, ($t1)
    	addi $t1, $t1, 1
    	sll $s5, $s5, 4
    	add $s5, $s5, $s3
    	sb $s5, ($t1)
    	sb $s5, cell_color
    	
    

    set_cell_done:
    li $v0, 0
    lw $s4, ($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    lw $s3, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a0, 28($sp)
    lw $a1, 32($sp)
    lw $a2, 36($sp)
    lw $a3, 40($sp)
    lw $ra, 44($sp)
    addi $sp, $sp, 48
    
    jr $ra
    set_cell_error:
    li $v0, -1
    
    lw $s4, ($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    lw $s3, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a0, 28($sp)
    lw $a1, 32($sp)
    lw $a2, 36($sp)
    lw $a3, 40($sp)
    lw $ra, 44($sp)
    addi $sp, $sp, 48
    
    jr $ra

reveal_map:
    addi $sp, $sp, -48
    sw $s4, ($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)
    sw $s3, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $a0, 28($sp)
    sw $a1, 32($sp)
    sw $a2, 36($sp)
    sw $a3, 40($sp)
    sw $ra, 44($sp)
    
    la $s1, ($a1)
    li $s0, 0
    beq $a0, 1, won
    beq $a0, -1, lost
    beq $a0, 0, reveal_map_done
    			
    
    won:
    jal smiley
    j reveal_map_done
    
    lost:
    bgt $s0, 99, reveal_map_end
    lb $s2, ($s1)
    
    revealed:
    andi $s6, $s2, 64
    bne $s6, 64, reveal_map_loop
    addi $s1, $s1, 1
    addi $s0, $s0, 1
    j lost
    
    reveal_map_loop:
    andi $s5, $s2, 48
    beq $s5, 48, flag_and_bomb
    beq $s5, 16, flag_no_bomb
    beq $s5, 32, no_flag_bomb
    beq $s5, 0, no_bomb_no_flag
    
    flag_and_bomb:
    row_col($s0, $t1, $s3, $s4)
    move $a0, $s3
    move $a1, $s4
    li $a2, 'f'
    li $a3, 12
    li $s4, 10
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    
    
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    j lost
    
    flag_no_bomb:
    row_col($s0, $t1, $s3, $s4)
    move $a0, $s3
    move $a1, $s4
    li $a2, 'f'
    li $a3, 12
    li $s4, 9
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    
    
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    j lost
    
    no_flag_bomb:
    row_col($s0, $t1, $s3, $s4)
    move $a0, $s3
    move $a1, $s4
    li $a2, 'b'
    li $a3, 7
    li $s4, 0
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    
    
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    j lost
    
    no_bomb_no_flag:
    addi $s2, $s2, 48
    beq $s2, 48, zeroooo
    j nextttt
    zeroooo:
    row_col($s0, $t1, $s3, $s4)
    move $a0, $s3
    move $a1, $s4
    li $a2, '\0'
    li $a3, 15
    li $s4, 0
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    j lost
    nextttt:
    row_col($s0, $t1, $s3, $s4)
    move $a0, $s3
    move $a1, $s4
    move $a2, $s2
    li $a3, 13
    li $s4, 0
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    j lost
    
    reveal_map_end:
    lb $t6, cursor_row
    lb $t7, cursor_col
    move $a0, $t6
    move $a1, $t7
    li $a2, 'e'
    li $a3, 15
    li $s4, 9
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4

    
    reveal_map_done:
    lw $s4, ($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    lw $s3, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a0, 28($sp)
    lw $a1, 32($sp)
    lw $a2, 36($sp)
    lw $a3, 40($sp)
    lw $ra, 44($sp)
    addi $sp, $sp, 48
   
    jr $ra


##############################
# PART 4 FUNCTIONS
##############################

perform_action:

addi $sp, $sp, -48
    
    sw $s0, ($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)
    sw $s4, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $a0, 28($sp)
    sw $a1, 32($sp)
    sw $a2, 36($sp)
    sw $a3, 40($sp)
    sw $ra, 44($sp)
    
    
    
    lb $s0, cursor_row
    lb $s1, cursor_col
    
    	
    address_finder($s0, $s1, $t0, $t3)
    li $t7, 2	
    div $t3, $t7
    mflo $s4    			#$s4 has cells array position	
   
    	
    move $s3, $a0
    
    add $s3, $s3, $s4			#$s3 has address for cell_array position
    
    beq $a1, 'f', flag			#checking for what character was entered by user
    beq $a1, 'F', flag
    beq $a1, 'r', reveal
    beq $a1, 'R', reveal
    beq $a1, 'w', up
    beq $a1, 'W', up
    beq $a1, 'a', left
    beq $a1, 'A', left
    beq $a1, 's', down
    beq $a1, 'S', down
    beq $a1, 'd', right
    beq $a1, 'D', right
    
    j perform_action_error
    
    flag:
    lb $s5, ($s3)
    andi $s6, $s5, 64
    beq $s6, 64, perform_action_error
    xori $s5, $s5, 16
    sb $s5, ($s3)
    andi $s6, $s5, 16
    
    beq $s6, 16, insert_flag
    j insert_null
    insert_flag:
    
    move $a2, $a1
    move $a0, $s0
    move $a1, $s1
    li $a3, 12
    li $s4, 11
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    li $t6, 2
    #row, col, char, f, g
    j perform_action_done
    insert_null:
    move $a0, $s0
    move $a1, $s1
    li $a2, '\0'
    li $a3, 7
    li $s4, 7
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    li $t6, 3
    j perform_action_done
    
    reveal:
    lb $s5, ($s3)
    andi $s6, $s5, 64
    beq $s6, 64, perform_action_error
    andi $s6, $s5, 16
    beq $s6, 16, reveal_flag
    andi $s6, $s5, 32
    beq $s6, 32, reveal_bomb
    j reveal_other
    
    
    reveal_flag:
    xori $s6, $s5, 80
    sb $s6, ($s3)
    andi $s2, $s6, 32
    beq $s2, 32, reveal_bomb
   j reveal_other
   
    
    reveal_bomb:
    xori $s6, $s5, 64
    sb $s6, ($s3)
    li $a2, 'b'
    move $a0, $s0
    move $a1, $s1
    li $a3, 7
    li $s4, 0
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    j perform_action_done
    
    reveal_other:
  
    andi $s2, $s5, 15
   
    beqz $s2, call_search_cells
    j guh
    call_search_cells:
     move $a1, $s0
    move $a2, $s1
    jal search_cells
  move $a2, $s2
    move $a0, $s0
    move $a1, $s1
    li $a3, 15
    li $s4, 11
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    li $t6, 1
    j perform_action_done
    
    guh:
    andi $s5, $s6, 64
    beq $s5, 64, already_revealed
    xori $s5, $s6, 64
    already_revealed:
    sb $s5, ($s3)
    addi $s2, $s2, 48
    move $a2, $s2
    move $a0, $s0
    move $a1, $s1
    li $a3, 13
    li $s4, 11
    addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    li $t6, 1
    j perform_action_done
    
    
    up:
    address_finder($s0, $s1, $t0, $t3)		#finding error
    li $t7, 2	
    div $t3, $t7
    mflo $s4  
    blt $s4, 10, perform_action_error
    
    address_finder($s0, $s1, $t2, $t3)		#setting previous cell to cell_color
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, cell_color
    	sb $t2, ($t1)
    	lb $t3, ($s3)
    	andi $t4, $t3, 16
    	beq $t4, 16, flag_color
    	andi $t4, $t3, 64
    	bge $t4, 64, number_color
    	j go
    	flag_color:
    	andi $t2, $t2 0x0f
    	li $t3, 7
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1)
    	j go
    	
    	
    	number_color:
    	andi $t2, $t2 0x0f
    	li $t3, 0
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1) 
    	go:
    	
    addi $s0, $s0, -1
    sw $s0, cursor_row
    addi $s3, $s3, -10
    address_finder($s0, $s1, $t2, $t3)		#saving future color to cell_color and setting it to yellow
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
        lb $t2, ($t1)
        sb $t2, cell_color
      
    	andi $t2, $t2, 0x0f
    	li $t3, 11
    	sll $t3, $t3, 4
    	add  $t3, $t3, $t2
    	sb $t3, ($t1)
    j perform_action_done
    
    left:
    address_finder($s0, $s1, $t0, $t3)
    li $t7, 2	
    div $t3, $t7
    mflo $s4  
    beqz $s4, perform_action_error
    li $t7, 10
    div $s4, $t7
    mfhi $s4
    beqz $s4, perform_action_error
    address_finder($s0, $s1, $t2, $t3)		#setting previous cell to cell_color
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, cell_color
    	sb $t2, ($t1)
    	lb $t3, ($s3)
    	andi $t4, $t3, 16
    	beq $t4, 16, flag_color_l
    
    	andi $t4, $t3, 64
    	bge $t4, 64, number_color_l
    	j go_l
    	flag_color_l:
    	andi $t2, $t2 0x0f
    	li $t3, 7
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1)
    	j go_l
    	
    	
    	number_color_l:
    	andi $t2, $t2 0x0f
    	li $t3, 0
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1) 
    	go_l:
    	
    	
    addi $s1, $s1, -1
    sw $s1, cursor_col
    addi $s3, $s3, -1
    address_finder($s0, $s1, $t2, $t3)
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, ($t1)
        sb $t2, cell_color
       
    	lb $t2, cell_color
    	
    	andi $t2, $t2, 0x0f
    	li $t3, 11
    	sll $t3, $t3, 4
    	add  $t3, $t3, $t2
    	sb $t3, ($t1)
    j perform_action_done
    
    down:
    address_finder($s0, $s1, $t0, $t3)
    li $t7, 2	
    div $t3, $t7
    mflo $s4  
    bgt $s4, 89, perform_action_error
    address_finder($s0, $s1, $t2, $t3)		#setting previous cell to cell_color
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, cell_color
    	sb $t2, ($t1)
    	lb $t3, ($s3)
    	andi $t4, $t3, 16
    	beq $t4, 16, flag_color_d
   
    	andi $t4, $t3, 64
    	bge $t4, 64, number_color_d
    	j go_d
    	flag_color_d:
    	andi $t2, $t2 0x0f
    	li $t3, 7
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1)
    	j go_d
    	
    	
    	number_color_d:
    	andi $t2, $t2 0x0f
    	li $t3, 0
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1) 
    	go_d:
    	
    	
    addi $s0, $s0, 1
    sw $s0 ,cursor_row
    addi $s3, $s3, 10
    address_finder($s0, $s1, $t2, $t3)
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, ($t1)
        sb $t2, cell_color
        
    	
    	
    	lb $t2, cell_color
    	
    	andi $t2, $t2, 0x0f
    	li $t3, 11
    	sll $t3, $t3, 4
    	add  $t3, $t3, $t2
    	sb $t3, ($t1)
    j perform_action_done
    
    right:
    address_finder($s0, $s1, $t0, $t3)
    li $t7, 2	
    div $t3, $t7
    mflo $s4  
    li $t7, 10
    div $s4, $t7
    mfhi $s4
    beq $s4, 9, perform_action_error
   
     address_finder($s0, $s1, $t2, $t3)		#setting previous cell to cell_color
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, cell_color
    	sb $t2, ($t1)
    	lb $t3, ($s3)
    	andi $t4, $t3, 16
    	beq $t4, 16, flag_color_r
   
    	andi $t4, $t3, 64
    	bge $t4, 64, number_color_r
    	j go_r
    	flag_color_r:
    	andi $t2, $t2 0x0f
    	li $t3, 7
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1)
    	j go_r
    	
    	
    	number_color_r:
    	andi $t2, $t2 0x0f
    	li $t3, 0
    	sll $t3, $t3, 4
    	add $t3, $t3, $t2
    	sb $t3, ($t1) 
    	go_r:
    	
    	
    addi $s1, $s1, 1
    sw $s1, cursor_col
    addi $s3, $s3, 1
   address_finder($s0, $s1, $t2, $t3)
    li $t1, 0xffff0000
    	add $t1, $t1, $t3
    	addi $t1, $t1, 1
    	lb $t2, ($t1)
        sb $t2, cell_color
        
    	lb $t2, cell_color
    	
    	andi $t2, $t2, 0x0f
    	li $t3, 11
    	sll $t3, $t3, 4
    	add  $t3, $t3, $t2
    	sb $t3, ($t1)
    
    perform_action_done:
 
    li $v0, 0
    
    lw $s0, ($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $s4, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a0, 28($sp)
    lw $a1, 32($sp)
    lw $a2, 36($sp)
    lw $a3, 40($sp)
    lw $ra, 44($sp)
    addi $sp, $sp, 48
   
    jr $ra
    
    perform_action_error:
    li $v0, -1
    lw $s0, ($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $s4, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a0, 28($sp)
    lw $a1, 32($sp)
    lw $a2, 36($sp)
    lw $a3, 40($sp)
    lw $ra, 44($sp)
    addi $sp, $sp, 48
 
    jr $ra


 game_status:
move $s0, $a0
li $t0, 0		#counter
li $t2, 0		#counter for bombs
li $t3, 0		#counter for flags on bombs
li $t4, 0		#counter for flags overall
game_status_loop:
bgt $t0, 99, maybe_won_ugh
lb $s1, ($s0)
andi $s2, $s1, 96
beq $s2, 96, lost_boo
addi $t0, $t0, 1
addi $s0, $s0, 1
j game_status_loop

maybe_won_ugh:
move $s0, $a0
maybe_won:
bgt $t3, 99, won_yay
lb $s1, ($s0)
andi $s2, $s1, 48
beq $s2, 48, flag_on_bomb
beq $s2, 16, incomplete
beq $s2, 32, incomplete
addi $s0, $s0, 1
addi $t3, $t3, 1
j maybe_won

flag_on_bomb:
addi $s0, $s0, 1
addi $t3, $t3, 1
j maybe_won


incomplete:
li $v0, 0
jr $ra
won_yay:
li $v0, 1
jr $ra
lost_boo: 
li $v0, -1
jr $ra
##############################
# PART 5 FUNCTIONS
##############################

search_cells:

addi $sp, $sp, -40		
    
    
    sw $s0, ($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)
    sw $s4, 16($sp)
    sw $s5, 20($sp)
    sw $s6, 24($sp)
    sw $a0, 28($sp)
    sw $a3, 32($sp)
    sw $ra, 36($sp)

move $fp, $sp			#fp = sp
				
addi $sp, $sp, -8
    sw $a2, ($sp)		#sp.push(col)
    sw $a1, 4($sp)		#sp.push(row)
   
   move $s0, $a0
   while:
   beq $sp, $fp, search_cells_done	#while(sp != fp)
   lw $a2, ($sp)		#sp.pop
   addi $sp, $sp, 4
   move $s2, $a2		#int col = s.pop
   move $s5, $a2
   lw $a1, ($sp)		#sp.pop
   addi $sp, $sp, 4
   move $s1, $a1		#int row = s.pop
   move $s3, $a1
   address_finder($s1, $s2, $t5, $t4)
   srl $t4, $t4, 1
   add $t0, $a0, $t4
   lb $t7, ($t0)
   andi $t4, $t7, 16		#checking isFlag
   beqz $t4, is_not_flag
   go_one:
   andi $t4, $t7, 15		#checking if number==0
   beqz $t4, zero
   j while
   
   is_not_flag:
   xori $t7, $t7, 64		#isFlag==true, then reveal
   sb $t7, ($t0) 
   andi $t7, $t7, 15
   addi $t7, $t7, 48
   beq $t7, 48, zero_blank
   move $a0, $s1
   move $a1, $s2
   move $a2, $t7
   li $a3, 13
   li $s4, 0
   addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
    j nextt
    zero_blank:
    move $a0, $s1
   move $a1, $s2
   li $a2, '\0'
   li $a3, 15
   li $s4, 0
   addi $sp, $sp, -4
    sw $s4, ($sp)
    jal set_cell
    addi $sp, $sp, 4
   nextt:
    move $a0, $s0
   j go_one
   
   zero:
   addi $s1, $s3, 1
   blt $s1, 10, less_than_ten
   j get_number_one
   
   less_than_ten:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden
   j get_number_one
   
   is_hidden:
   andi $t3, $t2, 16
   beqz $t3, get_number_true
   j get_number_one
   
   get_number_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   
   get_number_one:
   move $s1, $s3
   addi $s2, $s5, 1
   blt $s2, 10, less_than_ten_one
   j get_number_two
   
   less_than_ten_one:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_one
   j get_number_two
   
   is_hidden_one:
   andi $t3, $t2, 16
   beqz $t3, get_number_one_true
   j get_number_two
   
    get_number_one_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   
   get_number_two:
   move $s2, $s5
   addi $s1, $s3, -1
   bgez $s1, greater_than_zero_two
   j get_number_three
   
   greater_than_zero_two:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_two
   j get_number_three
   
   is_hidden_two:
   andi $t3, $t2, 16
   beqz $t3, get_number_two_true
   j get_number_three
   
   get_number_two_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   
   get_number_three:
   move $s1, $s3
   addi $s2, $s5, -1
   bgez $s2, greater_than_zero_three
   j get_number_four
   
   greater_than_zero_three:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_three
   j get_number_four
   
   is_hidden_three:
   andi $t3, $t2, 16
   beqz $t3, get_number_three_true
   j get_number_four
   
   get_number_three_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   
   get_number_four:
   addi $s1, $s3, -1
   addi $s2, $s5, -1
   bgez $s1, greater_than_zero_four
   j get_number_five
   greater_than_zero_four:
   bgez $s2, greater_than_zeroo_four
   j get_number_five
   
   greater_than_zeroo_four:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_four
   j get_number_five
   
   is_hidden_four:
   andi $t3, $t2, 16
   beqz $t3, get_number_four_true
   j get_number_five
   
   get_number_four_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   
   get_number_five:
   addi $s1, $s3, -1
   addi $s2, $s5, 1
   bgez $s1, greater_than_zero_five
   j get_number_six
   
   greater_than_zero_five:
   blt $s2, 10, greater_than_zeroo_five
   j get_number_six
   
   greater_than_zeroo_five:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_five
   j get_number_six
   
   is_hidden_five:
   andi $t3, $t2, 16
   beqz $t3, get_number_five_true
   j get_number_six
   
   get_number_five_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   
   get_number_six:
   addi $s1, $s3, 1
   addi $s2, $s5, -1
   
   
   blt $s1, 10, greater_than_zero_six
   j get_number_seven
   
   greater_than_zero_six:
   bgez $s2, greater_than_zeroo_six
   j get_number_seven
   
   greater_than_zeroo_six:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_six
   j get_number_seven
   
   is_hidden_six:
   andi $t3, $t2, 16
   beqz $t3, get_number_six_true
   j get_number_seven
   
   get_number_six_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   j get_number_seven
   
   get_number_seven:
   addi $s1, $s3, 1
   addi $s2, $s5, 1
   
   
   blt $s1, 10, greater_than_zero_seven
   j while
   
   greater_than_zero_seven:
   blt $s2, 10, greater_than_zeroo_seven
   j while
   
   greater_than_zeroo_seven:
   address_finder($s1, $s2, $t2, $t3)
   srl $t3, $t3, 1
   add $t0, $a0, $t3
   lb $t2, ($t0)
   andi $t3, $t2, 64
   bne $t3, 64, is_hidden_seven
   j while
   
   is_hidden_seven:
   andi $t3, $t2, 16
   beqz $t3, get_number_seven_true
   j while
   
   get_number_seven_true:
   addi $sp, $sp, -8
   sw $s2, ($sp)		
   sw $s1, 4($sp)
   j while
   
   search_cells_done:
   
   #lw $a2, ($sp)
    #lw $a1, 4($sp)
    lw $s0, ($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    lw $s4, 16($sp)
    lw $s5, 20($sp)
    lw $s6, 24($sp)
    lw $a0, 28($sp)
    lw $a3, 32($sp)
    lw $ra, 36($sp)
    addi $sp, $sp, 40
    
    jr $ra

print:
	move $s0, $a0
	li $t0, 0
	print_for:
		bge $t0, 100, print_end
		lbu $a0, 0($s0)
		li $v0, 1
		syscall
		la $a0, new_line_print
		li $v0, 4
		syscall
		addi $s0, $s0, 1
		addi $t0, $t0, 1
		j print_for
	print_end:
		li $v0, 10
		syscall

#################################################################
# Student defined data section
#################################################################
.data

.align 2  # Align next items to word boundary
string: .space 1
.byte 0
cursor_row: .word 0
cursor_col: .word 0
cell_color: .byte 0x77

flag_cell_color: .space 1
number_cell_color: .space 1
#place any additional data declarations here

new_line_print: .asciiz "\n"
