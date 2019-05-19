/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.DistritoDao;
import com.polar.sisfinance.entity.Distrito;
import com.polar.sisfinance.service.DistritoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DistritoServiceImpl extends GenericServiceImpl<Distrito> implements DistritoService {

    @Autowired
    DistritoDao distritoDao;

    @Override
    public List<Distrito> listarPorProvincia(int idProvincia) {
        return distritoDao.consultList("from Distrito d where d.provincia.id=" + idProvincia);
    }
}
