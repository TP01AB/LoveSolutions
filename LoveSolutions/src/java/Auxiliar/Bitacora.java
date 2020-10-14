
package Auxiliar;

import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author isra9
 */
public class Bitacora {
    
    public static void escribirBitacora(String m) {
        FileWriter fw = null;
        System.out.println(m);
        try {
            fw = new FileWriter(Constantes.ficheroBitacora, true);
            fw.write(m+"\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
}
