/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Personajuridica;
import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 */
public interface PersonajuridicaService extends GenericService<Personajuridica>{
    
    public List<Personajuridica> buscarClientejuridico(Map likeParams);
    
    public Personajuridica obtenerPorCodigoCliente(int idCliente);
    
    public int obtenerNumeroClientejuridico();
    
    public Personajuridica existe(String ruc);
    
    public List<Personajuridica> buscarClientejuridicoPorRuc(String ruc);

    public List<Personajuridica> buscarClientejuridicoPorNombre(String razonSocial, String nombreComercial);
}
