%{
#include <iostream>
#include "flexing.h"
#include <FlexLexer.h>

using std::cerr;
using std::cout;
using std::endl;

extern yyFlexLexer *scanner;

#define yylex() scanner->yylex()

%}
%union { }

//this is all we need for now
%token program identifier function print_integer print_string
%token vardec exp name
%token INTEGER ASSIGN DCONSTANT SCONSTANT
%token LPAREN RPAREN SEMI LBRACKET RBRACKET

%%
// program contains elements
program: name elements { $$ = $1; cout << "Start of program"; }

//elements contains a variable declaration or expression
elements: vardec { $$ = $1; }
            | exp SEMI { $$ = $1; }
            | function integer identifier LPAREN RPAREN {$$ = $3; cout << "Function declaration";}

//variable declarations. we dont need to do more than this
vardec: integer identifier SEMI {  $$ = $1; cout << "Declared variable";}

//expressions, we are only doing the ones in the example
exp: DCONSTANT { $$ = $1; cout << "A number "}
    | SCONSTANT { $$ = $1; cout << "A string "; }
    | exp ASSIGN exp { $$ = ($1 = $3); cout << "Variable assigned "; }
    | print_integer exp {$$ = $2; }
    | print_string exp {$$ = $2; }
    | LPAREN exp RPAREN {$$ = $2;}


//this will be used later for syntax stuff most likely
multibrackets: LBRACKET RBRACKET {cout << "Body";}
    | multibrackets LBRACKET RBRACKET {cout << "Nested body";}
}

%%
