<%-- 
    Document   : index
    Created on : 14-oct-2020, 12:38:17
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Estilos/Estilo1.css" type="text/css">
    <title>Love Solutions</title>
</head>
<body>
    <header>
        <img src="./Img/cab.png" alt="Love Solutions">

    </header>
    <aside>
        <article id="usuario1"></article>
        <article id="usuario2"></article>
        <article id="usuario3"></article>
        <article id="usuario4"></article>
    </aside>
    <article>
        <form action="./Controlador.jsp">
        <label for="User">Usuario:<input id="User" type="text"></label>
        <label for="Pass">Contraseña:<input type="password" id="Password"></label>
        <input id="Login" type="submit" value="Login">
        <input id="Registrarse" type="submit" value="Registrarse">
        <input id="Olvidado" type="submit" value="Olvide la Contraseña">
        </form>
    </article>
    <footer></footer>

    
</body>
</html>