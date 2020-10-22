<%-- 
    Document   : Cabecera
    Created on : 20-oct-2020, 21:03:43
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Estilos/Estilo1.css">
        <title>JSP Page</title>
    </head>
    <body >
        <%
            String ruta = "";
            if (!getServletConfig().getServletContext().getRealPath(request.getServletPath()).endsWith("index.jsp")) {
                ruta = "../";
            }
        %>
        <div class="contenedor">
            <header class="row col-l-8 col-m-8 " >

                <img  class="col-l-1 col-m-1 logo" src="<%out.print(ruta);%>/Img/Logo.png"  alt="Love Solutions">
                <img id="cabecera" class="col-l-8 col-m-8" src="<%out.print(ruta);%>/Img/Cabecera.jpg">

                <a href="index.jsp" class="a_logo">Love Solutions</a>

            </header>
        </div>
    </body>
</html>
