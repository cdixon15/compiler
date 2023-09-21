%{
#include "flexing.h"
#include <stdio.h>
#include <string.h>
%}

%%
[ \n\t\r]+ {}
"do" {fprintf(yyout,"K_DO\n");
    }
"double" {fprintf(yyout,"K_DOUBLE\n");
    }
"else" {fprintf(yyout,"K_ELSE\n");
    }
"exit" {fprintf(yyout,"K_EXIT\n");
    }
"function" {fprintf(yyout,"K_FUNCTION\n");
    }
"if" {fprintf(yyout,"K_IF\n");
    }
"integer" {fprintf(yyout,"K_INTEGER\n");
    }
"print_double" {fprintf(yyout,"K_PRINT_DOUBLE\n");
    }
"print_integer" {fprintf(yyout,"K_PRINT_INTEGER\n");
    }
"print_string" {fprintf(yyout,"K_PRINT_STRING\n");
    }
"procedure" {fprintf(yyout,"K_PROCEDURE\n");
    }
"program" {fprintf(yyout,"K_PROGRAM\n");
    }
"read_double" {fprintf(yyout,"K_READ_DOUBLE\n");
    }
"read_integer" {fprintf(yyout,"K_READ_INTEGER\n");
    }
"read_string" {fprintf(yyout,"K_READ_STRING\n");
    }
"return" {fprintf(yyout,"K_RETURN\n");
    }
"string" {fprintf(yyout,"K_STRING\n");
    }
"then" {fprintf(yyout,"K_THEN\n");
    }
"while" {fprintf(yyout,"K_WHILE\n");
    }
":=" {fprintf(yyout,"ASSIGN\n");
    }
"+=" {fprintf(yyout,"ASSIGN_PLUS\n");
    }
"-=" {fprintf(yyout,"ASSIGN_MINUS\n");
    }
"*=" {fprintf(yyout,"ASSIGN_MULTIPLY\n");
    }
"/=" {fprintf(yyout,"ASSIGN_DIVIDE\n");
    }
"%=" {fprintf(yyout,"ASSIGN_MOD\n");
    }
"," {fprintf(yyout,"COMMA\n");
    }
"//" {fprintf(yyout,"COMMENT\n");
    }
"&&" {fprintf(yyout,"DAND\n");
    }
"/" {fprintf(yyout,"DIVIDE\n");
    }
"||" {fprintf(yyout,"DOR\n");
    }
"==" {fprintf(yyout,"DEQ\n");
    }
">=" {fprintf(yyout,"GEQ\n");
    }
">" {fprintf(yyout,"GT\n");
    }
"[" {fprintf(yyout,"LBRACKET\n");
    }
"<=" {fprintf(yyout,"LEQ\n");
    }
"{" {fprintf(yyout,"LCURLY\n");
    }
"(" {fprintf(yyout,"LPAREN\n");
    }
"<" {fprintf(yyout,"LT\n");
    }
"-" {fprintf(yyout,"MINUS\n");
    }
"--" {fprintf(yyout,"DECREMENT\n");
    }    
"%" {fprintf(yyout,"MOD\n");
    }
"*" {fprintf(yyout,"MULTIPLY\n");
    }
"!=" {fprintf(yyout,"NE\n");
    }
"!" {fprintf(yyout,"NOT\n");
    }
"." {fprintf(yyout,"PERIOD\n");
    }
"+" {fprintf(yyout,"PLUS\n");
    }
"++" {fprintf(yyout,"INCREMENT\n");
    }
"]" {fprintf(yyout,"RBRACKET\n");
    }
"}" {fprintf(yyout,"RCURLY\n");
    }
")" {fprintf(yyout,"RPAREN\n");
    }
";" {fprintf(yyout,"SEMI\n");
    }

([0-9]*\.[0-9]*[d][+-][0-9]*)|([0-9]*\.[0-9]*) {fprintf(yyout,"DCONSTANT\n"); 
    }
    
([a-zA-Z|_|$][a-zA-Z0-9|_|$]){0,31} {fwrite("IDENTIFIER\n",1,sizeof("IDENTIFIER\n"),yyout);
    }
(\"(\\n|.)*\") {fprintf(yyout,"SCONSTANT\n");
    }
([0-9])+ {fprintf(yyout,"ICONSTANT\n"); 
    }
%%

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
