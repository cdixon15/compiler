%{
#include "flexing.h"
#include <stdio.h>
#include <string.h>
%}

%%
[ \n\t\r]+ {}
"do" {return (K_DO);}
"double" {return(K_DOUBLE);}
"else" {return(K_ELSE);}
"exit" {return(K_EXIT\);}
"function" {return(K_FUNCTION);}
"if" {return(K_IF);}
"integer" {return(K_INTEGER);}
"print_double" {return(K_PRINT_DOUBLE);}
"print_integer" {return(K_PRINT_INTEGER);}
"print_string" {return(K_PRINT_STRING);}
"procedure" {return(K_PROCEDURE);}
"program" {return(K_PROGRAM);}
"read_double" {return(K_READ_DOUBLE);}
"read_integer" {return(K_READ_INTEGER);}
"read_string" {return(K_READ_STRING);}
"return" {return(K_RETURN);}
"string" {return(K_STRING);}
"then" {return(K_THEN);}
"while" {return(K_WHILE);}
":=" {return(ASSIGN);}
"+=" {return(ASSIGN_PLUS);}
"-=" {return(ASSIGN_MINUS);}
"*=" {return(ASSIGN_MULTIPLY);}
"/=" {return(ASSIGN_DIVIDE);}
"%=" {return(ASSIGN_MOD);}
"," {return(COMMA);}
(\/\/.*)[\n] {return(COMMENT);}
"&&" {return(DAND);}
"/" {return(DIVIDE);}
"||" {return(DOR);}
"==" {return(DEQ);}
">=" {return(GEQ);}
">" {return(GT);}
"[" {return(LBRACKET);}
"<=" {return(LEQ);}
"{" {return(LCURLY);}
"(" {return(LPAREN);}
"<" {return(LT);}
"-" {return(MINUS);}
"--" {return(DECREMENT);}    
"%" {return(MOD);}
"*" {return(MULTIPLY);}
"!=" {return(NE)}
"!" {return(NOT);}
"." {return(PERIOD);}
"+" {return(PLUS);}
"++" {return(INCREMENT);}
"]" {return(RBRACKET);}
"}" {return(RCURLY);}
")" {return(RPAREN);}
";" {return(SEMI);}

([0-9]*\.[0-9]*[d][+-][0-9]*)|([0-9]*\.[0-9]*) {
    yylval.variable.intVar = 0; 
	yylval.variable.floatVar = atof(yytext);
    return(DCONSTANT);
    }

([a-zA-Z|_|$][a-zA-Z0-9|_|$]){0,31} {
    sscanf(yytext, "%s", yylval.name);
    return(IDENTIFIER);
    }

(\"(\\n|.)*\") {
    sscanf(yytext, "%s", yylval.name);
    return(SCONSTANT);
    }

([0-9])+ {
    yylval.variable.intVar = atoi(yytext); 
    yylval.variable.floatVar = 0;
    return(ICONSTANT);
    }

%%

/*
int yywrap(void){}
  
int main(int argc, char *argv[])
{

    extern FILE *yyin, *yyout;

    yyin = fopen(argv[1], "rb");    
    yyout = fopen(argv[2], "wb");
    yylex();
    fclose(yyin);
    fclose(yyout);

    return 0;
}
*/
