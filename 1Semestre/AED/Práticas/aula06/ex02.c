#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "elapsed_time.h"

size_t n_Calls;
size_t n_Adds;

size_t max(size_t a, size_t b) {
    return (a > b) ? a : b;
}

size_t cacheRecursive[10000] = {0};

size_t CoinsRecursiveM(size_t n, int *array) {
    n_Calls++;

    size_t maxValue = cacheRecursive[n];
    
    if (maxValue == 0) {
        if (n == 0) {
            maxValue = 0;

        }else if (n == 1)
        {
            maxValue = array[0];

        }else if (n > 1){
            n_Adds++;
            maxValue = max(array[n - 1] + CoinsRecursiveM(n - 2, array), + CoinsRecursiveM(n - 1, array));
            
        }

        cacheRecursive[n] = maxValue;
    }

    return maxValue;    
}


size_t CoinsIterativePD(size_t n, int *array, int * arrayStored) {
    
    size_t cacheI[n+1];
    int print;
    int count = 0;
    
    if (array[0] > array[1]) {
        print = 0;
    }else {
        print = 1;
    }

    for (size_t i = 0; i <= n; i++){
        
        if (i == 0) {
            cacheI[i] = 0;
 

        }else if(i == 1) {
            cacheI[i] = array[0];

            *(arrayStored++) = array[0];
           

        }else if (n > 1) {

            n_Adds++;
            cacheI[i] = max(array[i - 1] + cacheI[i - 2], cacheI[i - 1]);

            
            
            
        }
    }

    return cacheI[n];
}

int main(void)
{
    
    size_t size;

        
    printf("Number of coins: ");
    scanf("%zu", &size);

    srand(time(NULL));

    int* array = (int*) calloc(size, sizeof(int));
    int *arrayValues = (int*) calloc(size, sizeof(int));


    for (size_t i = 0; i < size; i++) {
        int random_number = rand() % 101;
        array[i] = random_number;
        printf("%d, ", array[i]);

    }

    double start_time;
    double finish_time;
    double exec_time1, exec_time2;

   size_t value;
    start_time = cpu_time();
    value = CoinsRecursiveM(size, array);
    finish_time = cpu_time();
    exec_time1 = finish_time - start_time;

    printf("\nValue: %zu || Calls: %zu || Additions: %zu || Exec Time: %f\n", value, n_Calls, n_Adds, exec_time1);

    n_Calls = 0;
    n_Adds = 0;
    
    
    start_time = cpu_time();
    value = CoinsIterativePD(size, array, arrayValues);
    finish_time = cpu_time();
    exec_time2 = finish_time - start_time;

    printf("\nValue: %zu || Calls: %zu || Additions: %zu || Exec Time: %f\n", value, n_Calls, n_Adds, exec_time2);

   for (int i = 0; i < size; i++) {
        printf("\n%d\n", arrayValues[i]);
    }

    printf("Recursive Memoization / Iterative DP = %f\n\n", exec_time1 / exec_time2);
    free(array);

    
    

    return 0;
}
