<%-- 
    Document   : Controlador
    Created on : 14-oct-2020, 12:46:10
    Author     : isra9
--%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.Console"%>
<%@page import="Paq.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% //---------------ABRIMOS CONEXION
    ConexionEstatica.nueva();
    System.out.println("la password");
    System.out.println(request.getParameter("Password"));
    //-------------------------LOGIN------------------
    if (request.getParameter("Login") != null) {

        String mail = request.getParameter("User");
        String pass = request.getParameter("Password");

        System.out.println(ConexionEstatica.prueba());
        try {
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
        System.out.println("tengo el rol");
        if (rol != -1) {
            System.out.println("Usuario y contraseña correctos");//BITACORA 
            if (rol == 3) {
                response.sendRedirect("Vistas/Admin.jsp");
            } else {
                response.sendRedirect("Vistas/Inicio.jsp");
            }
        } else {
            //MENSAJE DE LOGIN INCORRECTO
            System.out.println("ERROR , ALGO NO ESTA CORRECTO");
        }
    }
    //---------------------------REGISTRO-----------------------------
    
    //---------------------REDIRECCION A REGISTRO
    if (request.getParameter("Registrarse")!=null) {
         response.sendRedirect("Vistas/Registro.jsp");
    }
    //---------------------REGISTRO EN BBDD
    

    //-----------------------CERRAMOS CONEXION
    ConexionEstatica.cerrarBD();
%>