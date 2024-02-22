#include <stdio.h>

void Permute(int* a, int* b, int* c) {
    int p = *a;
    *a = *c;
    *c = p;
}
    


int main(void)
{
    int a = 1, b = 2, c = 3;
    printf("%d|%d|%d\n", a, b, c);
    Permute(&a, &b, &c);
    printf("Permuted\n");
    printf("%d|%d|%d\n", a, b, c);

    return 0;
}


