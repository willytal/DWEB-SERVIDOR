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
    <body style="max-height: 500px; max-width: 400px;">
        
        <form name="formadditem" id="formanadir" method="POST" action="controlador.jsp">
            <fieldset>
                <legend> Añadir Item </legend>
                <label>ID Aula: </label> <input class type="text" name="caja_aula" value="<% out.print(session.getAttribute("aula").toString()); %>" size="15" /><br><br>
                <label> Unidades: </label> <input type="text" name="caja_uds" value="" size="15" /><br><br>
                <label> Descripcion: </label> <input type="text" name="caja_desc" value="" size="15" /><br><br>
                <label> Marca: </label> <input type="text" name="caja_marca" value="" size="15" /><br><br>
                <label> Modelo: </label> <input type="text" name="caja_mod" value="" size="15" /><br><br>
                <input type="submit" value="Introducir Item" name="enviardatos" />
            </fieldset>
        </form>
        
    </body>
</html>
