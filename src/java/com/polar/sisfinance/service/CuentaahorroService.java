/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentaahorro;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface CuentaahorroService extends GenericService<Cuentaahorro> {

    int obtenerNumeroCuentaahorro();

    List<String> ListarInteres(Cuentaahorro ca);

    int registrarcuentaahorropf(Cuentaahorro ca);

    int registrarcuentaahorroah(Cuentaahorro ca);

    List<Cuentaahorro> listarCuentaahorros(Cliente c);

    List<Cuentaahorro> listarCPF(Cliente c);

    List<Aporte> listarCAH(Cliente c);
}
