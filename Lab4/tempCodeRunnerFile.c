#include<stdio.h>
#include<unistd.h>

void* malloc(size_t size) {
    void* mem = sbrk(size);
    return (mem == (void*) -1) ? NULL : mem;
}

void free(void* ptr) {
    // Assuming the allocator only uses sbrk for allocation
    // and doesn't split or merge blocks.
    // This implementation doesn't handle that case, which is more complex.

    // To free memory, you could just move the program break back.
    // However, this implementation assumes the pointer passed to free
    // is the same one returned by malloc.

    // Do nothing if ptr is nullptr.
    if (!ptr) return;

    // Move the program break back to release the allocated memory.
    brk(ptr);
}

int main() {
    int* arr = (int*)malloc(5 * sizeof(int));
    if (!arr) return 1;
    printf("Allocated memory at: %p\n", arr);
    free(arr);
    try {
        printf("Accessing memory at: %p\n", arr);
    } catch (e) {
        printf("Accessing freed memory\n");
    }
    return 0;
}
