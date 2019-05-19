/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.PermisoDao;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.PermisoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class PermisoServiceImpl extends GenericServiceImpl<Permiso> implements PermisoService {

    @Autowired
    PermisoDao permisoDao;

    @Override
    public List<Permiso> listarPorUsuario(Usuario u) {
        return permisoDao.consultList("from Permiso p where p.usuario.id=" + u.getId());
    }

}
