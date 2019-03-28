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
        session.setAttribute("notas", notas);
        request.setAttribute("notas", notas);
        session.setAttribute("matriculas", matriculas);
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
        int idmatricula = Integer.valueOf(request.getParameter("idmatricula"));
        int idestudiante = Integer.valueOf(request.getParameter("idestudiante"));
        Matricula matricula = Matricula.buscar_matricula(matriculas, idestudiante, idmatricula);
        if( matricula != null){
            String res = Nota.registrar(notas, new Nota(porcentaje, valor, id, matricula));
            if (res.equals(Mensajes.mensaje.get("reg"))){
                JOptionPane.showMessageDialog(null, res, "SAAN", JOptionPane.INFORMATION_MESSAGE);
            }
            else{
                JOptionPane.showMessageDialog(null, "id de nota ya existente", "SAAN",
                    JOptionPane.ERROR_MESSAGE);
            }
        }        
        else{
            JOptionPane.showMessageDialog(null, "Id de estudiante o matrícula inválidos", "SAAN",
                    JOptionPane.ERROR_MESSAGE);
        }  
        session.setAttribute("notas", notas);
        session.setAttribute("matriculas", matriculas);
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
