<%-- 
    Document   : index
    Created on : 14-oct-2020, 12:38:17
    Author     : isra9
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Paq.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilos/Estilo1.css">
    </head>
    <body >
        <header class="row"><a href="index.jsp"><img id="logo" class="col-m-1" src="Img/Logo.png" href="Vistas/Registro.jsp" alt="Love Solutions">
                <img id="cabecera" class="col-m-10" src="Img/Cabecera.jpeg"></a>

            <h1>Love Solutions</h1>
        </header>
        <main class="row">

            <aside class="col-m-2 col-l-2">
                <article id="usuario1"><p>usuario1</p></article>
                <article id="usuario2"><p>usuario2</p></article>
                <article id="usuario3"><p>usuario3</p></article>
                <article id="usuario4"><p>usuario4</p></article>
            </aside>

            <section class="col-m-7 col-l-7 ">


                <form class="col-m-6 col-l-2 row" action="Controlador.jsp" method="POST">
                    <legend>Inicio de Sesion</legend>
                    <label class="row" for="User">Usuario</label>
                    <input class="row" name="User" type="text">
                    <label class="row" for="Password">Contraseña</label>
                    <input class="row" name="Password"  type="password" >
                    <input class="row" name="Login" type="submit" value="Login">
                    <input type="checkbox" value="Recordarme"><label>Recordarme</label>
                    <input  class="row" name="Registrarse" type="submit" value="Registrarse">
                    <input class="row"  name="Olvidado" type="submit" value="Olvide la Contraseña">
                </form>


            </section>
        </main>
        <footer>
            Israel molina pulpon
        </footer>
    </body>

</html>
