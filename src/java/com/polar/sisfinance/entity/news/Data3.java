/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.entity.news;

import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Operacion;

/**
 *
 * @author nerio
 */
public class Data3 {

    private Cuentacredito cuentacredito;
    private Operacion operacion;

    public Data3() {
    }

    public Data3(Cuentacredito cuentacredito, Operacion operacion) {
        this.cuentacredito = cuentacredito;
        this.operacion = operacion;
    }

    public Cuentacredito getCuentacredito() {
        return cuentacredito;
    }

    public void setCuentacredito(Cuentacredito cuentacredito) {
        this.cuentacredito = cuentacredito;
    }

    public Operacion getOperacion() {
        return operacion;
    }

    public void setOperacion(Operacion operacion) {
        this.operacion = operacion;
    }

}
