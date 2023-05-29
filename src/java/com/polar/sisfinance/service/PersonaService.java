/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Persona;

/**
 *
 * @author nerio
 */
public interface PersonaService extends GenericService<Persona>{
    
    public Persona existe(Persona p);
    
    public Persona get(String dni);
}
