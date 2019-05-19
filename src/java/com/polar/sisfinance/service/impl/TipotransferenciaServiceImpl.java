/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.TipotransferenciaDao;
import com.polar.sisfinance.entity.Tipotransferencia;
import com.polar.sisfinance.service.TipotransferenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TipotransferenciaServiceImpl extends GenericServiceImpl<Tipotransferencia> implements TipotransferenciaService {

    @Autowired
    TipotransferenciaDao tipotransferenciaDao;
}
