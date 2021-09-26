package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Gato */
( "#" ) {lexeme=yytext(); return Gato;}

/* Dos Puntos */
( ":" ) {lexeme=yytext(); return Dos_puntos;}

/* Ampersand */
( "&" ) {lexeme=yytext(); return Ampersand;}

/* Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Punto */
( "." ) {lexeme=yytext(); return Punto;}

/* h */
( "h" ) {lexeme=yytext(); return H;}

/* Flecha */
( "->" ) {lexeme=yytext(); return Flecha;}

/* Simbolo "<<" */
( "<<" ) {lexeme=yytext(); return Simbolo_cout;}

/* Simbolo ">>" */
( ">>" ) {lexeme=yytext(); return Simbolo_cin;}

/* Tipos de datos */
( byte | char | long | float | double | enum | size_t) {lexeme=yytext(); return T_dato;}

/* Tipo de dato Int*/
( int ) {lexeme=yytext(); return Entero;}

/* Tipo de dato String */
( string ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada This */
( this ) {lexeme=yytext(); return This;}

/* Palabra reservada Const */
( const ) {lexeme=yytext(); return Const;}

/* Palabra reservada Return */
( return ) {lexeme=yytext(); return Return;}

/* Palabra reservada Cin */
( cin ) {lexeme=yytext(); return Cin;}

/* Palabra reservada Cout */
( cout ) {lexeme=yytext(); return Cout;}

/* Palabra reservada Endl */
( endl ) {lexeme=yytext(); return Endl;}

/* Palabras reservadas Especificadores */
( public | private | protected ) {lexeme=yytext(); return Especificador;}

/* Palabra reservada Class */
( class ) {lexeme=yytext(); return Class;}

/* Palabra reservada Void */
( void ) {lexeme=yytext(); return Void;}

/* Palabra reservada Include */
( include ) {lexeme=yytext(); return Include;}

/* Palabra reservada using */
( using ) {lexeme=yytext(); return Using;}

/* Palabra reservada Namespace */
( namespace ) {lexeme=yytext(); return Namespace;}

/* Palabra reservada std */
( std ) {lexeme=yytext(); return Std;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operadores aritmeticos */
( "+" | "-" | "/" | % ) {lexeme=yytext(); return Op_aritmetico;}

/* Operadores logicos */
( "&&" | "||") {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( "==" | "!=" | ">=" | "<=") {lexeme = yytext(); return Op_relacional;}

/*Operador Relacionales */
( "<") {lexeme = yytext(); return ParentesisAngular_a;}

/*Operador Relacionales */
( ">") {lexeme = yytext(); return ParentesisAngular_c;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}