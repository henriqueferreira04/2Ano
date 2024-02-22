#include <stdio.h>

int Function(int* array, int* comparations) {
    
    int count = 0;


    for (int i = 1; i < 9; i++) {
        if (array[i-1] + array[i+1] == array[i]) {
            count++;
        }
        (*comparations)++;
    }
    printf("Comparations = %d || ", *comparations);
    *comparations = 0;

    return count;
}

void PrintArray(int* array) {

    for (int i = 0; i < 10; i++) {
        if (i == 0) printf("[");
        printf(" %d ", array[i]);
        if (i == 9) printf("]\n");
    }
}

int main(void)
{
    int comparations = 0;

    int array1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int array2[] = {1, 2, 1, 4, 5, 6, 7, 8, 9, 10};
    int array3[] = {1, 2, 1, 3, 2, 6, 7, 8, 9, 10};
    int array4[] = {0, 2, 2, 0, 3, 3, 0, 4, 4, 0};
    int array5[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    
    PrintArray(array1);
    int res = Function(array1, &comparations);

    printf("Result: %d\n", res);

    PrintArray(array2);
    res = Function(array2, &comparations);

    printf("Result: %d\n", res);

    PrintArray(array3);
    res = Function(array3, &comparations);

    printf("Result: %d\n", res);

    PrintArray(array4);
    res = Function(array4, &comparations);

    printf("Result: %d\n", res);
    
    PrintArray(array5);
    res = Function(array5, &comparations);

    printf("Result: %d\n", res);

    return 0;
}
