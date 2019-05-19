/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.FrecuenciaaporteDao;
import com.polar.sisfinance.entity.Frecuenciaaporte;
import com.polar.sisfinance.service.FrecuenciaaporteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class FrecuenciaaporteServiceImpl extends GenericServiceImpl<Frecuenciaaporte> implements FrecuenciaaporteService {

    @Autowired
    FrecuenciaaporteDao frecuenciaaporteDao;

}
