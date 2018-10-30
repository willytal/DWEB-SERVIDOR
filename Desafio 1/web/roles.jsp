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
                Usuario u = (Usuario) session.getAttribute("usuario");
        %>
        <div id="divform">

            <div id="divusuario">
                <p> Bienvenido <% out.print(u.getNombre()); %> </p>
            </div>

            <form name="formroles" id="form_roles" method="POST" action="roles.jsp" >
                <fieldset>
                    <legend>Selecciona tu rol</legend>
                    <%
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
                    <a href="index.jsp"><input type="button" value="Volver" name="volver" /></a>
                </fieldset>

            </form>
            <%
            } else {

                session.setAttribute("rolelegido", request.getParameter("listroles")); //Recupero el rol seleccionado, para mostrarlo mas adelante

                if (request.getParameter("listroles").equals("Profesor")) {
                    session.setAttribute("rol", request.getParameter("listroles"));
                    response.sendRedirect("roles/profesor.jsp");
                }
                if (request.getParameter("listroles").equals("Jefe de Departamento")) {
                    session.setAttribute("rol", request.getParameter("listroles"));
                    Usuario u = (Usuario) session.getAttribute("usuario");
            %>
            <div id="divform">
                <div id="divusuario">
                    <p>Usuario conectado: <% out.print(u.getNombre()); %></p>
                </div>

                <form name="formselector" id="formselect">
                    <fieldset>
                        <legend>¿Que quieres hacer?</legend>
                        <a href="roles/jefedep.jsp"><input type="button" value="Ir a Inventario" name="enviar" /></a><br><br>
                        <a href="aulas.jsp"><input type="button" value="Ir a Asignar Aulas" name="enviar" /></a><br><br>
                        <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>
                    </fieldset>
                </form>
            </div>
            <%
                }
                if (request.getParameter("listroles").equals("Director")) {
                    session.setAttribute("rol", request.getParameter("listroles"));
                    Usuario u = (Usuario) session.getAttribute("usuario");
            %>
            <div id="divform">
                <div id="divusuario">
                    <p>Usuario conectado: <% out.print(u.getNombre()); %> %></p>
                </div>

                <form name="formselector" id="formselect">
                    <fieldset>
                        <legend>¿Que quieres hacer?</legend>
                        <a href="roles/director.jsp"><input type="button" value="Inventario" name="enviar" /></a><br><br>
                        <a href="asignajefe.jsp"><input type="button" value="Asignar Jefe de Departamento" name="enviar" /></a><br><br>
                        <a href="adduser.jsp"><input type="button" value="Gestion de Usuarios" name="enviar" /></a><br><br>
                        <a href="addaula.jsp"><input type="button" value="Gestion de Aulas" name="enviar" /></a><br><br>
                        <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>
                    </fieldset>
                </form>
            </div>
            <%                }
                }
            %>

        </div>

    </body>
</html>
