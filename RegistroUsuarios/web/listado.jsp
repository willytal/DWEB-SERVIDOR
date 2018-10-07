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
                if (session.getAttribute("lista") != null) {

                    ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista");
                    //Usuario u = (Usuario) session.getAttribute("userlogeado");

                    for (Usuario us : l) {
            %>

            <form name="formulario" method="POST" action="listado.jsp">
                <fieldset style="width: 480px;">
                    <input type="text" name="correo2" value="<% out.print(us.getCorreo()); %>" size="20" disabled="disabled" /> 
                    <input type="text" name="curso2" value="<% out.print(us.getCurso()); %>" size="5" disabled="disabled" />
                    <input type="text" name="admin2" value="<% if (us.getAdmin() == 0) {
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
                    <input type="submit" value="Modificar" name="enviarlist" />
                </fieldset>
            </form>

            <%

                    }
                    //out.print(request.getParameter("correo").toString());
                    if (request.getParameter("enviarlist") != null) {
                        if (request.getParameter("enviarlist").equals("Borrar")) {
                            l = (ArrayList) session.getAttribute("lista");
                            String email = request.getParameter("correo2");

                            for (Usuario usu : l) {
                                if (usu.getCorreo().equals(email)) {
                                    l.remove(usu);
                                }
                            }

                            session.setAttribute("lista", l);
                        }
                    }

                }
            %>

        </div>
    </body>
</html>
