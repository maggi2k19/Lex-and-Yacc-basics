%{
#include <stdio.h> 
void yyerror(char *);
int yylex();
%}

%token FOR ID BOP UOP NUMBER WHILE 

%%
prg: FOR '(' lexp ';' lexp ';' lexp ')' lbody 	{printf("\nFor\n");}
| WHILE '(' lexp ')' lbody			{printf("\nWhile\n");};

lbody		: 	stmt 
| codeblock 
;

codeblock	:	'{' stmt_list '}'
;

stmt_list	: 	stmt_list stmt
|;

stmt		: 	lexp ';'
;

lexp		: 	fexp 
|;

fexp		: 	fexp ',' exp 
|exp 
|'(' fexp ')' 
;

exp			: 	ID BOP exp 
| ID UOP 
| UOP ID 
| ID 
| NUMBER 
;

%%

void yyerror(char *s){
	printf("\nerror\n");
}

int main(){
	yyparse();
	return 0;
}
