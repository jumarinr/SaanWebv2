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
import javax.swing.JOptionPane;
import models.Estudiante;
import models.Grupo;
import models.Materia;
import models.Matricula;
import models.Nota;
import util.Mensajes;

/**
 *
 * @author pipel
 */
@WebServlet(name = "buscarnota", urlPatterns = {"/buscarnota"})
public class buscarnota extends HttpServlet {

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
        List<Nota> notas = new ArrayList<Nota>();
        HttpSession session = request.getSession();
        if(request.getParameter("id") != null && request.getParameter("materia") != null && request.getParameter("grupo") != null && request.getParameter("estudiante") != null){
            int id = Integer.parseInt(request.getParameter("id"));        
            int id_materia = Integer.parseInt(request.getParameter("materia"));
            int num_grup = Integer.parseInt(request.getParameter("grupo"));
            int estu = Integer.parseInt(request.getParameter("estudiante"));            
            
            if (session.getAttribute("notas") != null) {
                notas = (ArrayList<Nota>)session.getAttribute("notas");
            }
            Nota Not = Nota.buscarNota(notas, estu, id_materia, num_grup, id);
            if (Not != null) {
                request.setAttribute("Not", Not);
            }
        }      
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));       
        RequestDispatcher view = request.getRequestDispatcher("profBuscarNota.jsp");
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
        //Eliminar
        List<Materia> materias = new ArrayList<Materia>();
        List<Nota> notas = new ArrayList<Nota>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Grupo> grupos = new ArrayList<Grupo>();
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        
        HttpSession session = request.getSession();
        if(session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if(session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if(session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if(session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        if(session.getAttribute("estudiantes") != null){
            estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
        }
        
        if (request.getParameter("id") != null && request.getParameter("materia") != null && request.getParameter("grupo") != null && request.getParameter("estudiante") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int id_materia = Integer.parseInt(request.getParameter("materia"));
            int num_grup = Integer.parseInt(request.getParameter("grupo"));
            int estu = Integer.parseInt(request.getParameter("estudiante"));
            Nota Not = Nota.buscarNota(notas, estu, id_materia, num_grup, id);
            Matricula ma = Not.getMatricula();
            
            Nota.enviarCorreoActualizarNota("borro", id, Not.getValor(), Not.getPorcentaje(), ma.getEstudiante(), ma.getGrupo().getMateria());                                
            Nota.eliminar(notas, estu, id_materia, num_grup, id);
            String imprimir = "Nota eliminada satisfactoriamente";
            request.setAttribute("imprimir", imprimir);            
            session.setAttribute("materias", materias);
            session.setAttribute("grupos", grupos);
            session.setAttribute("matriculas", matriculas);
            session.setAttribute("notas", notas);
            session.setAttribute("estudiantes", estudiantes);
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("profBuscarNota.jsp");
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
