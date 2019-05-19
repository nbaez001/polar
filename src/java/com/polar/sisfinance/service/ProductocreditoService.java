/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Productocredito;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public interface ProductocreditoService extends GenericService<Productocredito>{

    public List<Productocredito> buscarProductocredito(Map likeParams, Map eqParams);
    
    public int obtenerNumeroProductocredito();
    
    public List<Productocredito> reverseList(List<String> orderDescParams);
}
