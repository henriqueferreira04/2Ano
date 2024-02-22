#include<stdio.h>
#include <math.h>

int main (void) {
    int lines;
    
    printf("Number of lines: ");
    scanf("%d", &lines);

    printf("%6s %6s %6s\n", "Number", "Square", "SquareRoot");
    for (int i = 0; i < lines; i++) {
        
        printf("%6d %6d %s %.2f\n", i, i*i, "  ", sqrt(i));
    }

    return 0;


}