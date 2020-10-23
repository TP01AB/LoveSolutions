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
        <title>Love Solutions</title>
    </head>
    <body>
        <jsp:include page="./Cabecera.jsp"/>
        <h1>Hello Chat!</h1>
        <form class="row " action="../Controlador.jsp" method="POST">
            <table>
                <%
                    Usuario u1 = (Usuario) session.getAttribute("u1");
                    Usuario u2 = (Usuario) session.getAttribute("u2");
                    LinkedList<Mensaje> Mensajes = (LinkedList) session.getAttribute("Mensajes");
                    for (int i = 0; i < Mensajes.size(); i++) {
                %>

                <%
                    Mensaje m = Mensajes.get(i);
                    if (m.getEmisor() == u1.getDNI()) {
                %>
                <tr class="td_u1"><% out.print(m.getMensaje()); %></tr>
                <%
                } else {
                %>
                <tr class="td_u2"><% out.print(m.getMensaje()); %></tr>
                <%
                    }

                %>

                <%                        }

                %>


            </table>

            <input type="text" id="mensajeNuevo" name="mensajeNuevo" placeholder="Introduzca su mensaje aqui">
            <input type="submit" id="enviarMensaje" name="enviarMensaje" value="Enviar" >
        </form>
    </body>
</html>
