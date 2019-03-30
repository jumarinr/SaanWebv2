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
import models.Matricula;
import models.Nota;
import models.Persona;
import models.Profesor;
import util.Mensajes;
import util.extra;

/**
 *
 * @author Juan Pablo
 */
@WebServlet(urlPatterns = {"/administrador_buscarEstudiante"})
public class AdminBuscarEstudiante extends HttpServlet {

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
        if (request.getParameter("id") != null) {
            String id = request.getParameter("id").toLowerCase();
            Estudiante est = null;
            if (extra.isInteger(id)) {
                est = (Estudiante) Estudiante.buscarPersona(new ArrayList<Persona>(),
                        estudiantes, new ArrayList<Profesor>(), Long.parseLong(id));
            } else if (extra.esEmailCorrecto(id)) {
                est = (Estudiante) Estudiante.buscarPersona(new ArrayList<Persona>(),
                        estudiantes, new ArrayList<Profesor>(), id);
            } else {
                request.setAttribute("imprimir", "Correo invalido");
            }
            request.setAttribute("usu", est);
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusEstudiante.jsp");
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
        //Eliminar
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Nota> notas = new ArrayList<Nota>();
        HttpSession session = request.getSession();
        if (session.getAttribute("estudiantes") != null) {
            estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
        }
        if (session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if (session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if (request.getParameter("doc") != null) {
            long doc = Long.parseLong(request.getParameter("doc"));
                String imprimir = Estudiante.eliminar(new ArrayList<Persona>(),
                        estudiantes, new ArrayList<Profesor>(), matriculas, notas, doc);
                request.setAttribute("imprimir", imprimir);
                session.setAttribute("estudiantes", estudiantes);
                session.setAttribute("matriculas", matriculas);
                session.setAttribute("notas", notas);
            
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusEstudiante.jsp");
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
