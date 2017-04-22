<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
<!DOCTYPE HTML>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
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

                    <% request.setAttribute( "test", new EquiposCtrl().consTodo()); %>
                    <display:table name="test" id="test" pagesize="5" export="true">
                        <display:column property="codiEquipos" title="ID" sortable="true" sortName="codiEquipos"/>
                        <display:column property="nombEquipo" title="Nombre equipo" sortable="true" sortName="nombEquipo"/>
                        <display:column property="descEquipo" title="Descripcion" sortable="true" sortName="descEquipo"/>
                    </display:table>
            </div>
                        
            <div class="bg-default">
                <br/>
                <br/>
                <br/>
            </div>
        </div>
        
    </body>
</html>
