<%-- 
    Document   : Chat
    Created on : 21-oct-2020, 10:51:25
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Love Solutions</title>
    </head>
    <body>

        <h1>Hello Chat!</h1>
        <form class="row " action="../Controlador.jsp" method="POST">
            
            <input type="text" id="mensajeNuevo" name="mensajeNuevo" placeholder="Introduzca su mensaje aqui">
            <input type="submit" id="enviarMensaje" name="enviarMensaje" value="Enviar" >
        </form>
    </body>
</html>
