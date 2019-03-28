/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import UpperEssential.UpperEssentialLookAndFeel;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author Juan Pablo
 */
public class extra {

    public static boolean isInteger(String dato) {
        try {
            Long.parseLong(dato);
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public static boolean esEmailCorrecto(String email) {
        Pattern pattern = Pattern
                .compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

        Matcher mather = pattern.matcher(email);

        if (mather.find() == true) {
            return true;
        }
        return false;
    }
    
    public static void AplicarLookAndFeel(){
        try {
            UIManager.setLookAndFeel(new UpperEssentialLookAndFeel());
        } catch (UnsupportedLookAndFeelException e) {
            e.printStackTrace();
        }
    }

}
