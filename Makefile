cppc=g++
cc=gcc
cppflags=-Wall -Wextra -std=c++17
cflags=-Wall -Wextra -std=gnu11

all:compilador

parser.tab.c parser.tab.h: parser.y
	bison -d -o parser.tab.c parser.y

lex.yy.c: lexer.l parser.tab.h
	flex -o lex.yy.c lexer.l

parser.tab.o: parser.tab.c
	$(cc) $(cflags) -c parser.tab.c -o parser.tab.o

lex.yy.o: lex.yy.c
	$(cc) $(cflags) -c lex.yy.c -o lex.yy.o

main.o: main.cpp
	$(cppc) $(cppflags) -c main.cpp -o main.o


compilador: parser.tab.o lex.yy.o main.o
	$(cppc) $(cppflags) parser.tab.o lex.yy.o main.o -o compilador -lfl

clean:
	rm -f parser.tab.c parser.tab.h lex.yy.c *.o
	#rm -f compilador

.PHONY: all clean
