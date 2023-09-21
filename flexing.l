%{
#include "flexing.h"
#include <stdio.h>
#include <string.h>
%}

%%
"do" {printf("k do\n");
    return K_DO;}
"double" {printf("k double\n");
    return K_DOUBLE;}
"else" {printf("k else\n");
    return K_ELSE;}
"exit" {printf("k exit\n");
    return K_EXIT;}
"function" {printf("k function\n");
    return K_FUNCTION;}
"if" {printf("k if\n");
    return K_IF;}
"integer" {printf("k integer\n");
    return K_INTEGER;}
"print_double" {printf("k print double\n");
    return K_PRINT_DOUBLE;}
"print_integer" {printf("k print integer\n");
    return K_PRINT_INTEGER;}
"print_string" {printf("k print string\n");
    return K_PRINT_STRING;}
"procedure" {printf("k procedure\n");
    return K_PROCEDURE;}
"program" {printf("k program\n");
    return K_PROGRAM;}
"read_double" {printf("k read double\n");
    return K_READ_DOUBLE;}
"read_integer" {printf("k read integer\n");
    return K_READ_INTEGER;}
"read_string" {printf("k read string\n");
    return K_READ_STRING;}
"return" {printf("k return\n");
    return K_RETURN;}
"string" {printf("k string\n");
    return K_STRING;}
"then" {printf("k then\n");
    return K_THEN;}
"while" {printf("k while\n");
    return K_WHILE;}
":=" {printf("assign\n");
    return ASSIGN;}
"+=" {printf("assign plus\n");
    return ASSIGN_PLUS;}
"-=" {printf("assign minus\n");
    return ASSIGN_MINUS;}
"*=" {printf("assign multiply\n");
    return ASSIGN_MULTIPLY;}
"/=" {printf("assign divide\n");
    return ASSIGN_DIVIDE;}
"%=" {printf("assign mod\n");
    return ASSIGN_MOD;}
"," {printf("comma\n");
    return COMMA;}
"//" {printf("comment\n");
    return COMMENT;}
"&&" {printf("dand\n");
    return DAND;}
"/" {printf("divide\n");
    return DIVIDE;}
"||" {printf("dor\n");
    return DOR;}
"==" {printf("deq\n");
    return DEQ;}
">=" {printf("geq\n");
    return GEQ;}
">" {printf("gt\n");
    return GT;}
"[" {printf("lbracket\n");
    return LBRACKET;}
"<=" {printf("leq\n");
    return LEQ;}
"{" {printf("lcurly\n");
    return LCURLY;}
"(" {printf("lparen\n");
    return LPAREN;}
"<" {printf("lt\n");
    return LT;}
"-" {printf("minus\n");
    return MINUS;}
"--" {printf("decrement\n");
    return DECREMENT;}    
"%" {printf("mod\n");
    return MOD;}
"*" {printf("multiply\n");
    return MULTIPLY;}
"!=" {printf("ne\n");
    return NE;}
"!" {printf("not\n");
    return NOT;}
"." {printf("period");
    return PERIOD;}
"+" {printf("plus\n");
    return PLUS;}
"++" {printf("increment\n");
    return INCREMENT;}
"]" {printf("rbracket\n");
    return RBRACKET;}
"}" {printf("rcurly\n");
    return RCURLY;}
")" {printf("rparen\n");
    return RPAREN;}
";" {printf("semicolon\n");
    return SEMI; }

([0-9]*\.[0-9]*[d][+-][0-9]*)|([0-9]*\.[0-9]*) {printf("dconstant\n"); 
    return DCONSTANT;}
    
([a-zA-Z|_|$][a-zA-Z0-9|_|$]){0,31} {printf("indentifier\n");
    return IDENTIFIER;}
(\"(\n|.)*\") {printf("sconstant\n");
    return SCONSTANT;}
([0-9])+ {printf("iconstant\n"); 
    return ICONSTANT;}
%%

int yywrap(void){}
  
int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
