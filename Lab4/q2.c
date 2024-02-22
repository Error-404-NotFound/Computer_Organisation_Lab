#include<stdio.h>
#include<stdbool.h>
int main()
{
    int a[] = {1,2,34,3,4,5,7,23,12};
    int n = sizeof(a)/sizeof(int);
    bool flag=0;
    for(int i = 0;i<n-2;i++) {
        if(a[i]%2==1 && a[i+1]%2==1 && a[i+2]%2==1) {
            flag=1;
        } 
    }
    if(flag) {
        printf("Yes");
    }
    else {
        printf("No");
    }
    return 0;
}