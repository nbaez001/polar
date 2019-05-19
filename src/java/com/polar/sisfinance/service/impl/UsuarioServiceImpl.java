/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.BobedaDao;
import com.polar.sisfinance.dao.TipoempleadoDao;
import com.polar.sisfinance.dao.UsuarioDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.PermisoService;
import com.polar.sisfinance.service.PersonaService;
import com.polar.sisfinance.service.TipoempleadoService;
import com.polar.sisfinance.service.UsuarioService;
import com.polar.sisfinance.util.HashUtil;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class UsuarioServiceImpl extends GenericServiceImpl<Usuario> implements UsuarioService {

    @Autowired
    UsuarioDao usuarioDao;
    @Autowired
    BobedaDao bobedaDao;
    @Autowired
    TipoempleadoDao tipoempleadoDao;

    @Autowired
    PermisoService permisoService;
    @Autowired
    TipoempleadoService tipoempleadoService;
    @Autowired
    PersonaService personaService;

    @Override
    public Usuario obtenerPorId(String usuario, String contrasena) {
        Object c = usuarioDao.consultUnique("select t from Usuario t where t.usuario='" + usuario + "' and t.contrasena= sha1('" + contrasena + "')");
        return (Usuario) c;
    }

    @Override
    public List<Usuario> listarCajeros() {
        List<Usuario> lista = usuarioDao.consultList("select u from Permiso p join p.usuario u where p.rol.id=7");
        return lista;
    }

    @Override
    public Usuario existeUsuarioParaPersona(Integer dni) {
        return (Usuario) usuarioDao.consultUnique("select u from Usuario u join u.empleado e join e.persona p where p.dni= " + dni + "");
    }

    @Override
    public int crearUsuario(List<Permiso> lp) {
        Usuario u = lp.get(0).getUsuario();
        if (u.getEmpleado().getTipoempleado().getId() == 1 && tipoempleadoService.existeGerente()) {
            return 2;
        } else {
            Empleado e = u.getEmpleado();
            Persona p = e.getPersona();

            //HASH DE CONTRASEÑA
            u.setContrasena(HashUtil.getStringMessageDigest(u.getContrasena(), HashUtil.SHA1));

            if (!personaService.existe(p)) {
                return usuarioDao.crearUsuarioPersonaNueva(p, e, u, lp);
            } else {
                return usuarioDao.crearUsuarioPersonaExistente(p, e, u, lp);
            }
        }
    }

    @Override
    public int modificarUsuario(List<Permiso> lp) {
        Usuario u = lp.get(0).getUsuario();
        if (u.getEmpleado().getTipoempleado().getId() == 1 && tipoempleadoService.existeGerente()) {
            return 2;
        } else {
            List<Permiso> lpa = permisoService.listarPorUsuario(u);
            Empleado e = u.getEmpleado();
            Persona p = e.getPersona();
            
            u.setContrasena(HashUtil.getStringMessageDigest(u.getContrasena(), HashUtil.SHA1));

            
            return usuarioDao.modificarUsuario(p, e, u, lp, lpa);
        }
    }

    @Override
    public List<Usuario> listarDisponibles() {
        Bobeda b = (Bobeda) bobedaDao.consultUnique("from Bobeda b where b.fechaApertura=(select max(fechaApertura) from Bobeda)");
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

        List<Usuario> listaTomadas = usuarioDao.consultList("select u from Cajero cj join cj.usuario u where cj.fechaApertura>'" + formater.format(b.getFechaApertura()) + "' group by u");
        List<Usuario> list = usuarioDao.consultList("select u from Permiso p join p.usuario u where p.rol.id=7");

        for (Usuario u : listaTomadas) {
            for (int i = 0; i < list.size(); i++) {
                Usuario u2 = list.get(i);
                if (Objects.equals(u2.getId(), u.getId())) {
                    list.remove(u2);
                }
            }
        }
        return list;
    }

    @Override
    public int eliminarUsuario(Usuario u) {
        List<Permiso> lpe = permisoService.listarPorUsuario(u);

        return usuarioDao.eliminarUsuario(u.getEmpleado().getPersona(), u.getEmpleado(), u, lpe);
    }
}
