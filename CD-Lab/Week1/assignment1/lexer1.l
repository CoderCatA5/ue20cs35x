%{
    #define YYSTYPE char*
    #include "y.tab.h"
    #include <stdio.h>
    extern void yyerror(const char*); 
    int yylineno;
%}

/* Regular definitions */
digit	[0-9]
letter	[a-zA-Z]
id	({letter}|_)({letter}|{digit}|_)*
unary	"++"|"--"
%%
\/\/(.*) ; // ignore comments
[\f\r\t ] ; // ignore whitespaces
\n		{ ++yylineno;}
"int" 		{ return T_INT;}
"char"		{ return T_CHAR;}
"double"	{ return T_DOUBLE;}
"float"		{ return T_FLOAT;}
"printf"	{ return T_PRINTF;}
"scanf"		{ return T_SCANF;}
"void"		{ return T_VOID;}
"return"	{ return T_RETURN;}
"if"		{ return T_IF;}
"while"		{ return T_WHILE;}
"for"		{ return T_FOR;}
"else"		{ return T_ELSE;}
^"#include"[ ]*<.+\.h>      { return T_INCLUDE; }
"true"                      { return T_TRUE; }
"false"                     { return T_FALSE; }
[-]?{digit}+                { return T_NUMBER; }
[-]?{digit}+\.{digit}{1,6}  { return T_FLOAT_NUM; }
{id}		   { return T_ID; }
{unary}                     { return T_UNARY; }
"<="                        { return T_LE; }
">="                        { return T_GE; }
"=="                        { return T_EQ; }
"!="                        { return T_NE; }
">"	                    { return T_GT; }
"<"	                    { return T_LT; }
"&&"	                    { return T_AND; }
"||"	                    { return T_OR; }
"+"                         { return T_ADD; }
"-"                         { return T_SUBTRACT; }
"/"                         { return T_DIVIDE; }
"*"                         { return T_MULTIPLY; }
","         	            {return *yytext;}
";"         	            {return *yytext;}
\/\/(.*) ; 
[\f\r\t ] ; 
\n		            {++yylineno;}
.	                    { return *yytext; }
["].*["]                    { return T_STR; }
['].[']                     { return T_CHARACTER; }
","         	            {return *yytext;}
";"         	            {return *yytext;}
.		            {yyerror("Unrecognized token");}

%%
int yywrap()
{
    return(1);
}
