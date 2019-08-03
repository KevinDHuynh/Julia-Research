#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "myheader.h"
#define JULIA_ENABLE_THREADING
#include <julia.h>

int main(int argc, char** argv){

    jl_init();

    int n=100;
    //jl_value_t *n = jl_eval_string("10000000");
    int numprimes = 0;
    int i;

    //jl_value_t *ret = jl_eval_string("sqrt(2.0)");

    for (i = 1; i <= n; i++)
    {
        if (is_prime(i) == 1)
            numprimes ++;
    }

    printf("Number of Primes: %d\n",numprimes);

    jl_atexit_hook(0);

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

