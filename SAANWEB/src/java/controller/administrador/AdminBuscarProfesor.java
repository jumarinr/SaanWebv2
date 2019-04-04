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
@WebServlet(urlPatterns = {"/administrador_buscarProfesor"})
public class AdminBuscarProfesor extends HttpServlet {

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
        if (session.getAttribute("profesores") != null) {
            profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
        }
        if (request.getParameter("id") != null) {
            String id = request.getParameter("id").toLowerCase();
            Profesor pro = null;
            if (extra.isInteger(id)) {
                pro = (Profesor) Profesor.buscarPersona(new ArrayList<Persona>(),
                        new ArrayList<Estudiante>(), profesores, Long.parseLong(id));
            } else if (extra.esEmailCorrecto(id)) {
                pro = (Profesor) Profesor.buscarPersona(new ArrayList<Persona>(),
                        new ArrayList<Estudiante>(), profesores, id);
            } else {
                request.setAttribute("imprimir", Mensajes.mensaje.get("corInv"));
            }
            request.setAttribute("usu", pro);
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusProfesor.jsp");
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
        List<Profesor> profesores = new ArrayList<Profesor>();
        HttpSession session = request.getSession();
        if (session.getAttribute("profesores") != null) {
            profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
        }
        if (request.getParameter("doc") != null) {
            long doc = Long.parseLong(request.getParameter("doc"));
            String imprimir = Profesor.eliminar(new ArrayList<Persona>(),
                    new ArrayList<Estudiante>(), profesores, doc);
            request.setAttribute("imprimir", imprimir);
            session.setAttribute("profesores", profesores);
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusProfesor.jsp");
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
