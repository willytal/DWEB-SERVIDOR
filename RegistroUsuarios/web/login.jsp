<%-- 
    Document   : login
    Created on : 03-oct-2018, 12:18:46
    Author     : willy
--%>

<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="estilo/estilo.css">
    </head>
    <body>
        <%
            String user = request.getParameter("usuario");
            String pass = request.getParameter("passwd");
            Usuario u = new Usuario();
            u.setCorreo(user);
            u.setPassword(pass);
            session.setAttribute("userlogeado", u);
            
            if (session.getAttribute("lista") != null) {
                ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista");
                for (Usuario us : l) {
                    if (us.getCorreo().equals(u.getCorreo())) {
                        if (us.getPassword().equals(u.getPassword())) {
                            //Inicio correcto
%>

        <form name="formulario" method="POST" style="width: 300px; margin: 0 auto;">
            <fieldset style="width: 300px">
                <legend>Bienvenido/a <%= us.getCorreo().toString()%></legend>
                <p>Contraseña: <input type="text" name="caja" value="<% out.print(us.getPassword()); %>"  disabled="disabled" /></p>
                <p>Curso: <input type="text" name="caja" value="<% out.print(us.getCurso()); %>" disabled="disabled" /></p>
                <p>Administrador: <input type="text" name="caja" value="<% out.print(us.getAdmin()); %>" disabled="disabled" /></p>
                <input type="submit" value="Cerrar Sesion" name="enviar" />
                <a href="index.jsp"><input type="button" value="Volver" name="enviar" /></a>
                    <%
                        if (us.getAdmin() == 0) {
                    %>
                <a href="listado.jsp"><input type="button" value="Listado" name="enviar" /></a>
                    <%
                        }
                    %>


            </fieldset>
        </form>

        <%
                        } else {
                            //pass incorrecta
                            out.print("Usuario o contraseña incorrecta");
                        }
                    } else {
                        //usuario incorrecto
                        out.print("Usuario o contraseña incorrecta");
                    }
                }
            } else {
                //no hay lista creada
                out.print("No hay ningun usuario registrado.");
            }

        %>

    </body>
</html>
