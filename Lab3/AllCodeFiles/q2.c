#include <stdio.h>

int add(int a, int b)
{
    return a + b;
}

int sub(int a, int b)
{
    return a - b;
}

void main()
{
    int a = 10;
    int b = 20;
    int c = add(a, b);
    int d = sub(a, b);
    printf("Addition: %d\n", c);
    printf("Subtraction: %d\n", d);
}
