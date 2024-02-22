#include <stdio.h>

size_t num_ops;

int Function(int* array1, int* array2, int* array3, size_t size) {
    int count = 0;
    for (int k = 2; k < size; k++) {

        for (int j = 0; j < k; j++) {

            for (int i = 0; i < j; i++) {

                if (array1[k] == array2[i] + array3[j]) count++;
                num_ops++;

            }
        }
    }

    return count;
}

void PrintArray(int* array) {

    for (int i = 0; i < 10; i++) {
        if (i == 0) printf("[");
        printf(" %d ", array[i]);
        if (i == 9) printf("]\n\n");
    }
}

int main(void)
{
    int array1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int array2[] = {1, 2, 4, 4, 5, 6, 7, 8, 9, 10};
    int array3[] = {1, 2, 4, 8, 5, 6, 7, 8, 9, 10};
    int array4[] = {1, 2, 4, 8, 16, 6, 7, 8, 9, 10};
    int array5[] = {1, 2, 4, 8, 16, 32, 7, 8, 9,10};
    int array6[] = {1, 2, 4, 8, 16, 32, 64, 8, 9, 10};
    int array7[] = {1, 2, 4, 8, 16, 32, 64, 128, 9, 10};
    int array8[] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 10};
    int array9[] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512};

    size_t size = 10;
    int res = 0;
    PrintArray(array1);
    PrintArray(array2);
    PrintArray(array3);

    
    res = Function(array1, array2, array3, size);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;

    printf("----------------------------------------------------\n");
    PrintArray(array4);
    PrintArray(array5);
    PrintArray(array6);

    
    res = Function(array4, array5, array6, size);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;


    printf("----------------------------------------------------\n");
    PrintArray(array7);
    PrintArray(array8);
    PrintArray(array9);

    
    res = Function(array7, array8, array9, size);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;
    return 0;
}
