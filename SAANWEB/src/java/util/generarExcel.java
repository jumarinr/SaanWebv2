/*

 * To change this license header, choose License Headers in Project Properties.

 * To change this template file, choose Tools | Templates

 * and open the template in the editor.

 */
package util;

import java.awt.Desktop;

import java.io.File;

import java.io.FileOutputStream;

import java.io.IOException;

import java.util.ArrayList;

import java.util.List;

import java.util.TreeSet;

import models.*;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.apache.poi.ss.usermodel.Cell;

import org.apache.poi.ss.usermodel.Row;

import org.apache.poi.ss.usermodel.Sheet;

import org.apache.poi.ss.usermodel.Workbook;

/**
 *
 *
 *
 * @author Juan Pablo
 *
 */
public class generarExcel {

    public static String generarArchivoDeExcel(Materia materia) {

        try {

            /*La ruta donde se creará el archivo*/
            String rutaArchivo = System.getProperty("user.home") + "/notas "
                    + materia.getNombre() + ".xls";

            /*Se crea el objeto de tipo File con la ruta del archivo*/
            File archivoXLS = new File(rutaArchivo);

            /*Si el archivo existe se elimina*/
            if (archivoXLS.exists()) {

                archivoXLS.delete();

            }

            /*Se crea el archivo*/
            archivoXLS.createNewFile();

            /*Se crea el libro de excel usando el objeto de tipo Workbook*/
            Workbook libro = new HSSFWorkbook();

            /*Se inicializa el flujo de datos con el archivo xls*/
            FileOutputStream archivo = new FileOutputStream(archivoXLS);

            for (Grupo grupo : materia.getGrupos()) {

                /*Utilizamos la clase Sheet para crear una nueva hoja de trabajo dentro del libro que creamos anteriormente*/
                Sheet hoja = libro.createSheet("grupo " + grupo.getNumero());

                List<Matricula> matriculas = grupo.getMatriculas();

                Row filaMateria = hoja.createRow(0);

                Cell cm1 = filaMateria.createCell(0);

                cm1.setCellValue("Materia");

                Row filaM2 = hoja.createRow(1);

                Cell cm2 = filaM2.createCell(0);

                cm2.setCellValue("Id");

                Cell cm3 = filaM2.createCell(1);

                cm3.setCellValue(grupo.getMateria().getId());

                Cell cm4 = filaM2.createCell(2);

                cm4.setCellValue("");

                Cell cm5 = filaM2.createCell(3);

                cm5.setCellValue("Nombre");

                Cell cm6 = filaM2.createCell(4);

                cm6.setCellValue(grupo.getMateria().getNombre());

                Row filaProfesor = hoja.createRow(2);

                Cell cp1 = filaProfesor.createCell(0);

                cp1.setCellValue("Profesor");

                Row filaP2 = hoja.createRow(3);

                Cell cp2 = filaP2.createCell(0);

                cp2.setCellValue("Documento");

                Cell cp3 = filaP2.createCell(1);

                cp3.setCellValue(grupo.getProfesor().getIdentificacion());

                Cell cp4 = filaP2.createCell(2);

                cp4.setCellValue("");

                Cell cp5 = filaP2.createCell(3);

                cp5.setCellValue("Nombre");

                Cell cp6 = filaP2.createCell(4);

                cp6.setCellValue(grupo.getProfesor().getNombre());

                if (!matriculas.isEmpty()) {

                    String[] tituloNotas = new String[matriculas.get(0).getNotas().size() + 2];

                    tituloNotas[0] = "Identificación";

                    tituloNotas[1] = "Nombre";

                    for (int i = 0; i < matriculas.get(0).getNotas().size(); i++) {

                        tituloNotas[i + 2] = Integer.toString(matriculas.get(0).getNotas().get(i).getId());

                    }

                    for (int f = 6; f < matriculas.size() + 7; f++) {

                        /*La clase Row nos permitirá crear las filas*/
                        Row fila = hoja.createRow(f);

                        for (int c = 0; c < tituloNotas.length; c++) {

                            /*Creamos la celda a partir de la fila actual*/
                            Cell celda = fila.createCell(c);

                            if (f == 6) {

                                celda.setCellValue(tituloNotas[c]);

                            } else if (c == 0) {

                                celda.setCellValue(matriculas.get(f - 7).getEstudiante().getIdentificacion());

                            } else if (c == 1) {

                                celda.setCellValue(matriculas.get(f - 7).getEstudiante().getNombre());

                            } else {

                                Nota n = Nota.buscarNota(matriculas.get(f - 7).getNotas(),
                                        matriculas.get(f - 7).getEstudiante().getIdentificacion(),
                                        matriculas.get(f - 7).getGrupo().getMateria().getId(),
                                        matriculas.get(f - 7).getGrupo().getNumero(),
                                        Integer.parseInt(tituloNotas[c]));

                                double nota = 0;

                                if (n != null) {

                                    nota = n.getValor();

                                }

                                celda.setCellValue(nota);

                            }

                        }

                    }

                }

            }

            /*Escribimos en el libro*/
            libro.write(archivo);

            /*Cerramos el flujo de datos*/
            archivo.close();

            /*Y abrimos el archivo con la clase Desktop*/
            Desktop.getDesktop().open(archivoXLS);

        } catch (IOException ex) {

        } catch (Exception e) {

        }

        return "Archivo generado";

    }

}
