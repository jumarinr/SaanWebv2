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
@WebServlet(urlPatterns = {"/administrador_registrarEstudiante"})
public class AdminRegistrarEstudiante extends HttpServlet {

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
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        HttpSession session = request.getSession();
        if (session.getAttribute("estudiantes") != null) {
            estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
        }
        session.setAttribute("estudiantes", estudiantes);
        request.setAttribute("estudiantes", estudiantes);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminRegEstudiante.jsp");
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
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo").toLowerCase();
        String clave = request.getParameter("clave");
        Estudiante p = new Estudiante(nombre, documento, correo, clave);
        String imprimir = "";
        if (extra.esEmailCorrecto(correo)) {
            imprimir = Estudiante.registrar(personas,
                    estudiantes, profesores, p);
        } else {
            imprimir = Mensajes.mensaje.get("corInv");
        }
        request.setAttribute("imprimir", imprimir);
        session.setAttribute("estudiantes", estudiantes);
        request.setAttribute("estudiantes", estudiantes);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminRegEstudiante.jsp");
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
