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
public class Item {

    private int id_item;
    private int id_aula;
    private int uds;
    private String descripcion;
    private String marca;
    private String modelo;

    public Item() {
        this.id_item = 0;
        this.id_aula = 0;
        this.uds = 0;
        this.descripcion = "";
        this.marca = "";
        this.modelo = "";
    }
    
    public Item(int id_item, int id_aula, int uds, String descripcion, String marca, String modelo) {
        this.id_item = id_item;
        this.id_aula = id_aula;
        this.uds = uds;
        this.descripcion = descripcion;
        this.marca = marca;
        this.modelo = modelo;
    }

    public int getId_item() {
        return id_item;
    }

    public void setId_item(int id_item) {
        this.id_item = id_item;
    }

    public int getId_aula() {
        return id_aula;
    }

    public void setId_aula(int id_aula) {
        this.id_aula = id_aula;
    }

    public int getUds() {
        return uds;
    }

    public void setUds(int uds) {
        this.uds = uds;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    @Override
    public String toString() {
        return "ID Item: " + id_item + " | ID Aula: " + id_aula + " | Unidades: " + uds + " | Descripcion: " + descripcion + " | Marca: " + marca + " | Modelo: " + modelo;
    }
    
    
    
}
