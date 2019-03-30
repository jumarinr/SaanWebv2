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
import models.Grupo;
import models.Materia;
import models.Matricula;
import models.Nota;
import util.Mensajes;
import util.extra;

/**

 */
@WebServlet(urlPatterns = {"/administrador_buscarMateria"})
public class AdminBuscarMateria extends HttpServlet {

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
        List<Materia> materias = new ArrayList<Materia>();
        HttpSession session = request.getSession();
        if (session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            Materia mat = Materia.buscarMateria(materias, id);
            if (mat != null) {
                request.setAttribute("mat", mat);
            }
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusMateria.jsp");
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
        List<Materia> materias = new ArrayList<Materia>();
        List<Nota> notas = new ArrayList<Nota>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Grupo> grupos = new ArrayList<Grupo>();
        HttpSession session = request.getSession();
        if(session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if(session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if(session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if(session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
                String imprimir = Materia.eliminar(materias, grupos, matriculas, notas, id);
                request.setAttribute("imprimir", imprimir);
                session.setAttribute("materias", materias);
                session.setAttribute("grupos", grupos);
                session.setAttribute("matriculas", matriculas);
                session.setAttribute("notas", notas);
        
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusMateria.jsp");
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
