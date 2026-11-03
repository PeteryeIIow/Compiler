
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

/* Valores semânticos dos tokens */

%union {
    int ival;
    char *sval;
}

/* Declaração dos tokens */

%token <ival> NUM
%token <sval> ID
%token INVALID

/* Libertar identificadores descartados em caso de erro */

%destructor { free($$); } <sval>

%%

/* Gramática */

program:
      items
      {
          printf("Programa valido!\n");
      }
    ;

items:
      item
    | items item
    ;

item:
      NUM
      {
          printf("NUM(%d)\n", $1);
      }
    | ID
      {
          printf("ID(%s)\n", $1);
          free($1);
      }
    ;

%%

/* Tratamento de erros sintaticos */

void yyerror(const char *s)
{
    fprintf(stderr, "Erro sintatico: %s\n", s);
}

