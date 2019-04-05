package models;

import util.EnvioDeCorreo;
import util.Mensajes;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Collections;

public class Nota {

    private double porcentaje;
    private double valor;
    private int id;
    private Matricula matricula;

    public Nota() {
    }

    public Nota(int porcentaje, double valor, int id, Matricula matricula) {
        this.setPorcentaje(porcentaje);
        this.setValor(valor);
        this.setId(id);
        this.setMatricula(matricula);
    }

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        if (porcentaje > 0) {
            this.porcentaje = porcentaje;
        }
    }

    public double getValor() {
        return this.valor;
    }

    public void setValor(double valor) {
        if (valor > 0) {
            this.valor = valor;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        if (id > 0) {
            this.id = id;
        }
    }

    public Matricula getMatricula() {
        return matricula;
    }

    public void setMatricula(Matricula matricula) {
        if (matricula != null) {
            this.matricula = matricula;
        }
    }

    //métodos
    public static Nota buscarNota(List<Nota> notas, long doc_estudiante, int id_materia, int num_grupo, int id) {
        for (Nota nota : notas) {
            if (nota.getMatricula().getEstudiante().getIdentificacion() == doc_estudiante && nota.getMatricula().getGrupo().getNumero() == num_grupo && nota.getMatricula().getGrupo().getMateria().getId() == id_materia && nota.getId() == id) {
                return nota;
            }
        }
        return null;

    }

    public static String registrar(List<Nota> notas, Nota nota) {
        if (Nota.buscarNota(notas, nota.getMatricula().getEstudiante().getIdentificacion(), nota.getMatricula().getGrupo().getNumero(), nota.getMatricula().getGrupo().getMateria().getId(), nota.getId()) != null) {
            return Mensajes.mensaje.get("err");
        } else {
            notas.add(nota);
            nota.getMatricula().getNotas().add(nota);
            return Mensajes.mensaje.get("reg");
        }
    }

    public static String eliminar(List<Nota> notas, long doc_estudiante, int id_materia, int num_grupo, int id) {
        Nota nota = Nota.buscarNota(notas, doc_estudiante, id_materia, num_grupo, id);
        if (nota != null) {
            notas.remove(nota);
            nota.getMatricula().getNotas().remove(nota);
            return Mensajes.mensaje.get("eli");
        }
        return Mensajes.mensaje.get("err");

    }

    public static void enviarCorreoActualizarNota(String opc, int id, double nota, double porcentaje, Estudiante estudiante, Materia materia) {
        String correo_enviar = estudiante.getCorreo();
        String cuerpo = "";
        String asunto = Mensajes.mensaje.get("eliNota");
        if (Mensajes.mensaje.get(opc).equals("borro")) {
            cuerpo = Mensajes.mensaje.get("cuerpo_borro") + id + Mensajes.mensaje.get("cuerpo_borro2") + materia.toString();
        } else {
            cuerpo = Mensajes.mensaje.get("cuerpo_resto") + materia.toString() + Mensajes.mensaje.get("cuerpo_resto2") + String.valueOf(id) + Mensajes.mensaje.get("cuerpo_resto3") + String.valueOf(nota) + Mensajes.mensaje.get("cuerpo_resto4") + String.valueOf(porcentaje) + '%';
            asunto = Mensajes.mensaje.get("asunto") + Mensajes.mensaje.get(opc) + Mensajes.mensaje.get("asunto2");
        }
        EnvioDeCorreo.EnvioDeMail(correo_enviar, asunto, cuerpo);
    }

    public static ArrayList<Nota> MejoresNotas(ArrayList<Matricula> matriculas, int id_materia, int num_grupo) {
        ArrayList<Nota> notas = new ArrayList<Nota>();
        for (Matricula matricula : matriculas) {
            if (matricula.getGrupo().getNumero() == num_grupo && matricula.getGrupo().getMateria().getId() == id_materia) {
                for (Nota n : (ArrayList<Nota>)matricula.getNotas()) {
                    notas.add(n);
                }

            }
        }

        Collections.sort(notas, (o1, o2) -> {
            if (o1.getValor() > o2.getValor())
                return 1;
            if (o1.getValor() < o2.getValor())
                return -1;
            return 0;
        });
        ArrayList<Nota> ol = new ArrayList<Nota>();

        if (notas.size() < 3 && notas.size() > 0) {
            for(int i=notas.size()-1; i>=0; i--){
                ol.add(notas.get(i));
            }
            return ol;
        } else if (notas.size() >= 3) {
            ol.add(notas.get(notas.size()-1));
            ol.add(notas.get(notas.size()-2));
            ol.add(notas.get(notas.size()-3));
            return ol;
        }
        return null;

    }

    public static boolean porcentajeDiferente100(ArrayList<Nota> notas, int id_materia, int num_grupo, int id_estudiante, double porcentaje) {
        double sum = 0;
        for (Nota nota : notas) {
            if (nota.getMatricula().getGrupo().getNumero() == num_grupo && nota.getMatricula().getGrupo().getMateria().getId() == id_materia && nota.getMatricula().getEstudiante().getIdentificacion() == id_estudiante) {
                sum += nota.getPorcentaje();
                System.out.println(nota.getId()+":"+nota.getPorcentaje());
            }
        }
        double total = sum + porcentaje;

        if (total >= 100) {
            return false;
        }
        return true;

    }

}
