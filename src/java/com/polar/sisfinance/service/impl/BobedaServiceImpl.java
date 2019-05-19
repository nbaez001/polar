/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.BobedaDao;
import com.polar.sisfinance.dao.CuentacreditoDao;
import com.polar.sisfinance.dao.DesembolsoDao;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Estadocredito;
import com.polar.sisfinance.entity.Estadodesembolso;
import com.polar.sisfinance.service.BobedaService;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Micha
 */
@Service
public class BobedaServiceImpl extends GenericServiceImpl<Bobeda> implements BobedaService {

    @Autowired
    BobedaDao bobedaDao;
    @Autowired
    CuentacreditoDao cuentacreditoDao;
    @Autowired
    DesembolsoDao desembolsoDao;

    @Override
    public boolean isBefore(Date fechaDB, Date fechaActual) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String cadenaFechaDB = format.format(fechaDB);
        String cadenaFechaActual = format.format(fechaActual);

        try {
            Date auxFechaDB = format.parse(cadenaFechaDB);
            Date auxFechaActual = format.parse(cadenaFechaActual);

            return auxFechaDB.before(auxFechaActual);
        } catch (ParseException ex) {
            Logger.getLogger(BobedaServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    @Override
    public boolean isEquals(Date fechaDB, Date fechaActual) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String cadenaFechaDB = format.format(fechaDB);
        String cadenaFechaActual = format.format(fechaActual);

        try {
            Date auxFechaDB = format.parse(cadenaFechaDB);
            Date auxFechaActual = format.parse(cadenaFechaActual);

            return auxFechaDB.equals(auxFechaActual);
        } catch (ParseException ex) {
            Logger.getLogger(BobedaServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    @Override
    public boolean isAfter(Date fechaDB, Date fechaActual) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String cadenaFechaDB = format.format(fechaDB);
        String cadenaFechaActual = format.format(fechaActual);

        try {
            Date auxFechaDB = format.parse(cadenaFechaDB);
            Date auxFechaActual = format.parse(cadenaFechaActual);

            return auxFechaDB.after(auxFechaActual);
        } catch (ParseException ex) {
            Logger.getLogger(BobedaServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    @Override
    public Bobeda lastBobeda() {
        return (Bobeda) bobedaDao.consultUnique("from Bobeda b where b.fechaApertura=(select max(fechaApertura) from Bobeda)");
    }

    @Override
    public List<Bobeda> listarUltimosBobeda() {
        List<String> orderDescParam = new ArrayList<>();
        orderDescParam.add("fechaApertura");

        return bobedaDao.CriteriaList(null, orderDescParam, null, null, 10);
    }

    @Override
    public int abrirBobeda(Bobeda b, List<Detallesaldobobeda> listaDsbApertura, List<Detallesaldobobeda> listaDsbCierre) {
        List<Cuentacredito> listaCuentacredito = cuentacreditoDao.consultList("from Cuentacredito cc where cc.estadocredito.id=6");
        //FORMATEO DE MONTO
        DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
        simbolo.setDecimalSeparator('.');
        DecimalFormat formateador = new DecimalFormat("####.#", simbolo);

        Estadodesembolso estadodesembolso = new Estadodesembolso();
        estadodesembolso.setId(2);

        for (Cuentacredito cc : listaCuentacredito) {
            List<Desembolso> listaDesembolso = desembolsoDao.consultList("select d from Desembolso d join d.cuentacredito cc where cc.id=" + cc.getId() + " and d.estadodesembolso.id<3");
            if (listaDesembolso.isEmpty()) {
                cc.setEstadocredito(new Estadocredito(7));
                cuentacreditoDao.update(cc);
            } else {
                for (Desembolso des : listaDesembolso) {
                    Date fecha = des.getFechaVence();
                    if (isBefore(fecha, new Date())) {
                        if (des.getCuotac() > 0) {
                            if (des.getFechaPago() != null) {
                                int diasA = cantidadDias(fecha, des.getFechaPago());
                                int dias = cantidadDias(des.getFechaPago(), new Date());
                                if ((dias + diasA) > des.getCuentacredito().getPlazoPagoCuotas()) {
                                    Double mora = Double.parseDouble(formateador.format(calcularMora(dias, des.getCuotac(), des.getCuentacredito().getTasaInteresmora())));
                                    des.setMora(des.getMora() + mora);
                                    des.setEstadodesembolso(estadodesembolso);
                                    des.setDiasAtraso(dias + diasA);
                                    desembolsoDao.update(des);
                                }
                            } else {
                                int dias = cantidadDias(fecha, new Date());
                                if (dias > des.getCuentacredito().getPlazoPagoCuotas()) {
                                    Double mora = Double.parseDouble(formateador.format(calcularMora(dias, des.getCuota(), des.getCuentacredito().getProductocredito().getTem())));
                                    des.setMora(mora);
                                    des.setEstadodesembolso(estadodesembolso);
                                    des.setDiasAtraso(dias);
                                    desembolsoDao.update(des);
                                }
                            }
                        } else {
                            if (des.getMora() > 0) {
                                des.setEstadodesembolso(estadodesembolso);
                                desembolsoDao.update(des);
                            } else {
                                des.setEstadodesembolso(new Estadodesembolso(3));
                                desembolsoDao.update(des);
                            }
                        }
                    }
                }
            }
        }
        return bobedaDao.abrirBobeda(b, listaDsbApertura, listaDsbCierre);
    }

    private int cantidadDias(Date fechaInicio, Date fechaFin) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            String fechaInicioAux = format.format(fechaInicio);
            String fechaFinAux = format.format(fechaFin);

            fechaInicio = format.parse(fechaInicioAux);
            fechaFin = format.parse(fechaFinAux);

            Calendar fInicio = Calendar.getInstance();
            fInicio.setTime(fechaInicio);

            Calendar fFin = Calendar.getInstance();
            fFin.setTime(fechaFin);

            int c = 0;
            while (fInicio.before(fFin)) {
                fInicio.add(Calendar.DATE, 1);
                c++;
            }
            return c;
        } catch (Exception e) {
            return 0;
        }
    }

    private double calcularMora(int dias, double monto, double tasa) {
        DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
        simbolo.setDecimalSeparator('.');
        DecimalFormat formateador = new DecimalFormat("####.#", simbolo);

        return Double.parseDouble(formateador.format(monto * dias * (tasa / 100)));
    }
}
