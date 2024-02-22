#include <stdio.h>

size_t num_ops;

int isGeometric(double *array, size_t size){
    double r;
    double r1;

    for(int i = 0; i < size - 1; i++) {

        if (i == 0) {
            r = array[i+1] / array[i];
        }else {
            r1 = array[i+1] / array[i];

        }
        if (r1 != r) return 0;

    }
    return 1;
}

int Function(double *array, size_t size) {
    
    double r;
  
    for(int i = 0; i < size - 1; i++) {
        
        if (i == 0) {
            r = array[i+1] / array[i];
            num_ops++;

        }
        
        if (array[i+1] != array[i] * r)   return 0;

        num_ops++;
        
    }
    return 1;
}

void PrintArray(double* array) {

    for (int i = 0; i < 10; i++) {
        if (i == 0) printf("[");
        printf(" %.1f ", array[i]);
        if (i == 9) printf("]\n\n");
    }
}

int main(void)
{
    double array1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    double array2[] = {1, 2, 4, 4, 5, 6, 7, 8, 9, 10};
    double array3[] = {1, 2, 4, 8, 5, 6, 7, 8, 9, 10};
    double array4[] = {1, 2, 4, 8, 16, 6, 7, 8, 9, 10};
    double array5[] = {1, 2, 4, 8, 16, 32, 7, 8, 9,10};
    double array6[] = {1, 2, 4, 8, 16, 32, 64, 8, 9, 10};
    double array7[] = {1, 2, 4, 8, 16, 32, 64, 128, 9, 10};
    double array8[] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 10};
    double array9[] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512};

    int res;

    PrintArray(array1);
    res = Function(array1, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;

    PrintArray(array2);
    res = Function(array2, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;

    PrintArray(array3);
    res = Function(array3, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;


    PrintArray(array4);
    res = Function(array4, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;


    PrintArray(array5);
    res = Function(array5, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;

    PrintArray(array6);
    res = Function(array6, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;

    PrintArray(array7);
    res = Function(array7, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;
    

    PrintArray(array8);
    res = Function(array8, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;


    PrintArray(array9);
    res = Function(array9, 10);
    printf("Result: %d || Operations: %zu\n\n", res, num_ops);
    num_ops = 0;
    return 0;
}
