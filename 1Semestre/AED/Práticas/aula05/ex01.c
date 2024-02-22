#include <stdio.h>

size_t nChamadas = 0;

size_t recursive1 (size_t n) {
    
    if (n > 1) {
        nChamadas++;
        return recursive1(n/2) + n;
    }

    return 1;
}

size_t recursive2 (n) {

    if (n > 1) {
        nChamadas+= 2;
        return recursive2(n/2) + recursive2((n+1)/2) + n;
    }

    return 1;
}

size_t recursive3 (n) {

    if (n == 1) return 1;
    
    if (n % 2 != 0) {
        nChamadas += 2;
        return recursive3(n/2) + recursive3((n+1)/2) + n;

    }else {
        nChamadas++;
        return (2 * recursive3(n/2)) + n;
    }
}
int main(void)
{
    printf("%3s %10s %10s %10s %10s %10s %10s \n", "N", "1ªFunção(N)", "Nº de Chamadas", "2ªFunção(N)", "Nº de Chamadas", "3ªFunção(N)", "Nº de Chamadas");
    for (size_t i = 1; i < 65; i++) {
        
        printf("%3zu %10zu %10zu", i, recursive1(i), nChamadas);
        nChamadas = 0;
        printf("%10zu %10zu", recursive2(i), nChamadas);
        nChamadas = 0;
        printf("%10zu %10zu\n", recursive3(i), nChamadas);  
        nChamadas = 0;

    }

    return 0;
}
