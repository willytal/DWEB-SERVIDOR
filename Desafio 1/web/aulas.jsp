<%-- 
    Document   : validar
    Created on : 10-oct-2018, 13:30:53
    Author     : willy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Clases.Constantes"%>
<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aulas</title>
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>

        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
            Usuario jefe = (Usuario) session.getAttribute("usuario");
        %>
        <form name="formaulas" id="form_aulas" method="POST" action="controladores/controlador_jefe.jsp">
            <fieldset id="field_aulas">
                <legend>Aulas</legend>
                
                <label> ID Aula: </label>
                <select name="aulalista">
                    <%                        LinkedList list_aulas = co.obtenerAulasDepartamento(jefe.getId_user());

                        for (Object id_aula : list_aulas) {
                    %>
                    <option><% out.print(id_aula.toString()); %></option>
                    <%
                        }
                    %>
                </select>

                <label> ID Profesor: </label>
                <select name="listaprofes">
                    <%
                        ArrayList profesores = co.obtenerUsuariosNoDirector(jefe.getId_depart());
                        Usuario profe = new Usuario();

                        for (Object profesor : profesores) {
                            profe = (Usuario) profesor;
                    %>
                    <option> <% out.print(profe.getId_user()); %> </option>
                    <%
                        }
                    %>
                </select>

                <br>
                <br>
                <input type="submit" value="Quitar" name="enviardatos" />
                <input type="submit" value="Asignar" name="enviardatos" />
            </fieldset>

        </form>

    </body>
</html>
