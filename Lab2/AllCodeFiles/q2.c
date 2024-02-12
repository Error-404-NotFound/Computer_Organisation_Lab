#include<stdio.h>

union q2 {
    int a;
    char c[4];
};

int main()
{
    union q2 q;
    printf("Size of union: %ld\n",sizeof(q));
    q.a = 1;
    printf("%x %x %x %x\n",q.c[0],q.c[1],q.c[2],q.c[3]);
    int x = 0x12345678;
    char *b=(char *)&x;
    printf("%x %x %x %x\n",b[0],b[1],b[2],b[3]);
    if(q.c[0])
    {
        printf("Little endian\n");
    }
    else
    {
        printf("Big endian\n");
    }
    return 0;
}
