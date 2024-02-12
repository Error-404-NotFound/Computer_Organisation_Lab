#include<stdio.h>

static inline uint32_t convert(uint32_t x)
{
    return (x>>24) | ((x>>8)&0xff00) | ((x<<8)&0xff0000) | (x<<24);
}

int main()
{
    uint32_t x = 0x12345678;
    printf("0x%08x\n", convert(x));
    return 0;
}