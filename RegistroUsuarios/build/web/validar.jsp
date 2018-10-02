<%-- 
    Document   : validar
    Created on : 28-sep-2018, 12:58:30
    Author     : willy
--%>

<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar</title>
    </head>
    <body>

        <div style="width: 300px; margin: 0 auto;">
            <form name="formulario" method="POST" action="registro.jsp">
                <fieldset style="width: 200px">
                    <legend>Registro completado</legend>

                    <%  boolean registrado = false;

                        if (session.getAttribute("lista") != null) { //Si hay lista en la sesion, se saca a una variable
                            ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista");
                            Usuario u = new Usuario();
                            
                            for (Usuario user : l) {
                                if (!request.getParameter("correo").equals(user.getCorreo())) {
                                    u = new Usuario(request.getParameter("correo"), request.getParameter("pass"), request.getParameter("radio"));
                                    registrado = true;
                                } else {
                                    registrado = false;
                                }
                            }
                            l.add(u);
                            session.setAttribute("lista", l);
                        } else { //Si no hay una lista, se crea y se añade a la sesion
                            ArrayList<Usuario> l = new ArrayList();
                            Usuario u = new Usuario(request.getParameter("correo"), request.getParameter("pass"), request.getParameter("radio"));
                            l.add(u);
                            session.setAttribute("lista", l);
                            out.print(session.getAttribute("lista"));
                            registrado = true;
                        }

                        if (registrado) {%>

                    <p>El usuario se ha registrado correctamente.</p>
                    <input type="submit" value="Volver" name="enviar" />
                    <%} else {%>
                    <p>El usuario ya existe</p>
                    <input type="submit" value="Volver" name="enviar" />
                    <%}%>

                </fieldset>
            </form>
        </div>





    </body>
</html>
