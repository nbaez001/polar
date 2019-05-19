/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Usuario;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface PermisoService extends GenericService<Permiso> {

    List<Permiso> listarPorUsuario(Usuario u);
}
