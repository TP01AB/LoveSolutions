<%-- 
    Document   : Olvidado
    Created on : 20-oct-2020, 23:02:53
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Estilos/Estilo1.css">
        <title>Love Solutions</title>
    </head>
    <body>
       <jsp:include page="./Cabecera.jsp"/>
        <h1>Hello Olvidado!</h1>
         <form name="form" action="../Controlador.jsp" method="POST">
            <button type="submit" name="Return" class="btn btn-dark w-100">Volver</button>
        </form>
    </body>
</html>
