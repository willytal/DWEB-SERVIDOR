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
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
        %>
    </head>
    <body>

        <%
            if (session.getAttribute("usuario") != null) {

                Usuario u = (Usuario) session.getAttribute("usuario");
        %>

        <form name="formaulas" id="form_aulas" method="POST" action="profesor.jsp">
            <fieldset id="field_aulas">
                <legend>Aulas - Rol Profesor</legend>
                <select name="aulalista">
                    <option selected="">Selecciona el Aula</option>
                    <%
                        LinkedList list_aulas = co.obtenerAulasDepartamento(u.getId_user());

                        for (Object id_aula : list_aulas) {
                    %>
                    <option><% out.print(id_aula.toString()); %></option>
                    <%
                        }
                    %>

                </select>
                <input type="submit" value="Mostrar" name="enviarAulas" />
            </fieldset>

            <%
                if (request.getParameter("aulalista") != null) {
                    if (!request.getParameter("aulalista").equals("Selecciona el Aula")) {
            %>
            <fieldset <% if (request.getParameter("enviarAulas") != null) {
                    out.print("");
                } else {
                    out.print("hidden=''");
                } %> >
                <legend>Inventario</legend>
                <%
                    ArrayList itemsaula = co.obtenerItemsAula(Integer.parseInt(request.getParameter("aulalista")));
                    for (Object item : itemsaula) {
                %>
                <div>
                    <p><% out.print(item.toString()); %></p>
                </div>
                <%
                    }
                %>

            </fieldset>

            <%                        }
                    }
                }
            %>

                <input type="submit" value="Cerrar Sesion" name="cerrarsesion" />

            <%
                if (request.getParameter("cerrarsesion") != null) {
                    session.removeAttribute("usuario");
                    session.removeAttribute("rol");
                    session.removeAttribute("listarol");
                    response.sendRedirect("index.jsp");
                }
            %>
        </form>

    </body>
</html>
