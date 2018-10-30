<%-- 
    Document   : anadiritem
    Created on : 24-oct-2018, 13:55:43
    Author     : willy
--%>

<%@page import="Clases.Usuario"%>
<%@page import="Clases.Constantes"%>
<%@page import="Clases.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Usuarios</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
        %>
        <div id="divform">
            <form name="formadditem" id="formanadir" method="POST" action="controladores/controlador_director.jsp">
                <fieldset>
                    <legend> Gestion de Usuarios </legend>

                    <label> Nombre: </label> <input type="text" name="cajanombre" value="" /><br><br>
                    <label> Email: </label> <input type="text" name="cajaemail" value="" /><br><br>
                    <label> Password: </label> <input type="text" name="cajapass" value="" /><br><br>
                    <label> Repetir Password: </label> <input type="text" name="cajapass2" value="" /><br><br>
                    <label> ID Departamento: </label> <input type="text" name="cajaid" value="" /><br><br>
                    <input type="submit" value="Registrar Usuario" name="enviardatos" />

                    <br>
                    <br>
                    <fieldset id="field_adduser">
                        <legend>Eliminar Usuario</legend>
                        <select name="selectuser">
                            <%
                                ArrayList profesores = co.obtenerProfesores();

                                for (Object profesor : profesores) {
                                    Usuario profe = (Usuario) profesor;
                            %>
                            <option> <% out.print(profe.getNombre()); %> </option>
                            <%
                                }
                            %>

                        </select>
                        <br>
                        <input id="btneliminar" type="submit" value="Eliminar Usuario" name="enviardatos" />
                    </fieldset>
                    
                    
                    <br>
                    <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>
                </fieldset>
            </form>
        </div>
    </body>
</html>
