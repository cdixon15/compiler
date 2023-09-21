SHELL = /bin/sh
CC = gcc
EXECUTABLE = f23
INPUT=mg.f23
OUTPUT=output.txt

all:
	flex flexing.l
	$(CC) lex.yy.c -o $(EXECUTABLE)
	./$(EXECUTABLE) $(INPUT) $(OUTPUT)

clean:
	rm -f $(EXECUTABLE) zzz
	rm -f $(OUTPUT)

