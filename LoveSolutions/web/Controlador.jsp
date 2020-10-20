<%-- 
    Document   : Controlador
    Created on : 14-oct-2020, 12:46:10
    Author     : isra9
--%>
<%@page import="Paq.Usuario"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.Console"%>
<%@page import="Paq.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
//---------------ABRIMOS CONEXION

    //-------------------------LOGIN------------------
    if (request.getParameter("Login") != null) {
        ConexionEstatica.nueva();
        String mail = request.getParameter("User");
        String pass = request.getParameter("Password");
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
        Usuario u1;
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
            Usuario u = new Usuario(request.getParameter("DNIRegistro"), request.getParameter("NickRegistro"), request.getParameter("EmailRegistro"), request.getParameter("SexoRegistro"));
            System.out.println("Aqui el cifrado pass : " + encString);
            System.out.println(u);
            ConexionEstatica.CrearUsuario(u, encString);

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

%>