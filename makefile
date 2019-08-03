CC = gcc
LIBRARY_PATH = /opt/sw/julia/lib
RM = /bin/rm

all:p1

p1:primeSerial.c
	gcc -I /opt/sw/julia/include/julia -o primeSerial.x primeSerial.c -lm -ljulia -Wl,-rpath,"/opt/sw/julia/lib/julia"

clean:
	rm -f $(OBJS) $(PROG)
