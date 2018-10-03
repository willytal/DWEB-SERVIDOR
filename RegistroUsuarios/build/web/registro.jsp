<%-- 
    Document   : registrar
    Created on : 28-sep-2018, 12:03:44
    Author     : willy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <div id="caja" style="width: 300px; margin: 0 auto;">
            <form name="formulario" method="POST" action="registrar.jsp">
                <fieldset style="width: 300px">
                    <legend>Registro</legend>
                    <div>
                        <p>Usuario (email): <input type="email" name="correo" value="" size="20" style="float: right"/> </p>
                        <p>Contraseña: <input type="password" name="pass" value="" size="20" required="required" id="p1" style="float: right"/> </p>
                        <p>Repetir contraseña: <input type="password" name="pass2" value="" size="20" id="p2" required="required" style="float: right"/> </p>

                        <fieldset style="width: 250px">
                            <legend>Curso</legend>
                            <p><input type="radio" name="radio" value="DAM" checked="checked" />DAM</p>
                            <p><input type="radio" name="radio" value="DAW" />DAW</p>
                        </fieldset>
                        
                        <fieldset style="width: 250px">
                            <legend>Administrador</legend>
                            <p><input type="radio" name="radioAdmin" value=0 checked="checked" />Admin</p>
                            <p><input type="radio" name="radioAdmin" value=1 />User</p>
                        </fieldset>
                        <br>
                        <div id="botones">
                            <input type="submit" value="Aceptar" name="enviar"/>
                            <a href="index.jsp"><input type="button" value="Volver" name="enviar" /></a>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>
