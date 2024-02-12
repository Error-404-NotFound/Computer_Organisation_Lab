#include<stdio.h>
#include<stdint.h>
static inline uint32_t convert(uint32_t x)
{
    return (x>>24) | ((x>>8)&0xff00) | ((x<<8)&0xff0000) | (x<<24);
}

static inline uint32_t to_bigendian(uint32_t x)
{
    union 
    {
        int i;
        char c;
    } u = {1};
    return u.c ? x : convert(x);
}

static inline uint32_t to_littleendian(uint32_t x)
{
    union 
    {
        int i;
        char c;
    } u = {1};
    return u.c ? convert(x) : x;
}

int main()
{
    uint32_t x = 0x12345678;
    printf("0x%08x\n", convert(x));
    printf("0x%08x\n", to_bigendian(x));
    printf("0x%08x\n", to_littleendian(x));
    return 0;
}