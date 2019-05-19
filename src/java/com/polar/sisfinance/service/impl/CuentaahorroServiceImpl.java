/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.AporteDao;
import com.polar.sisfinance.dao.CuentaahorroDao;
import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.entity.Estadocuentaahorro;
import com.polar.sisfinance.service.CuentaahorroService;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class CuentaahorroServiceImpl extends GenericServiceImpl<Cuentaahorro> implements CuentaahorroService {

    @Autowired
    CuentaahorroDao cuentaahorroDao;
    @Autowired
    AporteDao aporteDao;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat formateador;
    DecimalFormat formateador4;

    public CuentaahorroServiceImpl() {
        simbolo.setDecimalSeparator('.');
        formateador = new DecimalFormat("####.#", simbolo);
        formateador4 = new DecimalFormat("####.####", simbolo);
    }

    @Override
    public int obtenerNumeroCuentaahorro() {
        try {
            return (int) cuentaahorroDao.consultUnique("select max(id) from Cuentaahorro");
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            return 0;
        }
    }

    @Override
    public List<String> ListarInteres(Cuentaahorro ca) {
        List<String> listaInteres = new ArrayList<>();

        int dias = ca.getPeriodo();
        double tea = ca.getTea();
        double monto = ca.getImporte();
        Calendar fechaFin = Calendar.getInstance();
        fechaFin.setTime(ca.getFechaApertura());
        fechaFin.add(Calendar.DATE, 1);

        int meses;
        //CALCULO DE DIAS RESTANTES
        int diasFaltantes = 0;
        if ((dias % 30) != 0) {
            diasFaltantes = dias % 30;
        }
        meses = dias / 30;

        //CALCULO
        double montoActual = monto;
        double factorMensual = Math.pow((1.0 + (tea / 100.0)), (30.0 / 360.0)) - 1.0;
        double interes = 0;

        if (diasFaltantes == 0) {
            int c = 0;
            while (c < meses) {
                montoActual += interes;
                interes = montoActual * factorMensual;

                fechaFin.add(Calendar.DATE, 30);

                String cadena = "{\"numero\":\"" + (c + 1) + "\",\"fecha\":\"" + format.format(fechaFin.getTime()) + "\",\"factor\":\"" + formateador4.format(factorMensual) + "\",\"monto\":\"" + formateador.format(montoActual) + "\",\"interes\":\"" + formateador.format(interes) + "\"}";

                listaInteres.add(cadena);
                c++;
            }
        } else {
            int c = 0;
            while (c <= meses) {
                if (c < meses) {
                    montoActual += interes;
                    interes = montoActual * factorMensual;

                    fechaFin.add(Calendar.DATE, 30);

                    String cadena = "{\"numero\":\"" + (c + 1) + "\",\"fecha\":\"" + format.format(fechaFin.getTime()) + "\",\"factor\":\"" + formateador4.format(factorMensual) + "\",\"monto\":\"" + formateador.format(montoActual) + "\",\"interes\":\"" + formateador.format(interes) + "\"}";

                    listaInteres.add(cadena);
                    c++;
                } else {
                    factorMensual = (Math.pow(1.0 + (tea / 100.0), diasFaltantes / 360.0) - 1.0);

                    montoActual += interes;
                    interes = montoActual * factorMensual;

                    fechaFin.add(Calendar.DATE, diasFaltantes);

                    String cadena = "{\"numero\":\"" + (c + 1) + "\",\"fecha\":\"" + format.format(fechaFin.getTime()) + "\",\"factor\":\"" + formateador4.format(factorMensual) + "\",\"monto\":\"" + formateador.format(montoActual) + "\",\"interes\":\"" + formateador.format(interes) + "\"}";

                    listaInteres.add(cadena);
                    c++;
                }
            }
        }

        return listaInteres;
    }

    @Override
    public int registrarcuentaahorropf(Cuentaahorro ca) {
        Calendar fecha = Calendar.getInstance();
        fecha.setTime(ca.getFechaApertura());
        fecha.add(Calendar.DATE, 1);

        ca.setCodigo("CA-00" + (obtenerNumeroCuentaahorro() + 1));
        ca.setInteresProyectado(ca.getImporte() * (Math.pow(1.0 + (ca.getTea() / 100.0), ca.getPeriodo() / 360.0) - 1.0));
        ca.setEstadocuentaahorro(new Estadocuentaahorro(1));
        ca.setFechaApertura(fecha.getTime());

        fecha.add(Calendar.DATE, 360);

        ca.setFechaCierre(fecha.getTime());
        ca.setCapitalActual(ca.getImporte());

        return cuentaahorroDao.save(ca);
    }

    @Override
    public int registrarcuentaahorroah(Cuentaahorro ca) {
        Calendar fecha = Calendar.getInstance();
        fecha.setTime(ca.getFechaApertura());
        fecha.add(Calendar.DATE, 1);

        ca.setCodigo("CA-00" + (obtenerNumeroCuentaahorro() + 1));
        ca.setEstadocuentaahorro(new Estadocuentaahorro(1));
        ca.setFechaApertura(fecha.getTime());

        fecha.add(Calendar.DATE, 360);

        ca.setFechaCierre(fecha.getTime());
        ca.setCapitalActual(0.00);

        return cuentaahorroDao.save(ca);
    }

    @Override
    public List<Cuentaahorro> listarCuentaahorros(Cliente c) {
        return cuentaahorroDao.consultList("from Cuentaahorro ca where ca.cliente.id=" + c.getId());
    }

    @Override
    public List<Cuentaahorro> listarCPF(Cliente c) {
        return cuentaahorroDao.consultList("from Cuentaahorro ca where ca.cliente.id=" + c.getId() + " and ca.productoahorro.tipoahorro.id=1 and ca.estadocuentaahorro.id=1");
    }

    @Override
    public List<Aporte> listarCAH(Cliente c) {
        List<Aporte> la = new ArrayList<>();

        List<Cuentaahorro> lah = cuentaahorroDao.consultList("from Cuentaahorro ca where ca.cliente.id=" + c.getId() + " and ca.productoahorro.tipoahorro.id=2 and ca.estadocuentaahorro.id<3");
        for (Cuentaahorro ca : lah) {
            if (ca.getEstadocuentaahorro().getId() == 1) {
                la.add(new Aporte(ca, ca.getImporte(), ca.getFechaApertura()));
            } else {
                Date fecha = (Date) aporteDao.consultUnique("select max(a.fecha) from Aporte a where a.cuentaahorro.id=" + ca.getId());
                la = cantidadCuotasfaltantes(ca, fecha);
            }
        }
        return la;
    }

    public List<Aporte> cantidadCuotasfaltantes(Cuentaahorro ca, Date ultimo) {
        List<Aporte> la = new ArrayList<>();

        Calendar cUltimo = Calendar.getInstance();
        cUltimo.setTime(ultimo);

        Calendar cHoy = Calendar.getInstance();
        cHoy.setTime(new Date());

        switch (ca.getFrecuenciaaporte().getDias()) {
            case 1:
                cUltimo.add(Calendar.DATE, 1);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 7:
                cUltimo.add(Calendar.DATE, 7);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 15:
                cUltimo.add(Calendar.DATE, 15);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 30:
                cUltimo.add(Calendar.MONTH, 1);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 90:
                cUltimo.add(Calendar.MONTH, 3);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 120:
                cUltimo.add(Calendar.MONTH, 4);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 180:
                cUltimo.add(Calendar.MONTH, 6);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            case 360:
                cUltimo.add(Calendar.YEAR, 1);
                while (cUltimo.before(cHoy)) {
                    la.add(new Aporte(ca, ca.getImporte(), cUltimo.getTime()));
                }
                break;
            default:
                break;

        }
        return la;

    }

}
