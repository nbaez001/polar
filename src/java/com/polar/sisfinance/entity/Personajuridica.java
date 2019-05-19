package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Personajuridica generated by hbm2java
 */
public class Personajuridica implements java.io.Serializable {

    private Integer id;
    private Cliente cliente;
    private String razonSocial;
    private String nombreComercial;
    private String giroNegocio;
    private String ruc;
    private String direccion;
    private String distrito;
    private String provincia;
    private String departamento;
    private String pais;
    private String telefono;
    private String email;
    private Date fechaFundacion;
    private boolean estado;

    public Personajuridica() {
    }

    public Personajuridica(Cliente cliente, String razonSocial, String nombreComercial, String giroNegocio, String ruc, String direccion, boolean estado) {
        this.cliente = cliente;
        this.razonSocial = razonSocial;
        this.nombreComercial = nombreComercial;
        this.giroNegocio = giroNegocio;
        this.ruc = ruc;
        this.direccion = direccion;
        this.estado = estado;
    }

    public Personajuridica(Cliente cliente, String razonSocial, String nombreComercial, String giroNegocio, String ruc, String direccion, String distrito, String provincia, String departamento, String pais, String telefono, String email, Date fechaFundacion, boolean estado) {
        this.cliente = cliente;
        this.razonSocial = razonSocial;
        this.nombreComercial = nombreComercial;
        this.giroNegocio = giroNegocio;
        this.ruc = ruc;
        this.direccion = direccion;
        this.distrito = distrito;
        this.provincia = provincia;
        this.departamento = departamento;
        this.pais = pais;
        this.telefono = telefono;
        this.email = email;
        this.fechaFundacion = fechaFundacion;
        this.estado = estado;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return this.cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getRazonSocial() {
        return this.razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getNombreComercial() {
        return this.nombreComercial;
    }

    public void setNombreComercial(String nombreComercial) {
        this.nombreComercial = nombreComercial;
    }

    public String getGiroNegocio() {
        return this.giroNegocio;
    }

    public void setGiroNegocio(String giroNegocio) {
        this.giroNegocio = giroNegocio;
    }

    public String getRuc() {
        return this.ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDistrito() {
        return this.distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public String getProvincia() {
        return this.provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getDepartamento() {
        return this.departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getPais() {
        return this.pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getFechaFundacion() {
        return this.fechaFundacion;
    }

    public void setFechaFundacion(Date fechaFundacion) {
        this.fechaFundacion = fechaFundacion;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
