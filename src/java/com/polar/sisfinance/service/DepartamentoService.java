/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Departamento;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface DepartamentoService extends GenericService<Departamento>{
    
    public List<Departamento> listarPorPais(int idPais);
}
