%{
#include <stdio.h>
#include <ctype.h>

extern int yylex();
extern void yyerror(char *e);
%}

%token NUM
%left '+' '-'
%left '*' '/' '%'


%%

stmnt:
	 | stmnt line 
	 ;

line : expr   { printf("%d\n", $1); ;}
	 | error  { yyerrok; }
	 | '\n'
	 ;

expr : expr '+' expr  { $$ = $1 + $3; }
 	 | expr '-' expr  { $$ = $1 - $3; }
	 | expr '*' expr  { $$ = $1 * $3; }
	 | expr '%' expr  { $$ = $1 % $3; }
	 | expr '/' expr  { $$ = $1 / $3; }
	 | '(' expr ')'   { $$ = $2; }
	 | NUM            { $$ = $1; }
	 ; 
%%


void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main(int argc, char **argv)
{
	yyparse();
	return 0;
}

