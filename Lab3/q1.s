.data
    array: .word 0x0003 0x0003 0x0004 0x0003
    base: .word 0x10000000
    str1: .string "IIT Tirupati \n"
    str2: .string "Value of i is: "


.text
    .globl main
        
main:
    addi x3 x0 3     #x3 is k
    addi x4 x0 0     #x4 is i
    lw x11 base      #array first element

loop:
    lw x12 0(x11)
    bne x12 x3 exit
    addi x4 x0 2
    addi x11 x0 8
    j loop

exit:
    li a7 4
    la a0 str1
    ecall
    la a0 str2
    ecall
    li a7 1
    add a0 x0 x4
    ecall