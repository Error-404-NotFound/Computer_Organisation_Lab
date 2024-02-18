.data
    input: .word 0xff01abc
    prompt1: .string "The number in:-"
    prompt2: .string "\nBinary is: "
    prompt3: .string "\nHex is: "
    prompt4: .string "\nDecimal is: "
    prompt5: .string "\nNumber of 1 is: "
    prompt6: .string "\nNumber of 0 is: "
    buffer: .zero 32
    
.text
    .globl main

main:
    lw a0 input
    jal x1 print
    
    li t0 0            #count number of 1s
    li tp 0            #count number of 0s
    li t1 32           #number of bits to check
    jal x2 loop

print:
    li a7 4
    la a0 prompt1
    ecall
    la a0 prompt2
    ecall
    li a7 35
    lw a0 input
    ecall
    li a7 4
    la a0 prompt3
    ecall
    li a7 34
    lw a0 input
    ecall
    li a7 4
    la a0 prompt4
    ecall
    li a7 36
    lw a0 input
    ecall
    jr x1


loop:
    beqz t1 exit     #exit loop when 32--==0
    andi t2 a0 1     #do and operation to check if current bit is 1
    beqz t2 skip     #skip if bit is 0
    addi t0 t0 1     #else increment counter

skip:
    srli a0 a0 1       #shift right by 1
    addi t1 t1 -1      #decrement iterator
    j loop             #jump to loop back

exit:
    li a0 32
    sub tp a0 t0
    li a7 4
    la a0 prompt5
    ecall
    
    li a7 1
    mv a0 t0
    ecall
    
    li a7 4
    la a0 prompt6
    ecall
    
    li a7 1
    mv a0 tp
    ecall
    #end the program
    li a7, 10
    ecall
