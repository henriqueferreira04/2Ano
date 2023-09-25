#include<stdio.h>

void cumSum(const int a[], int b[], int length) {
    int c = 0;

    for (int i = 0; i < length; i++) {
        c += a[i];
        b[i] = c;
    }
}

void printArray(const char *s, int a[], int length) {
    printf("%s: [", s);

    for (int i = 0; i < length; i++) {
        if (i == 0) {
            printf("%d", a[i]);
        } 
        else
            printf(", %d", a[i]);
        
    }
    printf("]\n");
}

int main()
{
    int a[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    printArray("a", a, 12);
    int b[12];
    cumSum(a, b, 12);
    printArray("b", b, 12);

    return 0;
}


