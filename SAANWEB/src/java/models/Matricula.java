/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import util.Mensajes;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Juan Pablo
 */
public class Matricula {

    private double notaFinal;
    private int semestre;
    private Estudiante estudiante;
    private Grupo grupo;
    private List<Nota> notas;

    public Matricula() {
    }

    public Matricula(int semestre, Estudiante estudiante, Grupo grupo) {
        this.setSemestre(semestre);
        this.setEstudiante(estudiante);
        this.setGrupo(grupo);
        this.setNotaFinal(0.0);
        this.notas = new ArrayList<Nota>();
    }

    public double getNotaFinal() {
        double not;
        not = 0;
        for (Nota nota : this.getNotas()) {
            not += (nota.getValor() * nota.getPorcentaje()) / 100;
        }
        not = Double.parseDouble(String.format("%.2f", not));
        this.notaFinal = not;
        return notaFinal;
    }

    public void setNotaFinal(double notaFinal) {
        if (notaFinal >= 0) {
            this.notaFinal = notaFinal;
        }
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        if (semestre > 0) {
            this.semestre = semestre;
        }
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        if (estudiante != null) {
            this.estudiante = estudiante;
        }
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        if (grupo != null) {
            this.grupo = grupo;
        }
    }

    public List<Nota> getNotas() {
        return notas;
    }

    public void setNotas(List<Nota> notas) {
        if (notas != null) {
            this.notas = notas;
        }
    }

    public static Matricula buscar_matricula(List<Matricula> matriculas, long id_estudiante, int id_materia) {
        for (Matricula ma : matriculas) {
            Grupo gr = ma.getGrupo();
            if (ma.getEstudiante().getIdentificacion() == id_estudiante
                    && gr.getMateria().getId() == id_materia) {
                return ma;
            }
        }
        return null;
    }

    public static String matricular(List<Matricula> matriculas, Matricula matr) {
        Grupo gr = matr.getGrupo();
        if (Matricula.buscar_matricula(matriculas, matr.getEstudiante().getIdentificacion(),
                gr.getMateria().getId()) != null) {
            return Mensajes.mensaje.get("err");
        }
        if (matr.getEstudiante() == null || matr.getGrupo() == null
                || matr.getSemestre() <= 0) {
            return Mensajes.mensaje.get("err");
        }
        matriculas.add(matr);
        matr.getGrupo().getMatriculas().add(matr);
        matr.getEstudiante().getMatriculas().add(matr);
        return Mensajes.mensaje.get("err");
    }

    public static String cancelar(List<Matricula> matriculas, List<Nota> notas, long id_estudiante, int id_materia) {
        Matricula mat = Matricula.buscar_matricula(matriculas, id_estudiante, id_materia);
        if (mat != null) {
            mat.getGrupo().getMatriculas().remove(mat);
            mat.getEstudiante().getMatriculas().remove(mat);
            for (Nota nota : mat.getNotas()) {
                notas.remove(nota);
            }
            mat.getGrupo().getMatriculas().remove(mat);
            mat.getEstudiante().getMatriculas().remove(mat);
            matriculas.remove(mat);
            return Mensajes.mensaje.get("eli");
        }
        return Mensajes.mensaje.get("err");
    }

    public static void eliminarPorGrupo(List<Matricula> matriculas, List<Nota> notas, int num_grupo, int id_materia) {
        int bor = 0;
        for (int i = 0; i < matriculas.size(); i++) {
            Matricula mat = matriculas.get(i-bor);
            if (mat.getGrupo().getNumero() == num_grupo
                    && mat.getGrupo().getMateria().getId() == id_materia) {
                Matricula.cancelar(matriculas, notas, mat.getEstudiante().getIdentificacion(), id_materia);
                bor++;
            }
        }
    }

    public static void eliminarPorEstudiante(List<Matricula> matriculas, List<Nota> notas, long identificacion) {
        int bor = 0;
        for (int i = 0; i < matriculas.size(); i++) {
            Matricula mat = matriculas.get(i-bor);
            if (mat.getEstudiante().getIdentificacion() == identificacion) {
                Matricula.cancelar(matriculas, notas, identificacion, mat.getGrupo().getMateria().getId());
                bor++;
            }
        }
    }
}
