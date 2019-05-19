/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Detallesaldocajero;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface DetallesaldocajeroService extends GenericService<Detallesaldocajero>{
    
    public List<Detallesaldocajero> listarDscCierrePorId(int idCajero);
    
    public List<Detallesaldocajero> listarDscAperturaPorId(int idCajero);
}
