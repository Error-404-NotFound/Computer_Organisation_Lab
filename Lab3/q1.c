#include <stdio.h>

void main()
{
    int save[4] = {3, 3, 4, 3};
    int k = 3;
    int i = 0;

    while (save[i] == k)
    {
        i += 2;
    }
    printf("IIT Tirupati \n");
    printf("Value of i is: %d\n", i);
}
