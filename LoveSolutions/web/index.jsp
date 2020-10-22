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
        <jsp:include page="Vistas/Cabecera.jsp"/>
  
    </div>
    <main class="row col-l-8 col-m-8">

        <aside class="col-m-2 col-l-2">
            <article class="row tarjeta "  id="usuario1"><p>usuario1</p></article>
            <article class="row tarjeta"  id="usuario2"><p>usuario2</p></article>
            <article class="row tarjeta"  id="usuario3"><p>usuario3</p></article>
            <article class="row tarjeta"  id="usuario4"><p>usuario4</p></article>
        </aside>




        <section class=" col-l-4 col-m-4">
            <form class="row " action="Controlador.jsp" method="POST">
                <legend class="col-l-8 col-m-8" name="FormCabecera">Inicio de Sesion</legend>
                <hr>
                <label class="col-l-8 col-m-8" for="User">E-mail</label>
                <div class="col-l-2 col-m-1"> </div>
                <input class="col-l-4 col-m-6 campo" name="User" type="text" autofocus="" >
                <div class="col-l-2 col-m-1"> </div>
                <label class="col-l-8 col-m-8" for="Password">Contraseña</label>
                <div class="col-l-2 col-m-1"> </div>
                <input  class="col-l-4 col-m-6 campo" name="Password"  type="password" >
                <div class="col-l-2 col-m-1"> </div>

                <input  class="boton col-l-3 col-m-2" name="Login" type="submit" value="Login">

                <div class=" col-l-8 col-m-8">
                    <input   class="boton col-l-2 col-m-1" id="Registrarse" name="Registrarse" type="submit" value="Registrarse">
                    <div class="col-l-4 col-m-6"></div>
                    <input  class="boton col-l-2 col-m-1" id="Olvidado" name="Olvidado" type="submit" value="Olvide la Contraseña">
                </div>
            </form>
        </section>



    </main>
    <footer class="row col-l-8 col-m-8">
        <a href="Vistas/Chat.jsp" > Israel molina pulpon</a>
    </footer>
</body>

</html>