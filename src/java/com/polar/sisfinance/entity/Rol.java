package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

/**
 * Rol generated by hbm2java
 */
public class Rol implements java.io.Serializable {

    private Integer id;
    private String denominacion;
    private boolean estado;

    public Rol() {
    }

    public Rol(String denominacion, boolean estado) {
        this.denominacion = denominacion;
        this.estado = estado;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDenominacion() {
        return this.denominacion;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}