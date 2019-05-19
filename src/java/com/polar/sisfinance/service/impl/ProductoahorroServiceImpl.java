/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.ProductoahorroDao;
import com.polar.sisfinance.entity.Productoahorro;
import com.polar.sisfinance.service.ProductoahorroService;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ProductoahorroServiceImpl extends GenericServiceImpl<Productoahorro> implements ProductoahorroService {

    @Autowired
    ProductoahorroDao productoahorroDao;

    @Override
    public List<Productoahorro> reverseList() {
        return productoahorroDao.consultList("from Productoahorro pa order by pa.id desc");
    }

    @Override
    public List<Productoahorro> listarSimilar(Productoahorro p) {
        return productoahorroDao.consultList("from Productoahorro pa where pa.tipomoneda.id=" + p.getTipomoneda().getId() + " and pa.nombre like '%" + p.getNombre() + "%'");
    }

    @Override
    public int guardarProductoahorro(Productoahorro x) {
        Calendar calendar = Calendar.getInstance();

        calendar.setTime(x.getInicioFechaVigencia());
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        x.setInicioFechaVigencia(calendar.getTime());

        calendar.setTime(x.getFinFechaVigencia());
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        x.setFinFechaVigencia(calendar.getTime());

        int seq;
        try {
            seq = Integer.parseInt(productoahorroDao.consultUnique("select max(id) from Productoahorro").toString());
        } catch (Exception e) {
            seq = 0;
        }

        x.setCodigo("PA-00" + (seq + 1));

        return productoahorroDao.save(x);
    }
}
