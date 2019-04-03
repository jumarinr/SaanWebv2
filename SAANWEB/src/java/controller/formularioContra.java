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
@WebServlet(name = "formularioContra", urlPatterns = {"/formularioContra"})
public class formularioContra extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("mensaje", Mensajes.mensaje);
        RequestDispatcher view = request.getRequestDispatcher("formularioContra.jsp");
        view.forward(request, response);
    }
       // Post de nueva contraseña
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String codigoO = request.getParameter("codigoO");
        String Pass = request.getParameter("Pass");
        String confirmPas = request.getParameter("confirmPas");
        request.setAttribute("mensaje", Mensajes.mensaje);
        String codigo = (String) session.getAttribute("codigo");
 
        if (session.getAttribute("usuarioAct") != null) {
            Persona usuario = (Persona) session.getAttribute("usuarioAct"); 
            if(!codigo.equals(codigoO)){
                String error = "Codigo no concuerda";
            session.setAttribute("error", error);
            RequestDispatcher view = request.getRequestDispatcher("formularioContra.jsp");
            view.forward(request, response);
            }else if(!Pass.equals(confirmPas)) {
                String error = "Contraseñas no concuerdan";
            session.setAttribute("error", error);
            RequestDispatcher view = request.getRequestDispatcher("formularioContra.jsp");
            view.forward(request, response);
            }else{
      
               String error =  Persona.recuperarContraseña(codigo, codigoO, Pass, usuario);
            session.setAttribute("error", error);
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.forward(request, response);
            }
        } else {
            String error = "usuario no encontrado";
            session.setAttribute("error", error);
            RequestDispatcher view = request.getRequestDispatcher("recuperarContrasena.jsp");
            view.forward(request, response);
        }
        

    }

}
