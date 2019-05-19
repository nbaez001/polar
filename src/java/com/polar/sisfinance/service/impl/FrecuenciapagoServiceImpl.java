/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.FrecuenciapagoDao;
import com.polar.sisfinance.entity.Frecuenciapago;
import com.polar.sisfinance.service.FrecuenciapagoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class FrecuenciapagoServiceImpl extends GenericServiceImpl<Frecuenciapago> implements FrecuenciapagoService {

    @Autowired
    FrecuenciapagoDao frecuenciapagoDao;
}