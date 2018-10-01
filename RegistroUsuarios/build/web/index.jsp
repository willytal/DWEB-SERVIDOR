<%-- 
    Document   : index
    Created on : 28-sep-2018, 12:00:57
    Author     : willy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div id="caja" style="width: 300px; margin: 0 auto;">
            <form name="formulario" method="POST" action="registro.jsp"> <!-- Meter condicion para ir a registro o a bienvenida -->
                <fieldset style="width: 300px;">
                    <legend>Bienvenido</legend>
                    <div>
                        <p>Usuario:  <input type="text" name="caja" value="" size="20" style="float: right"/></p> 
                        <p>Contraseña: <input type="password" name="caja" value="" size="20" style="float: right"/></p> 
                    </div>
                    <div id="botones">
                        <input type="submit" value="Aceptar" name="enviar" />
                        <input type="submit" value="Registrar" name="enviar" /><br><br>
                        <a href="">He olvidado mi contraseña</a>
                    </div>
                </fieldset>

            </form>
        </div>
    </body>
</html>
