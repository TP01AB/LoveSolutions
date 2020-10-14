<%-- 
    Document   : Controlador
    Created on : 14-oct-2020, 12:46:10
    Author     : isra9
--%>
<%@page import="Paq.ConexionEstatica"%>

<%
//-----------------------------------BOTÓN REGISTRARSE
    if (request.getParameter("registrar") != null) {
        response.sendRedirect("vistas/registro.jsp");
    }
    if (request.getParameter("olvidado") != null) {
        response.sendRedirect("vistas/olvidado.jsp");
    }
    //-----------------------------------BOTÓN REGISTRARSE
    if (request.getParameter("login") != null) {
        String mail = request.getParameter("correo");
        String pass = request.getParameter("pass");
        int rol = ConexionEstatica.Login(mail, pass);
        if (rol != -1) {
            System.out.println("localizado y entro correcto");
            if (rol == 1) {
                response.sendRedirect("vistas/admin.jsp");
            } else {
                response.sendRedirect("vistas/juego.jsp");
            }

        }
    }

//-----------------------------------BOTÓN ACEPTAR REGISTRO
    if (request.getParameter("aceptarRegistro") != null) {
        System.out.println("entro en registro");
        String correo = request.getParameter("correo");
        String nombre = request.getParameter("nombre");
        String pass = request.getParameter("pass");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexo");

        ConexionEstatica.Insertar_Persona(correo, nombre, pass, 0, edad, sexo, 0, 0);
        response.sendRedirect("index.jsp");
    }


%>