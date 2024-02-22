#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <assert.h>



double* readArray(size_t* size) {
    
    while (1) {
        printf("Size of the array: ");
        scanf("%zu", size);
        if (*size > 0) {
            break;
        }
        printf("Size must be > 0\n");
        
    }
    
    double *array = (double*) calloc(*size, sizeof(double));

    for (int i = 0; i <*size; i++) {
        printf("\nIntroduce number for the %d position: ", i+1);
        scanf("%lf", &array[i]);
    }
    return array;
}

void displayArray(double* a, size_t n) {
    assert(a != NULL);
    assert(n > 0);

    printf("\nArray = [ ");
    for (int i = 0; i < n; i++) {
        if (i == n - 1) {
            printf("%.2lf ]\n", a[i]);
        }else {
            printf("%.2lf, ", a[i]);
        }
    
    }
}

double* append(double* array_1, size_t size_1, double* array_2, size_t size_2) {
    int i = 0, j = 0;

    double* array = (double*) calloc(size_1 + size_2, sizeof(double));
    for (; i < size_1; i++) {
        array[i] = array_1[i];
    }

    for (; j < size_2; j++) {
        array[i+j] = array_2[j];
    }

    return array;
}

int main(void)
{   
    size_t size1 = 0, size2 = 0;
    double* array1 = readArray(&size1);
    displayArray(array1, size1);

    double* array2 = readArray(&size2);
    displayArray(array2, size2);

    double* array3 = append(array1, size1, array2, size2);
    displayArray(array3, size1 + size2);
    
    free(array1);
    free(array2);
    free(array3);
    
    return 0;
}
