<%-- 
    Document   : Controlador
    Created on : 14-oct-2020, 12:46:10
    Author     : isra9
--%>
<%@page import="Paq.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Paq.Usuario"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.Console"%>
<%@page import="Paq.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario u1 = new Usuario();
    Usuario u2 = new Usuario();
    Mensaje m = new Mensaje();
    LinkedList mensajes = new LinkedList();
//---------------ABRIMOS CONEXION

    //-------------------------LOGIN------------------
    if (request.getParameter("Login") != null) {
        ConexionEstatica.nueva();
        String mail = request.getParameter("User");
        String pass = request.getParameter("Password");
        session.setAttribute("email", mail);

        try {// ENCRIPTACION POR MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(pass.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;

            }
            pass = encString;
        } catch (Exception e) {
            throw new RuntimeException(e);

        }
        //Captcha
        boolean valid = true;
        if (session.getAttribute("true") != null) {
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            System.out.println(gRecaptchaResponse);

            //  valid = Captcha.verificar(gRecaptchaResponse);
        }
        u1 = ConexionEstatica.Login(mail, pass);
        if (ConexionEstatica.UsuarioHabilitado(u1.getDNI())) {
            u1.setRol(ConexionEstatica.ObtenerRol(u1.getDNI()));
            if (u1.getRol() == 3) {
                response.sendRedirect("Vistas/Admin.jsp");
            } else if (u1.getRol() == 0) {
                response.sendRedirect("Vistas/Inicio.jsp");
            }
        } else {
            // Sacar mensaje de error y poner opcion de contactar con admin
            response.sendRedirect("Vistas/Ticket.jsp");
        }
        session.setAttribute("u1", u1);
        ConexionEstatica.cerrarBD();
    }

    //---------------------------REGISTRO-----------------------------
    //----------VOLVER
    if (request.getParameter("Return") != null) {

        response.sendRedirect("./index.jsp");
    }
    //---------------------REGISTRO EN BBDD
    if (request.getParameter("RegistrarseBBDD") != null) {
        ConexionEstatica.nueva();
        if (ConexionEstatica.ExisteDNI(request.getParameter("DNIRegistro"))) {
            // sacar porque dni ya existe

        } else {

            String encString = null;
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                byte[] encBytes = md.digest(request.getParameter("PasswordRegistro").getBytes());
                BigInteger numero = new BigInteger(1, encBytes);
                encString = numero.toString(16);
                while (encString.length() < 32) {
                    encString = "0" + encString;

                }
                System.out.println("encriptado todo bien");
            } catch (Exception e) {
                System.out.println("error al encriptar contraseña.");
            }
            System.out.println("contraseña de REGISTRO " + encString);
            u1 = new Usuario(request.getParameter("DNIRegistro"), request.getParameter("NickRegistro"), request.getParameter("EmailRegistro"), request.getParameter("SexoRegistro"));
            System.out.println("Aqui el cifrado pass : " + encString);
            System.out.println(u1);
            ConexionEstatica.CrearUsuario(u1, encString);

            response.sendRedirect("./index.jsp");

        }
        ConexionEstatica.cerrarBD();
    }

    //---------------------REDIRECCION A REGISTRO
    if (request.getParameter("Registrarse") != null) {
        response.sendRedirect("Vistas/Registro.jsp");

    }

//-------------------------OLVIDADO------------------
    if (request.getParameter("Olvidado") != null) {
        response.sendRedirect("Vistas/Olvidado.jsp");
    }
// -------------MENSAJES------------------------------

    if (request.getParameter("enviarMensaje") != null) {
        ConexionEstatica.nueva();
        u2 = (Usuario) session.getAttribute("u2");
        u1 = (Usuario) session.getAttribute("u1");
        m = new Mensaje(u1.getDNI(), u2.getDNI(), request.getParameter("mensajeNuevo"));
        if (ConexionEstatica.insertarMensaje(m)) {
            mensajes.add(m);
        }

        ConexionEstatica.cerrarBD();
        response.sendRedirect("./Chat.jsp");

    }
//----------------------------CHAT---------------------
    if (request.getParameter("iniciarChat") != null) {
        ConexionEstatica.nueva();
        u1 = (Usuario) session.getAttribute("u1");
        String dni1 = u1.getDNI();

        if (dni1 != "06280822E") {
            u2 = ConexionEstatica.obtenerUsuario("06280822E");
        } else {
            u2 = ConexionEstatica.obtenerUsuario("06280822M");
        }
        System.out.println(u1);
        session.setAttribute("u2", u2);
        LinkedList l = ConexionEstatica.obtenerMensajes(u1.getDNI(), u2.getDNI());
        for (int i = 0; i < l.size(); i++) {
            Mensaje m2 = (Mensaje) l.get(i);
            ConexionEstatica.leerMensaje(m2.getId(), dni1);
        }
        session.setAttribute("Mensajes", l);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("./Vistas/Chat.jsp");
    }

%>