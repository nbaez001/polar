/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.ProvinciaDao;
import com.polar.sisfinance.entity.Provincia;
import com.polar.sisfinance.service.ProvinciaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ProvinciaServiceImpl extends GenericServiceImpl<Provincia> implements ProvinciaService {

    @Autowired
    ProvinciaDao provinciaDao;

    @Override
    public List<Provincia> listarPorDepartamento(int idDepartamento) {
        return provinciaDao.consultList("from Provincia p where p.departamento.id=" + idDepartamento);
    }
}
