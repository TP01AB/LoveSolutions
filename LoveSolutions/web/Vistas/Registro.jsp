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
        <link rel="stylesheet" type="text/css" href="../Estilos/Estilo1.css">
        <title>Love Solutions</title>

    </head>

    <body onload="validacion()">
        <jsp:include page="./Cabecera.jsp"/>
        <div class="col-l-1 col-m-1"></div>
        <section class="col-l-6 col-m-6">
            <div class="col-l-1 col-m-1"></div>
            <form name="formulario" class="col-l-8 col-m-8" action="../Controlador.jsp" method="POST" novalidate>

                <label class=" row col-l-4 col-m-4" for="dni">DNI</label>
                <input type="text" class=" row campo  col-l-4 col-m-4" id="DNIRegistro"  placeholder="Introduce tu DNI" required pattern="\d{8}[A-Z]">
                <small id="DNIError" class="row form-text error" aria-live="polite"></small>


                <label class="row col-l-4 col-m-4" for="Nick">Nick</label>
                <input type="text" class="campo col-l-4 col-m-4" id="NickRegistro"  placeholder="Introduce tu nombre" required  pattern="/^[a-zA-Z0-9\_\-]{4,12}$/">
                <small id="NickError" class="row form-text error" aria-live="polite"></small>

                <label class="row col-l-4 col-m-4" for="Email">Correo electronico</label>
                <input type="email" class="campo  col-l-4 col-m-4" id="EmailRegistro"  placeholder="Introduce tu correo" required  pattern="^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$">
                <small id="EmailError" class="row form-text error" aria-live="polite"></small>

                <label class="col-l-4 col-m-4" for="Password">Contraseña</label>
                <input type="password" class="campo  col-l-4 col-m-4" id="Password"  placeholder="Introduce tu contraseña" required pattern="/^[a-zA-Z0-9\_\-]{8,15}$/">
                <small id="PasswordError" class=" row form-text error" aria-live="polite"></small>
                
                <div class="col-l-3 col-m-3"></div>
                <canvas class=" col-l-2 col-m-2" id="captcha" onload="captcha()" ></canvas>
                <div class="col-l-3 col-m-3"></div>
                <input type="text" class="col-l-1 col-m-1 captcha_introducido-enable boton" id="txtInput"/>
                <input type="button" id="refresh" class="row col-l-1 col-m-1 captcha_refresh-enable boton" value="Refresh" onclick="captcha()" />

                

                <input id="validar" class="row col-l-1 col-m-1 captcha_Comprobar-enable boton" type="button" value="Check" onclick="validCaptcha('txtInput')"/>
                <small id="CaptchaError" class="row col-l-1 col-m-1 form-text error" aria-live="polite"></small>
                <button type="submit" name="RegistrarseBBDD" class="row boton col-l-4 col-m-2">Registrarse</button>
                <button type="submit" name="Return" class="row boton col-l-4 col-m-2">Volver</button>
            </form><div class="col-l-1 col-m-1"></div>
        </section>
        <script src="../JS/ValidacionRegistro.js"></script>
    </body>

</html>