/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.DetallesaldobobedaDao;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.service.DetallesaldobobedaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DetallesaldobobedaServiceImpl extends GenericServiceImpl<Detallesaldobobeda> implements DetallesaldobobedaService {

    @Autowired
    DetallesaldobobedaDao detallesaldobobedaDao;
    
    @Override
    public List<Detallesaldobobeda> listarDsbCierrePorId(int idBobeda) {
        return detallesaldobobedaDao.consultList("from Detallesaldobobeda dsb where dsb.bobeda.id="+idBobeda+" and dsb.apertura=0 order by dsb.valor desc");
    }

    @Override
    public List<Detallesaldobobeda> listarDsbAperturaPorId(int idBobeda) {
        return detallesaldobobedaDao.consultList("from Detallesaldobobeda dsb where dsb.bobeda.id="+idBobeda+" and dsb.apertura=1 order by dsb.valor desc");
    }
}
