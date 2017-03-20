<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<!DOCTYPE HTML>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'> 
        <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script> 
        <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
        <title>GUIA08</title>
    
    <body>
        <div>
            <div class="col-md-12 bg-success">
            <h1 class="bg-primary">Control de Equipos</h1>
                <% 
                    boolean estaModi = Boolean.parseBoolean((String)request.getAttribute("estaModi")); 
                    String nombBton = estaModi ? "Nuevo" : "Guardar"; // Para el texto del botón 
                    String clssEditBton = estaModi ? "" : "display: none"; //Pra ocultar botones 
                 %> 
                <h4>${mensAlert}</h4>
                <form action="EquiposServ" method="POST" name="Demo" class="col-md-3 col-md-offset-2">
                    <input type="hidden" name="codi" id="codi" value="${codi}" placeholder="Text input"><br>
                    <input type="text" name="nomb" id="nomb" value="${nomb}" placeholder="Nombre del equipo"><br>
                    <input type="text" name="desc" id="desc" value="${desc}" placeholder="Descripción"><br>
                    <input type="submit" class="btn btn-default" name="btnEqui" value="<%=nombBton%>"/> 
                    <input type="submit" class="btn btn-primary" style="<%=clssEditBton%>" name="btnEqui" value="Modificar"/> 
                    <input type="submit" class="btn btn-danger" style="<%=clssEditBton%>" name="btnEqui" value="Eliminar"/> 
                </form>

                <form action="EquiposServ" method="POST" name="Demo" class="col-md-4">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Cons</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (Equipos temp : new EquiposCtrl().consTodo()) {
                            %>

                            <tr>
                                <td><input type="radio" name="codiEquiRadio" value="<%=temp.getCodiEquipos() %>"></td>
                                <td><%=temp.getNombEquipo()%></td>
                                <td><%=temp.getDescEquipo()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <input type="submit" value="Consultar" name="btnEqui"/>
                </form>
            </div>
                        
            <div class="bg-default">
                <br/>
                <br/>
                <br/>
            </div>
                        
            <div class="col-md-12 bg-info">
            <h1 class="bg-primary">Control de jugadores</h1>
                
                <% 
                    boolean estModi = Boolean.parseBoolean((String)request.getAttribute("estModi")); 
                    String nombBtn = estModi ? "Nuevo" : "Guardar"; // Para el texto del botón 
                    String clssEditBtn = estModi ? "" : "display: none"; //Pra ocultar botones 
                 %> 
                <h4>${mensAlert}</h4>
                <form action="JugadoresServ" method="POST" name="Demo" class="col-md-3 col-md-offset-2">
                    <input type="hidden" name="codi-juga" id="codi-juga" value="${codi}" placeholder="Text input"><br>
                    <input type="text" name="codi-equi" id="codi-equi" value="${nomb}" placeholder="Equipo"><br>
                    <input type="text" name="nom-juga" id="nom-juga" value="${desc}" placeholder="Nombre"><br>
                    <input type="number" max="99" min="0" name="edad" id="edad" value="${codi}" placeholder="Edad"><br>
                    <input type="number" min="0" name="altu" id="altu" value="${nomb}" placeholder="Altura"><br>
                    <input type="number" min="0" name="peso" id="peso" value="${desc}" placeholder="Peso"><br>
                    <input type="submit" class="btn btn-default" name="btnJuga" value="<%=nombBtn%>"/> 
                    <input type="submit" class="btn btn-primary" style="<%=clssEditBtn%>" name="btnJuga" value="Modificar"/> 
                    <input type="submit" class="btn btn-danger" style="<%=clssEditBtn%>" name="btnJuga" value="Eliminar"/> 
                </form>

                <form action="JugadoresServ" method="POST" name="Demo" class="col-md-4">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Cons </th>
                                <th>Nombre </th>
                                <th>Edad </th>
                                <th>Altura </th>
                                <th>Peso </th>
                                <th>Equipo </th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (Jugadores temp : new JugadoresCtrl().consTodo()) {
                            %>

                            <tr>
                                <td><input type="radio" name="codiJugaRadio" value="<%=temp.getCodJugador()%>"></td>
                                <td><%=temp.getNomJugador()%></td>
                                <td><%=temp.getEdad()%></td>
                                <td><%=temp.getAltura()%></td>
                                <td><%=temp.getPeso()%></td>
                                <td><%=temp.getCodEquipo()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <input type="submit" value="Consultar" name="btnJuga"/>
                </form>
            </div>
        </div>
        
    </body>
</html>
