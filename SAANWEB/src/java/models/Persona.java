package models;

import util.EnvioDeCorreo;
import util.Mensajes;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Juan Pablo
 */
public class Persona {

    private String nombre;
    private long identificacion;
    private String correo;
    private String clave;

    public Persona() {
    }

    public Persona(String nombre, long identificacion, String correo, String clave) {
        this.setNombre(nombre);
        this.setIdentificacion(identificacion);
        this.setCorreo(correo);
        this.setClave(clave);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        if (!nombre.equals("")) {
            this.nombre = nombre;
        }
    }

    public long getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(long identificacion) {
        if (identificacion > 0) {
            this.identificacion = identificacion;
        }
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        if (!correo.equals("")) {
            this.correo = correo;
        }
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        if (!clave.equals("")) {
            this.clave = clave;
        }
    }

    public static Persona buscarPersona(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, long identificacion) {
        for (Persona admin : personas) {
            if (admin.getIdentificacion() == identificacion) {
                return admin;
            }
        }
        for (Persona profe : profesores) {
            if (profe.getIdentificacion() == identificacion) {
                return profe;
            }
        }
        for (Persona estu : estudiantes) {
            if (estu.getIdentificacion() == identificacion) {
                return estu;
            }
        }
        return null;
    }

    public static Persona buscarPersona(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, String correo) {
        for (Persona admin : personas) {
            if (admin.getCorreo().equals(correo)) {
                return admin;
            }
        }
        for (Persona profe : profesores) {
            if (profe.getCorreo().equals(correo)) {
                return profe;
            }
        }
        for (Persona estu : estudiantes) {
            if (estu.getCorreo().equals(correo)) {
                return estu;
            }
        }
        return null;
    }

    public static String registrar(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, Persona usuario) {
        if (Persona.buscarPersona(personas, estudiantes, profesores, usuario.getIdentificacion()) != null) {
            return Mensajes.mensaje.get("err");
        }
        if (Persona.buscarPersona(personas, estudiantes, profesores, usuario.getCorreo()) != null) {
            return Mensajes.mensaje.get("err");
        }
        if (usuario.getIdentificacion() <= 0 || usuario.getNombre() == null
                || usuario.getClave() == null || usuario.getCorreo() == null) {
            return Mensajes.mensaje.get("err");
        }
        if (usuario instanceof Profesor) {
            profesores.add((Profesor) usuario);
        } else if (usuario instanceof Estudiante) {
            estudiantes.add((Estudiante) usuario);
        } else {
            personas.add(usuario);
        }
        return Mensajes.mensaje.get("reg");
    }

    /*
    devuelve 0 si es administrador, 1 si es estudiante,
    2 si es profesor y -1 si no esta registrado
     */
    public static byte login(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, long identificacion, String clave) {
        Persona usuario = Persona.buscarPersona(personas, estudiantes, profesores, identificacion);
        if (usuario != null) {
            if (usuario.getClave().equals(clave)) {
                if (usuario instanceof Profesor) {
                    return 2;
                } else if (usuario instanceof Estudiante) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }
        return -1;
    }

    public static byte login(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, String correo, String clave) {
        Persona usuario = Persona.buscarPersona(personas, estudiantes, profesores, correo);
        if (usuario != null) {
            if (usuario.getClave().equals(clave)) {
                if (usuario instanceof Profesor) {
                    return 2;
                } else if (usuario instanceof Estudiante) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }
        return -1;
    }

    public static String eliminar(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, long identificacion) {
        Persona usuario = Persona.buscarPersona(personas, estudiantes, profesores, identificacion);
        if (usuario != null) {
            if (usuario instanceof Profesor) {
                profesores.remove((Profesor) usuario);
            } else if (usuario instanceof Estudiante) {
                estudiantes.remove((Estudiante) usuario);
            } else {
                personas.remove(usuario);
            }
            return Mensajes.mensaje.get("eli");
        }
        return Mensajes.mensaje.get("err");
    }

    public static String eliminar(List<Persona> personas, List<Estudiante> estudiantes,
            List<Profesor> profesores, String correo) {
        Persona usuario = Persona.buscarPersona(personas, estudiantes, profesores, correo);
        if (usuario != null) {
            if (usuario instanceof Profesor) {
                profesores.remove((Profesor) usuario);
            } else if (usuario instanceof Estudiante) {
                estudiantes.remove((Estudiante) usuario);
            } else {
                personas.remove(usuario);
            }
            return Mensajes.mensaje.get("eli");
        }
        return Mensajes.mensaje.get("err");
    }

    public static String generarCodigo(Persona usuario) {
        String codigo = "";
        for (int i = 0; i < 4; i++) {
            codigo += (int) (Math.random() * 10);
            codigo += (char) ((int) (Math.random() * (122 - 97) + 97));
        }
        EnvioDeCorreo.EnvioDeMail(usuario.getCorreo(), Mensajes.mensaje.get("recu"),
                Mensajes.mensaje.get("codrecu") + codigo);
        return codigo;
    }

    public static String recuperarContraseña(String codigo, String codigoUsuario, String claveNueva, Persona usuario) {
        if (codigo.equals(codigoUsuario)) {
            usuario.setClave(claveNueva);
            return Mensajes.mensaje.get("mod");
        }
        return Mensajes.mensaje.get("err");
    }
}
