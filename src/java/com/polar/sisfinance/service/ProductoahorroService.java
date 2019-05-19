/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Productoahorro;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ProductoahorroService extends GenericService<Productoahorro> {

    List<Productoahorro> reverseList();
    
    List<Productoahorro> listarSimilar(Productoahorro p);
    
    int guardarProductoahorro(Productoahorro x);
}
