/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Conyugue;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Representantelegal;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public interface ClienteDao extends GenericDao<Cliente> {

    public int saveClienteNatural(Persona p, Personanatural pn, Cliente c, Conyugue cony);

    public int updateClienteNatural(Persona p, Personanatural pn, Cliente c, Conyugue cony);

    public int updateClienteNaturalNewConyugue(Persona p, Conyugue c);

    public int updateClienteNaturalExistConyugue(Persona p, Conyugue c);

    public int deleteClientenatural(Personanatural pn);

    public int saveClienteJuridico(Personajuridica pj, Cliente c, List<Representantelegal> listaRepresentantelegal);

    public int deleteClientejuridico(Personajuridica pj, List<Representantelegal> listaRepresentantelegal);
}
