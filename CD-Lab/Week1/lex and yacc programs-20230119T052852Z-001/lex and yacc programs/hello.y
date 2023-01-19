%{

#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(const char *s);

%}

%token HI BYE

%%

program: 
         hi bye
        ;

hi:     
        HI     { printf(" Enter World\n");   }
        ;
bye:    
        BYE    { printf(" Exit World\n"); exit(0); }
         ;
