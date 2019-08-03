#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "myheader.h"

int main(int argc, char** argv){

    int n=100;
    int numprimes = 0;
    int i;

    for (i = 1; i <= n; i++)
    {
        if (is_prime(i) == 1)
            numprimes ++;
    }

    printf("Number of Primes: %d\n",numprimes);


    return 0;

}

int is_prime(int n)
{
    /* handle special cases */
    if      (n == 0) return 0;
    else if (n == 1) return 0;
    else if (n == 2) return 1;

    int i;
    for(i=2;i<=(int)(sqrt((double) n));i++)
        if (n%i==0) return 0;

    return 1;
}

