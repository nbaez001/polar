/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.DepartamentoDao;
import com.polar.sisfinance.entity.Departamento;
import com.polar.sisfinance.service.DepartamentoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DepartamentoServiceImpl extends GenericServiceImpl<Departamento> implements DepartamentoService {

    @Autowired
    DepartamentoDao departamentoDao;

    @Override
    public List<Departamento> listarPorPais(int idPais) {
        return departamentoDao.consultList("from Departamento d where d.pais.id=" + idPais);
    }
}
