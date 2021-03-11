%{
#include "y.tab.h"
%}
num	[0-9]+
id	[a-zA-Z]+
bop	=|<|>|!=|<=|>=|==|&&|"||"|[+-/*]
uop	"++"|"--"
%%
"while"	{return WHILE;}
"for"	{return FOR;}
{bop}	{return BOP;}
{uop}	{return UOP;}
{num}	{return NUMBER;}
{id}	{return ID;}
[ \n\t]	; 
.	{return *yytext;}
%%
int yywrap(){return 1;}
