/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calculadora;

import java.io.File; //Como usamos new File() ocupamos importar esta librería

/**
 *
 * @author ProteusGateway
 */
public class Compilaflex {

    public static void main(String[] args) {
        // TODO code application logic here
        JFlex.Main.generate(new File("src\\calculadora\\esplex.flex"));
    }
}
