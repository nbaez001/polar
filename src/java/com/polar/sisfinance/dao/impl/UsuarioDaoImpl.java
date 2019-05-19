/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.UsuarioDao;
import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.entity.Usuario;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class UsuarioDaoImpl extends GenericDaoImpl<Usuario> implements UsuarioDao {

    @Override
    public int crearUsuarioPersonaNueva(Persona p, Empleado em, Usuario u, List<Permiso> lpe) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.save(p);

            em.setPersona(p);
            sesion.save(em);

            u.setEmpleado(em);
            sesion.save(u);

            for (Permiso pe : lpe) {
                pe.setUsuario(u);
                sesion.save(pe);
            }

            tx.commit();

            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int crearUsuarioPersonaExistente(Persona p, Empleado em, Usuario u, List<Permiso> lpe) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(p);

            em.setPersona(p);
            sesion.save(em);

            u.setEmpleado(em);
            sesion.save(u);

            for (Permiso pe : lpe) {
                pe.setUsuario(u);
                sesion.save(pe);
            }

            tx.commit();

            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int modificarUsuario(Persona p, Empleado em, Usuario u, List<Permiso> lpe, List<Permiso> lpa) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(p);

            sesion.update(em);

            sesion.update(u);

            for (Permiso pa : lpa) {
                sesion.delete(pa);
            }

            for (Permiso pe : lpe) {
                sesion.save(pe);
            }

            tx.commit();

            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int eliminarUsuario(Persona p, Empleado em, Usuario u, List<Permiso> lpe) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            for (Permiso pe : lpe) {
                sesion.delete(pe);
            }

            sesion.delete(u);
            sesion.delete(em);
            sesion.delete(p);
            tx.commit();

            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }
}
