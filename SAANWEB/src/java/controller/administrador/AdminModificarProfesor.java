/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.administrador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Estudiante;
import models.Persona;
import models.Profesor;
import util.Mensajes;
import util.extra;

/**
 *
 * @author Juan Pablo
 */
@WebServlet(urlPatterns = {"/administrador_modificarProfesor"})
public class AdminModificarProfesor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Profesor> profesores = new ArrayList<Profesor>();
        HttpSession session = request.getSession();
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view;
        if (session.getAttribute("profesores") != null) {
            profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
        }
        if (request.getParameter("doc") != null) {
            long doc = Long.parseLong(request.getParameter("doc"));
            Persona est = Profesor.buscarPersona(new ArrayList<Persona>(),
                    new ArrayList<Estudiante>(), profesores, doc);
            request.setAttribute("usu", est);
            request.setAttribute("profesores", profesores);
            view = request.getRequestDispatcher("adminModProfesor.jsp");
        } else {
            view = request.getRequestDispatcher("adminBusProfesor.jsp");
        }
        view.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        List<Profesor> profesores = new ArrayList<Profesor>();
        List<Persona> personas = new ArrayList<Persona>();
        HttpSession session = request.getSession();
        if (session.getAttribute("estudiantes") != null && session.getAttribute("profesores")
                != null && session.getAttribute("personas") != null) {
            estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
            profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
            personas = (ArrayList<Persona>) session.getAttribute("personas");
        }
        long documento = Long.parseLong(request.getParameter("identificacion"));
        long doc = Long.parseLong(request.getParameter("doc"));
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo").toLowerCase();
        String cor = request.getParameter("cor").toLowerCase();
        String clave = request.getParameter("clave");
        boolean seguir = true;
        String imprimir = "";
        if (!extra.esEmailCorrecto(correo)) {
            imprimir = Mensajes.mensaje.get("corInv");
            seguir = false;
        }
        if (documento != doc) {
            if (Persona.buscarPersona(personas, estudiantes, profesores, documento) != null) {
                imprimir = Mensajes.mensaje.get("docReg");
                seguir = false;
            }
        }
        if (!correo.equals(cor)) {
            if (Persona.buscarPersona(personas, estudiantes, profesores, correo) != null) {
                imprimir = Mensajes.mensaje.get("corReg");
                seguir = false;
            }
        }
        Persona p = Persona.buscarPersona(new ArrayList<Persona>(),
                new ArrayList<Estudiante>(), profesores, doc);
        RequestDispatcher view;
        if (seguir) {
            p.setNombre(nombre);
            p.setIdentificacion(documento);
            p.setClave(clave);
            p.setCorreo(correo);
            imprimir = Mensajes.mensaje.get("proMod");
            session.setAttribute("profesores", profesores);
        }
        request.setAttribute("imprimir", imprimir);
        request.setAttribute("usu", p);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        view = request.getRequestDispatcher("adminBusProfesor.jsp");
        view.forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
