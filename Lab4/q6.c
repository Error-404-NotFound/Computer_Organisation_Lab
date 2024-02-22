#include<stdio.h>
#include<unistd.h>

void* malloc(size_t size) {
    void* mem = sbrk(size);
    return (mem == (void*) -1) ? NULL : mem;
}

void free(void* ptr) {
    /*for the memory to be freed, we can just move the program break back. But in this, we must assume that 
    the pointer passed to free is the same one that was returned by malloc.*/

    // if it is a null pointer, then do nothing and at last, move the program break back to release the allocated memory.
    if (!ptr) return;
    brk(ptr);
}

int main() {
    int* arr = (int*)malloc(5 * sizeof(int));
    if (!arr) return 1;
    printf("Allocated memory at: %p\n", arr);
    free(arr);
    // printf("Freed memory at: %p\n", arr); // This would cause a segfault
    return 0;
}
