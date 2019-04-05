package models;

import java.util.ArrayList;
import java.util.List;
import util.Mensajes;

/**
 *
 * @author Juan Pablo
 */
public class Estudiante extends Persona {

    private List<Matricula> matriculas;

    public Estudiante(String nombre, long identificacion, String correo, String clave) {
        super(nombre, identificacion, correo, clave);
        this.matriculas = new ArrayList<Matricula>();
    }

    public Estudiante() {
    }

    public List<Matricula> getMatriculas() {
        return matriculas;
    }

    public void setMatriculas(List<Matricula> matriculas) {
        if (matriculas != null) {
            this.matriculas = matriculas;
        }
    }

    public static String eliminar(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, List<Matricula> matriculas, List<Nota> notas, long identificacion) {
        Matricula.eliminarPorEstudiante(matriculas, notas, identificacion);
        return Persona.eliminar(personas, estudiantes, profesores, identificacion);
    }

    public static String eliminar(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, List<Matricula> matriculas, List<Nota> notas, String correo) {
        Persona est = Persona.buscarPersona(personas, estudiantes, profesores, correo);
        Matricula.eliminarPorEstudiante(matriculas, notas, est.getIdentificacion());
        return Persona.eliminar(personas, estudiantes, profesores, correo);
    }

    public static ArrayList<Matricula> VanPerdiendo(List<Materia> materias) {
        ArrayList<Matricula> retorno = new ArrayList<>();
        for (Materia materia : materias) {
            for (Grupo grupo : materia.getGrupos()) {
                for (Matricula matricula : grupo.getMatriculas()) {
                    if (matricula.getNotaFinal() < 3 && matricula.porcentajeDeAvance() > 0) {
                        retorno.add(matricula);
                    }
                }
            }
        }
        return retorno;
    }
}
