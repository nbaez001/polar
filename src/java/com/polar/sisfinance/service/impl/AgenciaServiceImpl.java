/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.AgenciaDao;
import com.polar.sisfinance.dao.RolDao;
import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.service.AgenciaService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class AgenciaServiceImpl extends GenericServiceImpl<Agencia> implements AgenciaService {

    @Autowired
    AgenciaDao agenciaDao;
    @Autowired
    RolDao rolDao;

    @Override
    public List<Agencia> obtenerCriteria(Map eqParams, Map likeParams) {
        return agenciaDao.CriteriaList(eqParams, null, null, likeParams, 0);
    }

    @Override
    public int saveInitValues(Agencia agencia, Persona persona, String cargo, String usuario, String contrasena) {
        List<Rol> listaRol = rolDao.findAll();
        return agenciaDao.saveInitValues(agencia, persona, cargo, usuario, contrasena, listaRol);
    }

    @Override
    public Agencia obtenerAgenciaPrincipal() {
        return (Agencia) agenciaDao.consultUnique("from Agencia a where a.sede=false");
    }
    
    @Override
    public boolean existeInitParams() {
        int data;
        try {
            data = Integer.parseInt(agenciaDao.consultUnique("select count(e) from Agencia e").toString());
        } catch (Exception e) {
            data = 0;
        }
        return data >= 1;
    }
}
