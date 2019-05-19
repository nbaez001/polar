/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.entity.news;

import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personanatural;

/**
 *
 * @author nerio
 */
public class Data {

    private Persona persona;
    private Personanatural personanatural;
    private Cliente cliente;

    public Data() {
    }

    public Data(Persona persona, Personanatural personanatural, Cliente cliente) {
        this.persona = persona;
        this.personanatural = personanatural;
        this.cliente = cliente;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Personanatural getPersonanatural() {
        return personanatural;
    }

    public void setPersonanatural(Personanatural personanatural) {
        this.personanatural = personanatural;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
