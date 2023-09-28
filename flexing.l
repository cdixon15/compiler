%{
#include "flexing.h"
#include <stdio.h>
#include <string.h>
%}

%%
[ \n\t\r]+ {}
"do" {printf("K_DO\n",);
    }
"double" {printf("K_DOUBLE\n");
    }
"else" {printf("K_ELSE\n");
    }
"exit" {printf("K_EXIT\n");
    }
"function" {printf("K_FUNCTION\n");
    }
"if" {printf("K_IF\n");
    }
"integer" {printf("K_INTEGER\n");
    }
"print_double" {printf("K_PRINT_DOUBLE\n");
    }
"print_integer" {printf("K_PRINT_INTEGER\n");
    }
"print_string" {printf("K_PRINT_STRING\n");
    }
"procedure" {printf("K_PROCEDURE\n");
    }
"program" {printf("K_PROGRAM\n");
    }
"read_double" {printf("K_READ_DOUBLE\n");
    }
"read_integer" {printf("K_READ_INTEGER\n");
    }
"read_string" {printf("K_READ_STRING\n");
    }
"return" {printf("K_RETURN\n");
    }
"string" {printf("K_STRING\n");
    }
"then" {printf("K_THEN\n");
    }
"while" {printf("K_WHILE\n");
    }
":=" {printf("ASSIGN\n");
    }
"+=" {printf("ASSIGN_PLUS\n");
    }
"-=" {printf("ASSIGN_MINUS\n");
    }
"*=" {printf("ASSIGN_MULTIPLY\n");
    }
"/=" {printf("ASSIGN_DIVIDE\n");
    }
"%=" {printf("ASSIGN_MOD\n");
    }
"," {printf("COMMA\n");
    }
(\/\/.*)[\n] {printf("COMMENT\n"); //comments include newlines
    }
"&&" {printf("DAND\n");
    }
"/" {printf("DIVIDE\n");
    }
"||" {printf("DOR\n");
    }
"==" {printf("DEQ\n");
    }
">=" {printf("GEQ\n");
    }
">" {printf("GT\n");
    }
"[" {printf("LBRACKET\n");
    }
"<=" {printf("LEQ\n");
    }
"{" {printf("LCURLY\n");
    }
"(" {printf("LPAREN\n");
    }
"<" {printf("LT\n");
    }
"-" {printf("MINUS\n");
    }
"--" {printf("DECREMENT\n");
    }    
"%" {printf("MOD\n");
    }
"*" {printf("MULTIPLY\n");
    }
"!=" {printf("NE\n");
    }
"!" {printf("NOT\n");
    }
"." {printf("PERIOD\n");
    }
"+" {printf("PLUS\n");
    }
"++" {printf("INCREMENT\n");
    }
"]" {printf("RBRACKET\n");
    }
"}" {printf("RCURLY\n");
    }
")" {printf("RPAREN\n");
    }
";" {printf("SEMI\n");
    }

([0-9]*\.[0-9]*[d][+-][0-9]*)|([0-9]*\.[0-9]*) {printf("DCONSTANT\n"); 
    }
    
([a-zA-Z|_|$][a-zA-Z0-9|_|$]){0,31} {fwrite("IDENTIFIER\n",1,sizeof("IDENTIFIER\n"),yyout);
    }
(\"(\\n|.)*\") {printf("SCONSTANT\n");
    }
([0-9])+ {printf("ICONSTANT\n"); 
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
