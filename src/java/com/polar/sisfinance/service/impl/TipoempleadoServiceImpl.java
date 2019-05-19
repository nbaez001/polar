/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.EmpleadoDao;
import com.polar.sisfinance.dao.TipoempleadoDao;
import com.polar.sisfinance.entity.Tipoempleado;
import com.polar.sisfinance.service.TipoempleadoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TipoempleadoServiceImpl extends GenericServiceImpl<Tipoempleado> implements TipoempleadoService {

    @Autowired
    TipoempleadoDao tipoempleadoDao;
    @Autowired
    EmpleadoDao empleadoDao;

    @Override
    public List<Tipoempleado> listaValidadoGerente() {
        int numero;
        try {
            numero = Integer.parseInt(empleadoDao.consultUnique("select count(e) from Empleado e where e.tipoempleado.id=1").toString());
        } catch (Exception e) {
            numero = 0;
        }

        if (numero > 0) {
            return tipoempleadoDao.consultList("from Tipoempleado te where te.id!=1");
        } else {
            return tipoempleadoDao.findAll();
        }
    }

    @Override
    public boolean existeGerente() {
        int numero;
        try {
            numero = Integer.parseInt(tipoempleadoDao.consultUnique("select count(e) from Empleado e where e.tipoempleado.id=1").toString());
        } catch (Exception e) {
            numero = 0;
        }

        return numero > 0;
    }
}
