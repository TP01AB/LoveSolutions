/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paq;

/**
 *
 * @author isra9
 */
public class Mensaje {

    String emisor;
    String receptor;
    String mensaje;
    int id;
    boolean Leido;

    public Mensaje() {
    }

    public Mensaje(int id, String emisor, String receptor, String mensaje) {
        this.id = id;
        this.emisor = emisor;
        this.receptor = receptor;
        this.mensaje = mensaje;
    }

    public Mensaje(String emisor, String receptor, String mensaje) {

        this.emisor = emisor;
        this.receptor = receptor;
        this.mensaje = mensaje;
    }

    //CONSTRUCTOR PARA CREACION DE MENSAJES EXISTENTES EN BD
    public Mensaje(String emisor, String receptor, String mensaje, int id, boolean Leido) {
        this.emisor = emisor;
        this.receptor = receptor;
        this.mensaje = mensaje;
        this.id = id;
        this.Leido = Leido;
    }

    public String getEmisor() {
        return emisor;
    }

    public void setEmisor(String emisor) {
        this.emisor = emisor;
    }

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isLeido() {
        return Leido;
    }

    public void setLeido(boolean Leido) {
        this.Leido = Leido;
    }

    @Override
    public String toString() {
        return "Mensaje de " + emisor + ": " + mensaje;
    }
}
