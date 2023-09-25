#include <stdio.h>

int main(void)
{
  unsigned int i = 1;
  int j = -1;
  long long int k = -2147483648;

  printf("original i = %u\n", i);
  printf("original j = %d\n", j);
  printf("original k = %lld\n", k);
  // compare i with j
  if (i > j)
    printf("i > j is true\n");
  else
    printf("i > j is false\n");
  // replace k by its absolute value and print the result
  
  if (k < 0)
    k = -k;
  printf("absolute value of k = %lld\n", k);
  return 0;
}
