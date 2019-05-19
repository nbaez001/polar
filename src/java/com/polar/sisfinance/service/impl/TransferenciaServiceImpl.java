/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.TransferenciaDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Transferencia;
import com.polar.sisfinance.service.TransferenciaService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TransferenciaServiceImpl extends GenericServiceImpl<Transferencia> implements TransferenciaService {

    @Autowired
    TransferenciaDao transferenciaDao;

    @Override
    public List<Transferencia> listaTransferenciascajaHoy() {
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");

        return transferenciaDao.consultList("select tr from Transferencia tr where tr.fecha>'" + formateador.format(new Date()) + "' and tr.tipotransferencia.id=1");
    }

    @Override
    public List<Transferencia> listaTransferencias(Date fecha) {
        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");

        return transferenciaDao.consultList("select tr from Transferencia tr where tr.fecha>'" + formateador.format(fecha) + "'");
    }

    @Override
    public int transferirCajero(Bobeda b, Cajero c, List<Detallesaldobobeda> listaDsbCierre, List<Detallesaldocajero> listaDscCierre, List<Detallesaldotransferencia> listaDstr, Transferencia tr) {
        return transferenciaDao.transferirCajero(b, c, listaDsbCierre, listaDscCierre, listaDstr, tr);
    }

    @Override
    public Transferencia obtenerTransferenciaCierreDeCaja(int idCajero) {
        return (Transferencia) transferenciaDao.consultUnique("from Transferencia tr where tr.cajeroByIdCajero1.id=" + idCajero + " and tr.tipotransferencia.id=4");
    }
}
