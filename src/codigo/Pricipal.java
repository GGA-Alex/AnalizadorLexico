
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Pricipal {
    public static void main(String[] args) throws Exception {
        String ruta1 = "D:/JAVA/auf/Analizado-Lexico/src/codigo/Lexer.flex";
        String ruta2 = "D:/JAVA/auf/Analizado-Lexico/src/codigo/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax","D:/JAVA/auf/Analizado-Lexico/src/codigo/Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("D:/JAVA/auf/Analizado-Lexico/src/codigo/sym.java");
        if(Files.exists(rutaSym)){
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("D:/JAVA/auf/Analizado-Lexico/sym.java"), 
                Paths.get("D:/JAVA/auf/Analizado-Lexico/src/codigo/sym.java")
        );
        
        Path rutaSin = Paths.get("D:/JAVA/auf/Analizado-Lexico/src/codigo/sintax.java");
        if(Files.exists(rutaSin)){
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("D:/JAVA/auf/Analizado-Lexico/Sintax.java"), 
                Paths.get("D:/JAVA/auf/Analizado-Lexico/src/codigo/Sintax.java")
        );
    }
}