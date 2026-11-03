%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap
%option yylineno

%option noinput nounput

alpha [_a-zA-Z]
digit [0-9]

%%

[ \t\n\r]+ {
    /* Ignorar espaços em branco */
}

{alpha}({alpha}|{digit})* {
    yylval.sval = strdup(yytext);
    return ID;
}

{digit}+ {
    yylval.ival = atoi(yytext);
    return NUM;
}

. {
    fprintf(stderr,
            "Erro lexical na linha %d: caracter '%s'\n",
            yylineno, yytext);
    return INVALID;
}

%%
