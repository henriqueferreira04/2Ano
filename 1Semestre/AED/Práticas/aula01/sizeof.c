#include<stdio.h>

int main (void) {
    printf("Sizeof(void *) --> %lu\n", sizeof(void *));
    printf("Sizeof(void) --> %lu\n", sizeof(void));
    printf("Sizeof(char) --> %lu\n", sizeof(char));
    printf("Sizeof(short) --> %lu\n", sizeof(short));
    printf("Sizeof(int) --> %lu\n", sizeof(int));
    printf("Sizeof(long) --> %lu\n", sizeof(long));
    printf("Sizeof(long long) --> %lu\n", sizeof(long long));
    printf("Sizeof(float) --> %lu\n", sizeof(float));
    printf("Sizeof(double) --> %lu\n", sizeof(double));
    

    return 0;

}