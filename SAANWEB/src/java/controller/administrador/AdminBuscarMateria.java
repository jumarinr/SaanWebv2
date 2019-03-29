/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.administrador;

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
import models.Grupo;
import models.Materia;
import models.Matricula;
import models.Nota;
import util.Mensajes;
import util.extra;

/**
 <c:if test="${not empty mat.getGrupos()}">
                                hola
                                <!--<table class="table" style="margin-top: -10px;width: auto;">
                                    <thead>
                                        <tr>
                                                   <th scope="col">Numero</th>
                                                   <th scope="col">Documento profesor</th>
                                            <th scope="col">Nombre Profesor</th>
                                                   <th scope="col">Cantidad estudiantes</th>
                                               </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${mat.getGrupos()}" var="gru">
                                                   <tr>
                                                           <td><a href="./administrador_buscarGrupo?num=${gru.getNumero()}&id=${mat.getId()}">${gru.getId()}</a></td>
                                                <td><a href="./administrador_buscarProfesor?id=${gru.getProfesor().getIdentificacion()}">${gru.getProfesor().getIdentificacion()}</a></td>
                                                <td>${gru.getProfesor().getNombre}</td>
                                                <td>${gru.getMatriculas().size()}</td>
                                                       </tr>
                                               </c:forEach>
                                        </tbody>
                                    </table>-->
                            </c:if>
 */
@WebServlet(urlPatterns = {"/administrador_buscarMateria"})
public class AdminBuscarMateria extends HttpServlet {

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
        List<Materia> materias = new ArrayList<Materia>();
        HttpSession session = request.getSession();
        if (session.getAttribute("materias") != null) {
            materias = (ArrayList<Materia>) session.getAttribute("materias");
        }
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            Materia mat = Materia.buscarMateria(materias, id);
            if (mat != null) {
                request.setAttribute("mat", mat);
            }
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusMateria.jsp");
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
        //Eliminar
        List<Materia> materias = new ArrayList<Materia>();
        List<Nota> notas = new ArrayList<Nota>();
        List<Matricula> matriculas = new ArrayList<Matricula>();
        List<Grupo> grupos = new ArrayList<Grupo>();
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
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (JOptionPane.showConfirmDialog(null, "Esta seguro de eliminar este registro",
                    "SAAN", JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
                JOptionPane.showMessageDialog(null, Materia.eliminar(materias, grupos, matriculas, notas, id), "SAAN",
                        JOptionPane.INFORMATION_MESSAGE);
                session.setAttribute("materias", materias);
                session.setAttribute("grupos", grupos);
                session.setAttribute("matriculas", matriculas);
                session.setAttribute("notas", notas);
            }
        }
        request.setAttribute("mensaje", Mensajes.mensaje);
        request.setAttribute("usua", session.getAttribute("usua"));
        RequestDispatcher view = request.getRequestDispatcher("adminBusMateria.jsp");
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
