.data
str: .string "   **   **\n ***** *****\n***********\n *********\n  *******\n   *****\n    ***\n     *\n"

.text
la a0, str
li a7,4
ecall
