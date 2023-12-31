#include <stdio.h>
#include <stdlib.h>
#include "elapsed_time.h"


int Factorion(int n, int* array) {
    int res = 0;
    int j = n;
    
    while (1) {

        if (n == 0) {
            res = 1;
        }
        if (j == 0) {
            if (res == n) {
                return 1;
            }else return 0;
            
        }
        
        int indice = j % 10;

        res += array[indice];
        
        j /= 10;
        
    }
    
}



int main(void){
    
    double finish_time;

    
    int* fArray = (int*) calloc(10, sizeof(int));

    for (int i = 0; i < 10; i++) {
        if (i == 0) {
            fArray[i] = 1;

        }else {
            fArray[i] = i * fArray[i-1];
            printf("%d = %d\n",i, fArray[i]);
        };
        
    }

    

    printf("\nFactorian:\n");
    for (int i = 0; i < 1000000; i++) {
        if (Factorion(i, fArray) == 1) {
            printf("%d\n", i);
        }
        
    }

    finish_time = cpu_time();

    printf("\nTime: %e", finish_time);

    free(fArray);

    return 0;
}
