.data
    array: .word 1,2,3,4,5,6,7,8,9,10,11
    array_size: .word 11
    base: .word 0x10000000
    newline: .string "\n"
    delimiter: .string ", "
    buffer: .zero 255
    
.text
    .globl main
    
main:
    li s0 3
    la a0 array
    lw a1 array_size
    mv t0 a0
    mv t1 a1
    jal newloop
    
    
newloop:
    lw a0 0(t0)
    add a0 a0 s0
    
    beqz t0 endloop
    endloop:
        ret
        
printArray:
    mv t0 a0
    mv t1 a1
    loop:
        li a7 1
        lw a0 0(t0)   
        ecall
        li a7 4
        la a0 delimiter
        ecall
        addi t0 t0 4
        addi t1 t1 -1
        bnez t1 loop
        ret

printNewline:
    la a0, newline
    li a7, 4
    ecall
    jr x1