<%-- 
    Document   : index
    Created on : 10-oct-2018, 12:59:51
    Author     : willy
--%>

<%@page import="Clases.Usuario"%>
<%@page import="Clases.Conexion"%>
<%@page import="Clases.Constantes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <%

        %>
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <%            if (request.getParameter("enviar") == null) {
        %>    

        <form name="formulario"  id="formu" method="POST" action="index.jsp">
            <fieldset id="fieldlogin">
                <legend>Login</legend>

                <p> Usuario: <input type="text" name="cajauser" value="" size="15" /> </p>
                <p> Contraseña: <input type="text" name="cajapass" value="" size="15" /> </p>

                <input type="submit" value="Aceptar" name="enviar" />

            </fieldset>
        </form>

        <%
        } else {
            //Si las cajas tienen algo
            //Enviarlo a la conexion y comprobar que ese usuario existe
            Conexion co = new Conexion(Constantes.bbdd, Constantes.user, Constantes.passwd);
            if (!request.getParameter("cajauser").trim().equals("") && !request.getParameter("cajapass").trim().equals("")) {
                if (co.recuperarUsuario(request.getParameter("cajauser").toString(), request.getParameter("cajapass").toString()) == null) {

        %>
        <div id="usuarioincorrecto">
            <p>Usuario o contraseña incorrectos.</p>        
            <a href="index.jsp"><input type="button" value="Volver" name="volver" /></a>
        </div>
        <%                } else {
                    Usuario u = new Usuario();
                    u = co.recuperarUsuario(request.getParameter("cajauser").toString(), request.getParameter("cajapass").toString());
                    out.print("Existe <br>");
                    out.print(u.getNombre());
                    session.setAttribute("usuario", u);
                    response.sendRedirect("roles.jsp");
                }
//co.recuperarUsuario(request.getParameter("cajauser"), request.getParameter("cajapass"));
            }

        %>



        <%  }
        %>



    </body>
</html>
