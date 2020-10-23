<%-- 
    Document   : Chat
    Created on : 21-oct-2020, 10:51:25
    Author     : isra9
--%>

<%@page import="Paq.Usuario"%>
<%@page import="Paq.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Estilos/Estilo1.css">
        <title>Love Solutions</title>
    </head>
    <body>
        <jsp:include page="./Cabecera.jsp"/>
        <h1>Hello Chat!</h1>
        <form class="row chat" action="../Controlador.jsp" method="POST">

            <%
                Usuario u1 = (Usuario) session.getAttribute("u1");
                System.out.println(u1);
                Usuario u2 = (Usuario) session.getAttribute("u2");
                System.out.println(u2);
                LinkedList<Mensaje> Mensajes = (LinkedList) session.getAttribute("Mensajes");
                for (int i = 0; i < Mensajes.size(); i++) {
            %>

            <%
                Mensaje m = Mensajes.get(i);
                String dni1 = u1.getDNI();
                String dni2 = u2.getDNI();
                String Emi = m.getEmisor();
                if (Emi.equalsIgnoreCase(dni1)) {
            %>
            <p class="col-l-4 col-m-4"></p>
            <p class="col-l-4 col-m-4 td_u2"><% out.print(m); %></p>
            <%
            } else if (Emi.equalsIgnoreCase(dni2)) {
            %>
            <p class="td_u1 col-l-4 col-m-4 "><% out.print(m);%></p>
            <p class="col-l-4 col-m-4"></p>
            <%
                }
            %>

            <%
                }
            %>



            <section class="col-l-8 col-m-8">
                <input class="col-l-4 col-m-4 campo " type="text" id="mensajeNuevo" name="mensajeNuevo" placeholder="Introduzca su mensaje aqui">
                <input class="col-l-2 col-m-2 boton" type="submit" id="enviarMensaje" name="enviarMensaje" value="Enviar" >
                <button class="col-l-2 col-m-2 boton" type="submit" name="Return">Volver</button>
            </section>
        </form>
    </body>
</html>
