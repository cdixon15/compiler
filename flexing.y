%{
#include <iostream>
#include "flexing.h"
#include <FlexLexer.h>

int yyerror(char *s);
int nodeid=1;

using std::cerr;
using std::cout;
using std::endl;

extern yyFlexLexer *scanner;

#define yylex() scanner->yylex()

%}

%union{
	char name[32];
    int ival;
	struct Variable{
		int iVar;
		float fVar;
	} nvariable;

}


%token  K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE
%token K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE
%token ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD
%token COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY
%token NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER SCONSTANT

%token <nvariable> DCONSTANT ICONSTANT

%type <name> SCONSTANT
%type <name> IDENTIFIER

%%
prog:
	K_PROGRAM IDENTIFIER RCURLY function LCURLY
	| {
		printf("**Node %d : Program Start", nodeid);
	  }

;

function:
    K_FUNCTION K_INTEGER IDENTIFIER LPAREN RPAREN LCURLY statements RCURLY{
        printf("**Node %d : Reduced: function integer IDENTIFIER (){ STATEMENTS }")
        printf()
    }
;
statements:
	| statement SEMI statements
;

statement:
	K_INTEGER IDENTIFIER SEMI
	  {
        printf("**Node %d : Integer %s declared",nodeid, $2);
	  }
	| IDENTIFIER ASSIGN ICONSTANT
	  {
		printf("**Node %d : %s assigned to %s",nodeid,$1,$3);
	  }
	| K_PRINT_INTEGER RPAREN IDENTIFIER LPAREN SEMI 
	{
		printf("**Node %d : Integer %s printed",nodeid, $3);
	}
    | K_PRINT_STRING LPAREN SCONSTANT RPAREN SEMI
    {
        printf("**Node %d : string %s printed",nodeid,$3);
    }

;
/*
// program contains elements
prog: 
    K_PROGRAM IDENTIFIER LCURLY elements RCURLY{ 
        $$ = $1;
        cout << "Start of program"; 
    }
    | {
        cout<<"Parsing Error";
    }
;
//elements contains one or many element or is empty
elements: 
    | element SEMI element
;
//an element contain a variable declaration or expression
element: 
    vardec { $$ = $1; cout<< "variable declared"}
    | functiondec { $$ = $1; cout<<"function declared"}
    | exp {$$ = $3; cout << "Expression";}
;
//variable declarations. we dont need to do more than this
vardec: K_INTEGER IDENTIFIER SEMI {  $$ = $1; cout << "Declared variable";}
;

//function declaration
functiondec: K_FUNCTION K_INTEGER IDENTIFIER LPAREN RPAREN LCURLY elements RCURLY {$$ = $1; cout << "Declared function"; }
;
//expressions, we are only doing the ones in the example
exp: DCONSTANT { $$ = $1; cout << "A number "}
    | SCONSTANT { $$ = $1; cout << "A string "; }
    | exp ASSIGN exp { $$ = ($1 = $3); cout << "Variable assigned "; }
    | K_PRINT_INTEGER exp {$$ = $2; }
    | K_PRINT_STRING exp {$$ = $2; }
    | LPAREN exp RPAREN {$$ = $2;}

;
//this will be used later for syntax stuff most likely
multibrackets: LBRACKET RBRACKET {cout << "Body";}
    | multibrackets LBRACKET RBRACKET {cout << "Nested body";}

;
*/

%%
