/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.estudiante;

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
import models.Matricula;
import models.Nota;
import util.Mensajes;

/**
 *
 * @author USUARIO
 */
@WebServlet(urlPatterns = {"/estuBuscarMatricula"})
public class estuBuscarMatricula extends HttpServlet {

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
        List<Matricula> matriculas = new ArrayList<Matricula>();
        HttpSession session = request.getSession();
        if (session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if (request.getParameter("doc") != null && request.getParameter("idM") != null) {
            long doc = Long.parseLong(request.getParameter("doc"));
            int idM = Integer.parseInt(request.getParameter("idM"));
            Matricula matricula = Matricula.buscar_matricula(matriculas, doc, idM);
            if (matricula != null) {
                request.setAttribute("Matr", matricula);
            }
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("estuBuscarMatricula.jsp");
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
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Nota> notas = new ArrayList<Nota>();
        HttpSession session = request.getSession();
        if (session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if (session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if (request.getParameter("doc") != null && request.getParameter("idM") != null) {
            long doc = Long.parseLong(request.getParameter("doc"));
            int idM = Integer.parseInt(request.getParameter("idM"));
            String imprimir= Matricula.cancelar(matriculas, notas, doc, idM);
            request.setAttribute("imprimir", imprimir);;
            session.setAttribute("matriculas", matriculas);
            session.setAttribute("notas", notas);
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("estuBuscarMatricula.jsp");
        view.forward(request, response);
    }

}
