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
import models.Materia;
import models.Nota;
import util.Mensajes;

/**
 *
 * @author pipel
 */
@WebServlet(name = "modnota", urlPatterns = {"/modnota"})
public class modnota extends HttpServlet {

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
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));     
        RequestDispatcher view;
        if (session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if (request.getParameter("id") != null && request.getParameter("materia") != null && request.getParameter("grupo") != null && request.getParameter("estudiante") != null) {
            int id = Integer.parseInt(request.getParameter("id"));        
            int id_materia = Integer.parseInt(request.getParameter("materia"));
            int num_grup = Integer.parseInt(request.getParameter("grupo"));
            int estu = Integer.parseInt(request.getParameter("estudiante"));
            Nota Not = Nota.buscarNota(notas, estu, id_materia, num_grup, id);
            request.setAttribute("Not", Not);
            request.setAttribute("notas", notas);
            view = request.getRequestDispatcher("profModNota.jsp");
        } else {
            view = request.getRequestDispatcher("profBuscarNota.jsp");
        }
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
        List<Nota> notas = new ArrayList<Nota>();
        HttpSession session = request.getSession();
        if (session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if(request.getParameter("id") != null){
            int id = Integer.parseInt(request.getParameter("id"));                  
            int estudiante = Integer.parseInt(request.getParameter("estudiante"));
            int materia = Integer.parseInt(request.getParameter("materia"));
            int grupo = Integer.parseInt(request.getParameter("grupo"));

            Nota Not = Nota.buscarNota(notas, estudiante, materia, grupo, id);                                 
            int index = notas.indexOf(Not);
            if (request.getParameter("valor") != null){
                double valor = Double.parseDouble(request.getParameter("valor"));                                
                Not.setValor(valor);
                String imprimir = "Nota modificada exitosamente";
                request.setAttribute("imprimir", imprimir);
            }
            if(request.getParameter("porcentaje") != null){
                double porcentaje = Double.parseDouble(request.getParameter("porcentaje")); 
                if (Nota.porcentajeDiferente100((ArrayList<Nota>) notas, materia, grupo, estudiante, porcentaje)) {
                    Not.setPorcentaje(porcentaje);
                    String imprimir = "Nota modificada exitosamente";
                    request.setAttribute("imprimir", imprimir);
                }                                       
            }
            Nota.enviarCorreoActualizarNota("modifico", id, Not.getValor(), Not.getPorcentaje(), Not.getMatricula().getEstudiante(), Not.getMatricula().getGrupo().getMateria());
            notas.set(index, Not);
            request.setAttribute("Not", Not);
            request.setAttribute("mensaje", Mensajes.mensaje);
            request.setAttribute("usua", session.getAttribute("usua"));
        }
                
        session.setAttribute("notas", notas);
        view = request.getRequestDispatcher("profModNota.jsp");
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
