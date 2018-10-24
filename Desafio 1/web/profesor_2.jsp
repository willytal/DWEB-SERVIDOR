<%-- 
    Document   : validar
    Created on : 10-oct-2018, 13:30:53
    Author     : willy
--%>

<%@page import="Clases.Item"%>
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
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
        <%
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
        %>
    </head>
    <body>

        <%
            if (session.getAttribute("usuario") != null) {

                Usuario u = (Usuario) session.getAttribute("usuario");
        %>

        <form name="formaulas" id="form_aulas" method="POST" action="controlador.jsp"> <!-- -->
            <fieldset id="field_aulas">
                <legend>Aulas - Rol Profesor</legend>
                <select name="aulalista">
                    <option selected="">Selecciona el Aula</option>
                    <%
                        LinkedList list_aulas = co.obtenerAulasDepartamento(u.getId_user());

                        for (Object id_aula : list_aulas) {
                    %>
                    <option><% out.print(id_aula.toString()); %></option>
                    <%
                        }
                    %>

                </select>
                <input type="submit" value="Mostrar" name="enviarAulas" />
            </fieldset>

            <% //*********************** Mostrar Items ************************
               //**************************************************************
               
                if (request.getParameter("aulalista") != null) {
                    if (!request.getParameter("aulalista").equals("Selecciona el Aula")) {
            %>

            <fieldset <% if (request.getParameter("enviarAulas") != null) {
                    out.print("");
                } else {
                    out.print("hidden=''");
                } %> >
                <legend> Inventario del aula <% out.print(request.getParameter("aulalista")); %> </legend>
                <%
                    ArrayList itemsaula = co.obtenerItemsAula(Integer.parseInt(request.getParameter("aulalista")));
                    for (Object item : itemsaula) {
                        Item it = (Item) item;
                %>
                <div>
                    <label> ID Item: </label> <input type="text" name="cajaitem" disabled="" value="<%  out.print(it.getId_item()); %>" size="2" />
                    <label> ID Aula: </label>  <input type="text" name="cajaaula" disabled="" value="<%  out.print(it.getId_aula()); %>" size="2" />
                    <label> Unidades: </label>  <input type="text" name="cajaunds" <% if (co.obtenerAulaAsignada(u.getId_user()) != it.getId_aula()){ out.print("disabled='disabled'"); } %> value="<%  out.print(it.getUds() ); %>" size="2" />
                    <label> Descripcion: </label>  <input type="text" name="cajadesc" <% if (co.obtenerAulaAsignada(u.getId_user()) != it.getId_aula()){ out.print("disabled='disabled'"); } %> value="<%  out.print(it.getDescripcion()); %>" size="7" />
                    <label> Marca: </label>  <input type="text" name="cajamarca" <% if (co.obtenerAulaAsignada(u.getId_user()) != it.getId_aula()){ out.print("disabled='disabled'"); } %> value="<%  out.print(it.getMarca() ); %>" size="7" />
                    <label> Modelo: </label>  <input type="text" name="cajamod" <% if (co.obtenerAulaAsignada(u.getId_user()) != it.getId_aula()){ out.print("disabled='disabled'"); } %> value="<%  out.print(it.getModelo()); %>" size="7" />
                    <br>
                    <%
                        if (co.obtenerAulaAsignada(u.getId_user()) == it.getId_aula()) { //Comprueba si los items se encuentran en el aula asignada, si estan, permite borrarlos o editarlos.
                        session.setAttribute("item", it);
                    %>
                    <input type="submit" value="Borrar" name="enviar" />
                    <input type="submit" value="Editar" name="enviar" />
                    <br>
                    <br>
                    <br>
                    <%
                        }
                    %>    

                </div>
                <%                    }
                %>

            </fieldset>

            <%                        }
                    }
                }
            %>

            <input type="submit" value="Cerrar Sesion" name="cerrarsesion" />
            <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>

        </form>

    </body>
</html>
