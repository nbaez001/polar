/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Garante;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface CuentacreditoService extends GenericService<Cuentacredito> {

    int obtenerNumeroCuentacredito();

    List<Desembolso> calcularCuotas(Cuentacredito x);

    int crearCuentacredito(Cuentacredito cuentacredito, List<Desembolso> listaDesembolso, List<Garante> listaGarante);

    int quitarCuentacredito(int id);

    List<Cuentacredito> listarCuentasPorCliente(int idCliente);

    List<Cuentacredito> listarCuentasParaAprobacion();

    int admisionCuentacredito(Cuentacredito cc);

    List<Cuentacredito> listarCuentasParaDesembolso(int idCliente);

    List<Desembolso> listaPagoCuotas(int idCliente);

    boolean estaCancelada(int idCuentacredito);

    void cerrarCuentacredito(int idCuentacredito);

    List<String> listaCarteramorosa();

    List<Integer> numeroCuentamorosa(int idCliente);

    List<Cuentacredito> cuentasMorosa(Date fechaInicio, Date fechaFin);

    List<Object[]> cuentasMorosaPorProductocredito(int idProductocredito);

    List<Object[]> cuentasPorProductocredito(Date fechaInicio, Date fechaFin, int idProductocredito);

    List<Cuentacredito> listarCuentascredito(Cliente c);

    List<String> buscarCuentasporpagar(Cliente c);
}
