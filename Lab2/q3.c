#include<stdio.h>
#include<stdlib.h>

int changeEndian(int n) {
    return ((n & 0xff) << 24) | ((n & 0xff00) << 8) | ((n & 0xff0000) >> 8) | ((n & 0xff000000) >> 24);
}

int main() {
    int n = 0x12345678;
    int m = 0x87654321;
    printf("LE is 0x%x and it's BE is 0x%x\n",n,changeEndian(n));
    printf("BE is 0x%x and it's LE is 0x%x\n",m,changeEndian(m));
    return 0;
}