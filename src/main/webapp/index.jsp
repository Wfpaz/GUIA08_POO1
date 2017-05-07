<%@page import="java.util.Base64"%>
<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- language maneja el idioma actual --%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="com.sv.udb.bundle.file"/>

<!DOCTYPE HTML>

<html>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'> 
        <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script> 
        <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
        <title>GUIA08</title>
    
    <body>
        <div class="bg-default">
            <div class="bg-info">
                <form>
                    <select id="language" name="language" onchange="submit();">
                        <option value="es_ES" 
                            <c:if test="${language=='es_ES'}">selected</c:if>>
                            <fmt:message key="label.español" />
                        </option>
                        <option value="en_US" 
                            <c:if test="${language=='en_US'}">selected</c:if>>
                            <fmt:message key="label.ingles" />
                       </option>
                    </select>
                </form>
            </div>
        </div>
        <div>
            <div class="col-md-12 bg-success">
            <h1 class="bg-primary"><fmt:message key="lblEquipos"/></h1>
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
                        <input type="text" class="form-control" name="nomb" id="nomb" value="${nomb}" placeholder="<fmt:message key="lblEquipo"/>" required><br>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="desc" id="desc" value="${desc}" placeholder="<fmt:message key='txtDescripcion'/>" required><br>
                    </div>
                    <div class="form-group">
                        <input type="file" name="img" id="img" />
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-default" name="btnEqui" value="<fmt:message key="btnGuardar"/>"/> 
                        <input type="submit" class="btn btn-primary" style="<%=clssEditBton%>" name="btnEqui" value="<fmt:message key="btnGuardar"/>"/>
                        <input type="submit" class="btn btn-danger" style="<%=clssEditBton%>" name="btnEqui" value="<fmt:message key="btnEliminar"/>"/>
                    </div>
                </form>

                <form action="EquiposServ" method="POST" name="Demo" class="col-md-4">
                    <table border="1">
                        <thead>
                            <tr>
                                <th><fmt:message key="lblCodigo"/></th>
                                <th><fmt:message key="lblEquipo"/></th>
                                <th><fmt:message key="txtDescripcion"/></th>
                                <th><fmt:message key="thFoto"/></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                for (Equipos temp : new EquiposCtrl().consTodo()) {
                                    byte[] foto = temp.getImagen();
                                    String imagen = Base64.getEncoder().encodeToString(foto);
                            %>

                            <tr>
                                <td><input type="radio" name="codiEquiRadio" value="<%=temp.getCodiEquipos() %>"></td>
                                <td><%=temp.getNombEquipo()%></td>
                                <td><%=temp.getDescEquipo()%></td>
                                <td><img src="data:image/*;base64,<%=imagen%>" class="materialboxed" width="50" height="50"></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <input type="submit" name="btnEqui" value="<fmt:message key="btnConsultar"/>"/>
                </form>
            </div>
                        
            <div class="bg-default">
                <br/>
                <br/>
                <br/>
            </div>
                        
            <div class="col-md-12 bg-info">
                <h1 class="bg-primary"><fmt:message key="lblJugadores"/></h1>
                
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
                        <input type="text" name="nomb_juga" id="nomb_juga" value="${nomb_juga}" placeholder="<fmt:message key="lblNombres"/>"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" max="99" min="0" name="edad" id="edad" value="${edad}" placeholder="<fmt:message key="lblEdad"/>"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" step="any" min="0" name="altu" id="altu" value="${altu}" placeholder="<fmt:message key="lblAltura"/>"><br>
                    </div>
                    <div class="form-group">
                        <input type="text" step="any" min="0" name="peso" id="peso" value="${peso}" placeholder="<fmt:message key="lblPeso"/>"><br>
                    </div>
                    <!-- input type="submit" class="btn btn-default" name="btnJuga" value="< %=nombBtn%>"/--> 
                        <input type="submit" class="btn btn-default" name="btnEqui" value="<fmt:message key="btnGuardar"/>"/> 
                        <input type="submit" class="btn btn-primary" style="<%=clssEditBton%>" name="btnEqui" value="<fmt:message key="btnGuardar"/>"/>
                        <input type="submit" class="btn btn-danger" style="<%=clssEditBton%>" name="btnEqui" value="<fmt:message key="btnEliminar"/>"/>
                    <br>.
                </form>

                <form action="JugadoresServ" method="POST" name="Demo" class="col-md-4">
                    <table border="1">
                        <thead>
                            <tr>
                                <th><fmt:message key="lblCodigo"/> </th>
                                <th><fmt:message key="lblNombres"/> </th>
                                <th><fmt:message key="lblEdad"/> </th>
                                <th><fmt:message key="lblAltura"/> </th>
                                <th><fmt:message key="lblPeso"/> </th>
                                <th><fmt:message key="lblEquipo"/> </th>
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
                    <input type="submit"name="btnJuga" value="<fmt:message key="btnConsultar"/>"/>
                </form>
            </div>
        </div>
        
    </body>
</html>
