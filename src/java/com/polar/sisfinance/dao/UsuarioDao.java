/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Usuario;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface UsuarioDao extends GenericDao<Usuario>{

    int crearUsuarioPersonaNueva(Persona p, Empleado e, Usuario u, List<Permiso> lpe);
    
    int crearUsuarioPersonaExistente(Persona p, Empleado e, Usuario u, List<Permiso> lpe);
    
    int modificarUsuario(Persona p, Empleado e, Usuario u, List<Permiso> lpe, List<Permiso> lpa);
    
    int eliminarUsuario(Persona p, Empleado em, Usuario u, List<Permiso> lp);
}
