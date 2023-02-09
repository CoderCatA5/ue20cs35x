%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	void yyerror(const char*); // error handling function
	int yylex(); // declare the function performing lexical analysis
	extern int yylineno; // track the line number
	extern char* yytext;
	int err = 0;
%}

%token T_INT T_CHAR T_DOUBLE T_ID T_FLOAT T_PRINTF T_SCANF T_VOID T_RETURN T_IF T_WHILE T_FOR T_ELSE T_INCLUDE T_TRUE T_FALSE T_NUMBER T_FLOAT_NUM T_UNARY T_LE T_GE T_EQ T_NE T_GT T_LT T_AND T_OR T_ADD T_SUBTRACT T_DIVIDE T_MULTIPLY T_STR T_CHARACTER


%start START

%%
START : PROG { if(err==0) {printf("Valid syntax\n"); YYACCEPT;} }	
        ;					


	  
PROG: headers main '(' ')' '{' body return '}'
| error ';' PROG
;

headers: headers T_STR
| T_INCLUDE
;

main: datatype T_ID
;

datatype: T_INT 
| T_FLOAT 
| T_CHAR
| T_VOID
;

body: T_FOR '(' statement ';' condition ';' statement ')' '{' body '}'
| T_IF '(' condition ')' '{' body '}'
| T_IF '(' condition ')' '{' body '}' else
| statement ';' 
| body ';'
| T_PRINTF '(' T_STR ')' ';'
| T_SCANF '(' T_STR ',' '&' T_ID ')' ';'
;

else: T_ELSE '{' body '}'
;

condition: value relop value 
| T_TRUE 
| T_FALSE
;

statement: datatype T_ID init 
| T_ID '=' expression 
| T_ID relop expression
| T_ID T_UNARY 
| T_UNARY T_ID
|
;

init: '=' value 
|
;

expression: expression arithmetic expression
| value
|
;

arithmetic: T_ADD 
| T_SUBTRACT 
| T_MULTIPLY
| T_DIVIDE
;

relop: T_LT
| T_GT
| T_LE
| T_GE
| T_EQ
| T_NE
;

value: T_NUMBER
| T_FLOAT_NUM
| T_CHARACTER
| T_ID
;

return: T_RETURN value ';' 
;

%%


void yyerror(const char* s)
{
	printf("Error: %s,line number: %d,token: %s\n",s,yylineno,yytext);
	err = 1; 
}


int main(int argc, char* argv[])
{
	yyparse();
	return 0;

}
