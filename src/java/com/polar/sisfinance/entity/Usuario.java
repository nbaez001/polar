package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

/**
 * Usuario generated by hbm2java
 */
public class Usuario implements java.io.Serializable {

    private Integer id;
    private Empleado empleado;
    private String usuario;
    private String contrasena;
    private boolean estado;

    public Usuario() {
    }

    public Usuario(int id) {
        this.id = id;
    }

    public Usuario(int id, Empleado empleado, String usuario, String contrasena, boolean estado) {
        this.id = id;
        this.empleado = empleado;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.estado = estado;
    }

    public Usuario(Empleado empleado, String usuario, String contrasena, boolean estado) {
        this.empleado = empleado;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.estado = estado;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Empleado getEmpleado() {
        return this.empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return this.contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
