/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.TipotransaccionDao;
import com.polar.sisfinance.entity.Tipotransaccion;
import com.polar.sisfinance.service.TipotransaccionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class TipotransaccionServiceImpl extends GenericServiceImpl<Tipotransaccion> implements TipotransaccionService {

    @Autowired
    TipotransaccionDao tipotransaccionDao;
}
