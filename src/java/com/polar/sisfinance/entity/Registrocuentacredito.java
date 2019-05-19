package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Registrocuentacredito generated by hbm2java
 */
public class Registrocuentacredito  implements java.io.Serializable {


     private Integer id;
     private Cuentacredito cuentacredito;
     private Usuario usuario;
     private Date fecha;

    public Registrocuentacredito() {
    }

    public Registrocuentacredito(Cuentacredito cuentacredito, Usuario usuario, Date fecha) {
       this.cuentacredito = cuentacredito;
       this.usuario = usuario;
       this.fecha = fecha;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Cuentacredito getCuentacredito() {
        return this.cuentacredito;
    }
    
    public void setCuentacredito(Cuentacredito cuentacredito) {
        this.cuentacredito = cuentacredito;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }




}

