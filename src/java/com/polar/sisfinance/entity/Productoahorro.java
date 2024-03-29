package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1

import java.util.Date;

/**
 * Productoahorro generated by hbm2java
 */
public class Productoahorro implements java.io.Serializable {

    private Integer id;
    private Frecuenciaaporte frecuenciaaporte;
    private Tipoahorro tipoahorro;
    private Tipomoneda tipomoneda;
    private String codigo;
    private String nombre;
    private double tea;
    private String docSustentatorios;
    private Date inicioFechaVigencia;
    private Date finFechaVigencia;
    private String descripcion;
    private boolean estado;
    private Double montoAporte;
    private Double montoInscripcion;
    private Double montoCarnet;
    private Double montoMinimo;
    private Double montoMaximo;
    private Integer periodoMinimo;
    private Integer periodoMaximo;

    public Productoahorro() {
    }

    public Productoahorro(int id) {
        this.id = id;
    }

    public Productoahorro(Tipoahorro tipoahorro, Tipomoneda tipomoneda, String codigo, String nombre, double tea, String docSustentatorios, Date inicioFechaVigencia, Date finFechaVigencia, boolean estado) {
        this.tipoahorro = tipoahorro;
        this.tipomoneda = tipomoneda;
        this.codigo = codigo;
        this.nombre = nombre;
        this.tea = tea;
        this.docSustentatorios = docSustentatorios;
        this.inicioFechaVigencia = inicioFechaVigencia;
        this.finFechaVigencia = finFechaVigencia;
        this.estado = estado;
    }

    public Productoahorro(Frecuenciaaporte frecuenciaaporte, Tipoahorro tipoahorro, Tipomoneda tipomoneda, String codigo, String nombre, double tea, String docSustentatorios, Date inicioFechaVigencia, Date finFechaVigencia, String descripcion, boolean estado, Double montoAporte, Double montoInscripcion, Double montoCarnet, Double montoMinimo, Double montoMaximo, Integer periodoMinimo, Integer periodoMaximo) {
        this.frecuenciaaporte = frecuenciaaporte;
        this.tipoahorro = tipoahorro;
        this.tipomoneda = tipomoneda;
        this.codigo = codigo;
        this.nombre = nombre;
        this.tea = tea;
        this.docSustentatorios = docSustentatorios;
        this.inicioFechaVigencia = inicioFechaVigencia;
        this.finFechaVigencia = finFechaVigencia;
        this.descripcion = descripcion;
        this.estado = estado;
        this.montoAporte = montoAporte;
        this.montoInscripcion = montoInscripcion;
        this.montoCarnet = montoCarnet;
        this.montoMinimo = montoMinimo;
        this.montoMaximo = montoMaximo;
        this.periodoMinimo = periodoMinimo;
        this.periodoMaximo = periodoMaximo;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Frecuenciaaporte getFrecuenciaaporte() {
        return this.frecuenciaaporte;
    }

    public void setFrecuenciaaporte(Frecuenciaaporte frecuenciaaporte) {
        this.frecuenciaaporte = frecuenciaaporte;
    }

    public Tipoahorro getTipoahorro() {
        return this.tipoahorro;
    }

    public void setTipoahorro(Tipoahorro tipoahorro) {
        this.tipoahorro = tipoahorro;
    }

    public Tipomoneda getTipomoneda() {
        return this.tipomoneda;
    }

    public void setTipomoneda(Tipomoneda tipomoneda) {
        this.tipomoneda = tipomoneda;
    }

    public String getCodigo() {
        return this.codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getTea() {
        return this.tea;
    }

    public void setTea(double tea) {
        this.tea = tea;
    }

    public String getDocSustentatorios() {
        return this.docSustentatorios;
    }

    public void setDocSustentatorios(String docSustentatorios) {
        this.docSustentatorios = docSustentatorios;
    }

    public Date getInicioFechaVigencia() {
        return this.inicioFechaVigencia;
    }

    public void setInicioFechaVigencia(Date inicioFechaVigencia) {
        this.inicioFechaVigencia = inicioFechaVigencia;
    }

    public Date getFinFechaVigencia() {
        return this.finFechaVigencia;
    }

    public void setFinFechaVigencia(Date finFechaVigencia) {
        this.finFechaVigencia = finFechaVigencia;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Double getMontoAporte() {
        return this.montoAporte;
    }

    public void setMontoAporte(Double montoAporte) {
        this.montoAporte = montoAporte;
    }

    public Double getMontoInscripcion() {
        return this.montoInscripcion;
    }

    public void setMontoInscripcion(Double montoInscripcion) {
        this.montoInscripcion = montoInscripcion;
    }

    public Double getMontoCarnet() {
        return this.montoCarnet;
    }

    public void setMontoCarnet(Double montoCarnet) {
        this.montoCarnet = montoCarnet;
    }

    public Double getMontoMinimo() {
        return this.montoMinimo;
    }

    public void setMontoMinimo(Double montoMinimo) {
        this.montoMinimo = montoMinimo;
    }

    public Double getMontoMaximo() {
        return this.montoMaximo;
    }

    public void setMontoMaximo(Double montoMaximo) {
        this.montoMaximo = montoMaximo;
    }

    public Integer getPeriodoMinimo() {
        return this.periodoMinimo;
    }

    public void setPeriodoMinimo(Integer periodoMinimo) {
        this.periodoMinimo = periodoMinimo;
    }

    public Integer getPeriodoMaximo() {
        return this.periodoMaximo;
    }

    public void setPeriodoMaximo(Integer periodoMaximo) {
        this.periodoMaximo = periodoMaximo;
    }

}
