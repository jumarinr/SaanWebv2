/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.profesor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Estudiante;
import models.Persona;
import models.Profesor;
import util.Mensajes;

/**
 *
 * @author pipel
 */
@WebServlet(name = "cambiarcontrasena", urlPatterns = {"/cambiarcontrasena"})
public class cambiarcontrasena extends HttpServlet {

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
        RequestDispatcher view = request.getRequestDispatcher("profCambiarContrasena.jsp");
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
        HttpSession session = request.getSession();
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));        
        if(request.getParameter("password") != null){
            String password = request.getParameter("password");
            Persona user = (Persona)session.getAttribute("usua");
            long id = user.getIdentificacion();
            Persona oc = Persona.buscarPersona((ArrayList<Persona>) session.getAttribute("personas"), (ArrayList<Estudiante>) session.getAttribute("estudiantes"), (ArrayList<Profesor>)session.getAttribute("profesores"), id);
            oc.setClave(password);
        }
        String imprimir = "Contraseña modificada exitosamente";
        request.setAttribute("imprimir", imprimir);
        RequestDispatcher view = request.getRequestDispatcher("profCambiarContrasena.jsp");
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
