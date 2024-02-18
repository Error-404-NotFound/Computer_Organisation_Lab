.data
    prompt1: .string "Addition: "
    prompt2: .string "\nSubtraction: "
    buffer:  .zero 255

.text
    .globl main

main:
    addi x1 zero 10
    addi x2 zero 20
    jal x3 addition
    jal x4 subtraction
    call print
    
    #exit program
    li a7 10
    ecall
    
addition:
    add x5 x1 x2
    jr x3
    
subtraction:
    sub x6 x1 x2
    jr x4

print:
    li a7 4
    la a0 prompt1
    ecall
    li a7 1
    mv a0 t0
    ecall
    li a7 4
    la a0 prompt2
    ecall
    li a7 1
    mv a0 t1
    ecall
    ret
