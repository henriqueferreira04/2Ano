#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int countAlphabet(char* string) {
    int count = 0;
    for (int i = 0; string[i] != '\0'; i++) {
        if ((string[i] >= 'A' && string[i] <= 'Z') || (string[i] >= 'a' && string[i] <= 'z')) {
           
            count++;
        }
    }
    return count;
}

int countAlphabet_upper(char *string) {
    int count = 0;

    for (int i = 0; string[i] != '\0'; i++) {
        if (string[i] >= 'A' && string[i] <= 'Z') {
            count++;
        }
    }   
    return count;
}


void to_lower(char *string) {
    for (int i = 0; string[i] != '\0'; i++) {
        if (string[i] >= 'A' && string[i] <= 'Z') {
            string[i] += ('a' - 'A');
        }
    }   
}



int main(void)
{
    char *string1, *string2, *string3;
    string1 = (char*) calloc(51, sizeof(char));
    string2 = (char*) calloc(51, sizeof(char));

    printf("Write first string: ");
    scanf("%[^\n]%*c", string1);
    printf("Write a second string: ");
    scanf("%[^\n]%*c", string2);

    printf("The string1 has %d letters.\n", countAlphabet(string1)) ;
    printf("The string2 has %d upper letters.\n", countAlphabet_upper(string2));

    to_lower(string1);
    to_lower(string2);

    printf("\nStrings in Lower Case: \n%s \n%s\n", string1, string2);

    int compare = strcmp(string1, string2);
    if (compare == 0) {
        printf("Same string.\n");
    } else{
        printf("Strings are different.\n");
    }

    string3 = (char*) calloc(strlen(string2) + 1, sizeof(char));
    strcpy(string3, string2);
    
    printf("%s\n", string3);
    
    free(string1);
    free(string2);
    free(string3);

    return 0;

    
}


