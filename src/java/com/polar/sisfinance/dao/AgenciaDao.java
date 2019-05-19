/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Rol;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface AgenciaDao extends GenericDao<Agencia> {

    public int saveInitValues(Agencia agencia, Persona persona, String cargo, String usuario, String contrasena, List<Rol> listaRol);
}
