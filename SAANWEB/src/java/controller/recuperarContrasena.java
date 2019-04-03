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
import models.Persona;
import models.Profesor;
import util.Mensajes;
import util.extra;

/**
 *
 * @author juann
 */
@WebServlet(name = "recuperarContrasena", urlPatterns = {"/recuperarContrasena"})
public class recuperarContrasena extends HttpServlet {

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
        request.setAttribute("mensaje", Mensajes.mensaje);
        RequestDispatcher view = request.getRequestDispatcher("recuperarContrasena.jsp");
        view.forward(request, response);
    }

    
    // Post de olvido contraseña
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("inputEmail");
        request.setAttribute("mensaje", Mensajes.mensaje);
        String codigo;
        HttpSession session = request.getSession();
                if (session.getAttribute("personas") != null && session.getAttribute("profesores") != null && session.getAttribute("estudiantes") != null) {
            List<Persona> personas = (ArrayList<Persona>) session.getAttribute("personas");
            List<Estudiante> estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
            List<Profesor> profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
            Persona usua;
            if (extra.isInteger(id)) {
                usua = Persona.buscarPersona(personas, estudiantes, profesores, Long.parseLong(id));
            } else {
                usua = Persona.buscarPersona(personas, estudiantes, profesores, id);
            }
            if(usua!=null){
               codigo=  Persona.generarCodigo(usua);
               session.setAttribute("codigo", codigo);
               session.setAttribute("usuarioAct", usua);
               RequestDispatcher pr = request.getRequestDispatcher("formularioContra.jsp");
               pr.forward(request, response);
            }
        } else {
            String error = "usuario no encontrado";
            session.setAttribute("error", error);
            RequestDispatcher view = request.getRequestDispatcher("recuperarContrasena.jsp");
            view.forward(request, response);
        }
        

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
