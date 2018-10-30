<%-- 
    Document   : anadiritem
    Created on : 24-oct-2018, 13:55:43
    Author     : willy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Item</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <div id="divitem">
            <form name="formadditem" id="formanadir" method="POST" action="controlador.jsp">
                <fieldset>
                    <legend> Gestion de Aula </legend>
                    
                    <p>SECCION EN DESARROLLO, PULSE EL BOTON VOLVER</p>

                    <!-- <input type="text" name="caja_aula" value="<% //out.print(session.getAttribute("aula").toString());%>" hidden=""/>
                    <input disabled="" type="submit" value="Introducir Item" name="enviardatos" />
                    <input hidden="" type="submit" value="Introducir Item" name="enviardatos" /> -->
                    <br>
                    <a href="roles.jsp"><input type="button" value="Volver" name="volver" /></a>
                </fieldset>
            </form>
        </div>
    </body>
</html>
