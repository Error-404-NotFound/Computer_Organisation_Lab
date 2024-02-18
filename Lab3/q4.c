#include<stdio.h>
#include<stdint.h>

int main() 
{
    uint32_t n = 0xff01abc;
    uint32_t m = 1234;
    int count=0;
    int count1=0;
    for (int i = 0; i < 32; i++) {
        if (n & 1) {
            count++;
        }
        n = n >> 1;
    }
    for (int i = 0; i < 32; i++) {
        if (m & 1) {
            count1++;
        }
        m = m >> 1;
    }
    printf("Number of 1's in the given number 1 is: %d\n", count);
    printf("Number of 0's in the given number 1 is: %d\n", 32-count);
    printf("Number of 1's in the given number 2 is: %d\n", count1);
    printf("Number of 0's in the given number 2 is: %d\n", 32-count1);
    return 0;
}