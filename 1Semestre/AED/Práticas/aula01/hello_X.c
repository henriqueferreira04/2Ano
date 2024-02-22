#include <stdio.h>

int main(void) {
    char first_name[21], last_name[21];

    printf("First and last name: ");
    
    scanf("%s %s", first_name, last_name);

    printf("Hello, %s %s!\n", first_name, last_name);

    return 0; 
}
