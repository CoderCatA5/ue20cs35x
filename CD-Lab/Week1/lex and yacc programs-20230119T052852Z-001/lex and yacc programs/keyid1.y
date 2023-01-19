%{
	#include<stdio.h>
	int yylex();
	void yyerror(const char *s);
%}

%token ID INT FLOAT CHAR

%% 

Prog	: Decl {printf("Valid syntax!");}
	;
Decl	: Type ListVar ';'
	;
Type	: INT
	| FLOAT
	| CHAR
	;
ListVar	: ID
	| ListVar ',' ID
	;

%%
void yyerror(const char *s)
{
	printf("%s\n", s);
}
int main()
{
	yyparse();
	return 0;
}