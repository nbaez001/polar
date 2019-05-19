/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.entity.news;

import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public class Data2 {

    private List<Map> listaPagados;
    private String nombreCliente;
    private Integer idCliente;

    public Data2() {
    }

    public Data2(List<Map> listaPagados, String nombreCliente, Integer idCliente) {
        this.listaPagados = listaPagados;
        this.nombreCliente = nombreCliente;
        this.idCliente = idCliente;
    }

    public List<Map> getListaPagados() {
        return listaPagados;
    }

    public void setListaPagados(List<Map> listaPagados) {
        this.listaPagados = listaPagados;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

}
