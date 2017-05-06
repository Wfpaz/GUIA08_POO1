<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<!DOCTYPE HTML>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <!--h4>${mensAlert}</h4-->

                <form action="EquiposServ" method="POST" name="Demo" class="col-md-3 col-md-offset-2">
                    <!-- input type="hidden" name="codi" id="codi" value="$ {codi}" placeholder="Text input" --><br>
                    <input type="text" name="nomb" id="nomb" value="${nomb}" placeholder="Nombre del equipo"><br>
                    <input type="text" name="desc" id="desc" value="${desc}" placeholder="Descripción"><br>
                    <c:if test="${codi==null}">
                        <input type="submit" class="btn btn-default" name="btnEqui" value="Guardar"/>
                    </c:if> 
                    <c:if test="${codi != '' and codi!=null}">
                        <input type="submit" class="btn btn-primary" name="btnEqui" value="Modificar"/> 
                        <input type="submit" class="btn btn-danger"  name="btnEqui" value="Eliminar"/>      
                    </c:if>    
                        <input type="submit" class="btn btn-danger"  name="btnEqui" value="Nuevo"/>
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
                               List<Equipos> listEqui = new EquiposCtrl().consTodo();
                               pageContext.setAttribute("listEquiJSTL", listEqui);
                           %>
                           <c:forEach items="${listEquiJSTL}" var="temp">
                                <tr>
                                   <td>
                                       <p>
                                           <!--input name="codiEquiRadi" type="radio" id="$ {temp.codiEquipos}" value="$ {temp.codiEquipos}" />
                                           <label for="$ {temp.codiEquipos}"></label-->
                                       </p>
                                   </td>
                                   <td>${temp.nombEquipo}</td>
                                   <td>${temp.descEquipo}</td>                
                               </tr>
                           </c:forEach>
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
        <!--           
            <div class="col-md-12 bg-info">
                <h1 class="bg-primary">Control de jugadores</h1>
                
                < % 
                    boolean estModi = Boolean.parseBoolean((String)request.getAttribute("estModi")); 
                    String nombBtn = estModi ? "Nuevo" : "Guardar"; // Para el texto del botón 
                    String clssEditBtn = estModi ? "" : "display: none"; //Pra ocultar botones 
                 %> 
                <h4>$ {mensAlert}</h4>
                <form action="JugadoresServ" method="POST" name="Demo" class="col-md-3 col-md-offset-2">
                    <div class="form-group">
                        <input type="hidden" name="codi_juga" id="codi_juga" value="$ {codi_juga}" placeholder="Text input"><br>
                    </div>
                    <select class="form-control">
                        < % for (Equipos obj : new EquiposCtrl().consTodo()) { %>
                        <option value="$ {codi_equi}" selected="$ {codi_equi}">< %=obj.getNombEquipo()%></option>
                        < % } %>
                    </select><br>
                    <div class="form-group">
                        <input type="text" name="nomb_juga" id="nomb_juga" value="$ {nomb_juga}" placeholder="Nombre"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" max="99" min="0" name="edad" id="edad" value="$ {edad}" placeholder="Edad"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" step="any" min="0" name="altu" id="altu" value="$ {altu}" placeholder="Altura"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" step="any" min="0" name="peso" id="peso" value="$ {peso}" placeholder="Peso"><br>
                    </div>
                    <input type="submit" class="btn btn-default" name="btnJuga" value="< %=nombBtn%>"/> 
                    <input type="submit" class="btn btn-primary" style="< %=clssEditBtn%>" name="btnJuga" value="Modificar"/> 
                    <input type="submit" class="btn btn-danger" style="< %=clssEditBtn%>" name="btnJuga" value="Eliminar"/> 
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

                            < %
                                for (Jugadores temp : new JugadoresCtrl().consTodo()) {
                                    Equipos obj = new EquiposCtrl().consUno(temp.getCodEquipo());
                            %>

                            <tr>
                                <td><input type="radio" name="codiJugaRadio" value="< %=temp.getCodJugador()%>"></td>
                                <td>< %=temp.getNomJugador()%></td>
                                <td>< %=temp.getEdad()%></td>
                                <td>< %=temp.getAltura()%></td>
                                <td>< %=temp.getPeso()%></td>
                                <td>< %=obj.getNombEquipo()%></td>
                            </tr>
                            < % } %>
                        </tbody>
                    </table>
                    <input type="submit" value="Consultar" name="btnJuga"/>
                </form>
            </div-->
        </div>  
    </body>
</html>
