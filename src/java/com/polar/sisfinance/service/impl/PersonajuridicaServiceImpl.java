/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.PersonajuridicaDao;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.service.PersonajuridicaService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class PersonajuridicaServiceImpl extends GenericServiceImpl<Personajuridica> implements PersonajuridicaService {

    @Autowired
    PersonajuridicaDao personajuridicaDao;

    @Override
    public List<Personajuridica> buscarClientejuridico(Map likeParams) {
        return personajuridicaDao.CriteriaList(null, null, null, likeParams, 0);
    }

    @Override
    public Personajuridica obtenerPorCodigoCliente(int idCliente) {
        return (Personajuridica) personajuridicaDao.consultUnique("from Personajuridica pj where pj.cliente.id=" + idCliente);
    }

    @Override
    public int obtenerNumeroClientejuridico() {
        try {
            return (int) personajuridicaDao.consultUnique("select max(id) from Cliente");
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            return 0;
        }
    }

    @Override
    public Personajuridica existe(String ruc) {
        Map<String,Object> eqParams = new HashMap<>();
        eqParams.put("ruc", ruc);
        
        return personajuridicaDao.CriteriaUnique(eqParams, null);
    }
    
    @Override
    public List<Personajuridica> buscarClientejuridicoPorRuc(String ruc) {
        return (List<Personajuridica>) personajuridicaDao.consultList("from Personajuridica pj where pj.ruc like '%" + ruc+"%'");
    }

    @Override
    public List<Personajuridica> buscarClientejuridicoPorNombre(String razonSocial, String nombreComercial) {
        return (List<Personajuridica>) personajuridicaDao.consultList("from Personajuridica pj where pj.razonSocial like '%" + razonSocial+"%' and pj.nombreComercial like '%" + nombreComercial+"%'");
    }
}