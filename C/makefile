CC = tau_cc.sh
LDC = tau_cc.sh
LD_FLAGS = -fopenmp
FLAGS = -fopenmp
RM= /bin/rm

FILES = $(shell find *.c)

CPROGS = $(addsuffix x, $(FILES))

OBJSC=$(CPROGS:%.x=%.o) 

#all rule
all: prime-Serial.x prime-MPI.x prime-OpenMP.x prime-MPI-OpenMP.x

%.x: %.o
	$(LDC) $^ $(LD_FLAGS) -o $@ -lm

%.o: %.c
	$(CC) -c $^ $(FLAGS) -o $@ -lm

#clean rule
clean:
	$(RM) -rf *.o *.x *.mod

