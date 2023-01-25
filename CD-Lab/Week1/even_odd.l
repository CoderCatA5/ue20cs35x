digit     [0-9]


%{
#include<stdio.h>
%}

%%
{digit}*[13579]  printf("odd");
{digit}*[02468]  printf("even");
%%

int yywrap(){
    return(1);
}
int main(int argc ,char *argv[]){
    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}