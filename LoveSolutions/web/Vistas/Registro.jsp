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
        <link rel="stylesheet" type="text/css" href="Estilos/Formulario.css">
        <title>Love Solutions</title>

    </head>

    <body onload="validacion()">
        <header class="row"><a href="index.jsp"><img id="logo" class="col-m-1" src="Img/Logo.png" href="Vistas/Registro.jsp" alt="Love Solutions">
                <img id="cabecera" class="col-m-10" src="Img/Cabecera.jpeg"></a>

            <h1>Love Solutions</h1>


            <!-- ------------------------- Cuerpo de la página ------------------------- -->

            <section class="d-flex-center min-vh-100 m-3">

                <!-- ----------------------------- Formulario ------------------------------ -->

                <form name="formulario" action="../Controlador.jsp" method="POST" novalidate>


                    <div class="m-1">
                        <label for="dni">DNI</label>
                        <input type="text" class="input" id="DNIRegistro"  placeholder="Introduce tu DNI" required pattern="\d{8}[A-Z]">
                        <small id="DNIError" class="form-text error" aria-live="polite"></small>
                    </div>
                    <hr>


                    <div class="m-1">
                        <label for="Nick">Nick</label>
                        <input type="text" class="input" id="NickRegistro"  placeholder="Introduce tu nombre" required minlength="4" maxlength="12"pattern="/^[a-zA-Z0-9\_\-]{4,12}$/">
                        <small id="NickError" class="form-text error" aria-live="polite"></small>
                    </div>
                    <hr>


                    <div class="m-1">
                        <label for="Email">Correo electronico</label>
                        <input type="email" class="input" id="EmailRegistro"  placeholder="Introduce tu correo" required minlength="8" maxlength="25" pattern="^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$">
                        <small id="EmailError" class="form-text error" aria-live="polite"></small>
                    </div>
                    <hr>


                    <div class="m-1">
                        <label for="Password">Contraseña</label>
                        <input type="password" class="input" id="Password"  placeholder="Introduce tu contraseña" required minlength="8" maxlength="15" pattern="/^[a-zA-Z0-9\_\-]{8,15}$/">
                        <small id="PasswordError" class="form-text error" aria-live="polite"></small>
                    </div>
                    <hr>

                    <canvas id="captcha captcha_canvas"></canvas>
                    
                    <input type="button" id="refresh" class="captcha_refresh-enable" value="Refresh" onclick="captcha();" />
           
                    <input type="text" class="captcha_introducido-enable" id="txtInput"/>
               
                    <input id="validar" class="captcha_Comprobar-enable" type="button" value="Check" onclick="validCaptcha('txtInput');"/>
                    <div class="m-1">
                        <button type="submit" name="RegistrarseBBDD" class="btn btn-dark w-100">Registrarse</button>
                         <button type="submit" name="Return" class="btn btn-dark w-100">Volver</button>
                    </div>

                </form>
            </section>

            <script src="../JS/ValidacionRegistro.js"></script>
    </body>

</html>