#include <stdio.h>
#include <math.h>


int CountDigits(int number) {

    int count = 0;

    if (number == 0) {
        return 1;
    }

    while (number != 0) {
        number /= 10;
        count++; 
    }

    return count;
}

int Amstrong(int number, int digits) {

    int amstrong = 0;
    int resto = 0;

    for (int i = 0; i < digits; i++) {
        resto = number % 10;
        number /= 10;
        
        amstrong += pow(resto, digits); 
        //printf("\nNumber: %d, Digit: %d", number, resto);
        
        
        
    }
    return amstrong;

}

int main(void){

    int digits = 0;
    int res = 0;

    printf("\nAmstrong numbers:\n");
    for (int i = 0; i < 1000000; i++) {
        digits = CountDigits(i);
        res = Amstrong(i, digits);

        if (i == res) {
            printf("%d\n", i);
        }
        
    }
    
    return 0;
}
