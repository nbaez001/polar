/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.TransferenciaDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Transferencia;
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
public class TransferenciaDaoImpl extends GenericDaoImpl<Transferencia> implements TransferenciaDao {

    @Override
    public int transferirCajero(Bobeda b, Cajero c, List<Detallesaldobobeda> listaDsbCierre, List<Detallesaldocajero> listaDscCierre, List<Detallesaldotransferencia> listaDstr, Transferencia tr) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.update(b);

            for (Detallesaldobobeda dsb : listaDsbCierre) {
                sesion.update(dsb);
            }

            sesion.update(c);

            for (Detallesaldocajero dsc : listaDscCierre) {
                if (dsc.getId() == null) {
                    sesion.save(dsc);
                } else {
                    sesion.update(dsc);
                }

            }

            tr.setBobeda(b);
            tr.setCajeroByIdCajero1(c);
            tr.setFecha(new Date());

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
}
