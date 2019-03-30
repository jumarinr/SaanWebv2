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
import models.Matricula;
import models.Nota;
import util.Mensajes;

/**
 *
 * @author pipel
 */
@WebServlet(name = "mejoresnotas", urlPatterns = {"/mejoresnotas"})
public class mejoresnotas extends HttpServlet {

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
        List<Matricula> matriculas = new ArrayList<Matricula>();        
        if(request.getParameter("materia") != null && request.getParameter("grupo") != null){                  
            int id_materia = Integer.parseInt(request.getParameter("materia"));
            int num_grup = Integer.parseInt(request.getParameter("grupo"));            
            
            System.err.println(id_materia);
            System.err.println(num_grup);            
            
            if (session.getAttribute("matriculas") != null) {
                matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
            }            
            ArrayList<Nota> Nots = Nota.MejoresNotas((ArrayList<Matricula>) matriculas, id_materia, num_grup);
            request.setAttribute("Nots", Nots);
        }                      
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = request.getRequestDispatcher("profMejoresNotas.jsp");
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
