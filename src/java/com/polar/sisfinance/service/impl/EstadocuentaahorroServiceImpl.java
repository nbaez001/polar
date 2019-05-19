/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.EstadocuentaahorroDao;
import com.polar.sisfinance.entity.Estadocuentaahorro;
import com.polar.sisfinance.service.EstadocuentaahorroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class EstadocuentaahorroServiceImpl extends GenericServiceImpl<Estadocuentaahorro> implements EstadocuentaahorroService {

    @Autowired
    EstadocuentaahorroDao estadocuentaahorroDao;

}
