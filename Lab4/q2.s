.data
    array: .word 2,6,4,1,2
    array_size: .word 5
    base: .word 0x10000000
    newline: .string "\n"
    delimiter: .string ", "
    prompt1: .string "The array is: "
    prompt2: .string "Yes it has three consecutive odds."
    prompt3: .string "No it does not have 3 consecutive odds."
    buffer: .zero 255

.text
    .globl main
        
main:
    li a7 4
    la a0 prompt1
    ecall
    la a0 array
    lw a1 array_size
    jal printArray
    
    jal printNewline
    
    #find consecutive odd numbers
    la a0 array
    lw a1 array_size
    jal consecutive

    #print answer
    beq tp gp ans_yes
    li a7 4
    la a0 prompt3
    ecall

    #end the program
    li a7 10
    ecall

ans_yes:
    li a7 4
    la a0 prompt2
    ecall
    
    #end the program
    li a7 10
    ecall

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


consecutive:
    li tp 0
    mv t0 a0
    mv t1 a1
    addi t1 t1 -2
    li t3 0
    li gp 1
    o_loop:
        beq t3 t1 end_loop
        lw t4 0(t0)
        lw t5 4(t0)
        lw t6 8(t0)
        andi t4 t4 1
        beqz t4 iter
        andi t5 t5 1
        beqz t5 iter
        andi t6 t6 1
        beqz t6 iter
        addi tp tp 1
    
    iter:
        addi t0 t0 4
        addi t3 t3 1
        j o_loop
        
    end_loop:
        ret
        
printNewline:
    la a0, newline
    li a7, 4
    ecall
    jr x1
