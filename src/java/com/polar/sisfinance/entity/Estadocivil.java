/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.entity;

/**
 *
 * @author nerio
 */
public class Estadocivil {

    private Integer id;
    private String denominacion;
    private boolean estado;

    public Estadocivil() {
    }

    public Estadocivil(String denominacion, boolean estado) {
        this.denominacion = denominacion;
        this.estado = estado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDenominacion() {
        return denominacion;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
