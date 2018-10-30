<%-- 
    Document   : validar
    Created on : 10-oct-2018, 13:30:53
    Author     : willy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Clases.Constantes"%>
<%@page import="Clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aulas</title>
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>

        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
            Usuario jefe = (Usuario) session.getAttribute("usuario");
        %>
        <div id="divform">

            <div id="divusuario">
                <p>Usuario conectado: <% out.print(jefe.getNombre()); %> , <% out.print(session.getAttribute("rolelegido")); %></p>
            </div>


            <form name="formaulas" id="form_aulas" method="POST" action="controladores/controlador_jefe.jsp">
                <fieldset id="field_aulas">
                    <legend>Aulas del departamento de <% out.print(co.obtenerDepartamento(jefe.getId_depart())); %></legend>

                    <label> ID Aula: </label>
                    <select name="aulalista">
                        <%                        LinkedList list_aulas = co.obtenerAulasDepartamento(jefe.getId_user());

                            for (Object id_aula : list_aulas) {
                        %>
                        <option> <% out.print(id_aula.toString()); %> </option>
                        <%
                            }
                        %>
                    </select>

                    <label> ID Profesor: </label>
                    <select name="listaprofes">
                        <%
                            ArrayList profesores = co.obtenerUsuariosNoDirector(jefe.getId_depart());
                            Usuario profe = new Usuario();

                            for (Object profesor : profesores) {
                                profe = (Usuario) profesor;
                        %>
                        <option> <% out.print(profe.getId_user()); %> </option>
                        <%
                            }
                        %>
                    </select>

                    <br>
                    <br>
                    <!-- <input type="submit" value="Quitar" name="enviardatos" />  Se implementara en la siguiente release--> 
                    <input type="submit" value="Asignar" name="enviardatos" />
                </fieldset>

            </form>

            <form name="formadicional" id="form_csesion" method="POST" action="controladores/controlador_jefe.jsp">
                <input type="submit" value="Cerrar Sesion" name="enviardatos" />
                <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>
            </form>
        </div>
    </body>
</html>
