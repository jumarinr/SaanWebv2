package util;

import java.util.HashMap;

/**
 *
 * @author Juan Pablo
 */
public class Mensajes {

    public static HashMap<String, String> mensaje = new HashMap<String, String>() {
        {
            put("err", "Error");
            put("reg", "Registrado");
            put("usuInc", "Usuario o contraseña incorrecto");
            put("eli", "Eliminado");
            put("recu", "Recuperación de contraseña");
            put("codrecu", "Código de recuperación: ");
            put("mod", "Modificado");
            put("ideMate", "Identificacion de la materia");
            put("gru", "Grupo");
            put("Nonotas", "Materia sin notas");
            put("Nogrup", "Materia sin grupos");
            put("megru", "Mejores grupos");
            put("estper", "Estudiantes que van perdiendo");
            put("ini", "Inicio");
            put("saan", "SISTEMA ACADÉMICO ASISTENTE DE NOTAS");
            put("esp", "Español");
            put("ing", "Ingles");
            put("inisec", "Iniciar sesión");
            put("menu", "Menú");
            put("Ganosinno", "El estudiante no va perdiendo o no tiene notas");
            put("Noestnot", "Estudiante sin notas");
            put("registro","registro");
            put("modifico", "modifico");
            put("borro", "borro");
            put("cuerpo_borro", "se le borro la nota con identificación ");
            put("cuerpo_borro2", " de la materia ");
            put("cuerpo_resto", "Su nota en ");
            put("cuerpo_resto2", " con identificación de ");
            put("cuerpo_resto3", " fue de ");
            put("cuerpo_resto4", " y vale ");
            put("cuerpo_resto5", " % de la nota final");
            put( "asunto", "se le ");
            put("asunto2", " una nota");
        }
    };

}
