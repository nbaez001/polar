/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.TipodocumentoDao;
import com.polar.sisfinance.entity.Tipodocumento;
import com.polar.sisfinance.service.TipodocumentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TipodocumentoServiceImpl extends GenericServiceImpl<Tipodocumento> implements TipodocumentoService {

    @Autowired
    TipodocumentoDao tipodocumentoDao;
}
