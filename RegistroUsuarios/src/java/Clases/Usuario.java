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

    private String correo;
    private String password;
    private String curso;
    private int admin;

    public Usuario() {
        this.correo = "";
        this.password = "";
        this.curso = "";
        this.admin = 0;
    }

    public Usuario(String correo, String password, String curso, int admin) {
        this.correo = correo;
        this.password = password;
        this.curso = curso;
        this.admin = admin;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    

    @Override
    public String toString() {
        String permiso = "";
        if (admin == 0) {
            permiso = "Administrador";
        } else if (admin == 1) {
            permiso = "Usuario";
        }
        
        return "Correo: " + correo + ", Curso: " + curso + ", Admin: " + permiso;
    }

}
