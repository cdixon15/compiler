
%{
#include "flexing.h"
%}

%%
"do" return K_DO;
"double" return K_DOUBLE;
"else" return K_ELSE;
"exit" return K_EXIT;
"function" return K_FUNCTION;
"if" return K_IF;
"integer" return K_INTEGER;
"print_double" return K_PRINT_DOUBLE;
"print_integer" return K_PRINT_INTEGER;
"print_string" return K_PRINT_STRING;
"procedure" return K_PROCEDURE;
"program" return K_PROGRAM;
"read_double" return K_READ_DOUBLE;
"read_integer" return K_READ_INTEGER;
"read_string" return K_READ_STRING;
"return" return K_RETURN;
"string" return K_STRING;
"then" return K_THEN;
"while" return K_WHILE;
":=" return ASSIGN;
"+=" return ASSIGN_PLUS;
"-=" return ASSIGN_MINUS;
"*=" return ASSIGN_MULTIPLY;
"/=" return ASSIGN_DIVIDE;
"%=" return ASSIGN_MOD;
"," return COMMA;
"//" return COMMENT;
"&&" return DAND;
"/" return DIVIDE;
"||" return DOR;
"==" return DEQ;
">=" return GEQ;
">" return GT;
"[" return LBRACKET;
"<=" return LEQ;
"{" return LCURLY;
"(" return LPAREN;
"<" return LT;
"-" return MINUS;
"--" return DECREMENT;
"%" return MOD;
"*" return MULTIPLY;
"!=" return NE;
"!" return NOT;
"." return PERIOD;
"+" return PLUS;
"++" return INCREMENT;
"]" return RBRACKET;
"}" return RCURLY;
")" return RPAREN;
";" return SEMI; 
[a-zA-Z|_|$][a-zA-Z0-9|_|$]{0,31} return IDENTIFIER;
\"(\n|.)*\" return SCONSTANT;
[0-9]+ return ICONSTANT;
"([0-9]*\.[0-9]*[d][+-][0-9]*)|([0-9]*\.[0-9]*)" return DCONSTANT;
[/t/n] ;

%%
rules
%%
user code