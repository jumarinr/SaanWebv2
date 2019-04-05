/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.profesor;

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
import models.Matricula;
import models.Profesor;
import util.Mensajes;
import util.EnvioDeCorreo;

/**
 *
 * @author pipel
 */
@WebServlet(name = "crearevento", urlPatterns = {"/crearevento"})
public class crearevento extends HttpServlet {  

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
        HttpSession session = request.getSession();
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));        
        RequestDispatcher view = request.getRequestDispatcher("profCrearEvento.jsp");
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
        request.setAttribute("imprimir", null);
        RequestDispatcher view;
        HttpSession session = request.getSession();
        List<Grupo> grupos = new ArrayList<Grupo>();        
        if (session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        if (request.getParameter("name") != null && request.getParameter("fecha") != null && request.getParameter("detalles") != null && request.getParameter("materia") != null && request.getParameter("grupo") != null) {
            String name = request.getParameter("name");
            String fecha = request.getParameter("fecha");
            String detalles = request.getParameter("detalles");
            int id_materia =  Integer.parseInt(request.getParameter("materia"));
            int num_grup = Integer.parseInt(request.getParameter("grupo"));            
            Grupo gru = Grupo.buscarGrupo(grupos, num_grup, id_materia);
            ArrayList<Matricula> matriculas = (ArrayList<Matricula>) gru.getMatriculas();
            Profesor.encontrarCorreosYEnviar(matriculas, num_grup, id_materia, fecha, name, detalles);
            String imprimir = "Evento registrado exitosamente";
            request.setAttribute("imprimir", imprimir);
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));        
        view = request.getRequestDispatcher("profCrearEvento.jsp");
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
