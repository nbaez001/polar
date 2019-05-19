/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.RepresentantelegalDao;
import com.polar.sisfinance.entity.Representantelegal;
import com.polar.sisfinance.service.RepresentantelegalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class RepresentantelegalServiceImpl extends GenericServiceImpl<Representantelegal> implements RepresentantelegalService {

    @Autowired
    RepresentantelegalDao representantelegalDao;
}
