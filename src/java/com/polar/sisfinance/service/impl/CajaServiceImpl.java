/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.BobedaDao;
import com.polar.sisfinance.dao.CajaDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Caja;
import com.polar.sisfinance.service.CajaService;
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
public class CajaServiceImpl extends GenericServiceImpl<Caja> implements CajaService {

    @Autowired
    CajaDao cajaDao;
    @Autowired
    BobedaDao bobedaDao;

    @Override
    public List<Caja> listarDisponibles() {
        Bobeda b = (Bobeda) bobedaDao.consultUnique("from Bobeda b where b.fechaApertura=(select max(fechaApertura) from Bobeda)");
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

        List<Caja> listaTomadas = cajaDao.consultList("select c from Cajero cj join cj.caja c where cj.fechaApertura>'" + formater.format(b.getFechaApertura()) + "' group by c");
        List<Caja> list = cajaDao.findAll();

        for (Caja c : listaTomadas) {
            for (int i = 0; i < list.size(); i++) {
                Caja c2 = list.get(i);
                if (Objects.equals(c.getId(), c2.getId())) {
                    list.remove(c2);
                }
            }
        }
        return list;
    }
}
