/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.MastertableDao;
import com.polar.sisfinance.entity.Mastertable;
import com.polar.sisfinance.service.MastertableService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class MastertableServiceImpl extends GenericServiceImpl<Mastertable> implements MastertableService {

    @Autowired
    MastertableDao mastertableDao;

    @Override
    public List<Mastertable> listarTablaDeterminada(Map eqParams, List orderDescParams, List orderAscParams, Map likeParams, int limit) {
        return mastertableDao.CriteriaList(eqParams, orderDescParams, orderAscParams, likeParams, limit);
    }
}