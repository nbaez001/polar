/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Operacion;
import com.polar.sisfinance.entity.Transaccion;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface TransaccionDao extends GenericDao<Transaccion> {

    public int desembolsoCuentacredito(Cuentacredito cc, Transaccion tr, Operacion op, Cajero c, HttpSession sesion);

    public int pagoCuotacuentacredito(List<Desembolso> listaDesembolso, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession sesion);

    public int transaccionComprobante(Comprobante comprobante, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession sesion);

    int aperturarAH(Cuentaahorro ca, Aporte a, Transaccion tr, Operacion o, Cajero c, HttpSession session);

    int cobrarAH(Cuentaahorro ca, Aporte a, Transaccion tr, Operacion o, Cajero c, HttpSession session);
    
    int aperturarPF(Cuentaahorro ca, Transaccion tr, Operacion o, Cajero c, HttpSession session);
}
