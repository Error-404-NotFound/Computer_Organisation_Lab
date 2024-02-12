#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<unistd.h>

void f(void)
{
    int *x = (int *)malloc(10*sizeof(int));
    sleep(20);
    x[10] = 0;
}
int main(void)
{
    f() ;
    return 0;
}