/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Conyugue;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Representantelegal;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ClienteService extends GenericService<Cliente> {

    public int crearClienteNatural(Persona p, Personanatural pn, Cliente c, Conyugue cony);

    public int modificarClienteNatural(Personanatural pn);

    public int eliminarClientenatural(Personanatural pn);

    public int crearClienteJuridico(Personajuridica pj, Cliente c, List<Representantelegal> listaRepresentantelegal);

    public int eliminarClientejuridico(Personajuridica pj);
}
