%{
#include<stdio.h>
#include<stdlib.h>
//extern int yyparse();
extern FILE *yyin;
//void yyerrok(const char *s);
%}
%token  BOOLEAN
%token  BREAK
%token  CASE
%token  CHAR
%token  CONSTATNT
%token  CONTINUE
%token  DEFAULT
%token  DOUBLE
%token  ELSE
%token   FALSE
%token  FUNCTION
%token  FLOAT
%token   FOR
%token  IF
%token  INPUT
%token  OUTPUT
%token  INT
%token RETURN
%token STATIC
%token STRING
%token SWITCH
%token TRUE
%token TYPE
%token NUMBER
%token ID
%token ARITHMETICOPERATOR
%token RELATIONALOPERATOR
%token ASSIGNMENTOPERATOR
%token INCREMENTOPERATOR
%token DECREMENTOPERATOR
%token LOGICALANDOPERATOR
%token BITWISEANDOPERATOR
%token BITWISEOROPERATOR
%token LOGICALOROPERATOR
%token BraceCLOSE
%token BraceOPEN
%token ParentheseCLOSE
%token ParentheseOPEN
%token SEMICOLON
%token COLON
%token BracetCLOSE
%token BracetOPEN
%token COMMO
%token LOGICALOPERATOR
%token REMAINEDEDOPERATOR
%start program
%%
program :                    
        | func_def program   
        ;

func_def : FUNCTION ID COLON inout block
         ;


inout    :
         | input_list
         | output_list
         | input_list output_list
         ;
input_list : INPUT params
           ;

output_list : OUTPUT params
            ;

block : BraceOPEN  A BraceCLOSE
      ;


A: A A
 | var_dcl
 | statement
 | 
 ;

var_dcl : B type var_del_cnt C
        ;
B : CONSTATNT
  |
  ;
C :COMMO var_del_cnt C
  | 
  ;

type : INT
     | BOOLEAN
     | FLOAT
     | CHAR
     | DOUBLE
     | ID
     | STRING
     | type BracetOPEN BracetCLOSE
     ;

var_del_cnt : variable ASSIGNMENTOPERATOR expr
            | variable
            ;

statement : assignment SEMICOLON
          | func_call SEMICOLON
          | cond_stmt
          | loop_stmt
          | RETURN SEMICOLON
          | expr SEMICOLON
          | BREAK SEMICOLON
          |CONTINUE SEMICOLON
          ;

assignment : variable ASSIGNMENTOPERATOR expr
           | variable D ASSIGNMENTOPERATOR func_call
           ;
D : COMMO variable D
  |
  ;

variable : ID F
         |DECREMENTOPERATOR variable 
         |INCREMENTOPERATOR variable 
         |variable  INCREMENTOPERATOR
         |variable  DECREMENTOPERATOR
         ;
F : NUMBER F
  |
  ;


func_call : ID ParentheseOPEN parameters ParentheseCLOSE
          | ID ParentheseOPEN ParentheseCLOSE
          ;


parameters : variable 
           | variable COMMO parameters 
           ;
		   
		   
params : type ID COMMO params
       | type ID
	   ;


cond_stmt : IF ParentheseOPEN expr ParentheseCLOSE block ELSE block
          | IF ParentheseOPEN expr ParentheseCLOSE block
          | SWITCH ParentheseOPEN ID ParentheseCLOSE COLON BraceOPEN  G DEFAULT COLON block BraceCLOSE
          ;

G : CASE NUMBER COLON block G
  |
  ;

loop_stmt : FOR ParentheseOPEN var_dcl SEMICOLON expr SEMICOLON H ParentheseCLOSE block
          | FOR ParentheseOPEN  expr SEMICOLON H ParentheseCLOSE block
          ;
H :
  | assignment
  | expr
  ;


expr : expr binary_op expr
     | ParentheseOPEN expr ParentheseCLOSE
     | func_call
     | variable
     | const_val
     | '-' expr
     | LOGICALOPERATOR expr
     ;


binary_op : arithmatic
          | conditional
          ;

arithmatic : ARITHMETICOPERATOR
           | LOGICALANDOPERATOR
           | LOGICALOROPERATOR
           | BITWISEANDOPERATOR
           | BITWISEOROPERATOR
           | REMAINEDEDOPERATOR
           ;

conditional : RELATIONALOPERATOR
            ;


const_val : NUMBER
          | TRUE
          | FALSE
          | STRING
          ;


%%


int main(){
FILE *file;
file=fopen("input.z++","r");
if(!file)
{
printf("couldnt open input.z++ \n");
exit(0);
}
yyin=file;
yyparse();
fclose(yyin);
}

/*void yyerrok(const char *s)
{
	printf( "EEK, parse error!  Message: %s" ,s);
	exit(-1);
}*/






