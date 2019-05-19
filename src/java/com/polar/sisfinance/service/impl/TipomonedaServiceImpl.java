/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.TipomonedaDao;
import com.polar.sisfinance.entity.Tipomoneda;
import com.polar.sisfinance.service.TipomonedaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TipomonedaServiceImpl extends GenericServiceImpl<Tipomoneda> implements TipomonedaService {

    @Autowired
    TipomonedaDao tipomonedaDao;
}
