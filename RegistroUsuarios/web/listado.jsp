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
            
                        <form name="formulario" method="POST" >
                            <fieldset>
                                <input type="text" name="caja" value="<% out.print(us.getCorreo()); %>" size="20" disabled="disabled" /> 
                                <input type="text" name="caja" value="<% out.print(us.getCurso()); %>" size="5" disabled="disabled" />
                                <input type="text" name="caja" value="<% if (us.getAdmin() == 0) {out.print("Admin");} else {out.print("User");}%>" size="5" disabled="disabled" />

                                <a href="borrar.jsp"> <input type="button" value="Borrar" name="enviarlist" /></a>
                                <input type="button" value="Modificar" name="enviarlist" />
                                <a href=""><input type="button" value="<% if (us.getAdmin() == 0) {out.print("U");} else {out.print("A");}%>" name="enviarlist" /></a>
                            </fieldset>
                        </form>
            <%
                        }
            %>

        </div>
    </body>
</html>
