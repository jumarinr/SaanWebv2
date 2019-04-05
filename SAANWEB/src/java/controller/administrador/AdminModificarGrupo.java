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
import models.Grupo;
import models.Materia;
import models.Persona;
import models.Profesor;
import util.Mensajes;

/**
 *
 * @author Juan Pablo
 */
@WebServlet(urlPatterns = {"/administrador_modificarGrupo"})
public class AdminModificarGrupo extends HttpServlet {

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
        List<Grupo> grupos = new ArrayList<Grupo>();
        HttpSession session = request.getSession();
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view;
        if (session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        if (request.getParameter("id") != null && request.getParameter("num") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int num = Integer.parseInt(request.getParameter("num"));
            Grupo gru = Grupo.buscarGrupo(grupos, num, id);
            request.setAttribute("gru", gru);
            request.setAttribute("grupos", grupos);
            view = request.getRequestDispatcher("adminModGrupo.jsp");
        } else {
            view = request.getRequestDispatcher("adminBusGrupo.jsp");
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
        List<Materia> materias = new ArrayList<Materia>();
        List<Grupo> grupos = new ArrayList<Grupo>();
        List<Profesor> profesores = new ArrayList<>();
        HttpSession session = request.getSession();
        if (session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        if (session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if (session.getAttribute("grupos") != null) {
            profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
        }
        String imprimir = "";
        int num = Integer.parseInt(request.getParameter("numero"));
        int idMateria = Integer.parseInt(request.getParameter("mat"));
        long docProfesor = Long.parseLong(request.getParameter("doc"));
        int numAnterior = Integer.parseInt(request.getParameter("numa"));
        boolean seguir = true;
        if (num != numAnterior) {
            if (Grupo.buscarGrupo(grupos, num, idMateria) != null) {
                imprimir = Mensajes.mensaje.get("maYaReg");
                seguir = false;
            }
        }
        if (Profesor.buscarPersona(new ArrayList<Persona>(), new ArrayList<Estudiante>(),
                profesores, docProfesor) == null) {
            imprimir = Mensajes.mensaje.get("proNoReg");
            seguir = false;
        }
        Grupo g = Grupo.buscarGrupo(grupos, numAnterior, idMateria);
        RequestDispatcher view;
        if (seguir) {
            g.setProfesor((Profesor)Profesor.buscarPersona(new ArrayList<Persona>(), new ArrayList<Estudiante>(),
                    profesores, docProfesor));
            g.setNumero(num);
            imprimir = Mensajes.mensaje.get("gruMod");
            session.setAttribute("grupos", grupos);
        }
        request.setAttribute("imprimir", imprimir);
        request.setAttribute("gru", g);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        view = request.getRequestDispatcher("adminBusGrupo.jsp");
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
