SHELL = /bin/sh
CC = gcc
EXECUTABLE = f23
INPUT=mg.f23
OUTPUT=output.txt
HDRS=flexing.h

all:
	flex flexing.l
	bison flexing.y
	 $(CC) $(HDRS) lex.yy.c flexing.tab.c -o $(EXECUTABLE)
	./$(EXECUTABLE) $(INPUT) $(OUTPUT)

clean:
	rm -f $(EXECUTABLE) zzz
	rm -f $(OUTPUT)
