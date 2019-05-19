/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Garante;
import com.polar.sisfinance.entity.Registrocuentacredito;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface CuentacreditoDao extends GenericDao<Cuentacredito> {

    public int saveCuentacredito(Cuentacredito x, List<Desembolso> listaDesembolso, List<Garante> listaGarante);

    public int deleteCuentacredito(Cuentacredito x, List<Desembolso> listaDesembolso, Registrocuentacredito rcc);
}
