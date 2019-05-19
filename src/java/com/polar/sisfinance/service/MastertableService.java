/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Mastertable;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public interface MastertableService extends GenericService<Mastertable>{
    
    public List<Mastertable> listarTablaDeterminada(Map eqParams, List orderDescParams, List orderAscParams, Map likeParams, int limit);
}
