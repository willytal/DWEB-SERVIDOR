<%-- 
    Document   : controlador
    Created on : 19-oct-2018, 13:51:19
    Author     : willy
--%>

<%@page import="Clases.Item"%>
<%@page import="Clases.Constantes"%>
<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);

            if (session.getAttribute("item") != null) {
                Item it = (Item) session.getAttribute("item");
                co.borrarItem(it.getId_item());
                session.removeAttribute("item");
                response.sendRedirect("profesor.jsp");
            }
        %>
    </body>
</html>
