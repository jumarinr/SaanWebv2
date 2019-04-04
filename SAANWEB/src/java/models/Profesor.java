package models;

import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import util.EnvioDeCorreo;

/**
 *
 * @author Juan Diego
 */
public class Profesor extends Persona {

    private List<Grupo> grupos;

    public Profesor() {
    }

    public Profesor(String nombre, long identificacion, String correo, String clave) {
        super(nombre, identificacion, correo, clave);
        this.grupos = new ArrayList<Grupo>();
    }

    public List<Grupo> getGrupos() {
        return grupos;
    }

    public void setGrupos(List<Grupo> grupos) {
        if (grupos != null) {
            this.grupos = grupos;
        }
    }

    public static String eliminar(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, long identificacion) {
        Profesor pro = (Profesor) Persona.buscarPersona(personas, estudiantes, profesores, identificacion);
        if (pro != null) {
            if (pro.getGrupos().size() > 0) {
                return "No se puede eliminar al profesor, ya que tiene grupos en los que enseña";
            }
        }
        return Persona.eliminar(personas, estudiantes, profesores, identificacion);
    }

    public static void encontrarCorreosYEnviar(ArrayList<Matricula> matriculas, Integer grupo, Integer Materia, String Fecha, String name, String Detalle) {
        String asunto = "Correo creado " + Fecha + ". Con detalles: " + Detalle + ". ID materia: " + Materia + ". Num grupo: " + grupo + ".";
        matriculas.forEach((t) -> {
                EnvioDeCorreo.EnvioDeMail(t.getEstudiante().getCorreo(), name, asunto);
            });
    }
}
