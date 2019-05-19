/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.AgenciaDao;
import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.entity.Tipoempleado;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.util.HashUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class AgenciaDaoImpl extends GenericDaoImpl<Agencia> implements AgenciaDao {

    @Override
    public int saveInitValues(Agencia agencia, Persona persona, String cargo, String usuario, String contrasena, List<Rol> listaRol) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.save(agencia);
            sesion.save(persona);

            Tipoempleado te = new Tipoempleado();
            te.setId(3);

            Empleado empleado = new Empleado(agencia, persona, te, new Date());
            sesion.save(empleado);

            Usuario user = new Usuario(empleado, usuario, HashUtil.getStringMessageDigest(contrasena, HashUtil.SHA1), true);
            sesion.save(user);

            for (Rol rol : listaRol) {
                Permiso permiso = new Permiso(rol, user);
                sesion.save(permiso);
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
}
