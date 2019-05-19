/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.CajeroDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Transferencia;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class CajeroDaoImpl extends GenericDaoImpl<Cajero> implements CajeroDao {

    @Override
    public int abrirCajeroConMeresa(Bobeda b, List<Detallesaldobobeda> listaDsb, Transferencia tr, List<Detallesaldotransferencia> listaDstr, Cajero c, List<Detallesaldocajero> listaDscApertura, List<Detallesaldocajero> listaDscCierre) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(b);

            for (Detallesaldobobeda dsb : listaDsb) {
                sesion.update(dsb);
            }

            sesion.update(c);

            for (Detallesaldocajero dsc : listaDscApertura) {
                dsc.setCajero(c);
                sesion.save(dsc);
            }

            for (Detallesaldocajero dsc : listaDscCierre) {
                dsc.setCajero(c);
                sesion.save(dsc);
            }

            sesion.save(tr);

            for (Detallesaldotransferencia dst : listaDstr) {
                dst.setTransferencia(tr);
                sesion.save(dst);
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
    public int cerrarCajero(Bobeda bobeda, List<Detallesaldobobeda> listaDsb, List<Detallesaldobobeda> listaDsbNueva, Cajero cajero, Transferencia tr, List<Detallesaldotransferencia> listaDst, HttpSession Httpsesion) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(bobeda);

            for (Detallesaldobobeda dsb : listaDsb) {
                sesion.update(dsb);
            }

            for (Detallesaldobobeda dsb : listaDsbNueva) {
                dsb.setBobeda(bobeda);
                sesion.save(dsb);
            }

            sesion.update(cajero);

            sesion.save(tr);
            for (Detallesaldotransferencia dst : listaDst) {
                dst.setTransferencia(tr);
                sesion.save(dst);
            }

            Httpsesion.setAttribute("cajero", cajero);

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
    public int reaperturarCajero(Cajero cajero, Transferencia transferencia) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.clear();
            sesion.update(transferencia);
            sesion.update(cajero);
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
