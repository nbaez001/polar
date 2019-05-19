/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.ClienteDao;
import com.polar.sisfinance.dao.PersonaDao;
import com.polar.sisfinance.dao.PersonajuridicaDao;
import com.polar.sisfinance.dao.PersonanaturalDao;
import com.polar.sisfinance.dao.RepresentantelegalDao;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Conyugue;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Representantelegal;
import com.polar.sisfinance.service.ClienteService;
import java.util.ArrayList;
import java.util.Date;
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
public class ClienteServiceImpl extends GenericServiceImpl<Cliente> implements ClienteService {

    @Autowired
    ClienteDao clienteDao;
    @Autowired
    PersonaDao personaDao;
    @Autowired
    RepresentantelegalDao representantelegalDao;
    @Autowired
    PersonanaturalDao personanaturalDao;
    @Autowired
    PersonajuridicaDao personajuridicaDao;

    @Override
    public int crearClienteNatural(Persona p, Personanatural pn, Cliente c, Conyugue cony) {
        Map<String, Integer> eqParams = new HashMap<>();
        eqParams.put("dni", p.getDni());

        Persona persona = personaDao.CriteriaUnique(eqParams, null);
        if (persona != null) {
            List<Personanatural> listaPersonanatural = personanaturalDao.consultList("from Personanatural pn where pn.persona.dni='" + persona.getDni() + "'");
            if (!listaPersonanatural.isEmpty()) {
                return 2;
            } else {
                return clienteDao.updateClienteNatural(persona, pn, c, cony);
            }
        } else {
            return clienteDao.saveClienteNatural(p, pn, c, cony);
        }
    }

    @Override
    public int eliminarClientenatural(Personanatural pn) {
        return clienteDao.deleteClientenatural(pn);
    }

    @Override
    public int crearClienteJuridico(Personajuridica pj, Cliente c, List<Representantelegal> listaRepresentantelegal) {
        List<Representantelegal> listaRepresentantes = new ArrayList<>();
        int secuencia;
        try {
            secuencia = Integer.parseInt(representantelegalDao.consultUnique("select max(id) from Representantelegal").toString());
        } catch (Exception e) {
            secuencia = 0;
        }

        for (Representantelegal rl : listaRepresentantelegal) {
            Persona p = rl.getPersona();
            Persona aux = (Persona) personaDao.consultUnique("from Persona p where p.dni='" + p.getDni() + "'");

            if (aux == null) {
                personaDao.save(p);
                //AGREGA REPRESENTANTES
                rl.setPersona(p);
                rl.setCodigo("RL-00" + (secuencia + 1));
                rl.setFechaCreacion(new Date());
                listaRepresentantes.add(rl);
            } else {
                rl.setPersona(aux);
                rl.setCodigo("RL-00" + (secuencia + 1));
                rl.setFechaCreacion(new Date());
                listaRepresentantes.add(rl);
            }
            secuencia++;
        }

        if (listaRepresentantes.isEmpty()) {
            return 0;
        } else {
            return clienteDao.saveClienteJuridico(pj, c, listaRepresentantes);
        }
    }

    @Override
    public int eliminarClientejuridico(Personajuridica pj) {
        List<Representantelegal> listaRepresentantelegal = representantelegalDao.consultList("from Representantelegal rl where rl.personajuridica.id=" + pj.getId());
        return clienteDao.deleteClientejuridico(pj, listaRepresentantelegal);
    }

