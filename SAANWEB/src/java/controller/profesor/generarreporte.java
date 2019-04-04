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

import models.Materia;

import util.Mensajes;

import util.generarExcel;



/**

 *

 * @author pipel

 */

@WebServlet(name = "generarreporte", urlPatterns = {"/generarReporte"})

public class generarreporte extends HttpServlet {



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

        List<Materia> materias = new ArrayList<Materia>();

        HttpSession session = request.getSession();

        String imprimir = "";

        if (session.getAttribute("materias") != null) {

            materias = (ArrayList<Materia>) session.getAttribute("materias");

        }

        if (request.getParameter("id") != null) {

            int id = Integer.parseInt(request.getParameter("id"));

            Materia mat = Materia.buscarMateria(materias, id);

            if (mat != null) {

                imprimir = generarExcel.generarArchivoDeExcel(mat);

            }else{

                imprimir = "La materia no esta registrada";

            }

        }

        request.setAttribute("imprimir", imprimir);

        request.setAttribute("mensaje", Mensajes.mensaje);

        request.setAttribute("usua", session.getAttribute("usua"));

        RequestDispatcher view = request.getRequestDispatcher("/menuprof");

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