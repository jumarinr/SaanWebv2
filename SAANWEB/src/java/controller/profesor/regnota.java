package controller.profesor;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
import models.Materia;
import models.Matricula;
import models.Nota;
import util.Mensajes;

/**
 *
 * @author pipel
 */
@WebServlet(urlPatterns = {"/regnota"})
public class regnota extends HttpServlet {

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
        List<Nota> notas = new ArrayList<Nota>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        HttpSession session = request.getSession();
        if (session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if(session.getAttribute("matriculas") != null){
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        
        request.setAttribute("notas", notas);
        request.setAttribute("matriculas", matriculas);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("profRegNota.jsp");
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
        List<Nota> notas = new ArrayList<Nota>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        HttpSession session = request.getSession();
        if(session.getAttribute("notas") != null){
            notas = (ArrayList<Nota>) session.getAttribute("notas");            
        }
        if(session.getAttribute("matriculas") != null){
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        int id = Integer.valueOf(request.getParameter("id"));
        double valor = Double.valueOf(request.getParameter("valor"));
        int porcentaje = Integer.valueOf(request.getParameter("porcentaje"));
        int idmateria = Integer.valueOf(request.getParameter("idmateria"));
        int idestudiante = Integer.valueOf(request.getParameter("idestudiante"));
        Matricula matricula = Matricula.buscar_matricula(matriculas, idestudiante, idmateria);
        String imprimir = "";
        if( matricula != null && Nota.porcentajeDiferente100((ArrayList<Nota>) notas, idmateria, matricula.getGrupo().getNumero(), idestudiante, porcentaje)){
            String res = Nota.registrar(notas, new Nota(porcentaje, valor, id, matricula));            
            if (res.equals(Mensajes.mensaje.get("reg"))){
                Nota.enviarCorreoActualizarNota("registro", id, valor, porcentaje, matricula.getEstudiante(), matricula.getGrupo().getMateria());                
                imprimir = "Nota registrada exitosamente";
            }
            else{
                imprimir = "La nota no pudo ser registrada";
            }
        }  
        else{
                imprimir = "La nota no pudo ser registrada porque la matrícula no fue encontrada o el porcentaje excede al 100%";
        }
        
        request.setAttribute("imprimir", imprimir);       
        request.setAttribute("notas", notas);
        request.setAttribute("matriculas", matriculas);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("profRegNota.jsp");
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
