package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1



/**
 * Detallecomprobante generated by hbm2java
 */
public class Detallecomprobante  implements java.io.Serializable {


     private Integer id;
     private Comprobante comprobante;
     private Tipodocumento tipodocumento;
     private String descripcion;
     private double monto;

    public Detallecomprobante() {
    }

    public Detallecomprobante(Comprobante comprobante, Tipodocumento tipodocumento, String descripcion, double monto) {
       this.comprobante = comprobante;
       this.tipodocumento = tipodocumento;
       this.descripcion = descripcion;
       this.monto = monto;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Comprobante getComprobante() {
        return this.comprobante;
    }
    
    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }
    public Tipodocumento getTipodocumento() {
        return this.tipodocumento;
    }
    
    public void setTipodocumento(Tipodocumento tipodocumento) {
        this.tipodocumento = tipodocumento;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public double getMonto() {
        return this.monto;
    }
    
    public void setMonto(double monto) {
        this.monto = monto;
    }




}


