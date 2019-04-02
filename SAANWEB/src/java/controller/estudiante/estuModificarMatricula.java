/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.estudiante;

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
import models.Materia;
import models.Matricula;
import util.Mensajes;

/**
 *
 * @author USUARIO
 */
@WebServlet(urlPatterns = {"/estuModificarMatricula"})
public class estuModificarMatricula extends HttpServlet {

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
        List<Matricula> matriculas = new ArrayList<Matricula>();
        HttpSession session = request.getSession();
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view;
        if (session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if (request.getParameter("doc") != null && request.getParameter("mat") != null) {
            long doc = Long.parseLong(request.getParameter("doc"));
            int mat = Integer.parseInt(request.getParameter("mat"));
            Matricula m = Matricula.buscar_matricula(matriculas, doc, mat);
            int borr=0;
            for (int i = 0; i < matriculas.size()+borr; i++) {
                if(matriculas.get(i-borr).getEstudiante()!=session.getAttribute("usua")){
                    matriculas.remove(i-borr);
                    borr++;
                }
            }
            request.setAttribute("Matr", m);
            request.setAttribute("matriculas",matriculas);
            view = request.getRequestDispatcher("estuModificarMatricula.jsp");
        }else{
            view = request.getRequestDispatcher("estuBuscarMatricula.jsp");
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
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Materia> materias = new ArrayList<Materia>();
        List<Grupo> grupos = new ArrayList<Grupo>();
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        HttpSession session = request.getSession();
        if (session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
         if (session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        if (session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if (session.getAttribute("estudiantes") != null) {
            estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
        }
        int sem= Integer.parseInt(request.getParameter("Semestre"));
        long doc= Long.parseLong(request.getParameter("doc"));
        int mat= Integer.parseInt(request.getParameter("mat"));
        Matricula m = Matricula.buscar_matricula(matriculas, doc, mat);
        m.setSemestre(sem);
        String imprimir = Mensajes.mensaje.get("matrM");
        session.setAttribute("matriculas",matriculas);
        request.setAttribute("imprimir", imprimir);
        request.setAttribute("Matr", m);
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("estuBuscarMatricula.jsp");
        view.forward(request, response);
     
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}