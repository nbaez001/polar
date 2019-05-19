/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.entity.Usuario;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface UsuarioService extends GenericService<Usuario>{

    Usuario obtenerPorId(String usuario, String contrasena);

    List<Usuario> listarCajeros();

    Usuario existeUsuarioParaPersona(Integer dni);

    int crearUsuario(List<Permiso> lp);

    int modificarUsuario(List<Permiso> lp);
    
    int eliminarUsuario(Usuario u);

    List<Usuario> listarDisponibles();
}
