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
import javax.swing.JOptionPane;
import models.Estudiante;
import models.Grupo;
import models.Materia;
import models.Persona;
import models.Profesor;
import util.Mensajes;
import util.extra;

/**
 *
 * @author Juan Pablo
 */
@WebServlet(urlPatterns = {"/administrador_registrarGrupo"})
public class AdminRegistrarGrupo extends HttpServlet {

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
        if (session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        request.setAttribute("grupos", grupos);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminRegGrupo.jsp");
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
        int num = Integer.parseInt(request.getParameter("numero"));
        int idMateria = Integer.parseInt(request.getParameter("id"));
        long docProfesor = Long.parseLong(request.getParameter("doc"));
        
        if(Materia.buscarMateria(materias, idMateria) == null){
            JOptionPane.showMessageDialog(null, "La materia no esta registrada",
                    "SAAN",JOptionPane.ERROR_MESSAGE);
        }
        if(Profesor.buscarPersona(new ArrayList<Persona>(), new ArrayList<Estudiante>(),
                profesores, docProfesor) == null){
            JOptionPane.showMessageDialog(null, "EL profesor no esta registrada",
                    "SAAN",JOptionPane.ERROR_MESSAGE);
        }
        
        Grupo grupo = new Grupo(num,(Profesor) Profesor.buscarPersona(new ArrayList<Persona>(), new ArrayList<Estudiante>(),
                profesores, docProfesor), Materia.buscarMateria(materias, idMateria));

        JOptionPane.showMessageDialog(null, Grupo.registrar(grupos, grupo), "SAAN", JOptionPane.INFORMATION_MESSAGE);

        session.setAttribute("grupos", grupos);
        session.setAttribute("materias", materias);
        session.setAttribute("profesor", profesores);
        request.setAttribute("grupos", grupos);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminRegGrupo.jsp");
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
