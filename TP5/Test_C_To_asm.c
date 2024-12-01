#include<stdio.h>


int main(void) {
    char * string = "blabla";
    
    printf("%s = %d caractères \n ", string,longueur(string));
    int a = 3;
    int b = 2;
    printf("%d - %d = %d \n",a,b,difference(a,b));
    return 0;
}
