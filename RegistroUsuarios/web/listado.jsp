<%-- 
    Document   : listado
    Created on : 03-oct-2018, 17:28:06
    Author     : willy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de usuarios registrados</title>
    </head>
    <body>
        <h1>Listado</h1>
        <div id="listado">
            <%
                ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista"); //Recupero la lista de la sesion
                Usuario u = (Usuario) session.getAttribute("userlogueado");

                for (Usuario us : l) {
            %>
            <<form name="formulario"  ></form>
                
            <%
                }
            %>

        </div>
    </body>
</html>
