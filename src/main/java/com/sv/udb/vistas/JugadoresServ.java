/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vistas;

import com.sv.udb.controlador.JugadoresCtrl;
import com.sv.udb.modelo.Jugadores;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Walter
 */
@WebServlet(name = "JugadoresServ", urlPatterns = {"/JugadoresServ"})
public class JugadoresServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean esValido = request.getMethod().equals("POST");
        String mens = "";
        
        if (!esValido) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }else {
            String CRUD = request.getParameter("btnJuga");
            
            if (null != CRUD) switch (CRUD) {
                case "Guardar":{
                    Jugadores obje = new Jugadores();
                    //obje.setCodiEquipo(Integer.parseInt(request.getParameter("codi")));
                    obje.setCodEquipo(Integer.valueOf(request.getParameter("codi-equi")));
                    obje.setNomJugador(request.getParameter("nom-juga"));
                    obje.setEdad(Integer.parseInt(request.getParameter("edad")));
                    obje.setAltura(Double.parseDouble(request.getParameter("altu")));
                    obje.setPeso(Double.parseDouble(request.getParameter("peso")));
                    if (new JugadoresCtrl().guardar(obje)) {
                        mens = "Datos guardados";
                    } else {
                        mens = "Error al guardar";
                    }       break;
                    }
                case "Consultar":{
                    int codigo;
                    codigo = Integer.parseInt(request.getParameter("codiJugaRadio").isEmpty() ? "-1" : request.getParameter("codiEquiRadio"));
                    Jugadores obje = new JugadoresCtrl().consUno(codigo);
                    if (obje != null) {
                        request.setAttribute("codi-juga", obje.getCodJugador());
                        request.setAttribute("codi-equi", obje.getCodEquipo());
                        request.setAttribute("nom-juga", obje.getNomJugador());
                        request.setAttribute("edad", obje.getNomJugador());
                        request.setAttribute("altu", obje.getAltura());
                        request.setAttribute("peso", obje.getPeso());
                        request.setAttribute("estModi", "true");
                    } else {
                        mens = "Error al consultar";
                    }       break;
                    }
                case "Nuevo":
                    request.setAttribute("codi-juga", "");
                    request.setAttribute("codi-equi", "");
                    request.setAttribute("nom-juga", "");
                    request.setAttribute("edad", "");
                    request.setAttribute("altu", "");
                    request.setAttribute("peso", "");
                    break;
                case "Eliminar":{
                    Jugadores obje = new Jugadores();
                    obje.setCodJugador(Integer.parseInt(request.getParameter("codi")));
                    obje.setCodEquipo(Integer.valueOf(request.getParameter("codi-equi")));
                    obje.setNomJugador(request.getParameter("nom-juga"));
                    obje.setEdad(Integer.getInteger(request.getParameter("edad")));
                    obje.setAltura(Double.parseDouble(request.getParameter("altu")));
                    obje.setPeso(Double.parseDouble(request.getParameter("peso")));
                    if (new JugadoresCtrl().eliminar(obje)) {
                        mens = "Datos eliminados";
                    } else {
                        mens = "Error al eliminar";
                    }       break;
                    }
                case "Modificar":{
                    Jugadores obje = new Jugadores();
                    obje.setCodJugador(Integer.parseInt(request.getParameter("codi")));
                    obje.setCodEquipo(Integer.valueOf(request.getParameter("codi-equi")));
                    obje.setNomJugador(request.getParameter("nom-juga"));
                    obje.setEdad(Integer.getInteger(request.getParameter("edad")));
                    obje.setAltura(Double.parseDouble(request.getParameter("altu")));
                    obje.setPeso(Double.parseDouble(request.getParameter("peso")));
                    if (new JugadoresCtrl().modificar(obje)) {
                        mens = "Datos modificados";
                    } else {
                        mens = "Error al modificar";
                    }       break;
                    } 
                default:
                    break;
            }
            request.setAttribute("mensAlert", mens);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
