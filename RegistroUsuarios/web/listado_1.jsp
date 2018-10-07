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
                if (request.getParameter("enviarlist") == null) {

                    ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista"); //Recupero la lista de la sesion
                    Usuario u = (Usuario) session.getAttribute("userlogueado");

                    for (Usuario us : l) {
            %>

            <form name="formulario" method="POST" action="listado.jsp">
                <fieldset style="width: 480px;">
                    <input type="text" name="correo" value="<% out.print(us.getCorreo()); %>" size="20" disabled="disabled" /> 
                    <input type="text" name="curso" value="<% out.print(us.getCurso()); %>" size="5" disabled="disabled" />
                    <input type="text" name="admin" value="<% if (us.getAdmin() == 0) {
                            out.print("Admin");
                        } else {
                            out.print("User");
                        }%>" size="5" disabled="disabled" />

                    <input type="submit" value="<% if (us.getAdmin() == 0) {
                            out.print("U");
                        } else {
                            out.print("A");
                        }%>" name="enviarlist" />
                    <input type="submit" value="Borrar" name="enviarlist" />
                </fieldset>
            </form>

            <form name="formulario2" method="POST" action="modificar.jsp">
                <input type="hidden" name="correo" value="<% out.print(us.getCorreo()); %>" disabled="disabled" /> 
                <input type="hidden" name="curso" value="<% out.print(us.getCurso()); %>" disabled="disabled" />
                <input type="hidden" name="admin" value="<% if (us.getAdmin() == 0) {
                        out.print("Admin");
                    } else {
                        out.print("User");
                    }%>" disabled="disabled" />

                <input type="submit" value="Modificar" name="enviarlist" />
            </form>
            <%
                    }
                } else if (request.getParameter("enviarlist").equals("Borrar")) {
                    String correo = request.getParameter("correo");
                    ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista");

                    for (Usuario u : l) {
                        if (u.getCorreo().equals(correo)) {
                            l.remove(u);
                        }
                    }

                    session.setAttribute("lista", l);
                }
            %>

        </div>
    </body>
</html>
