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
import javax.swing.JOptionPane;
import models.Estudiante;
import models.Grupo;
import models.Materia;
import models.Matricula;
import models.Nota;
import models.Persona;
import models.Profesor;
import util.Mensajes;

/**
 *
 * @author juann
 */
@WebServlet(name = "datosFicticios", urlPatterns = {"/datosFicticios"})
public class datosFicticios extends HttpServlet {

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
        List<Materia> materias = new ArrayList<Materia>();
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        List<Profesor> profesores = new ArrayList<Profesor>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Persona> personas = new ArrayList<Persona>();
        List<Grupo> grupos = new ArrayList<Grupo>();
        Materia.cargarMaterias(materias);
        HttpSession session = request.getSession();
        if(session.getAttribute("notas") != null) {
            notas = (ArrayList<Nota>) session.getAttribute("notas");
        }
        if(session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if(session.getAttribute("estudiantes") != null) {
            estudiantes = (ArrayList<Estudiante>) session.getAttribute("estudiantes");
        }
        if(session.getAttribute("profesores") != null) {
            profesores = (ArrayList<Profesor>) session.getAttribute("profesores");
        }
        if(session.getAttribute("matriculas") != null) {
            matriculas = (ArrayList<Matricula>) session.getAttribute("matriculas");
        }
        if(session.getAttribute("personas") != null) {
            personas = (ArrayList<Persona>) session.getAttribute("personas");
        }
        if(session.getAttribute("grupos") != null) {
            grupos = (ArrayList<Grupo>) session.getAttribute("grupos");
        }
        
        Materia.cargarMaterias(materias);
        if (materias.isEmpty()) {
            Materia.registrar(materias, new Materia(1, "Programación Orientada a Objetos", 3));
        }
        if (materias.size() == 1) {
            int num = 2;
            if (Materia.buscarMateria(materias, num) != null) {
                num = 1;
            }
            Materia.registrar(materias, new Materia(num, "Calculo Diferencial", 4));
        }
        Materia mat1 = materias.get(0);
        Materia mat2 = materias.get(1);
        //Administrador
        Persona ad1 = new Persona("Mark Zuckaritas", 198, "mark@unal.edu.co", "face");
        Persona.registrar(personas, estudiantes, profesores, ad1);
        Persona ad2 = new Persona("Steve Jobs", 111, "job@unal.edu.co", "micro");
        Persona.registrar(personas, estudiantes, profesores, ad2);
        //Profesor
        Profesor pr1 = new Profesor("Jose Gregorio Guardia", 123, "jgre@unal.edu.co", "hola");
        Profesor.registrar(personas, estudiantes, profesores, pr1);
        Profesor pr2 = new Profesor("Pablo Antoño Ortiz", 456, "pano@unal.edu.co", "chao");
        Profesor.registrar(personas, estudiantes, profesores, pr2);
        //Estudiante
        Estudiante es1 = new Estudiante("Juan Pablo Moya Alarcón", 789, "jmoya@unal.edu.co", "clave");
        Estudiante.registrar(personas, estudiantes, profesores, es1);
        Estudiante es2 = new Estudiante("Julian Ospina Murguetio", 135, "juospinam@unal.edu.co", "anime");
        Estudiante.registrar(personas, estudiantes, profesores, es2);
        Estudiante es3 = new Estudiante("Juan Diego Marin Rogriguez", 246, "jumarinr@unal.edu.co", "banano");
        Estudiante.registrar(personas, estudiantes, profesores, es3);
        Estudiante es4 = new Estudiante("Juan Felipe Usuga Villegas", 791, "jusugav@unal.edu.co", "1234");
        Estudiante.registrar(personas, estudiantes, profesores, es4);
        //Grupo
        Grupo gr1 = new Grupo(1, pr1, mat1);
        Grupo.registrar(grupos, gr1);
        Grupo gr2 = new Grupo(2, pr2, mat1);
        Grupo.registrar(grupos, gr2);
        Grupo gr3 = new Grupo(1, pr1, mat2);
        Grupo.registrar(grupos, gr3);
        //Matricula
        Matricula matr1 = new Matricula(3, es1, gr1);
        Matricula.matricular(matriculas, matr1);
        Matricula matr2 = new Matricula(2, es2, gr1);
        Matricula.matricular(matriculas, matr2);
        Matricula matr3 = new Matricula(4, es3, gr2);
        Matricula.matricular(matriculas, matr3);
        Matricula matr4 = new Matricula(3, es4, gr2);
        Matricula.matricular(matriculas, matr4);
        Matricula matr5 = new Matricula(3, es1, gr3);
        Matricula.matricular(matriculas, matr5);
        Matricula matr6 = new Matricula(2, es2, gr3);
        Matricula.matricular(matriculas, matr6);
        Matricula matr7 = new Matricula(4, es3, gr3);
        Matricula.matricular(matriculas, matr7);
        //Nota
        Nota n1 = new Nota(33, 5, 1, matr1);
        Nota n2 = new Nota(33, 4, 2, matr1);
        Nota n3 = new Nota(10, 3, 3, matr1);
        Nota.registrar(notas, n1);
        Nota.registrar(notas, n2);
        Nota.registrar(notas, n3);
        Nota n4 = new Nota(33, 1.3, 1, matr2);
        Nota n5 = new Nota(33, 3, 2, matr2);
        Nota n6 = new Nota(34, 4.5, 3, matr2);
        Nota.registrar(notas, n4);
        Nota.registrar(notas, n5);
        Nota.registrar(notas, n6);
        Nota n7 = new Nota(33, 1.7, 1, matr3);
        Nota n8 = new Nota(33, 4, 2, matr3);
        Nota n9 = new Nota(34, 3.6, 3, matr3);
        Nota.registrar(notas, n7);
        Nota.registrar(notas, n8);
        Nota.registrar(notas, n9);

        session.setAttribute("notas", notas);
        session.setAttribute("materias", materias);
        session.setAttribute("estudiantes", estudiantes);
        session.setAttribute("profesores", profesores);
        session.setAttribute("matriculas", matriculas);
        session.setAttribute("personas", personas);
        session.setAttribute("grupos", grupos);
        
        JOptionPane.showMessageDialog(null, "Datos ficticios generados","SAAN",
                JOptionPane.INFORMATION_MESSAGE);
        
        request.setAttribute("usua", session.getAttribute("usua"));

        request.setAttribute("mensaje", Mensajes.mensaje);

        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
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
