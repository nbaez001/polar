/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.ComprobanteDao;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Detallecomprobante;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class ComprobanteDaoImpl extends GenericDaoImpl<Comprobante> implements ComprobanteDao {

    @Override
    public int saveComprobante(Comprobante comprobante, List<Detallecomprobante> listaComprobante) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.save(comprobante);

            for (Detallecomprobante dc : listaComprobante) {
                dc.setComprobante(comprobante);
                sesion.save(dc);
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
    public int deleteComprobante(Comprobante comprobante, List<Detallecomprobante> listaDetallecomprobante) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            for (Detallecomprobante dc : listaDetallecomprobante) {
                sesion.delete(dc);
            }

            sesion.delete(comprobante);
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
