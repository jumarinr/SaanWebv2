/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import models.Grupo;
import models.Materia;
import models.Matricula;
import util.Mensajes;

/**
 *
 * @author juann
 */
@WebServlet(name = "estudiantesPerdiendo", urlPatterns = {"/estudiantesPerdiendo"})
public class estudiantesPerdiendo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
        ArrayList<Matricula> matriculasPerdiendo = Estudiante.VanPerdiendo(materias);
        request.setAttribute("matriculas",matriculasPerdiendo);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));

        RequestDispatcher view = request.getRequestDispatcher("estudiantesPerdiendo.jsp");
        view.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
}
