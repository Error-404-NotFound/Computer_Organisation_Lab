.data
array: .word 23, 32, 45, 54, 67, 76, 89, 98
size: .word 8
half_size: .word 4
const: .word 1023
space: .string " "

.text
    .globl main

main:
    lw x25, const
    la x4, array
    li x7, 1
    lw x2, half_size
    lw x3, size
    mv x5, x4
    mv x9, x4
    j back_pointer

loop1:
    beq x2, x0, restart_pointer2
    lw x10, 0(x5)
    slli x10, x10, 10
    lw x11, 0(x9)
    or x10, x10, x11
    sw x10, 0(x5)
    addi x5, x5, -4
    addi x9, x9, -4
    addi x2, x2, -1
    j loop1

loop2:
    beq x3, x2, print_int
    lw x30, 0(x4)
    lw x31, 0(x12)
    and x30, x31, x25
    sw x30, 0(x4)
    addi x4, x4, 4
    lw x30, 0(x4)
    srli x30, x31, 10
    sw x30, 0(x4)
    addi x4, x4, 4
    addi x12, x12, 4
    addi x2, x2, 1
    j loop2

back_pointer:
    beq x7, x3, restart_pointer
    addi x5, x5, 4
    addi x7, x7, 1
    j back_pointer

restart_pointer:
    mv x12, x5
    li x7, 1
    j middle_pointer

restart_pointer2:
    li x7, 1
    mv x12, x17
    addi x12, x12, 4
    lw x2, n
    j loop2

middle_pointer:
    beq x7, x2, loop1
    addi x9, x9, 4
    addi x7, x7, 1
    mv x17, x9
    j middle_pointer

print_int:
    la x4, array
    li x5, 1
    lw x6, size
    j print

print:
    blt x6, x5, exit
    li a7, 1
    lw a0, 0(x4)
    ecall
    li a7, 4
    la a0, space
    ecall
    addi x4, x4, 4
    addi x5, x5, 1
    j print

exit:
    li a7, 10
    ecall