<%@page import="java.util.Base64"%>
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
                <form action="EquiposServ" method="POST" name="Demo" class="col-md-3 col-md-offset-2" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="codi" id="codi" value="${codi}" placeholder="Text input" required><br>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="nomb" id="nomb" value="${nomb}" placeholder="Nombre del equipo" required><br>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="desc" id="desc" value="${desc}" placeholder="Descripción" required><br>
                    </div>
                    <div class="form-group">
                        <input type="file" name="img" id="img" />
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-default" name="btnEqui" value="<%=nombBton%>"/> 
                        <input type="submit" class="btn btn-primary" style="<%=clssEditBton%>" name="btnEqui" value="Modificar"/> 
                        <input type="submit" class="btn btn-danger" style="<%=clssEditBton%>" name="btnEqui" value="Eliminar"/>
                    </div>
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
                                    byte[] photo = temp.getImagen();
                                    String bphoto = Base64.getEncoder().encodeToString(photo);
                            %>

                            <tr>
                                <td><input type="radio" name="codiEquiRadio" value="<%=temp.getCodiEquipos() %>"></td>
                                <td><%=temp.getNombEquipo()%></td>
                                <td><%=temp.getDescEquipo()%></td>
                                <td><img src="data:image/*;base64,<%=bphoto%>" class="materialboxed" width="100" height="100"></td>
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
                    <div class="form-group">
                        <input type="hidden" name="codi_juga" id="codi_juga" value="${codi_juga}" placeholder="Text input"><br>
                    </div>
                    <select class="form-control">
                        <% for (Equipos obj : new EquiposCtrl().consTodo()) { %>
                        <option value="${codi_equi}" selected="${codi_equi}"><%=obj.getNombEquipo()%></option>
                        <% } %>
                    </select><br>
                    <div class="form-group">
                        <input type="text" name="nomb_juga" id="nomb_juga" value="${nomb_juga}" placeholder="Nombre"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" max="99" min="0" name="edad" id="edad" value="${edad}" placeholder="Edad"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" step="any" min="0" name="altu" id="altu" value="${altu}" placeholder="Altura"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" step="any" min="0" name="peso" id="peso" value="${peso}" placeholder="Peso"><br>
                    </div>
                    <input type="submit" class="btn btn-default" name="btnJuga" value="<%=nombBtn%>"/> 
                    <input type="submit" class="btn btn-primary" style="<%=clssEditBtn%>" name="btnJuga" value="Modificar"/> 
                    <input type="submit" class="btn btn-danger" style="<%=clssEditBtn%>" name="btnJuga" value="Eliminar"/> 
                    <br>.
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
                                    Equipos obj = new EquiposCtrl().consUno(temp.getCodEquipo());
                            %>

                            <tr>
                                <td><input type="radio" name="codiJugaRadio" value="<%=temp.getCodJugador()%>"></td>
                                <td><%=temp.getNomJugador()%></td>
                                <td><%=temp.getEdad()%></td>
                                <td><%=temp.getAltura()%></td>
                                <td><%=temp.getPeso()%></td>
                                <td><%=obj.getNombEquipo()%></td>
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
