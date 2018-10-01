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

    public Usuario() {
        this.correo = "";
        this.password = "";
        this.curso = "";
    }

    public Usuario(String correo, String password, String curso) {
        this.correo = correo;
        this.password = password;
        this.curso = curso;
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

    @Override
    public String toString() {
        return "Correo: " + correo  + ", Curso: " + curso;
    }
    
    
    
    
}
