.data
    array: .word 3,-3,5,6,5,3,5,6,8,9,4,2,8,0,4,2,-1,4,-4,2
    array_size: .word 20
    base: .word 0x10000000
    newline: .string "\n"
    delimiter: .string ", "
    prompt1: .string "Unsorted array is: "
    prompt2: .string "Sorted array is: "
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
    
    #sort array using bubble sort
    la a0 array
    lw a1 array_size
    jal bubbleSort

    #print sorted array
    la a0 prompt2
    li a7 4
    ecall
    la a0 array
    lw a1 array_size
    jal printArray

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


bubbleSort:
    mv t0 a0
    mv t1 a1
    addi t1 t1 -1
    li t2 1

    outer_loop:
        li t2 0
        li t3 0
        mv t0 a0
        inner_loop:
            beq t3 t1 end_inner_loop
            lw t4 0(t0)
            lw t5 4(t0)
            ble t4 t5 no_swap
            sw t5 0(t0)
            sw t4 4(t0)
            lw t4 0(t0)        #tocheck for debugging
            lw t5 4(t0)        #tocheck for debugging 
            li t2 1
            no_swap:
                addi t0 t0 4
                addi t3 t3 1
                j inner_loop
        end_inner_loop:
        addi t1 t1 -1 #decrease the number of iterations each time
        bnez t2 outer_loop
        ret
        
printNewline:
    la a0, newline
    li a7, 4
    ecall
    jr x1