    @Override
    public int modificarClienteNatural(Personanatural pn) {
        Personanatural pn2 = (Personanatural) personanaturalDao.consultUnique("select pn from Personanatural pn join pn.persona p where p.dni='" + pn.getPersona().getDni() + "'");
        if (pn2 == null) {
            pn2 = personanaturalDao.read(pn.getId());
            //SETEO DE PERSONA NATURAL
            pn.setId(pn2.getId());
            pn.setRecibo(pn2.getRecibo());
            pn.setEstado(pn2.isEstado());
            pn.setCliente(pn2.getCliente());

            //SETEAMOS DATOS
            Persona p = pn2.getPersona();
            p.setDni(pn.getPersona().getDni());
            p.setNombre(pn.getPersona().getNombre());
            p.setApellidoPat(pn.getPersona().getApellidoPat());
            p.setApellidoMat(pn.getPersona().getApellidoMat());
            p.setDireccion(pn.getPersona().getDireccion());
            p.setDistrito(pn.getPersona().getDistrito());
            p.setProvincia(pn.getPersona().getProvincia());
            p.setDepartamento(pn.getPersona().getDepartamento());
            p.setPais(pn.getPersona().getPais());
            p.setCelular(pn.getPersona().getCelular());
            p.setEmail(pn.getPersona().getEmail());
            p.setRuc(pn.getPersona().getRuc());
            p.setEstadocivil(pn.getPersona().getEstadocivil());
            p.setFechaNacimiento(pn.getPersona().getFechaNacimiento());//AQUI
            p.setGenero(pn.getPersona().getGenero());//AQUI
            p.setNacionalidad(pn.getPersona().getNacionalidad());
            p.setProfesion(pn.getPersona().getProfesion());

            if (pn.getPersona().getConyugue() == null) {
                return personaDao.update(p);
            } else {
                if (pn2.getPersona().getConyugue() == null) {
                    Conyugue c = pn.getPersona().getConyugue();
                    return clienteDao.updateClienteNaturalNewConyugue(p, c);
                } else {
                    Conyugue c = pn2.getPersona().getConyugue();

                    c.setDni(pn.getPersona().getConyugue().getDni());
                    c.setNombre(pn.getPersona().getConyugue().getNombre());
                    c.setApellidoPat(pn.getPersona().getConyugue().getApellidoPat());
                    c.setApellidoMat(pn.getPersona().getConyugue().getApellidoMat());
                    c.setNumeroHijos(pn.getPersona().getConyugue().getNumeroHijos());
                    c.setNumeroDependientes(pn.getPersona().getConyugue().getNumeroDependientes());
                    c.setProfesion(pn.getPersona().getConyugue().getProfesion());

                    return clienteDao.updateClienteNaturalExistConyugue(p, c);
                }
            }
        } else {
            //SETEO DE PERSONA NATURAL
            pn.setId(pn2.getId());
            pn.setRecibo(pn2.getRecibo());
            pn.setEstado(pn2.isEstado());
            pn.setCliente(pn2.getCliente());

            if (pn2.getPersona().getDni().equals(pn.getPersona().getDni())) {
                //SETEAMOS DATOS
                Persona p = pn2.getPersona();
                p.setDni(pn.getPersona().getDni());
                p.setNombre(pn.getPersona().getNombre());
                p.setApellidoPat(pn.getPersona().getApellidoPat());
                p.setApellidoMat(pn.getPersona().getApellidoMat());
                p.setDireccion(pn.getPersona().getDireccion());
                p.setDistrito(pn.getPersona().getDistrito());
                p.setProvincia(pn.getPersona().getProvincia());
                p.setDepartamento(pn.getPersona().getDepartamento());
                p.setPais(pn.getPersona().getPais());
                p.setCelular(pn.getPersona().getCelular());
                p.setEmail(pn.getPersona().getEmail());
                p.setRuc(pn.getPersona().getRuc());
                p.setEstadocivil(pn.getPersona().getEstadocivil());//AQUI
                p.setFechaNacimiento(pn.getPersona().getFechaNacimiento());
                p.setGenero(pn.getPersona().getGenero());//AQUI
                p.setNacionalidad(pn.getPersona().getNacionalidad());
                p.setProfesion(pn.getPersona().getProfesion());

                if (pn.getPersona().getConyugue() == null) {
                    return personaDao.update(p);
                } else {
                    if (pn2.getPersona().getConyugue() == null) {
                        Conyugue c = pn.getPersona().getConyugue();
                        return clienteDao.updateClienteNaturalNewConyugue(p, c);
                    } else {
                        Conyugue c = pn2.getPersona().getConyugue();

                        c.setDni(pn.getPersona().getConyugue().getDni());
                        c.setNombre(pn.getPersona().getConyugue().getNombre());
                        c.setApellidoPat(pn.getPersona().getConyugue().getApellidoPat());
                        c.setApellidoMat(pn.getPersona().getConyugue().getApellidoMat());
                        c.setNumeroHijos(pn.getPersona().getConyugue().getNumeroHijos());
                        c.setNumeroDependientes(pn.getPersona().getConyugue().getNumeroDependientes());
                        c.setProfesion(pn.getPersona().getConyugue().getProfesion());

                        return clienteDao.updateClienteNaturalExistConyugue(p, c);
                    }
                }
            } else {
                return 2;
            }
        }
    }
}
