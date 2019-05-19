/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.EmpleadoDao;
import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.service.EmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class EmpleadoServiceImpl extends GenericServiceImpl<Empleado> implements EmpleadoService {

    @Autowired
    EmpleadoDao empleadoDao;
}