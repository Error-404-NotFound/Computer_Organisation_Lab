#include <iostream>
using namespace std;

void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void bubbleSort(int array[], int size) {
    bool flag = true;
    for (int i = 0; i < size - 1 && flag; i++) {
        flag = false;
        for (int j = 0; j < size - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                swap(&array[j], &array[j + 1]);
                flag = true;
            }
        }
    }
}

int main() {
    int array[] = {3,-3,5,6,5,3,5,6,8,9,4,2,8,0,4,2,-1,4,-4,2};
    int size = sizeof(array) / sizeof(array[0]);

    cout << "Unsorted array: ";
    for (int i = 0; i < size; i++) {
        cout << array[i] << " ";
    }
    bubbleSort(array, size);
    cout << endl;
    cout << "Sorted array: ";
    for (int i = 0; i < size; i++) {
        cout << array[i] << " ";
    }
    cout << endl;

    return 0;
}