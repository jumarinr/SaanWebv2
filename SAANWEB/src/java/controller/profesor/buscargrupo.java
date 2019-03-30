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
import models.Grupo;
import models.Nota;
import util.Mensajes;

/**
 *
 * @author pipel
 */
@WebServlet(name = "buscargrupo", urlPatterns = {"/buscargrupo"})
public class buscargrupo extends HttpServlet {

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
        List<Grupo> grupos = new ArrayList<Grupo>();
        HttpSession session = request.getSession();
        if(request.getParameter("id") != null && request.getParameter("materia") != null){
            int id = Integer.parseInt(request.getParameter("id"));        
            int id_materia = Integer.parseInt(request.getParameter("materia"));            
            System.err.println(id);
            System.err.println(id_materia);            
            
            if (session.getAttribute("grupos") != null) {
                grupos = (ArrayList<Grupo>)session.getAttribute("grupos");
            }
            Grupo grupo = Grupo.buscarGrupo(grupos, id, id_materia);
            if (grupo != null) {
                request.setAttribute("Gru", grupo);
            }
        }      
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));                         
        RequestDispatcher view = request.getRequestDispatcher("profBuscarGrupo.jsp");
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
