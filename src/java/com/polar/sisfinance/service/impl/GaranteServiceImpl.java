/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.GaranteDao;
import com.polar.sisfinance.entity.Garante;
import com.polar.sisfinance.service.GaranteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class GaranteServiceImpl extends GenericServiceImpl<Garante> implements GaranteService {

    @Autowired
    GaranteDao garanteDao;

    @Override
    public List<Garante> listaPorCuentacredito(int idCuentacredito) {
        return garanteDao.consultList("from Garante g where g.cuentacredito.id="+idCuentacredito);
    } 
}