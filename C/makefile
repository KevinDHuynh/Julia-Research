CC = gcc
LDC = gcc
LD_FLAGS = -fopenmp -lm
FLAGS = -fopenmp -lm
RM= /bin/rm

#all rule
all: prime-Serial.x prime-MPI.x prime-OpenMP.x

%.x: %.o
	$(LDC) $^ $(LD_FLAGS) -o $@

%.o: %.c
	$(CC) -c $^ $(FLAGS) -o $@

#clean rule
clean:
	$(RM) -rf *.o *.x *.mod

