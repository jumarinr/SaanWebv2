package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import util.Mensajes;

/**
 *
 * @author Juan Pablo
 */
public class Grupo {

    private int numero;
    private Profesor profesor;
    private List<Matricula> matriculas;
    private Materia materia;

    public Grupo(int numero, Profesor profesor, Materia materia) {
        this.setNumero(numero);
        this.setProfesor(profesor);
        this.setMateria(materia);
        this.matriculas = new ArrayList<Matricula>();
    }

    public Grupo() {
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        if (numero > 0) {
            this.numero = numero;
        }
    }

    public Profesor getProfesor() {
        return profesor;
    }

    public void setProfesor(Profesor profesor) {
        if (profesor != null) {
            this.profesor = profesor;
        }
    }

    public List<Matricula> getMatriculas() {
        return matriculas;
    }

    public void setMatriculas(List<Matricula> matriculas) {
        if (matriculas != null) {
            this.matriculas = matriculas;
        }
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        if (materia != null) {
            this.materia = materia;
        }
    }

    public static Grupo buscarGrupo(List<Grupo> grupos, int num, int idMateria) {
        for (Grupo grupo : grupos) {
            if (grupo.getNumero() == num && idMateria == grupo.getMateria().getId()) {
                return grupo;
            }
        }
        return null;

    }

    public static String registrar(List<Grupo> grupos, Grupo gr) {
        if (gr.getMateria() != null) {
            if (gr.buscarGrupo(grupos, gr.getNumero(), gr.getMateria().getId()) != null || gr.getProfesor() == null || gr.getNumero() <= 0) {
                return Mensajes.mensaje.get("err");
            } else {
                grupos.add(gr);
                gr.getMateria().getGrupos().add(gr);
                gr.getProfesor().getGrupos().add(gr);
                return Mensajes.mensaje.get("reg");
            }

        }
        return Mensajes.mensaje.get("err");
    }

    public static String eliminar(List<Grupo> grupos, List<Matricula> matriculas, List<Nota> notas, int num, int idMateria) {
        Grupo grupo = Grupo.buscarGrupo(grupos, num, idMateria);
        if (grupo != null) {
            Matricula.eliminarPorGrupo(matriculas, notas, num, idMateria);
            grupo.getMateria().getGrupos().remove(grupo);
            grupo.getProfesor().getGrupos().remove(grupo);
            grupos.remove(grupo);
            return Mensajes.mensaje.get("eli");
        } else {
            return Mensajes.mensaje.get("err");
        }
    }

    public static void eliminarPorMateria(List<Grupo> grupos, List<Matricula> matriculas, List<Nota> notas, int idMateria) {
        int bor = 0;
        for (int i = 0; i < grupos.size(); i++) {
            Grupo grupo = grupos.get(i - bor);
            if (grupo.getMateria().getId() == idMateria) {
                Grupo.eliminar(grupos, matriculas, notas, grupo.numero, idMateria);
                bor++;
            }
        }
    }

    public static ArrayList<Grupo> mejoresGrupos(List<Materia> materias) {
        ArrayList<Grupo> retorno = new ArrayList<>();
        for (Materia mat : materias) {
            List<Grupo> grupos = mat.getGrupos();
            if (!grupos.isEmpty()) {
                HashMap<Integer, Grupo> promedioPorGrupo = new HashMap<Integer, Grupo>();
                for (Grupo grupo : grupos) {
                    int cont = 0;
                    List<Matricula> matriculas = grupo.getMatriculas();
                    if (!matriculas.isEmpty()) {
                        for (Matricula matricula : matriculas) {
                            List<Nota> notas = matricula.getNotas();
                            int cont2 = 0;
                            if (!notas.isEmpty()) {
                                for (Nota nota : notas) {
                                    cont2 += nota.getValor();
                                }
                            } else {
                                cont2 = 0;
                            }
                            cont += cont2;
                        }
                        promedioPorGrupo.put(cont / matriculas.size(), grupo);
                    } else {
                        promedioPorGrupo.put(0, grupo);
                    }
                }
                int mayor = 0;
                for (Map.Entry<Integer, Grupo> i : promedioPorGrupo.entrySet()) {
                    if (i.getKey() > mayor) {
                        mayor = i.getKey();
                    }
                }
                if (mayor != 0) {
                    retorno.add(promedioPorGrupo.get(mayor));
                }
            }
        }
        return retorno;
    }
}
