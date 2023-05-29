/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.PersonaDao;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.service.PersonaService;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class PersonaServiceImpl extends GenericServiceImpl<Persona> implements PersonaService {

    @Autowired
    PersonaDao personaDao;

    @Override
    public Persona existe(Persona p) {
        Map<String, Integer> eqParams = new HashMap<>();
        eqParams.put("dni", p.getDni());

        p = personaDao.CriteriaUnique(eqParams, null);

        return p;
    }

    @Override
    public Persona get(String dni) {
        return (Persona) personaDao.consultUnique("from Persona p where p.dni='"+dni+"'");
    }
}