/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.EstadocreditoDao;
import com.polar.sisfinance.entity.Estadocredito;
import com.polar.sisfinance.service.EstadocreditoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class EstadocreditoServiceImpl extends GenericServiceImpl<Estadocredito> implements EstadocreditoService {

    @Autowired
    EstadocreditoDao estadocreditoDao;
}