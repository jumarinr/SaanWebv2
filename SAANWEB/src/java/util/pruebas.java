/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.swing.JOptionPane;
import models.Estudiante;
import models.Grupo;
import models.Materia;
import models.Matricula;
import models.Nota;
import models.Profesor;

/**
 *
 * @author Juan Pablo
 */
public class pruebas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Matricula ma = new Matricula(2, new Estudiante("juan moya", 123,
                "jmoy@de.com", "000"), new Grupo(1, new Profesor("Jose",
                345, "ded@df.com", "111"), new Materia(1, "cal", 4)));
        ma.getNotas().add(new Nota(30, 5, 2, ma));
        ma.getNotas().add(new Nota(30, 4, 1, ma));
        ma.getNotas().add(new Nota(30, 3, 3, ma));
        ma.getNotas().add(new Nota(10, 0.2, 4, ma));
        System.out.println(ma.getNotaFinal());
    }

}
