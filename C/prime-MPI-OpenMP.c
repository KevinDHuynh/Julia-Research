#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "myheader.h"
#include "mpi.h"


int main(int argc, char** argv){

    int n=100000;
    int* numprimes = {0};
	int* finalNumprimes = (int*) malloc(sizeof(int));
	int size,rank;
	int i;
	
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);


	int* split = (int*) malloc((size+1) * sizeof(int));
	
	for(i=0;i<=size;i++){
			if(i == size) split[i] = n;
			else split[i] = (n/size) * i;
	}	
	
    for(i = split[rank]; i <= split[rank+1]; i++){
        if (is_prime(i) == 1)
            numprimes[0]++;
    }


	MPI_Reduce(numprimes,finalNumprimes,1,MPI_INT,MPI_SUM,0,MPI_COMM_WORLD);
	
	if(rank == 0)
		printf("Number of Primes: %d\n",finalNumprimes[0]);

	MPI_Finalize();
	
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

