#include <stdio.h>
#include <math.h>

int main (void) {
    printf("%s %s %s\n", "ang", "sin(ang)", "cos(ang)");
    FILE *file;
    file = fopen("sinCos.txt", "w"); 

    
    for (int i = 0; i < 360; i += 5) {

        double radius = i * (M_PI / 180);
        printf("%3d %.5f %.5f\n", i, sin(radius), cos(radius));
        

        fprintf(file, "%3d %.5f %.5f\n", i, sin(radius), cos(radius));
        
    }
    fclose(file);
    return 0;
}