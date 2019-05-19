/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.PersonaDao;
import com.polar.sisfinance.dao.PersonanaturalDao;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.service.PersonanaturalService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class PersonanaturalServiceImpl extends GenericServiceImpl<Personanatural> implements PersonanaturalService {

    @Autowired
    PersonanaturalDao personanaturalDao;
    @Autowired
    PersonaDao personaDao;

    @Override
    public List<Persona> buscarClientenatural(Map eqParams) {
        return personaDao.CriteriaList(null, null, null, eqParams, 0);
    }

    @Override
    public int obtenerNumeroClientenatural() {
        try {
            return (int) personanaturalDao.consultUnique("select max(id) from Cliente");
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            return 0;
        }
    }

    @Override
    public Personanatural obtenerPorCodigoCliente(int idCliente) {
        return (Personanatural) personanaturalDao.consultUnique("from Personanatural pn where pn.cliente.id=" + idCliente);
    }

    @Override
    public Personanatural obtenerPorIdPersona(int idPersona) {
        return (Personanatural) personanaturalDao.consultUnique("from Personanatural pn where pn.persona.id=" + idPersona);
    }

    @Override
    public List<Personanatural> buscarClientenaturalPorDni(Integer dni) {
        return (List<Personanatural>) personanaturalDao.consultList("from Personanatural pn where pn.persona.dni like '%" + dni+"%'");
    }

    @Override
    public List<Personanatural> buscarClientenaturalPorDni2(Integer dni) {
        return (List<Personanatural>) personanaturalDao.consultList("from Personanatural pn where pn.persona.dni='" + dni+"'");
    }
    
    @Override
    public List<Personanatural> buscarClientenaturalPorNombre(String nombre, String apellidoPat, String apellidoMat) {
        return (List<Personanatural>) personanaturalDao.consultList("from Personanatural pn where pn.persona.nombre like '%" + nombre+"%' and pn.persona.apellidoPat like '%" + apellidoPat+"%' and pn.persona.apellidoMat like '%" + apellidoMat+"%'");
    }

    @Override
    public Persona obtenerPorCodigoCliente(Cliente c) {
        return (Persona) personanaturalDao.consultUnique("select p from Personanatural pn join pn.persona p where pn.cliente.id=" + c.getId());
    }
}