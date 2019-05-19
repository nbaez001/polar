/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.ConyugueDao;
import com.polar.sisfinance.entity.Conyugue;
import com.polar.sisfinance.service.ConyugueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ConyugueServiceImpl extends GenericServiceImpl<Conyugue> implements ConyugueService {

    @Autowired
    ConyugueDao conyugueDao;
}