/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.DetallesaldotransferenciaDao;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.service.DetallesaldotransferenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DetallesaldotransferenciaServiceImpl extends GenericServiceImpl<Detallesaldotransferencia> implements DetallesaldotransferenciaService {

    @Autowired
    DetallesaldotransferenciaDao detallesaldotransferenciaDao;
}