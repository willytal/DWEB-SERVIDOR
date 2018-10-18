/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author willy
 */
public class Usuario {
    private int id_user;
    private int id_depart;
    private String nombre;
    private String email;
    private String password;

    public Usuario() {
        this.id_user = 0;
        this.id_depart = 0;
        this.nombre = "";
        this.email = "";
        this.password = "";
    }
    
    public Usuario(int id_user, int id_depart, String nombre, String email, String password) {
        this.id_user = id_user;
        this.id_depart = id_depart;
        this.nombre = nombre;
        this.email = email;
        this.password = password;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_depart() {
        return id_depart;
    }

    public void setId_depart(int id_depart) {
        this.id_depart = id_depart;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Usuario:" + "\r\nID USER: " + id_user + "\r\nID DEPARTAMENTO: " + id_depart + "\r\nNOMBRE: " + nombre + "\r\nEMAIL: " + email + "\r\nPASSWORD: " + password + '}';
    }
    
    
    
}
