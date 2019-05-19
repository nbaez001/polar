package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * Estadocuentaahorro generated by hbm2java
 */
public class Estadocuentaahorro implements java.io.Serializable {

    private Integer id;
    private String denominacion;
    private String abreviacion;
    private boolean estado;

    public Estadocuentaahorro() {
    }

    public Estadocuentaahorro(int id) {
        this.id = id;
    }

    public Estadocuentaahorro(String denominacion, String abreviacion, boolean estado) {
        this.denominacion = denominacion;
        this.abreviacion = abreviacion;
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

    public String getAbreviacion() {
        return this.abreviacion;
    }

    public void setAbreviacion(String abreviacion) {
        this.abreviacion = abreviacion;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}
