/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.DetallecomprobanteDao;
import com.polar.sisfinance.entity.Detallecomprobante;
import com.polar.sisfinance.service.DetallecomprobanteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DetallecomprobanteServiceImpl extends GenericServiceImpl<Detallecomprobante> implements DetallecomprobanteService {

    @Autowired
    DetallecomprobanteDao detallecomprobanteDao;

    @Override
    public List<Detallecomprobante> listDetallecomprobante(int idComprobante) {
        return detallecomprobanteDao.consultList("from Detallecomprobante dc where dc.comprobante.id=" + idComprobante);
    }
}
