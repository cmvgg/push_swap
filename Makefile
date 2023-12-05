all: push_swap

push_swap: push_swap.o
	gcc push_swap.o -o push_swap

push_swap.o: push_swap.c
	gcc -c push_swap.c

run: push_swap
	ARG="4 67 3 87 23" ./push_swap $$ARG | wc -l

clean:
	rm *.o push_swap