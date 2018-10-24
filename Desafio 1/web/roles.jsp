<%-- 
    Document   : roles
    Created on : 16-oct-2018, 12:00:09
    Author     : willy
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Clases.Constantes"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccion de Roles</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
            if (request.getParameter("enviar") == null) {
        %>
        <form name="formroles" id="form_roles" method="POST" action="roles.jsp" >
            <fieldset>
                <legend>Seleccion de Rol</legend>
                <%
                    Usuario u = (Usuario) session.getAttribute("usuario");
                    LinkedList list_rol = (LinkedList) co.obtenerRol(u.getId_user());
                    session.setAttribute("listaroles", list_rol);
                %>

                <select name="listroles">
                    <%
                        for (Object rol : list_rol) {
                    %>
                    <option><% out.print(rol.toString()); %></option>
                    <%
                        }
                    %>
                </select>

                <input type="submit" value="Aceptar" name="enviar" />
            </fieldset>

        </form>
        <%
            } else {
                if (request.getParameter("listroles").equals("Profesor")) {
                    session.setAttribute("rol", request.getParameter("listroles"));
                    response.sendRedirect("profesor.jsp");
                }
                if (request.getParameter("listroles").equals("Jefe de Departamento")) {
                    session.setAttribute("rol", request.getParameter("listroles"));
                    response.sendRedirect("jefe.jsp");
                }
                if (request.getParameter("listroles").equals("Director")) {
                    session.setAttribute("rol", request.getParameter("listroles"));
                    response.sendRedirect("director.jsp");
                }
            }
        %>






    </body>
</html>
