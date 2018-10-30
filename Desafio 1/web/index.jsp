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
        <title> Inicio - IFP DeathStar - “Do. Or do not. There is no try.” — Yoda </title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
        <script>
            /*var usercorrecto = "1@1.com";
            var passcorrecto = "1234";
            var intentos = 1;
            var usuario = document.getElementById("cajausuario");
            var passwd = document.getElementById("cajapasswd");
            var cookie;

            function comprobarCookie() { //En desarrollo

                if (document.cookie !== null) {
                    alert("Existe");
                } else {
                    alert("No existe");
                }

            }

            function comprobar() { //En desarrollo

                if (usercorrecto === usuario && passcorrecto === passwd) {
                    alert("Login correcto");
                } else {
                    alert(intentos);

                    if (intentos <= 3) {
                        intentos++;
                    } else {
                        document.cookie = "nombre=control; max-age = 30";

                        alert("Espera 30 segundos.");
                        //document.getElementById("cajausuario").disabled;
                        //document.getElementById("cajapasswd").disabled;
                    }
                }

            }*/

        </script>
    </head>
    <body>
        <%            if (request.getParameter("enviar") == null) {
        %>    


        <div id="formlogin">
            <h1>IFP DeathStar</h1>
            <form name="formulario" id="formu" method="POST" action="index.jsp">
                <fieldset id="fieldlogin">
                    <legend>Login</legend>

                    <p> Usuario: <input type="text" name="cajauser" id="cajausuario" value="" size="15" required=""/> </p>
                    <p> Contraseña: <input type="password" name="cajapass" id="cajaupasswd" value="" size="15" required="" /> </p>

                    <input type="submit" value="Aceptar" name="enviar"/>

                </fieldset>
            </form>
        </div>


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
