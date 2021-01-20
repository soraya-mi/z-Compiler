%{
#include<stdio.h>
#include <string.h>
%}
/*regular expression*/
letter [a-zA-Z]
digit [0-9]
id {letter}({letter}|{digit})*
digits {digit}{digit}*
number {digits}+(\.{digit}+)?(E[+-]?{digit}+)?
string ["](([\\]["])|([^"]))*["]
comment ("##"(.)*)|("/#"(.|{delim})*+"#/")
delim [ \t\n]
ws {delim}*
%%
{ws} {/* no action*/}
{comment} {/* no action*/}
bool|break|case|char|const|continue|default|double|else|false|function|float|for|if|input|output|int|return|static|string|switch|true|type {printf("%s is a KEYWORD\n",yytext);} 
{number} {printf("%s is a NUMBER\n",yytext);}
{string} {printf("%s is a STRING\n",yytext);}
{id} {printf("%s is a IDENTIFIER\n",yytext);}
"+"|"-"|"/"|"*" {printf("%s is a ARITHMETIC OPERATOR\n",yytext);}
">="|"<="|"=="|"<>"|"<"|">" {printf("%s is a RELATIONAL OPERATOR\n",yytext);}
"=" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"++" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"--" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"&&" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"&" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"||" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"|" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"}" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"{" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
")" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"(" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
";" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"," {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
"!" {printf("%s is a ASSIGNMENT OPERATOR\n",yytext);}
%%
int main(int argc,char**argv){
printf("Z++ compiler:\n");
FILE *file=fopen("test.z++", "r");
//if(!file)
/*{
printf("couldnt open %s \n",argv[1]);
exit(0);
}*/
yyin=file;
yylex();
//fclose(yyin);
return(0);
}
int yywrap()
{
return 1;
}

