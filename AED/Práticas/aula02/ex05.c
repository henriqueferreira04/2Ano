#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>


double* readCoef(size_t* degree) {
    while (1) {
        printf("Polinom degree: \n");
        scanf("%zu", degree);

        if (degree >= 0) break;
    }
    

    double* array = (double*) calloc((int)*degree + 1, sizeof(double));
    for(int i = 0; i < (int)*degree + 1; i++) {

        double coef = 0;
        printf("Coefficient x^%d: ", (int)*degree - i);
        scanf("%lf", &coef);
        array[i] = coef;
    
    }
    return array;
}

void DisplayPol(double* coef, size_t degree) {
    printf("Pol(x) =");
    for (int i = 0; i < (int)degree + 1; i++) {
        if (i == degree) {
            printf(" %.2lf\n", coef[i]);
        }else {
            printf(" %.2lf * x^%d +", coef[i], (int)degree - i);
        }
        
    }
}

double ComputePol(double* coef, size_t degree, double x) {

    printf("x value: ");
    scanf("%lf", &x);

    double res = 0;
    for(int i = 0; i < (int)degree + 1; i++) {
        res += coef[i] * pow(x, (int)degree - i);
        
    }

    return res;
}

int GetRealRoots(double* coef, size_t degree, double* root_1, double* root_2) {
    assert (coef != NULL);
    
    assert (coef[0] != 0);

    *root_1 = (-coef[1] + sqrt(pow(coef[1],2)- (4 * coef[0] * coef[2]))) / (2 * coef[0]);
    *root_2 = (-coef[1] - sqrt(pow(coef[1],2)- (4 * coef[0] * coef[2]))) / (2 * coef[0]);
    
    

    if (isnan(*root_1) || isnan(*root_2)) {
        return 0;

    }else if (*root_1 == *root_2) {
        return 1;

    }else return 2;

}

int main(void)
{
    size_t degree = 0;
    double x = 0;
    double root_1 = 0, root_2 = 0;

    double* coef1 = readCoef(&degree);

    

    DisplayPol(coef1, degree);

    double value = ComputePol(coef1, degree, x);
    printf("\nPol(x) = %.2lf", value);

    int rootsType = GetRealRoots(coef1, degree, &root_1, &root_2);

    if (rootsType == 0) {
        printf("\nNo real roots");

    }else if (rootsType == 1) {
        printf("\nRoots with multiplicity 2: %lf", root_1);

    }else printf("\nRoot1: %.2lf\nRoot2: %.2lf", root_1, root_2);

    free(coef1);
    return 0;
}
