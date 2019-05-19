/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.TransaccionDao;
import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Operacion;
import com.polar.sisfinance.entity.Transaccion;
import java.util.Date;
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
public class TransaccionDaoImpl extends GenericDaoImpl<Transaccion> implements TransaccionDao {

    @Override
    public int desembolsoCuentacredito(Cuentacredito cc, Transaccion tr, Operacion op, Cajero c, HttpSession Httpsesion) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(cc);

            sesion.save(tr);

            op.setTransaccion(tr);
            sesion.save(op);

            sesion.update(c);
            Httpsesion.setAttribute("cajero", c);

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
    public int pagoCuotacuentacredito(List<Desembolso> listaDesembolso, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession Httpsesion) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            for (Desembolso d : listaDesembolso) {
                d.setFechaPago(new Date());
                sesion.update(d);
            }

            sesion.save(tr);

            for (Operacion op : listaOperacion) {
                op.setTransaccion(tr);
                sesion.save(op);
            }

            sesion.update(c);
            Httpsesion.setAttribute("cajero", c);

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
    public int transaccionComprobante(Comprobante comprobante, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession Httpsesion) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(comprobante);

            sesion.save(tr);

            for (Operacion op : listaOperacion) {
                op.setTransaccion(tr);
                sesion.save(op);
            }

            sesion.update(c);
            Httpsesion.setAttribute("cajero", c);

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
    public int aperturarAH(Cuentaahorro ca, Aporte a, Transaccion tr, Operacion o, Cajero c, HttpSession session) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(ca);

            sesion.save(a);
            sesion.save(tr);

            o.setTransaccion(tr);
            sesion.save(o);

            sesion.update(c);

            tx.commit();

            session.setAttribute("cajero", c);

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
    public int cobrarAH(Cuentaahorro ca, Aporte a, Transaccion tr, Operacion o, Cajero c, HttpSession session) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(ca);

            sesion.save(a);
            sesion.save(tr);

            o.setTransaccion(tr);
            sesion.save(o);

            sesion.update(c);

            tx.commit();

            session.setAttribute("cajero", c);

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
    public int aperturarPF(Cuentaahorro ca, Transaccion tr, Operacion o, Cajero c, HttpSession session) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(ca);

            sesion.save(tr);

            o.setTransaccion(tr);
            sesion.save(o);

            sesion.update(c);

            tx.commit();

            session.setAttribute("cajero", c);

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
