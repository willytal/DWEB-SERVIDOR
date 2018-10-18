<%-- 
    Document   : validar
    Created on : 10-oct-2018, 13:30:53
    Author     : willy
--%>

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
        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
        %>
    </head>
    <body>

        <%
            if (request.getParameter("enviarAulas") == null) {
        %>
        <form name="formaulas" id="form_aulas" method="POST" action="aulas.jsp">
            <fieldset id="field_aulas">
                <legend>Aulas</legend>
                <select name="aulalista">
                    <%
                        LinkedList list_aulas = co.obtenerAulas();

                        for (Object id_aula : list_aulas) {
                    %>
                    <option><% out.print(id_aula.toString()); %></option>
                    <%
                        }

                    %>
                </select>
                <input type="submit" value="Mostrar" name="enviarAulas" />
            </fieldset>

            <%            } else {
            %>
            <fieldset>
                <legend>Inventario</legend>
                
            </fieldset>
            <%
                    out.print("Aulas listadas");
                }
            %>
        </form>

    </body>
</html>
