package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

/**
 * Caja generated by hbm2java
 */
public class Caja implements java.io.Serializable {

    private Integer id;
    private String nombre;
    private boolean estado;

    public Caja() {
    }

    public Caja(String nombre, boolean estado) {
        this.nombre = nombre;
        this.estado = estado;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
