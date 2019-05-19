/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.TipoahorroDao;
import com.polar.sisfinance.entity.Tipoahorro;
import com.polar.sisfinance.service.TipoahorroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TipoahorroServiceImpl extends GenericServiceImpl<Tipoahorro> implements TipoahorroService {

    @Autowired
    TipoahorroDao tipoahorroDao;
}
