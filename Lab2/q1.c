#include<stdio.h>

int main()
{
  unsigned int a=1;
  char *c=(char*)&a;
  printf("%x %x %x %x\n",c[0],c[1],c[2],c[3]);
  int x = 0x12345678;
  char *b=(char *)&x;
  printf("%x %x %x %x\n",b[0],b[1],b[2],b[3]);
  if(*c)
  {
    printf("Little-endian\n");
  }
  else
  {
    printf("Big-endian\n");
  }
  return 0;
}
