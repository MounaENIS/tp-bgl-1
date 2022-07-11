##### Makefile ###########
prog: test.o
	gcc -o prog test.o
test.o: test.c
	gcc -c test.c
