<%-- 
    Document   : bienvenida
    Created on : 28-sep-2018, 12:03:30
    Author     : willy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenida</title>
    </head>
    <body>
        <div>

            <%      if (request.getParameter("enviar") != null) {%>
           
                <form  name = "formulario" method = "POST" action = "bienvenida.jsp"> 
                    <fieldset>
                        <legend> Bienvenido/a <% out.print(" " + request.getParameter("usuario")); %></legend>
                        <p>Hola, <% out.print("usuario");%></p>
                    </fieldset>
                </form>
            
            <%}%>

        </div>

    </body>
</html>
