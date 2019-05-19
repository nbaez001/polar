/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.ProductocreditoDao;
import com.polar.sisfinance.entity.Productocredito;
import com.polar.sisfinance.service.ProductocreditoService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ProductocreditoServiceImpl extends GenericServiceImpl<Productocredito> implements ProductocreditoService {

    @Autowired
    ProductocreditoDao productocreditoDao;

    @Override
    public List<Productocredito> buscarProductocredito(Map likeParams, Map eqParams) {
        return productocreditoDao.CriteriaList(eqParams, null, null, likeParams, 0);
    }

    @Override
    public int obtenerNumeroProductocredito() {
        try {
            return (int) productocreditoDao.consultUnique("select max(id) from Productocredito");
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            return 0;
        }
    }

    @Override
    public List<Productocredito> reverseList(List<String> orderDescParams) {
        return productocreditoDao.CriteriaList(null, orderDescParams, null, null, 0);
    }
}