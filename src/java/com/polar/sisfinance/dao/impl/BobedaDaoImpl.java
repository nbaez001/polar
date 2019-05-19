/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.BobedaDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Micha
 */
@Repository
public class BobedaDaoImpl extends GenericDaoImpl<Bobeda> implements BobedaDao {

    @Override
    public int abrirBobeda(Bobeda b, List<Detallesaldobobeda> dsApertura, List<Detallesaldobobeda> dsCierre) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.save(b);

            for (Detallesaldobobeda ds : dsApertura) {
                ds.setBobeda(b);
                sesion.save(ds);
            }

            for (Detallesaldobobeda ds : dsCierre) {
                ds.setBobeda(b);
                sesion.save(ds);
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
