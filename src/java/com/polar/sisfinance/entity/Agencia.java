package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

/**
 * Agencia generated by hbm2java
 */
public class Agencia implements java.io.Serializable {

    private Integer id;
    private String nombre;
    private String ruc;
    private String direccion;
    private String telefono;
    private String distrito;
    private String provincia;
    private String departamento;
    private String pais;
    private String fax;
    private boolean sede;

    public Agencia() {
    }

    public Agencia(String nombre, String ruc, String direccion, String telefono, String distrito, String provincia, String departamento, String pais, boolean sede) {
        this.nombre = nombre;
        this.ruc = ruc;
        this.direccion = direccion;
        this.telefono = telefono;
        this.distrito = distrito;
        this.provincia = provincia;
        this.departamento = departamento;
        this.pais = pais;
        this.sede = sede;
    }

    public Agencia(String nombre, String ruc, String direccion, String telefono, String distrito, String provincia, String departamento, String pais, String fax, boolean sede) {
        this.nombre = nombre;
        this.ruc = ruc;
        this.direccion = direccion;
        this.telefono = telefono;
        this.distrito = distrito;
        this.provincia = provincia;
        this.departamento = departamento;
        this.pais = pais;
        this.fax = fax;
        this.sede = sede;
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

    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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

    public String getFax() {
        return this.fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public boolean isSede() {
        return this.sede;
    }

    public void setSede(boolean sede) {
        this.sede = sede;
    }
}