#include <stdio.h>
#include "elapsed_time.h"

size_t nChamadas = 0;

size_t DelannoyRecursive(size_t m, size_t n) {
    nChamadas++;
    if (m == 0 || n == 0) {
        return 1;

    }
      
    return DelannoyRecursive(m - 1, n) + DelannoyRecursive(m - 1, n - 1) + DelannoyRecursive(m, n - 1);

}

#define LIMIT 10000
static size_t cacheM[1+LIMIT][1+LIMIT] = {{0}}; 

size_t DelannoyRecursiveMemo(size_t m, size_t n) {
    nChamadas++;

    size_t ret = cacheM[m][n];
    
    if (ret == 0) {
        if (m == 0 || n == 0) {
            ret = 1;
            
        }else {
            ret = DelannoyRecursiveMemo(m - 1, n) + DelannoyRecursiveMemo(m - 1, n - 1) + DelannoyRecursiveMemo(m, n - 1);
            
        }

        cacheM[m][n] = ret;
    }
    
    return ret;
}

size_t DelannoyIterativePD(size_t m, size_t n) {

    size_t cacheI[m + 1][n + 1];

    for (size_t i = 0; i <= m; i++) {

        for (size_t j = 0; j <= n; j++) {

            if (i == 0 || j == 0) {
                cacheI[i][j] = 1;
            }else {

                cacheI[i][j] = cacheI[i - 1][j] + cacheI[i - 1][j - 1] + cacheI[i][j - 1];
            }

        }
    }

    return cacheI[m][n];
}

size_t DelannoyIterativeFaster(size_t n, size_t m)
{
    int dp[m + 1][n + 1];
 
    // Base cases
    for (int i = 0; i <= m; i++) 
        dp[i][0] = 1;
    for (int i = 0; i <= m; i++) 
        dp[0][i] = 1;    
 
    for (int i = 1; i <= m; i++) 
        for (int j = 1; j <= n; j++) 
            dp[i][j] = dp[i - 1][j] +
                       dp[i - 1][j - 1] + 
                       dp[i][j - 1];
 
    return dp[m][n];
}

int main(void)
{
    double start_time;
    double finish_time;
    double exec_time1, exec_time2;

    size_t value;

    while (1){
        size_t m, n;
        printf("Choose the coordenates (m, n): ");
        scanf("%zu, %zu", &m, &n);

        if (m == 0 && n == 0) break;
        
        
        start_time = cpu_time();
        value = DelannoyRecursiveMemo(m, n);
        finish_time = cpu_time();
        exec_time1 = finish_time - start_time;

        printf("Recursive: %6zu || nChamadas: %6zu || Exec time: %10f\n", value, nChamadas, exec_time1);
        nChamadas = 0;

        start_time = cpu_time();
        value = DelannoyIterativePD(m, n);
        finish_time = cpu_time();
        exec_time2 = finish_time - start_time;

        printf("Iterative: %6zu || nChamadas: %6zu || Exec time: %10f\n", value, nChamadas, exec_time2);

        printf("Recursive Memoization / Iterative DP = %f\n\n", exec_time1 / exec_time2);

        nChamadas = 0;

        start_time = cpu_time();
        value = DelannoyIterativeFaster(m, n);
        finish_time = cpu_time();
        exec_time2 = finish_time - start_time;

        printf("Iterative Faster: %6zu || nChamadas: %6zu || Exec time: %10f\n", value, nChamadas, exec_time2);

    }
    

    return 0;
}
