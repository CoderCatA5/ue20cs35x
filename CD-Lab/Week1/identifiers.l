digit [0-9]
letter [_A-Za-z]

%{
    #include <stdio.h>
%}

%%
{letter}({letter}|{digit})*