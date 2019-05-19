/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Persona;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public interface AgenciaService extends GenericService<Agencia> {
    
    public List<Agencia> obtenerCriteria(Map eqParams, Map likeParams);
    
    public int saveInitValues(Agencia agencia, Persona persona, String cargo, String usuario, String contrasena);
    
    public Agencia obtenerAgenciaPrincipal();
    
    public boolean existeInitParams();
}
