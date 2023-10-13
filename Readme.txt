Lexer
Collin Dixon & James Lucid
COSC 4785
9/21/2023

To build and run, simply 'make all'
By default, the output will be in output.txt
flex installed from linux command line: 'sudo apt-get install flex'
Ran on Windows 10 WSL Ubuntu

Known Issue:
The fprintf statements add extra characters to the output file. 
I am pretty sure this is something to do with string length not matching the actual number of chars in the string.
Spent long enough trying to fix it, but I would rather not spend time debugging a feature that wont even be used once a parser is involved.

James: Not sure how to link bison and flex together, and not sure how to fix the errors in flexing.l
