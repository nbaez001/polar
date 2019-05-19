/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.AporteDao;
import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.service.AporteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class AporteServiceImpl extends GenericServiceImpl<Aporte> implements AporteService {

    @Autowired
    AporteDao aporteDao;
}
