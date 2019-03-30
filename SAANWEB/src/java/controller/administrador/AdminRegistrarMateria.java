/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.administrador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Materia;
import util.Mensajes;

/**
 *
 * @author Juan Pablo
 */
@WebServlet(urlPatterns = {"/administrador_registrarMateria"})
public class AdminRegistrarMateria extends HttpServlet {

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
        request.setAttribute("materias", materias);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminRegMateria.jsp");
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
        List<Materia> materias = new ArrayList<Materia>();
        HttpSession session = request.getSession();
        if (session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nombre");
        int cre = Integer.parseInt(request.getParameter("creditos"));
        Materia mat = new Materia(id, nom, cre);

        String imprimir = Materia.registrar(materias, mat);
        request.setAttribute("imprimir", imprimir);
        session.setAttribute("materias", materias);
        request.setAttribute("materias", materias);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminRegMateria.jsp");
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
