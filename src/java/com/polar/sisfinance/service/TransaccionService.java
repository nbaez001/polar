/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Operacion;
import com.polar.sisfinance.entity.Transaccion;
import com.polar.sisfinance.entity.news.Data3;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface TransaccionService extends GenericService<Transaccion> {

    int obtenerNumeroTransaccion();

    int desembolsoCuentacredito(Cuentacredito cc, Transaccion tr, Operacion op, Cajero c, HttpSession sesion);

    List<String> listarTransacciones(int idCajero);

    int pagoCuotacuentacredito(List<Desembolso> listaDesembolso, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession sesion);

    int transaccionComprobante(Comprobante comprobante, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession sesion);

    int aperturarAH(Aporte a, HttpSession sesion);

    int cobrarAH(Aporte a, HttpSession sesion);

    int aperturarPF(Cuentaahorro ca, HttpSession sesion);

    int pagoFacilcuotas(Data3 data, HttpSession session);
}
