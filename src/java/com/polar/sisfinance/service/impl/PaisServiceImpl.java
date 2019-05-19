/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.PaisDao;
import com.polar.sisfinance.entity.Pais;
import com.polar.sisfinance.service.PaisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class PaisServiceImpl extends GenericServiceImpl<Pais> implements PaisService {

    @Autowired
    PaisDao paisDao;
}