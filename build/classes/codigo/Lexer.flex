package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
if | else | while | switch | cout | cin | do | for | include | define | struct | public | private | class | return | break | exit {lexeme=yytext(); return Reservadas;}
int | float | string | enum | double | boolean | char {lexeme=yytext(); return TipoDato;}
"+" | "-" | "*" | "/" {lexeme=yytext(); return OperadoresAritmeticos;}
"<" | ">" | "==" | "<=" | ">=" | "!=" {lexeme=yytext(); return OperadoresRelacionales;}
{espacio} {/*Ignore*/}
"//" {lexeme=yytext(); return Comentario;}
"=" {lexeme=yytext(); return Igual;}
"." {lexeme=yytext(); return Punto;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
