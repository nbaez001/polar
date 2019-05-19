/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Distrito;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface DistritoService extends GenericService<Distrito>{
    
    public List<Distrito> listarPorProvincia(int idProvincia);
}
