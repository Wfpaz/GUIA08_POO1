/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vistas;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import com.sv.udb.controlador.EquiposCtrl;
import com.sv.udb.modelo.Equipos;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;

/**
 *
 * @author Walter
 */
@WebServlet(name = "EquiposServ", urlPatterns = {"/EquiposServ"})
@MultipartConfig
public class EquiposServ extends HttpServlet {

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
            String CRUD = request.getParameter("btnEqui");
            
            if ("Guardar".equals(CRUD)) {
                Equipos obje = new Equipos();
                //obje.setCodiEquipo(Integer.parseInt(request.getParameter("codi")));
                obje.setNombEquipo(request.getParameter("nomb"));
                obje.setDescEquipo(request.getParameter("desc"));

                byte[] foto = null;
                final Part filePart = request.getPart("img");
                int tamaFoto = (int)filePart.getSize();
                if (filePart != null) {
                    foto = new byte[tamaFoto];
                    try(DataInputStream imagen = new DataInputStream(filePart.getInputStream())) {
                        imagen.readFully(foto);
                    }
                }
                
                if (tamaFoto > 0) {
                    obje.setImagen(foto);
                }

                if (new EquiposCtrl().guardar(obje)) {
                    mens = "Datos guardados";
                } else {
                    mens = "Error al guardar";
                }
                
            } else if ("Consultar".equals(CRUD)) {
                
                int codigo = Integer.parseInt(request.getParameter("codiEquiRadio").isEmpty() ? "-1" : request.getParameter("codiEquiRadio"));
                Equipos obje = new EquiposCtrl().consUno(codigo);
                if (obje != null) {
                    request.setAttribute("codi", obje.getCodiEquipos());
                    request.setAttribute("nomb", obje.getNombEquipo());
                    request.setAttribute("desc", obje.getDescEquipo());
                    request.setAttribute("estaModi", "true");
                } else {
                    mens = "Error al consultar";
                }
                
            } else if("Nuevo".equals(CRUD)) { 
                request.setAttribute("codi", ""); 
                request.setAttribute("nomb", ""); 
                request.setAttribute("desc", ""); 
                
            } else if("Eliminar".equals(CRUD)) {
                Equipos obje = new Equipos(); 
                obje.setCodiEquipo(Integer.parseInt(request.getParameter("codi")));
                obje.setNombEquipo(request.getParameter("nomb"));
                obje.setDescEquipo(request.getParameter("desc"));

                if (new EquiposCtrl().eliminar(obje)) {
                    mens = "Datos eliminados";
                } else {
                    mens = "Error al eliminar";
                } 
            } else if("Modificar".equals(CRUD)) {
                Equipos obje = new Equipos(); 
                obje.setCodiEquipo(Integer.parseInt(request.getParameter("codi")));
                obje.setNombEquipo(request.getParameter("nomb"));
                obje.setDescEquipo(request.getParameter("desc"));

                if (new EquiposCtrl().modificar(obje)) {
                    mens = "Datos modificados";
                } else {
                    mens = "Error al modificar";
                } 
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
