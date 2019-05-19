/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personanatural;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public interface PersonanaturalService extends GenericService<Personanatural> {

    public List<Persona> buscarClientenatural(Map esParams);

    public int obtenerNumeroClientenatural();

    public Personanatural obtenerPorCodigoCliente(int idCliente);

    public Personanatural obtenerPorIdPersona(int idPersona);

    public Persona obtenerPorCodigoCliente(Cliente c);

    public List<Personanatural> buscarClientenaturalPorDni(Integer dni);

    public List<Personanatural> buscarClientenaturalPorDni2(Integer dni);

    public List<Personanatural> buscarClientenaturalPorNombre(String nombre, String apellidoPat, String apellidoMat);
}
