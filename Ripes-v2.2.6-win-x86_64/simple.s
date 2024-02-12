#let take value of g,h,i,j as 10,5,2,3 respectively

addi x10, x0, 10    # g = 10 in x10
addi x11, x0, 5     # h = 5 in x11
add x10, x10, x11   # g = g+h in x10
addi x12, x0, 2     # i = 2 in x12
addi x13, x0, 3     # j = 3 in x13
add x12, x12, x13   # i = i+j in x12
sub x10, x10, x12   # g = g-i in x10