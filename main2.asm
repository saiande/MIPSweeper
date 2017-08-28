.data
.eqv QUIT 10
.text

.globl main

main:

jal smiley



# Exit main
    li $v0, QUIT
    syscall
    
    .include "hw3.asm"