/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.CuentacreditoDao;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Garante;
import com.polar.sisfinance.entity.Registrocuentacredito;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class CuentacreditoDaoImpl extends GenericDaoImpl<Cuentacredito> implements CuentacreditoDao {

    @Override
    public int saveCuentacredito(Cuentacredito x, List<Desembolso> listaDesembolso, List<Garante> listaGarante) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.save(x);

            for (Desembolso d : listaDesembolso) {
                d.setCuentacredito(x);
                sesion.save(d);
            }

            for (Garante g : listaGarante) {
                g.setCuentacredito(x);
                sesion.save(g);
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
    public int deleteCuentacredito(Cuentacredito x, List<Desembolso> listaDesembolso, Registrocuentacredito rcc) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            if (rcc != null) {
                sesion.delete(rcc);
            }

            for (Desembolso d : listaDesembolso) {
                sesion.delete(d);
            }
            sesion.delete(x);

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
