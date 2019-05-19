/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.DetallesaldocajeroDao;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.service.DetallesaldocajeroService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DetallesaldocajeroServiceImpl extends GenericServiceImpl<Detallesaldocajero> implements DetallesaldocajeroService {

    @Autowired
    DetallesaldocajeroDao detallesaldocajeroDao;

    @Override
    public List<Detallesaldocajero> listarDscCierrePorId(int idCajero) {
        return detallesaldocajeroDao.consultList("from Detallesaldocajero dsc where dsc.cajero.id=" + idCajero + " and dsc.apertura=0");
    }

    @Override
    public List<Detallesaldocajero> listarDscAperturaPorId(int idCajero) {
        return detallesaldocajeroDao.consultList("from Detallesaldocajero dsc where dsc.cajero.id=" + idCajero + " and dsc.apertura=1");
    }
}
