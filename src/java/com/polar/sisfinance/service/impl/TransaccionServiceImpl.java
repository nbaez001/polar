/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.dao.DesembolsoDao;
import com.polar.sisfinance.dao.OperacionDao;
import com.polar.sisfinance.dao.PersonajuridicaDao;
import com.polar.sisfinance.dao.PersonanaturalDao;
import com.polar.sisfinance.dao.TransaccionDao;
import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Estadocuentaahorro;
import com.polar.sisfinance.entity.Estadodesembolso;
import com.polar.sisfinance.entity.Operacion;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Tipotransaccion;
import com.polar.sisfinance.entity.Transaccion;
import com.polar.sisfinance.entity.news.Data3;
import com.polar.sisfinance.service.TransaccionService;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class TransaccionServiceImpl extends GenericServiceImpl<Transaccion> implements TransaccionService {

    @Autowired
    TransaccionDao transaccionDao;
    @Autowired
    PersonanaturalDao personanaturalDao;
    @Autowired
    PersonajuridicaDao personajuridicaDao;
    @Autowired
    OperacionDao operacionDao;
    @Autowired
    DesembolsoDao desembolsoDao;

    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat formatd;
    Gson gson;

    public TransaccionServiceImpl() {
        simbolo.setDecimalSeparator('.');
        formatd = new DecimalFormat("####.#", simbolo);
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @Override
    public int obtenerNumeroTransaccion() {
        try {
            return (int) transaccionDao.consultUnique("select max(id) from Transaccion");
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            return 1;
        }
    }

    @Override
    public int desembolsoCuentacredito(Cuentacredito cc, Transaccion tr, Operacion op, Cajero c, HttpSession sesion) {
        return transaccionDao.desembolsoCuentacredito(cc, tr, op, c, sesion);
    }

    @Override
    public List<String> listarTransacciones(int idCajero) {
        List<String> lstr = new ArrayList<>();
        List<Transaccion> lt = transaccionDao.consultList("from Transaccion tr where tr.cajero.id=" + idCajero);

        for (Transaccion tr : lt) {
            List<Operacion> lo = operacionDao.consultList("from Operacion o where o.transaccion.id=" + tr.getId());

            Double monto = 0.0;
            for (Operacion o : lo) {
                monto += o.getTotal();
            }

            String json = gson.toJson(tr);
            json = json.substring(0, json.length() - 2);

            json += "\",\"monto\":" + Double.parseDouble(formatd.format(monto)) + "}";

            lstr.add(json);
        }

        return lstr;
    }

    @Override
    public int pagoCuotacuentacredito(List<Desembolso> listaDesembolso, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession sesion) {
        return transaccionDao.pagoCuotacuentacredito(listaDesembolso, tr, listaOperacion, c, sesion);
    }

    @Override
    public int transaccionComprobante(Comprobante comprobante, Transaccion tr, List<Operacion> listaOperacion, Cajero c, HttpSession sesion) {
        return transaccionDao.transaccionComprobante(comprobante, tr, listaOperacion, c, sesion);
    }

    @Override
    public int aperturarAH(Aporte a, HttpSession sesion) {
        Cuentaahorro ca = a.getCuentaahorro();
        ca.setEstadocuentaahorro(new Estadocuentaahorro(2));
        ca.setCapitalActual(ca.getCapitalActual() + Double.parseDouble(formatd.format(a.getMonto())));

        Transaccion tr = new Transaccion((Cajero) sesion.getAttribute("cajero"), ca.getCliente(), new Tipotransaccion(5), "TR-00" + obtenerNumeroTransaccion(), new Date(), nombreCliente(ca.getCliente()));
        Operacion o = new Operacion(tr, "PAGO POR APERTURA DE CUENTA Y APORTE INICIAL", ca.getCodigo(), Double.parseDouble(formatd.format(ca.getMontoInscripcion() + ca.getMontoCarnet())), Double.parseDouble(formatd.format(a.getMonto())), Double.parseDouble(formatd.format(a.getMonto() + ca.getMontoInscripcion() + ca.getMontoCarnet())));

        Cajero c = (Cajero) sesion.getAttribute("cajero");
        c.setSaldoCierre(c.getSaldoCierre() + Double.parseDouble(formatd.format(a.getMonto() + ca.getMontoInscripcion() + ca.getMontoCarnet())));

        return transaccionDao.aperturarAH(ca, a, tr, o, c, sesion);
    }

    @Override
    public int cobrarAH(Aporte a, HttpSession sesion) {
        Cuentaahorro ca = a.getCuentaahorro();
        ca.setCapitalActual(ca.getCapitalActual() + Double.parseDouble(formatd.format(a.getMonto())));

        Transaccion tr = new Transaccion((Cajero) sesion.getAttribute("cajero"), ca.getCliente(), new Tipotransaccion(5), "TR-00" + obtenerNumeroTransaccion(), new Date(), nombreCliente(ca.getCliente()));
        Operacion o = new Operacion(tr, "PAGO DE APORTE AHORRO", ca.getCodigo(), 0.0, Double.parseDouble(formatd.format(a.getMonto())), Double.parseDouble(formatd.format(a.getMonto())));

        Cajero c = (Cajero) sesion.getAttribute("cajero");
        c.setSaldoCierre(c.getSaldoCierre() + Double.parseDouble(formatd.format(a.getMonto())));

        return transaccionDao.cobrarAH(ca, a, tr, o, c, sesion);
    }

    @Override
    public int aperturarPF(Cuentaahorro ca, HttpSession sesion) {
        ca.setEstadocuentaahorro(new Estadocuentaahorro(2));

        Transaccion tr = new Transaccion((Cajero) sesion.getAttribute("cajero"), ca.getCliente(), new Tipotransaccion(6), "TR-00" + obtenerNumeroTransaccion(), new Date(), nombreCliente(ca.getCliente()));
        Operacion o = new Operacion(tr, "COBRO DE DEPOSITO A PLAZO FIJO", ca.getCodigo(), 0.0, Double.parseDouble(formatd.format(ca.getImporte())), Double.parseDouble(formatd.format(ca.getImporte())));

        Cajero c = (Cajero) sesion.getAttribute("cajero");
        c.setSaldoCierre(c.getSaldoCierre() + Double.parseDouble(formatd.format(ca.getImporte())));

        return transaccionDao.aperturarPF(ca, tr, o, c, sesion);
    }

    @Override
    public int pagoFacilcuotas(Data3 data, HttpSession sesion) {
        Cajero c = (Cajero) sesion.getAttribute("cajero");
        Operacion o = data.getOperacion();
        Cuentacredito cc = data.getCuentacredito();

        if (!c.isCerrado()) {

            List<Desembolso> ld = desembolsoDao.consultList("from Desembolso d where d.estadodesembolso.id<3 and d.cuentacredito.id=" + cc.getId());

            List<Desembolso> ld2 = new ArrayList<>();

            Double total = o.getTotal();

            int cont = 0;
            while (total > 0.0) {
                Desembolso des = ld.get(cont);

                if (des.getCuotac() < total) {
                    total -= des.getCuotac();

                    des.setCuotac(0.0);
                    des.setEstadodesembolso(new Estadodesembolso(3));
                } else {
                    if (Objects.equals(des.getCuotac(), total)) {
                        total -= des.getCuotac();

                        des.setCuotac(0.0);
                        des.setEstadodesembolso(new Estadodesembolso(3));
                    } else {
                        des.setCuotac(Double.parseDouble(formatd.format(ld.get(cont).getCuotac() - total)));

                        total = 0.0;
                    }
                }

                ld2.add(des);
                cont++;
            }

            o.setAgregado(0.0);
            o.setPago(Double.parseDouble(formatd.format(o.getTotal())));
            o.setDenominacion("PAGO EN GRUPO DE CUOTAS DE CREDITO");

            List<Operacion> lo = new ArrayList<>();
            lo.add(o);

            Tipotransaccion ttr = new Tipotransaccion(2);
            String codigo = "TR-00" + (obtenerNumeroTransaccion() + 1);

            o.getTransaccion().setCajero(c);
            o.getTransaccion().setCodigo(codigo);
            o.getTransaccion().setFecha(new Date());
            o.getTransaccion().setTipotransaccion(ttr);

            return transaccionDao.pagoCuotacuentacredito(ld2, o.getTransaccion(), lo, c, sesion);//transaccionService.pagoCuotacuentacredito(listaPagodesembolso, o.getTransaccion(), listaOperacion, c, sesion);
        } else {
            return 2;
        }
    }

    public String nombreCliente(Cliente c) {
        Personanatural pn = (Personanatural) personanaturalDao.consultUnique("from Personanatural pn where pn.cliente.id=" + c.getId());

        if (pn != null) {
            return pn.getPersona().getNombre() + " " + pn.getPersona().getApellidoPat() + " " + pn.getPersona().getApellidoMat();
        } else {
            Personajuridica pj = (Personajuridica) personajuridicaDao.consultUnique("from Personajuridica pj where pj.cliente.id=" + c.getId());
            return pj.getRazonSocial();
        }
    }
}
