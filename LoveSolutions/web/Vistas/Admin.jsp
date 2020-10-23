<%-- 
    Document   : Admin
    Created on : 14-oct-2020, 13:08:14
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" type="text/css" href="./Estilos/Estilo1.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="./Cabecera.jsp"/>
        <h1>Hello ADMIN!</h1>
        <form name="form" action="../Controlador.jsp" method="POST">
            <input class="boton" type="submit" name="inicio" id="inicio" value="Inicio como usuario">
            <input class="boton" type="submit" name="iniciarChat" id="iniciarChat" value="CHAT">
            
            <button class="boton" type="submit" name="Return">Volver</button>
        </form>
    </body>
</html>
