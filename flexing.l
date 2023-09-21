%{
#include "flexing.h"
#include <stdio.h>
#include <string.h>
%}

%%
"do" {fprintf(yyout,"k do\n");
    return K_DO;}
"double" {fprintf(yyout,"k double\n");
    return K_DOUBLE;}
"else" {fprintf(yyout,"k else\n");
    return K_ELSE;}
"exit" {fprintf(yyout,"k exit\n");
    return K_EXIT;}
"function" {fprintf(yyout,"k function\n");
    return K_FUNCTION;}
"if" {fprintf(yyout,"k if\n");
    return K_IF;}
"integer" {fprintf(yyout,"k integer\n");
    return K_INTEGER;}
"print_double" {fprintf(yyout,"k print double\n");
    return K_PRINT_DOUBLE;}
"print_integer" {fprintf(yyout,"k print integer\n");
    return K_PRINT_INTEGER;}
"print_string" {fprintf(yyout,"k print string\n");
    return K_PRINT_STRING;}
"procedure" {fprintf(yyout,"k procedure\n");
    return K_PROCEDURE;}
"program" {fprintf(yyout,"k program\n");
    return K_PROGRAM;}
"read_double" {fprintf(yyout,"k read double\n");
    return K_READ_DOUBLE;}
"read_integer" {fprintf(yyout,"k read integer\n");
    return K_READ_INTEGER;}
"read_string" {fprintf(yyout,"k read string\n");
    return K_READ_STRING;}
"return" {fprintf(yyout,"k return\n");
    return K_RETURN;}
"string" {fprintf(yyout,"k string\n");
    return K_STRING;}
"then" {fprintf(yyout,"k then\n");
    return K_THEN;}
"while" {fprintf(yyout,"k while\n");
    return K_WHILE;}
":=" {fprintf(yyout,"assign\n");
    return ASSIGN;}
"+=" {fprintf(yyout,"assign plus\n");
    return ASSIGN_PLUS;}
"-=" {fprintf(yyout,"assign minus\n");
    return ASSIGN_MINUS;}
"*=" {fprintf(yyout,"assign multiply\n");
    return ASSIGN_MULTIPLY;}
"/=" {fprintf(yyout,"assign divide\n");
    return ASSIGN_DIVIDE;}
"%=" {fprintf(yyout,"assign mod\n");
    return ASSIGN_MOD;}
"," {fprintf(yyout,"comma\n");
    return COMMA;}
"//" {fprintf(yyout,"comment\n");
    return COMMENT;}
"&&" {fprintf(yyout,"dand\n");
    return DAND;}
"/" {fprintf(yyout,"divide\n");
    return DIVIDE;}
"||" {fprintf(yyout,"dor\n");
    return DOR;}
"==" {fprintf(yyout,"deq\n");
    return DEQ;}
">=" {fprintf(yyout,"geq\n");
    return GEQ;}
">" {fprintf(yyout,"gt\n");
    return GT;}
"[" {fprintf(yyout,"lbracket\n");
    return LBRACKET;}
"<=" {fprintf(yyout,"leq\n");
    return LEQ;}
"{" {fprintf(yyout,"lcurly\n");
    return LCURLY;}
"(" {fprintf(yyout,"lparen\n");
    return LPAREN;}
"<" {fprintf(yyout,"lt\n");
    return LT;}
"-" {fprintf(yyout,"minus\n");
    return MINUS;}
"--" {fprintf(yyout,"decrement\n");
    return DECREMENT;}    
"%" {fprintf(yyout,"mod\n");
    return MOD;}
"*" {fprintf(yyout,"multiply\n");
    return MULTIPLY;}
"!=" {fprintf(yyout,"ne\n");
    return NE;}
"!" {fprintf(yyout,"not\n");
    return NOT;}
"." {fprintf(yyout,"period");
    return PERIOD;}
"+" {fprintf(yyout,"plus\n");
    return PLUS;}
"++" {fprintf(yyout,"increment\n");
    return INCREMENT;}
"]" {fprintf(yyout,"rbracket\n");
    return RBRACKET;}
"}" {fprintf(yyout,"rcurly\n");
    return RCURLY;}
")" {fprintf(yyout,"rparen\n");
    return RPAREN;}
";" {fprintf(yyout,"semicolon\n");
    return SEMI; }

([0-9]*\.[0-9]*[d][+-][0-9]*)|([0-9]*\.[0-9]*) {fprintf(yyout,"dconstant\n"); 
    return DCONSTANT;}
    
([a-zA-Z|_|$][a-zA-Z0-9|_|$]){0,31} {fprintf(yyout,"indentifier\n");
    return IDENTIFIER;}
(\"(\n|.)*\") {fprintf(yyout,"sconstant\n");
    return SCONSTANT;}
([0-9])+ {fprintf(yyout,"iconstant\n"); 
    return ICONSTANT;}
%%

int yywrap(void){}
  
int main(int argc, char *argv[])
{

    extern FILE *yyin, *yyout;

    yyin = fopen("example.txt", "r");    
    yyout = fopen("output.txt", "w");
    yylex();
    fclose(yyin);

    return 0;
}
