<%-- 
    Document   : Cabecera
    Created on : 20-oct-2020, 21:03:43
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String ruta = "";
    if (!getServletConfig().getServletContext().getRealPath(request.getServletPath()).endsWith("index.jsp")) {
        ruta = "../";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%out.print(ruta);%>Estilos/Estilo1.css">
        <title>JSP Page</title>
    </head>
    <body >

        <div class="contenedor">
            <header class="row col-l-8 col-m-8 " >

                <img  class="col-l-1 col-m-1 logo" src="<%out.print(ruta);%>Img/Logo.png"  alt="Love Solutions">
                <a  class=""><img id="cabecera"  class="col-l-8 col-m-8" src="<%out.print(ruta);%>Img/Cabecera.jpg" >

                </a>

            </header>
        </div>
    </body>
</html>
