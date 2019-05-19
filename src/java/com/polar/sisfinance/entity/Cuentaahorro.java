package com.polar.sisfinance.entity;
// Generatea 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Cuentaahorro generatea by hbm2java
 */
public class Cuentaahorro implements java.io.Serializable {

    private Integer id;
    private Cliente cliente;
    private Estadocuentaahorro estadocuentaahorro;
    private Frecuenciaaporte frecuenciaaporte;
    private Productoahorro productoahorro;
    private Tipomoneda tipomoneda;
    private String codigo;
    private double tea;
    private double importe;
    private double montoInscripcion;
    private double montoCarnet;
    private Integer periodo;
    private double interesProyectado;
    private Date fechaApertura;
    private Date fechaCierre;
    private double capitalActual;

    public Cuentaahorro() {
    }

    public Cuentaahorro(int id) {
        this.id = id;
    }

    public Cuentaahorro(Cliente cliente, Estadocuentaahorro estadocuentaahorro, Productoahorro productoahorro, Tipomoneda tipomoneda, String codigo, double tea, double importe, Date fechaApertura, double capitalActual) {
        this.cliente = cliente;
        this.estadocuentaahorro = estadocuentaahorro;
        this.productoahorro = productoahorro;
        this.tipomoneda = tipomoneda;
        this.codigo=codigo;
        this.tea = tea;
        this.importe = importe;
        this.fechaApertura = fechaApertura;
        this.capitalActual = capitalActual;
    }

    public Cuentaahorro(Integer id, Cliente cliente, Estadocuentaahorro estadocuentaahorro, Frecuenciaaporte frecuenciaaporte, Productoahorro productoahorro, Tipomoneda tipomoneda, String codigo, double tea, double importe, double montoInscripcion, double montoCarnet, Integer periodo, double interesProyectado, Date fechaApertura, Date fechaCierre, double capitalActual) {
        this.id = id;
        this.cliente = cliente;
        this.estadocuentaahorro = estadocuentaahorro;
        this.frecuenciaaporte = frecuenciaaporte;
        this.productoahorro = productoahorro;
        this.tipomoneda = tipomoneda;
        this.codigo=codigo;
        this.tea = tea;
        this.importe = importe;
        this.montoInscripcion = montoInscripcion;
        this.montoCarnet = montoCarnet;
        this.periodo = periodo;
        this.interesProyectado = interesProyectado;
        this.fechaApertura = fechaApertura;
        this.fechaCierre = fechaCierre;
        this.capitalActual = capitalActual;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Estadocuentaahorro getEstadocuentaahorro() {
        return estadocuentaahorro;
    }

    public void setEstadocuentaahorro(Estadocuentaahorro estadocuentaahorro) {
        this.estadocuentaahorro = estadocuentaahorro;
    }

    public Frecuenciaaporte getFrecuenciaaporte() {
        return frecuenciaaporte;
    }

    public void setFrecuenciaaporte(Frecuenciaaporte frecuenciaaporte) {
        this.frecuenciaaporte = frecuenciaaporte;
    }

    public Productoahorro getProductoahorro() {
        return productoahorro;
    }

    public void setProductoahorro(Productoahorro productoahorro) {
        this.productoahorro = productoahorro;
    }

    public Tipomoneda getTipomoneda() {
        return tipomoneda;
    }

    public void setTipomoneda(Tipomoneda tipomoneda) {
        this.tipomoneda = tipomoneda;
    }

    public double getTea() {
        return tea;
    }

    public void setTea(double tea) {
        this.tea = tea;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public double getMontoInscripcion() {
        return montoInscripcion;
    }

    public void setMontoInscripcion(double montoInscripcion) {
        this.montoInscripcion = montoInscripcion;
    }

    public double getMontoCarnet() {
        return montoCarnet;
    }

    public void setMontoCarnet(double montoCarnet) {
        this.montoCarnet = montoCarnet;
    }

    public Integer getPeriodo() {
        return periodo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setPeriodo(Integer periodo) {
        this.periodo = periodo;
    }

    public double getInteresProyectado() {
        return interesProyectado;
    }

    public void setInteresProyectado(double interesProyectado) {
        this.interesProyectado = interesProyectado;
    }

    public Date getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(Date fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public Date getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(Date fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public double getCapitalActual() {
        return capitalActual;
    }

    public void setCapitalActual(double capitalActual) {
        this.capitalActual = capitalActual;
    }

}
