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

            <form name="formulario" method="GET" action="listado.jsp">
                <fieldset style="width: 480px;">
                    <input type="text" name="correo2" value="<% out.print(us.getCorreo()); %>" size="20" /> <!-- en disabled no permite recuperar los datos con getParameter-->
                    <input type="text" name="curso2" value="<% out.print(us.getCurso()); %>" size="5" />
                    <input type="text" name="admin2" value="<% if (us.getAdmin() == 0) {
                            out.print("Admin");
                        } else {
                            out.print("User");
                        }%>" size="5" />
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
                    //Borrar -------------------------------------------------------------------------------------
                    if (request.getParameter("enviarlist") != null) {
                        String email = request.getParameter("correo2");
                        if (request.getParameter("enviarlist").equals("Borrar")) {
                            l = (ArrayList) session.getAttribute("lista");
                            Usuario usua = new Usuario();

                            for (Usuario usu : l) {
                                if (usu.getCorreo().equals(email)) {
                                    usua = usu; //No se puede alterar una lista enlazada o arraylist dentro de un for each, error de concurrencia
                                }
                            }

                            l.remove(usua);
                            session.setAttribute("lista", l);
                            response.sendRedirect("listado.jsp");
                        }
                        
                        //Cambio de permiso ----------------------------------------------------------------------
                        if (request.getParameter("enviarlist").equals("U") || request.getParameter("enviarlist").equals("A") ) {
                            String admin = request.getParameter("admin2");
                            String correo = request.getParameter("correo2");
                            l = (ArrayList) session.getAttribute("lista");
                            Usuario usua = new Usuario();
                            
                            for (Usuario usu : l) {
                                    if (usu.getCorreo().equals(correo)) {
                                            usua = usu;
                                        }
                                }

                                if (admin.equals("Admin")) {
                                    usua.setAdmin(1);
                                } else {
                                    usua.setAdmin(0);
                                }
                            
                            l.remove(usua);
                            l.add(usua);
                            session.setAttribute("lista", l);
                            response.sendRedirect("listado.jsp");
                        }
                    }

                }
            %>

        </div>
    </body>
</html>
