//
// TO DO : desenvolva um algoritmo para verificar se um numero inteiro positivo
//         e uma capicua
//         Exemplos: 12321 e uma capiacua, mas 123456 nao e
//         USE uma PILHA DE INTEIROS (STACK) e uma FILA DE INTEIROS (QUEUE)
//
// TO DO : design an algorithm to check if the digits of a positive decimal
//         integer number constitue a palindrome
//         Examples: 12321 is a palindrome, but 123456 is not
//         USE a STACK of integers and a QUEUE of integers
//

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include "IntegersQueue.h"
#include "IntegersStack.h"


#define MAX(a,b) (((a)>(b))?(a):(b))

size_t number_digits(int n) {
    size_t c = (n==0)?1:log10(n)+1;  
    return c;
}

int *digitsList(int n, size_t *ndigits) {
    *ndigits = number_digits(n);

    int *list = (int*) calloc(*ndigits, sizeof(int));

    for (size_t i = *ndigits; i > 0; i--) {
        list[i-1] = n % 10;
        n /= 10;
    } 

    return list;
}

int main(void) { 

    while (1) {
        int number = 0;
        size_t nDigits = 0;
        printf("Number: ");
        scanf("%d", &number);

        if (number == 0) {
            break;
        }

        int *listDigits = digitsList(number, &nDigits);

        for (size_t i = 0; i < nDigits; i++) {
            //printf("%d\n", listDigits[i]);
        }

        Queue* queue = QueueCreate(MAX(nDigits, 10));
        Stack* stack = StackCreate(MAX(nDigits, 10));

        for (size_t j = 0; j < nDigits; j++) {
                QueueEnqueue(queue, listDigits[j]);
                StackPush(stack, listDigits[j]);
        }

        int result = 1;
        while (!QueueIsEmpty(queue) && !StackIsEmpty(stack)) {
            int digitQueue = 0;
            int digitStack = 0;

            digitQueue = QueueDequeue(queue);
            digitStack = StackPop(stack);

            printf("DigitQueue = %d || DigitStack == %d\n", digitQueue, digitStack);
            if (digitQueue != digitStack) {
                result = 0;
                break;
            }
        }

        if (result == 1) {
            printf("%d is a capicua\n", number);

        }else {
            printf("%d is not a capicua\n", number);
        }

        QueueDestroy(&queue);
        StackDestroy(&stack);
        
        free(listDigits);
    }
    
    return 0; 
}

