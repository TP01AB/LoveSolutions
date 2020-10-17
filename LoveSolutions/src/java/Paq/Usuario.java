/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paq;

import java.sql.Date;
import java.util.LinkedList;

/**
 *
 * @author isra9
 */
public class Usuario {
    String DNI;
    String nick;
    String email;
    String sexo;
    Date fecha_nacimiento;
    LinkedList pref;

    public Usuario(String DNI, String nick, String email, String sexo) {
        this.DNI = DNI;
        this.nick = nick;
        this.email = email;
        this.sexo = sexo;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public LinkedList getPref() {
        return pref;
    }

    public void setPref(LinkedList pref) {
        this.pref = pref;
    }

   

  

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    @Override
    public String toString() {
        return "Usuario{" + "DNI=" + DNI + ", nick=" + nick + ", email=" + email + ", sexo=" + sexo + '}';
    }

}
