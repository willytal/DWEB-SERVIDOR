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
            boolean mostrar = false;
        %>
    </head>
    <body>

        <div id="divform">

            <%
                if (session.getAttribute("usuario") != null) {
                    Usuario u = (Usuario) session.getAttribute("usuario");
            %>

            <form name="formaulas" id="form_aulas" method="POST" action="controlador.jsp"> <!-- -->

                <fieldset id="field_aulas">
                    <legend>Aulas - Rol Profesor</legend>
                    <select name="aulalista">
                        <option selected=""> Selecciona el Aula </option>
                        <%
                            LinkedList list_aulas = co.obtenerAulasDepartamento(u.getId_user());

                            for (Object id_aula : list_aulas) {
                        %>
                        <option><% out.print(id_aula.toString()); %></option>
                        <%
                            }
                        %>

                    </select>
                    <input type="submit" value="Mostrar" name="enviardatos" />
                    <%

                    %>
                </fieldset>

                <%                    if (session.getAttribute("items") != null) {
                        ArrayList items = (ArrayList) session.getAttribute("items");
                %>
            </form>

            <%
                for (Object item : items) {
                    Item it = (Item) item;
                    session.setAttribute("item", it);
            %>
            <form name="formitems" id="form_items" method="POST" action="controlador.jsp">
                <fieldset>
                    <div>
                        <label> ID Item: </label> <input type="text" name="cajaitem" disabled="" value="<% out.print(it.getId_item()); %>" size="2" />
                        <label> ID Aula: </label>  <input type="text" name="cajaaula" disabled="" value="<% out.print(it.getId_aula()); %>" size="2" />
                        <label> Unidades: </label>  <input type="text" name="cajaunds" value="<% out.print(it.getUds()); %>" size="2" />
                        <label> Descripcion: </label>  <input type="text" name="cajadesc" value="<%  out.print(it.getDescripcion()); %>" size="7" />
                        <label> Marca: </label>  <input type="text" name="cajamarca" value="<%  out.print(it.getMarca()); %>" size="7" />
                        <label> Modelo: </label>  <input type="text" name="cajamod" value="<% out.print(it.getModelo()); %>" size="7" />

                        <input type="text" name="cajaitem" hidden="" value="<% out.print(it.getId_item()); %>" size="2" />
                        <input type="text" name="cajaaula" hidden="" value="<% out.print(it.getId_aula()); %>" size="2" />
                        <br>
                        <%
                            if (co.obtenerAulaAsignada(u.getId_user()) == it.getId_aula()) { //Comprueba si los items se encuentran en el aula asignada, si estan, permite borrarlos o editarlos.
                                session.setAttribute("item", it); //Meto el Item en sesion
                                session.setAttribute("aula", it.getId_aula()); //Meto el ID Aula en sesion, para poder recuperarlo en Añadir Item
                                mostrar = true;
                        %>
                        <input type="submit" value="Borrar" name="enviardatos" />
                        <input type="submit" value="Editar" name="enviardatos" />
                        <input hidden="" type="submit" value="Añadir Item" name="enviardatos" />
                        <br>
                        <br>
                        <br>
                        <%
                            }
                        %>
                    </div>

                </fieldset>
            </form>
            <%                    }
            %>
            <a href="javascript:window.open('anadiritem.jsp','toolbar=no', 'top=100, left= 700, width=400, height=500');void 0;"><input <% if (!mostrar) {out.print("hidden=''");} %>type="button" id="additem" value="Añadir Item" name="enviardatos" /></a> <!-- Se abre en una ventana nueva -->
            <%
                }
            %>

            <form name="formadicional" id="form_csesion" method="POST" action="controlador.jsp">
                <input type="submit" value="Cerrar Sesion" name="enviardatos" />
                <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>
            </form>


            <%
                }
            %>

        </div>
    </body>
</html>
