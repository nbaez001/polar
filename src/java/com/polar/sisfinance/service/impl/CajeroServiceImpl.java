/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.CajeroDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Transferencia;
import com.polar.sisfinance.service.CajeroService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class CajeroServiceImpl extends GenericServiceImpl<Cajero> implements CajeroService {

    @Autowired
    CajeroDao cajeroDao;

    @Override
    public List<Cajero> cajerosHoy() {
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");

        return cajeroDao.consultList("select c from Cajero c where c.fechaApertura>'" + formateador.format(new Date()) + "'");
    }

    @Override
    public List<Cajero> listaActivos() {
        return cajeroDao.consultList("from Cajero c where c.idEstado=10 or c.idEstado=11");
    }

    @Override
    public int abrirCajeroConMeresa(Bobeda b, List<Detallesaldobobeda> listaDsbCierre, Transferencia tr, List<Detallesaldotransferencia> listaDstr, Cajero c, List<Detallesaldocajero> listaDscApertura, List<Detallesaldocajero> listaDscCierre) {
        return cajeroDao.abrirCajeroConMeresa(b, listaDsbCierre, tr, listaDstr, c, listaDscApertura, listaDscCierre);
    }

    @Override
    public int cerrarCajero(Bobeda bobeda, List<Detallesaldobobeda> listaDsb, List<Detallesaldobobeda> listaDsbNueva, Cajero cajero, Transferencia tr, List<Detallesaldotransferencia> listaDst, HttpSession Httpsesion) {
        return cajeroDao.cerrarCajero(bobeda, listaDsb, listaDsbNueva, cajero, tr, listaDst, Httpsesion);
    }

    @Override
    public List<Cajero> listarCajeros(Date fecha) {
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");

        return cajeroDao.consultList("select c from Cajero c where c.fechaApertura>'" + formateador.format(fecha) + "'");
    }

    @Override
    public List<Cajero> listarCajerosabiertos(Date fecha) {
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");

        return cajeroDao.consultList("select c from Cajero c where c.fechaApertura>'" + formateador.format(fecha) + "' and c.cerrado=false");
    }

    @Override
    public int reaperturarCajero(Cajero cajero, Transferencia transferencia) {
        return cajeroDao.reaperturarCajero(cajero, transferencia);
    }
}
