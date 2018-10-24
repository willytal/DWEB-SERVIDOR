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
        <script>
            function prueba() {
                alert("prueba");
            }

            function comprobar() {
                alert("entra");
                var usercorrecto = "1@1.com";
                var passcorrecto = "1234";
                var usuario = document.getElementById("cajausuario");
                var passwd = document.getElementById("cajapasswd");
                var cont = 3;

                if (usercorrecto !=== usuario && passcorrecto !=== passwd) {
                    cont--;
                    alert("Intentos: " + cont);
                }

                if (cont === 0) {
                    document.cookie = "max-age = 30";
                    document.write("Espera 30 segundos.");
                }

            }
            
        </script>
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <%            if (request.getParameter("enviar") == null) {
        %>    

        <form name="formulario"  id="formu" method="POST" action="index.jsp">
            <fieldset id="fieldlogin">
                <legend>Login</legend>

                <p> Usuario: <input type="text" name="cajauser" id="cajausuario" value="" size="15" required=""/> </p>
                <p> Contraseña: <input type="text" name="cajapass" id="cajaupasswd" value="" size="15" required="" /> </p>

                <input type="submit" value="Aceptar" name="enviar" onclick="comprobar()"/>

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
