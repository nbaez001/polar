/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.CalendarioDao;
import com.polar.sisfinance.entity.Calendario;
import com.polar.sisfinance.service.CalendarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class CalendarioServiceImpl extends GenericServiceImpl<Calendario> implements CalendarioService {

    @Autowired
    CalendarioDao calendarioDao;

}
