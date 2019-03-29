package models;

import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.FileWriter;   // Import the FileWriter class
import java.io.IOException;
import util.Mensajes;

/**
 *
 * @author Juan Pablo
 */
public class Materia {

    private int id;
    private String nombre;
    private int creditos;
    private List<Grupo> grupos;

    public Materia(int id, String nombre, int creditos) {
        this.setId(id);
        this.setNombre(nombre);
        this.setCreditos(creditos);
        this.grupos = new ArrayList<Grupo>();
    }

    public Materia() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        if (id > 0) {
            this.id = id;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        if (!nombre.equals("")) {
            this.nombre = nombre;
        }
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        if (creditos > 0) {
            this.creditos = creditos;
        }
    }

    public List<Grupo> getGrupos() {
        return grupos;
    }

    public void setGrupos(List<Grupo> grupos) {
        if (grupos != null) {
            this.grupos = grupos;
        }
    }

    @Override
    public String toString() {
        return "Materia{" + "id=" + id + ", nombre=" + nombre + ", creditos=" + creditos + ", grupos=" + grupos + '}';
    }

    public static Materia buscarMateria(List<Materia> materias, int id) {
        for (Materia materia : materias) {
            if (materia.getId() == id) {
                return materia;
            }
        }
        return null;
    }

    public static String registrar(List<Materia> materias, Materia materia) {
        if (Materia.buscarMateria(materias, materia.getId()) != null) {
            return Mensajes.mensaje.get("err");
        }
        if (materia.getCreditos() <= 0 || materia.getId() <= 0 || materia.getNombre() == null) {
            return Mensajes.mensaje.get("err");
        }
        materias.add(materia);
        Materia.guardarCambios(materias);
        return Mensajes.mensaje.get("reg");
    }

    public static String eliminar(List<Materia> materias, List<Grupo> grupos,
            List<Matricula> matriculas, List<Nota> notas, int id) {
        Materia materia = Materia.buscarMateria(materias, id);
        if (materia != null) {
            Grupo.eliminarPorMateria(grupos, matriculas, notas, id);
            materias.remove(materia);
            Materia.guardarCambios(materias);
            return Mensajes.mensaje.get("eli");
        }
        return "err";
    }

    public static void cargarMaterias(List<Materia> materias) {
        String inf = "";
        int ini = 0;
        int fin = 0;
        try {
            File file = new File("materias.txt");
            if (!file.exists()) {
                file.createNewFile();
            } else {
                Scanner myReader = new Scanner(file);
                while (myReader.hasNextLine()) {
                    String data = myReader.nextLine();
                    inf += data;
                }
                myReader.close();
            }
        } catch (IOException e) {
            System.out.println("An error occurred.");
        }
        while (inf.indexOf(">", fin + 1) != -1 && fin < inf.length() - 1) {
            ini = inf.indexOf("<", fin);
            fin = inf.indexOf(">", ini);
            String[] mat = inf.substring(ini + 1, fin).split(",");
            Materia.registrar(materias, new Materia(Integer.parseInt(mat[0]), mat[1], Integer.parseInt(mat[2])));
        }
    }

    public static void guardarCambios(List<Materia> materias) {
        try {
            FileWriter file = new FileWriter("materias.txt");
            file.write("");
            for (Materia materia : materias) {
                file.write("<" + Integer.toString(materia.getId()) + "," + materia.getNombre() + "," + Integer.toString(materia.getCreditos()) + ">");
            }
            file.close();
        } catch (IOException e) {
            System.out.println("An error occurred.");
        }
    }
}
