/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.OperacionDao;
import com.polar.sisfinance.entity.Operacion;
import com.polar.sisfinance.service.OperacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class OperacionServiceImpl extends GenericServiceImpl<Operacion> implements OperacionService {

    @Autowired
    OperacionDao operacionDao;
}