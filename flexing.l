
%{
#include "flexing.h"
%}

%%
"do" 
    {printf(COMMENT);
    return K_DO;}
"double" 
    {printf(COMMENT);
    return K_DOUBLE;}
"else" 
    {printf(COMMENT);
    return K_ELSE;}
"exit" 
    {printf(COMMENT);
    return K_EXIT;}
"function" 
    {printf(COMMENT);
    return K_FUNCTION;}
"if" 
    {printf(COMMENT);
    return K_IF;}
"integer" 
    {printf(COMMENT);
    return K_INTEGER;}
"print_double" 
    {printf(COMMENT);
    return K_PRINT_DOUBLE;}
"print_integer" 
    {printf(COMMENT);
    return K_PRINT_INTEGER;}
"print_string" 
    {printf(COMMENT);
    return K_PRINT_STRING;}
"procedure" 
    {printf(COMMENT);
    return K_PROCEDURE;}
"program" 
    {printf(COMMENT);
    return K_PROGRAM;}
"read_double" 
    {printf(COMMENT);
    return K_READ_DOUBLE;}
"read_integer" 
    {printf(COMMENT);
    return K_READ_INTEGER;}
"read_string" 
    {printf(COMMENT);
    return K_READ_STRING;}
"return" 
    {printf(COMMENT);
    return K_RETURN;}
"string" 
    {printf(COMMENT);
    return K_STRING;}
"then" 
    {printf(COMMENT);
    return K_THEN;}
"while" 
    {printf(COMMENT);
    return K_WHILE;}
":=" 
    {printf(COMMENT);
    return ASSIGN;}
"+=" 
    {printf(COMMENT);
    return ASSIGN_PLUS;}
"-=" 
    {printf(COMMENT);
    return ASSIGN_MINUS;}
"*=" 
    {printf(COMMENT);
    return ASSIGN_MULTIPLY;}
"/=" 
    {printf(COMMENT);
    return ASSIGN_DIVIDE;}
"%=" 
    {printf(COMMENT);
    return ASSIGN_MOD;}
"," 
    {printf(COMMENT);
    return COMMA;}
"//" 
    {printf(COMMENT);
    return COMMENT;}
"&&" 
    {printf(COMMENT);
    return DAND;}
"/" 
    {printf(COMMENT);
    return DIVIDE;}
"||" 
    {printf(COMMENT);
    return DOR;}
"=="
    {printf(COMMENT);
    return DEQ;}
">=" 
    {printf(COMMENT);
    return GEQ;}
">" 
    {printf(COMMENT);
    return GT;}
"[" 
    {printf(COMMENT);
    return LBRACKET;}
"<=" 
    {printf(COMMENT);
    return LEQ;}
"{" 
    {printf(COMMENT);
    return LCURLY;}
"(" 
    {printf(COMMENT);
    return LPAREN;}
"<" 
    {printf(COMMENT);
    return LT;}
"-" 
    {printf(COMMENT);
    return MINUS;}
"--" 
    {printf(COMMENT);
    return DECREMENT;}    
"%" 
    {printf(COMMENT);
    return MOD;}
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
[/t/n:space::blank:] ;

%%
int yywrap(void){}
  
int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}
