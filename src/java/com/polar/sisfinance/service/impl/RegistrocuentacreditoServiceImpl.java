/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.RegistrocuentacreditoDao;
import com.polar.sisfinance.entity.Registrocuentacredito;
import com.polar.sisfinance.service.RegistrocuentacreditoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class RegistrocuentacreditoServiceImpl extends GenericServiceImpl<Registrocuentacredito> implements RegistrocuentacreditoService {

    @Autowired
    RegistrocuentacreditoDao registrocuentacreditoDao;
}
