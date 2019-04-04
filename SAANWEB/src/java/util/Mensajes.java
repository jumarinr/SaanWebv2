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
            put("matrM","Matricula modificada");
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
            // mensajes de juan diego - estudiantes perdiendo
            put("nombre", "Nombre");
            put("Materia", "Materia");
            put("Numero", "Numero");
            put("Docente", "Docente");
            put("EstuPerd", "Estudiantes que van perdiendo");
            put("generar", "Generar datos ficticios");
            put("SAAN" , "SAAN");
            put("WEB" , "WEB");
            put("menuUser", "Menu de usuario");
            // mensajes de juan diego - recuperar contraseña
            put("recup" ,"¿Desea recuperar contraseña?");
            put("volver", "Volver a inicio");
            put("iniciar", "Inicie sesion en SAAN");
            put("placeholderCorreo", "Ingrese su documento o email");
            put("placeholderContra", "Escriba una contraseña");
            put("init", "Iniciar");
            put("olvido", "Olvido contraseña Saan");
            put("olvido2", "¿Olvido su contraseña?");
            put("olvidoCuerpo", "Lo entendemos, solo ingrese su correo o documento para recuperarla.\n" +
"                    Recibira un codigo en breves momentos en su correo electronico.");
            put("yaCuenta", "¿Ya tienes una cuenta? ¡ingresa aqui!");
            put("placeholderOlvido", "Ingrese su correo");
            put("generarCodigo", "Generar codigo");
            put("juanD", "Juan Diego Marin Rodriguez");
            put("juanU", "Juan Felipe Usuga Villegas");
            put("juanP", "Juan Pablo Moya Alarcon");
            put("julian", "Julian Ospina Murgueitio");
            put("funcionalidades", "Funcionalidades especiales");
            put("enviarAct", "Enviar correos al actualizar, borrar, modificar y añadir una nota");
            put("generarRep", "Generar reportes de excel");
            put("mejoresGrupos", "Mostrar los mejores grupos");
            put("malosEstudiantes", "Mostrar los estudiantes que van perdiendo");
            put("recuperarcontra", "Recuperar contraseña");
            put("mejoresNotas", "Reporte de mejores notas");
            put("encontrarCor", "Encontrar correos de estudiantes y mandar eventos");
            put("cuando","Cuando..." );
            put("profNota", "Tu profesor sube las notas y no te avisa");
            put("contreaNew", "Escriba una nueva contraseña");
            put("contraConfirm", "Escriba de nuevo la contraseña");
            put("dataRec", "Recupere su contraseña, inserte una nueva.");
            put("codigoO", "Ingrese el codigo que le llego al correo");
            put("infoEnv", "Cambiar contraseña");
        }
    };

}
