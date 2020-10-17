<%-- 
    Document   : Registro
    Created on : 17-oct-2020, 10:08:09
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./Estilos/Estilo1.css">
        <title>Love Solutions</title>

    </head>
    <body>
        <header class="row">
            <img src="./Img/cab.png" alt="Love Solutions">
            <h1>Love Solutions</h1>
        </header>
        <main class="row">
            <section class="col-m-8 col-l-8 ">


                <form class="col-m-5 col-l-2 row" action="./Controlador.jsp" method="POST">
                    <legend>Registro</legend>
                    <label class="row" for="User">E-mail</label>
                    <input class="row" name="EmailRegistro" type="text">
                    <label class="row" for="User">Usuario</label>
                    <input class="row" name="UserRegistro" type="text">
                    <label class="row" for="Password">Contraseña</label>
                    <input class="row" name="PasswordRegistro"  type="password" >
                    <input  class="row" name="Registrarse" type="submit" value="Registrarse">
                    <input class="row"  name="Return" type="submit" value="volver">
                </form>

            </section>
        </main>
    </body>
</html>
