<%-- 
    Document   : modificar
    Created on : 08-oct-2018, 18:37:55
    Author     : willy
--%>

<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Datos</title>
    </head>
    <body>

        <%
            if (session.getAttribute("lista") != null) {
                ArrayList<Usuario> l = (ArrayList) session.getAttribute("lista");
                String email = request.getParameter("correo2"); //Correo de la caja de listado
                Usuario aux = new Usuario();

                for (Usuario user : l) {
                    if (user.getCorreo().equals(email)) {
                        aux = user;
                    }
                }


        %>

        <form name="formulario" method="POST" action="modificar.jsp">
            <fieldset style="width: 300px">
                <legend>Modificar Datos</legend>
                <div>
                    <p>Usuario (email): <input type="email" name="correo" value="<% out.print(aux.getCorreo());  %>" size="20" style="float: right"/> </p>
                    <p>Contraseña: <input type="password" name="pass" value="" size="20" required="required" id="p1" style="float: right"/> </p>
                    <p>Repetir contraseña: <input type="password" name="pass2" value="" size="20" id="p2" required="required" style="float: right"/> </p>

                    <fieldset style="width: 250px">
                        <legend>Curso</legend>
                        <p><input type="radio" name="radio" value="DAM" <% if (aux.getCurso().equals("DAM")) {out.print("checked='checked'");}%> />DAM</p>
                        <p><input type="radio" name="radio" value="DAW" <% if (aux.getCurso().equals("DAW")) {out.print("checked='checked'");}%> />DAW</p>
                    </fieldset>

                    <fieldset style="width: 250px">
                        <legend>Administrador</legend>
                        <p><input type="radio" name="radioAdmin" value=0 <% if (aux.getAdmin() == 0) {out.print("checked='checked'");}%> />Admin</p>
                        <p><input type="radio" name="radioAdmin" value=1 <% if (aux.getAdmin() == 1) {out.print("checked='checked'");}%> />User</p>
                    </fieldset>
                    <br>
                    <div id="botones">
                        <input type="submit" value="Aceptar Cambios" name="enviar"/>
                        <a href="listado.jsp"><input type="button" value="Volver" name="enviar" /></a> <!--Volver a listado-->
                    </div>
                </div>
            </fieldset>
        </form>


        <%    
            if (request.getParameter("enviar") != null) {
                    aux.setCorreo(request.getParameter("correo"));
                    aux.setPassword(request.getParameter("pass"));
                    aux.setCurso(request.getParameter("radio"));
                    aux.setAdmin(Integer.parseInt(request.getParameter("radioAdmin")));
                    
                    l.remove(aux);
                    l.add(aux);
                    session.setAttribute("lista", l);
                    response.sendRedirect("modificar.jsp");
                }
            
            }
        %>
    </body>
</html>
