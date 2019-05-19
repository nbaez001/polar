/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.RolDao;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.service.RolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class RolServiceImpl extends GenericServiceImpl<Rol> implements RolService {

    @Autowired
    RolDao rolDao;
}
