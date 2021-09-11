
package codigo;

import java.io.File;

public class Pricipal {
    public static void main(String[] args) {
        String ruta = "D:/JAVA/auf/Analizado-Lexico/src/codigo/Lexer.flex";
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}