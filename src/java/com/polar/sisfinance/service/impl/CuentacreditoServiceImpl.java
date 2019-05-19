/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.dao.CalendarioDao;
import com.polar.sisfinance.dao.CuentacreditoDao;
import com.polar.sisfinance.dao.DesembolsoDao;
import com.polar.sisfinance.dao.FrecuenciapagoDao;
import com.polar.sisfinance.dao.GaranteDao;
import com.polar.sisfinance.dao.PersonajuridicaDao;
import com.polar.sisfinance.dao.PersonanaturalDao;
import com.polar.sisfinance.dao.ProductocreditoDao;
import com.polar.sisfinance.dao.RegistrocuentacreditoDao;
import com.polar.sisfinance.dao.impl.CuentacreditoDaoImpl;
import com.polar.sisfinance.entity.Calendario;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Estadocredito;
import com.polar.sisfinance.entity.Estadodesembolso;
import com.polar.sisfinance.entity.Frecuenciapago;
import com.polar.sisfinance.entity.Garante;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Productocredito;
import com.polar.sisfinance.entity.Registrocuentacredito;
import com.polar.sisfinance.service.CuentacreditoService;
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
public class CuentacreditoServiceImpl extends GenericServiceImpl<Cuentacredito> implements CuentacreditoService {
    
    @Autowired
    CuentacreditoDao cuentacreditoDao;
    @Autowired
    FrecuenciapagoDao frecuenciapagoDao;
    @Autowired
    DesembolsoDao desembolsoDao;
    @Autowired
    GaranteDao garanteDao;
    @Autowired
    CalendarioDao calendarioDao;
    @Autowired
    ProductocreditoDao productocreditoDao;
    @Autowired
    PersonanaturalDao personanaturalDao;
    @Autowired
    PersonajuridicaDao personajuridicaDao;
    @Autowired
    RegistrocuentacreditoDao registrocuentacreditoDao;
    
    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat formatd;
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Gson gson;
    
    public CuentacreditoServiceImpl() {
        simbolo.setDecimalSeparator('.');
        formatd = new DecimalFormat("####.#", simbolo);
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }
    
    @Override
    public int obtenerNumeroCuentacredito() {
        try {
            return (int) cuentacreditoDao.consultUnique("select max(id) from Cuentacredito");
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            return 0;
        }
    }
    
    @Override
    public List<Desembolso> calcularCuotas(Cuentacredito x) {
        //OBTENER PLAZO Y FRECUENCIA PAGO
        Frecuenciapago fp = frecuenciapagoDao.read(x.getFrecuenciapago().getId());
        int dias = fp.getDias();
        
        List<Desembolso> lista = new ArrayList<>();
        
        switch (dias) {
            case 1:
                lista = calcularDesembolsoDiario(x);
                break;
            case 7:
                lista = calcularDesembolsoSemanal(x);
                break;
            case 15:
                lista = calcularDesembolsoQuincenal(x);
                break;
            case 30:
                lista = calcularDesembolsoMensual(x);
                break;
            case 90:
                lista = calcularDesembolsoTrimestral(x);
                break;
            case 120:
                lista = calcularDesembolsoCuatrimestral(x);
                break;
            case 180:
                lista = calcularDesembolsoSemestral(x);
                break;
            case 360:
                lista = calcularDesembolsoAnual(x);
                break;
        }

        //NORMALIZACION DE DATOS
        DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
        simbolo.setDecimalSeparator('.');
        DecimalFormat formateador = new DecimalFormat("####.#", simbolo);
        
        for (Desembolso des : lista) {
            des.setCuota(Double.parseDouble(formateador.format(des.getCuota())));
            des.setCuotac(Double.parseDouble(formateador.format(des.getCuotac())));
            des.setInteres(Double.parseDouble(formateador.format(des.getInteres())));
            des.setAmortizacion(Double.parseDouble(formateador.format(des.getAmortizacion())));
            des.setSaldoInsoluto(Double.parseDouble(formateador.format(des.getSaldoInsoluto())));
            des.setDeudaExtinguida(Double.parseDouble(formateador.format(des.getDeudaExtinguida())));
        }
        
        return lista;
    }
    
    public List<Date> ListarDias(Calendar fechaInicio, Calendar fechaFin) {
        List<Date> listaDias = new ArrayList<>();
        
        while (fechaInicio.before(fechaFin)) {
            fechaInicio.add(Calendar.DATE, 1);
            listaDias.add(fechaInicio.getTime());
        }
        return listaDias;
    }
    
    public List<Date> ListarSemanas(Calendar fechaInicio, Calendar fechaFin) {
        List<Date> listaSemanas = new ArrayList<>();
        //CALCULO DIAS FALTANTES
        Calendar fInicio = Calendar.getInstance();
        fInicio.setTime(fechaInicio.getTime());
        
        int c = 0;
        while (fInicio.before(fechaFin)) {
            fInicio.add(Calendar.DATE, 1);
            c++;
        }
        int diasFaltantes = 0;
        if ((c % 7) != 0) {
            diasFaltantes = 7 - (c % 7);
        }
        //END CALCULO DIAS FALTANTES

        //AGREGAR DIAS FALTANTES A FECHA FIN
        fechaFin.add(Calendar.DATE, diasFaltantes);
        
        while (fechaInicio.before(fechaFin)) {
            fechaInicio.add(Calendar.DATE, 7);
            
            listaSemanas.add(fechaInicio.getTime());
        }
        return listaSemanas;
    }
    
    public List<Date> ListarQuicenas(Calendar fechaInicio, Calendar fechaFin) {
        List<Date> listaQuincenas = new ArrayList<>();

        //CALCULO DIAS FALTANTES
        Calendar fInicio = Calendar.getInstance();
        fInicio.setTime(fechaInicio.getTime());
        
        int c = 0;
        while (fInicio.before(fechaFin)) {
            fInicio.add(Calendar.DATE, 1);
            c++;
        }
        int diasFaltantes = 0;
        if ((c % 15) != 0) {
            diasFaltantes = 15 - (c % 15);
        }
        //END CALCULO DIAS FALTANTES

        //AGREGAR DIAS FALTANTES A FECHA FIN
        fechaFin.add(Calendar.DATE, diasFaltantes);
        
        while (fechaInicio.before(fechaFin)) {
            fechaInicio.add(Calendar.DATE, 15);
            
            listaQuincenas.add(fechaInicio.getTime());
        }
        return listaQuincenas;
    }
    
    public List<Date> ListarMensuales(Calendar fechaInicio, Calendar fechaFin, int meses) {
        List<Date> listaMensuales = new ArrayList<>();
        fechaFin.add(Calendar.MONTH, meses);
        
        int c = 0;
        while (c < meses) {
            fechaInicio.add(Calendar.MONTH, 1);
            
            listaMensuales.add(fechaInicio.getTime());
            c++;
        }
        return listaMensuales;
    }
    
    public List<Date> ListarTrimestrales(Calendar fechaInicio, Calendar fechaFin, int meses) {
        List<Date> listaTrimestrales = new ArrayList<>();

        //CALCULO DE MESES FALTANTES
        int mesesFaltantes = 0;
        if ((meses % 3) != 0) {
            mesesFaltantes = 3 - meses % 3;
        }
        meses = meses + mesesFaltantes;
        //END CALCULO MESES FALTANTES

        fechaFin.add(Calendar.MONTH, meses);
        
        int c = 0;
        while (c < meses) {
            fechaInicio.add(Calendar.MONTH, 3);
            
            listaTrimestrales.add(fechaInicio.getTime());
            c = c + 3;
        }
        return listaTrimestrales;
    }
    
    public List<Date> ListarCuatrimestrales(Calendar fechaInicio, Calendar fechaFin, int meses) {
        List<Date> listaCuatrimestrales = new ArrayList<>();

        //CALCULO DE MESES FALTANTES
        int mesesFaltantes = 0;
        if ((meses % 4) != 0) {
            mesesFaltantes = 4 - meses % 4;
        }
        meses = meses + mesesFaltantes;
        //END CALCULO MESES FALTANTES

        fechaFin.add(Calendar.MONTH, meses);
        
        int c = 0;
        while (c < meses) {
            fechaInicio.add(Calendar.MONTH, 4);
            
            listaCuatrimestrales.add(fechaInicio.getTime());
            c = c + 4;
        }
        return listaCuatrimestrales;
    }
    
    public List<Date> ListarSemestrales(Calendar fechaInicio, Calendar fechaFin, int meses) {
        List<Date> listaSemestrales = new ArrayList<>();

        //CALCULO DE MESES FALTANTES
        int mesesFaltantes = 0;
        if ((meses % 6) != 0) {
            mesesFaltantes = 6 - meses % 6;
        }
        meses = meses + mesesFaltantes;
        //END CALCULO MESES FALTANTES
        fechaFin.add(Calendar.MONTH, meses);
        
        int c = 0;
        while (c < meses) {
            fechaInicio.add(Calendar.MONTH, 6);
            
            listaSemestrales.add(fechaInicio.getTime());
            c = c + 6;
        }
        return listaSemestrales;
    }
    
    public List<Date> ListarAnuales(Calendar fechaInicio, Calendar fechaFin, int meses) {
        List<Date> listaAnuales = new ArrayList<>();

        //CALCULO DE MESES FALTANTES
        int mesesFaltantes = 0;
        if ((meses % 12) != 0) {
            mesesFaltantes = 12 - meses % 12;
        }
        meses = meses + mesesFaltantes;
        //END CALCULO MESES FALTANTES
        fechaFin.add(Calendar.MONTH, meses);
        
        int c = 0;
        while (c < meses) {
            fechaInicio.add(Calendar.MONTH, 12);
            
            listaAnuales.add(fechaInicio.getTime());
            c = c + 12;
        }
        return listaAnuales;
    }
    
    public List<Desembolso> calcularDesembolso(List<Date> listaFechas, double cuota, double importeCredito, double tasaInteres) {
        List<Desembolso> listaDesembolso = new ArrayList<>();
        
        double importeCalculo = importeCredito;
        double interes;
        double amortizacion;
        double deudaExtinguida = 0;

        //SETEO DE FECHA
        Calendar dia = Calendar.getInstance();
        String[] days = new String[]{"DOMINGO", "LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO"};
        
        for (Date fecha : listaFechas) {
            Desembolso des = new Desembolso();
            
            des.setFechaVence(fecha);
            
            dia.setTime(fecha);
            des.setDiaPago(days[dia.get(Calendar.DAY_OF_WEEK) - 1]);

            //CUOTA
            des.setCuota(cuota);
            des.setCuotac(cuota);

            //INTERES
            interes = importeCalculo * (tasaInteres / 100);
            des.setInteres(interes);

            //AMORTIZACION
            amortizacion = cuota - interes;
            des.setAmortizacion(amortizacion);

            //IMPORTE CALCULO
            importeCalculo = importeCalculo - amortizacion;
            des.setSaldoInsoluto(importeCalculo);

            //DEUDA EXTINGUIDA
            deudaExtinguida = deudaExtinguida + amortizacion;
            des.setDeudaExtinguida(deudaExtinguida);

            //MORA Y ESTADO
            des.setMora(0.0);
            des.setIdEstadomora(0);
            
            Estadodesembolso estadodesembolso = new Estadodesembolso();
            estadodesembolso.setId(1);
            des.setEstadodesembolso(estadodesembolso);

            //AGREGAMOS A LA LISTA
            listaDesembolso.add(des);
        }
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoDiasHabiles(List<Desembolso> lista, double importeCredito) {
        List<Desembolso> listaDesembolso = new ArrayList<>();
        
        double montoSundays = 0;
        double montoInteres = 0;
        for (Desembolso d : lista) {
            Calendar f = Calendar.getInstance();
            f.setTime(d.getFechaVence());
            if (f.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                listaDesembolso.add(d);
            } else {
                montoSundays += d.getCuota();
                montoInteres += d.getInteres();
            }
        }
        
        double agregadoCuota = montoSundays / listaDesembolso.size();
        double agregadoInteres = montoInteres / listaDesembolso.size();
        
        double importeCalculo = importeCredito;
        double cuota;
        double interes;
        double amortizacion;
        double deudaExtinguida = 0;

        //SETEO DE FECHA
        Calendar dia = Calendar.getInstance();
        String[] days = new String[]{"DOMINGO", "LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO"};
        
        for (Desembolso d : listaDesembolso) {
            dia.setTime(d.getFechaVence());
            d.setDiaPago(days[dia.get(Calendar.DAY_OF_WEEK) - 1]);

            //CUOTA
            cuota = d.getCuota() + agregadoCuota;
            d.setCuota(cuota);
            d.setCuotac(cuota);

            //INTERES
            interes = d.getInteres() + agregadoInteres;
            d.setInteres(interes);

            //AMORTIZACION
            amortizacion = cuota - interes;
            d.setAmortizacion(amortizacion);

            //IMPORTE CALCULO
            importeCalculo = importeCalculo - amortizacion;
            d.setSaldoInsoluto(importeCalculo);

            //DEUDA EXTINGUIDA
            deudaExtinguida = deudaExtinguida + amortizacion;
            d.setDeudaExtinguida(deudaExtinguida);
        }
        
        return listaDesembolso;
    }
    
    public List<Desembolso> agregarPeriodogracia(int diasPeriodogracia, double tasaInteres, double importeCredito, List<Desembolso> lista) {
        double interes = (tasaInteres / 100) * diasPeriodogracia * importeCredito;
        double adicional = interes / (lista.size());
        
        for (Desembolso des : lista) {
            des.setCuota(des.getCuota() + adicional);
            des.setInteres(des.getInteres() + adicional);
        }
        
        return lista;
    }
    
    public List<Desembolso> calcularDesembolsoDiario(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());

        //ESTABLECE FECHA FIN
        fechaFin.add(Calendar.MONTH, x.getPlazo());
        
        List<Date> listaFechas = ListarDias(fechaInicio, fechaFin);
        int cantidadCuotas = listaFechas.size();

        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));

        //TIPO CALENDARIO
        Calendario cal = calendarioDao.read(x.getCalendario().getId());
        
        List<Desembolso> listaDesembolso;
        if (cal.getId() == 1) {
            listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());
            //GENERACION DE DESEMBOLSO
            listaDesembolso = calcularDesembolsoDiasHabiles(listaDesembolso, x.getImporteCredito());
            
        } else {
            //GENERACION DE DESEMBOLSO
            listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());
        }

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECIMIENTO FECHA VENCIMIENTO
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoSemanal(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());

        //ESTABLECE FECHA FIN
        fechaFin.add(Calendar.MONTH, x.getPlazo());
        
        List<Date> listaFechas = ListarSemanas(fechaInicio, fechaFin);
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECIMIENTO FECHA VENCIMIENTO
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoQuincenal(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());

        //ESTABLECE FECHA FIN
        fechaFin.add(Calendar.MONTH, x.getPlazo());
        
        List<Date> listaFechas = ListarQuicenas(fechaInicio, fechaFin);
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECIMIENTO FECHA VENCIMIENTO
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoMensual(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());
        
        List<Date> listaFechas = ListarMensuales(fechaInicio, fechaFin, x.getPlazo());
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECE FECHA FIN
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoTrimestral(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());
        
        List<Date> listaFechas = ListarTrimestrales(fechaInicio, fechaFin, x.getPlazo());
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECE FECHA FIN
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoCuatrimestral(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());
        
        List<Date> listaFechas = ListarCuatrimestrales(fechaInicio, fechaFin, x.getPlazo());
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECE FECHA FIN
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoSemestral(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());
        
        List<Date> listaFechas = ListarSemestrales(fechaInicio, fechaFin, x.getPlazo());
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECE FECHA FIN
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    public List<Desembolso> calcularDesembolsoAnual(Cuentacredito x) {
        Calendar fechaInicio = Calendar.getInstance();
        Calendar fechaFin = Calendar.getInstance();
        
        fechaInicio.setTime(x.getFechaApertura());
        fechaFin.setTime(x.getFechaApertura());

        //PERIODO GRACIA
        fechaInicio.add(Calendar.DATE, x.getPeriodoGracia());
        fechaFin.add(Calendar.DATE, x.getPeriodoGracia());
        
        List<Date> listaFechas = ListarAnuales(fechaInicio, fechaFin, x.getPlazo());
        int cantidadCuotas = listaFechas.size();
        //CALCULO CUOTA NORMAL
        double cuota = x.getImporteCredito() * (((x.getTasaInteres() / 100) * (Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas))) / ((Math.pow(1 + (x.getTasaInteres() / 100), cantidadCuotas)) - 1));
        
        List<Desembolso> listaDesembolso = calcularDesembolso(listaFechas, cuota, x.getImporteCredito(), x.getTasaInteres());

        //CALCULO DE PERIODO GRACIA
        if (x.getPeriodoGracia() > 0) {
            Productocredito pc = productocreditoDao.read(x.getProductocredito().getId());
            listaDesembolso = agregarPeriodogracia(x.getPeriodoGracia(), pc.getTem(), x.getImporteCredito(), listaDesembolso);
        }

        //ESTABLECE FECHA FIN
        x.setFechaVencimiento(fechaFin.getTime());
        
        return listaDesembolso;
    }
    
    @Override
    public int crearCuentacredito(Cuentacredito cuentacredito, List<Desembolso> listaDesembolso, List<Garante> listaGarante) {
        cuentacreditoDao = new CuentacreditoDaoImpl();

        //SETEAMOS CUENTA CREDITO
        Integer codigo = (Integer) cuentacreditoDao.consultUnique("select max(id) from Cuentacredito");
        if (codigo == null) {
            cuentacredito.setCuentaCredito("CR-00" + 1);
        } else {
            cuentacredito.setCuentaCredito("CR-00" + (codigo + 1));
        }
        
        if (listaDesembolso == null) {
            listaDesembolso = new ArrayList<>();
        }
        
        if (listaGarante == null) {
            listaGarante = new ArrayList<>();
        } else {
            String garante = "";
            for (Garante g : listaGarante) {
                garante += "[GARANTE DE " + g.getTipoGarante() + " VALORIZADO EN " + g.getImporteGarante() + "] ";
            }
            cuentacredito.setGarante(garante);
        }

        //CALCULO INTERES
        double aux = 0.0;
        for (Desembolso d : listaDesembolso) {
            aux += d.getCuota();
        }

        //NORMALIZACION DE DATOS 
        DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
        simbolo.setDecimalSeparator('.');
        DecimalFormat formateador = new DecimalFormat("####.#", simbolo);
        
        cuentacredito.setInteres(Double.parseDouble(formateador.format(aux - cuentacredito.getImporteCredito())));
        
        return cuentacreditoDao.saveCuentacredito(cuentacredito, listaDesembolso, listaGarante);
    }
    
    @Override
    public int quitarCuentacredito(int id) {
        List<Desembolso> listaDesembolso = (List<Desembolso>) desembolsoDao.consultList("from Desembolso d where d.cuentacredito.id=" + id);
        Cuentacredito cuentacredito = cuentacreditoDao.read(id);
        Registrocuentacredito registrocuentacredito = (Registrocuentacredito) registrocuentacreditoDao.consultUnique("from Registrocuentacredito rgcc where rgcc.cuentacredito.id=" + id);
        
        return cuentacreditoDao.deleteCuentacredito(cuentacredito, listaDesembolso, registrocuentacredito);
    }
    
    @Override
    public List<Cuentacredito> listarCuentasPorCliente(int idCliente) {
        return cuentacreditoDao.consultList("from Cuentacredito cc where cc.cliente.id=" + idCliente);
    }
    
    @Override
    public List<Cuentacredito> listarCuentasParaAprobacion() {
        return cuentacreditoDao.consultList("from Cuentacredito cc where cc.estadocredito.id = 1 or cc.estadocredito.id = 4");
    }
    
    @Override
    public int admisionCuentacredito(Cuentacredito cc) {
        return cuentacreditoDao.update(cc);
    }
    
    @Override
    public List<Cuentacredito> listarCuentasParaDesembolso(int idCliente) {
        return cuentacreditoDao.consultList("select cc from Cuentacredito cc join cc.cliente c where c.id=" + idCliente + " and cc.estadocredito.id = 5");
    }
    
    @Override
    public List<Desembolso> listaPagoCuotas(int idCliente) {
        return cuentacreditoDao.consultList("select d from Desembolso d join d.cuentacredito cc where cc.cliente.id=" + idCliente + " and cc.estadocredito.id=6 and d.estadodesembolso.id<3 or d.idEstadomora=1");
    }
    
    @Override
    public boolean estaCancelada(int idCuentacredito) {
        int dato = Integer.parseInt(cuentacreditoDao.consultUnique("select count(d) from Desembolso d join d.cuentacredito cc where cc.id=" + idCuentacredito + " and d.estadodesembolso.id<3").toString());
        return dato <= 0;
    }
    
    @Override
    public void cerrarCuentacredito(int idCuentacredito) {
        Cuentacredito cc = cuentacreditoDao.read(idCuentacredito);
        
        Estadocredito ec = new Estadocredito();
        ec.setId(7);
        cc.setEstadocredito(ec);
        
        cuentacreditoDao.update(cc);
    }
    
    @Override
    public List<String> listaCarteramorosa() {
        List<String> lstr = new ArrayList<>();
        
        List<Cuentacredito> lcc = cuentacreditoDao.consultList("select cc from Desembolso d join d.cuentacredito cc where cc.estadocredito.id=7 and d.mora>0 group by cc");
        
        for (Cuentacredito cc : lcc) {
            String json = gson.toJson(cc);
            
            Personanatural pn = (Personanatural) personanaturalDao.consultUnique("from Personanatural pn where pn.cliente.id=" + cc.getCliente().getId());
            if (pn != null) {
                json = json.substring(0, json.length() - 1);
                json += ",\"nombre\":\"" + pn.getPersona().getNombre() + " " + pn.getPersona().getApellidoPat() + " " + pn.getPersona().getApellidoMat() + "\",\"cl\":\"CN\"}";
            } else {
                Personajuridica pj = (Personajuridica) personajuridicaDao.consultUnique("from Personajuridica pj where pj.cliente.id=" + cc.getCliente().getId());
                json = json.substring(0, json.length() - 1);
                json += ",\"nombre\":\"" + pj.getRazonSocial() + "\",\"cl\":\"CJ\"}";
            }
            
            lstr.add(json);
        }
        
        return lstr;
    }
    
    @Override
    public List<Integer> numeroCuentamorosa(int idCliente) {
        return (List<Integer>) cuentacreditoDao.consultList("select count(cc) from Desembolso d join d.cuentacredito cc where cc.estadocredito.id=7 and cc.cliente.id=" + idCliente + " and d.mora>0 group by cc");
    }
    
    @Override
    public List<Cuentacredito> cuentasMorosa(Date fechaInicio, Date fechaFin) {
        return cuentacreditoDao.consultList("select cc from Desembolso d join d.cuentacredito cc where cc.estadocredito.id=7 and cc.fechaVencimiento>='" + format.format(fechaInicio) + "' and cc.fechaVencimiento<='" + format.format(fechaFin) + "' and d.mora>0 group by cc.cliente");
    }
    
    @Override
    public List<Object[]> cuentasMorosaPorProductocredito(int idProductocredito) {
        if (idProductocredito == 0) {
            List<Object[]> lista = cuentacreditoDao.consultList("select pc.id as id,pc.codigo as codigo,pc.nombre as nombre, pc.frecuenciapago.nombre as formaPago,pc.tasa as tasa,count(cc) as numero from Cuentacredito cc join cc.productocredito pc where cc.fechaVencimiento<'" + format.format(new Date()) + "' and cc.estadocredito.id=6 group by pc");
            return lista;
        } else {
            List<Object[]> lista = cuentacreditoDao.consultList("select pc.id as id,pc.codigo as codigo,pc.nombre as nombre, pc.frecuenciapago.nombre as formaPago,pc.tasa as tasa,count(cc) as numero from Cuentacredito cc join cc.productocredito pc where cc.fechaVencimiento<'" + format.format(new Date()) + "' and pc.id=" + idProductocredito + " and cc.estadocredito.id=6 group by pc");
            return lista;
        }
    }
    
    @Override
    public List<Object[]> cuentasPorProductocredito(Date fechaInicio, Date fechaFin, int idProductocredito) {
        if (idProductocredito == 0) {
            List<Object[]> lista = cuentacreditoDao.consultList("select pc.id as id,pc.codigo as codigo,pc.nombre as nombre, pc.frecuenciapago.nombre as formaPago,pc.tasa as tasa,count(cc) as numero from Cuentacredito cc join cc.productocredito pc where cc.fechaApertura>='" + format.format(fechaInicio) + "' and cc.fechaApertura<='" + format.format(fechaFin) + "' and cc.estadocredito.id>=6 group by pc");
            return lista;
        } else {
            List<Object[]> lista = cuentacreditoDao.consultList("select pc.id as id,pc.codigo as codigo,pc.nombre as nombre, pc.frecuenciapago.nombre as formaPago,pc.tasa as tasa,count(cc) as numero from Cuentacredito cc join cc.productocredito pc where cc.fechaApertura>='" + format.format(fechaInicio) + "' and cc.fechaApertura<='" + format.format(fechaFin) + "' and pc.id=" + idProductocredito + " and cc.estadocredito.id>=6 group by pc");
            return lista;
        }
    }
    
    @Override
    public List<Cuentacredito> listarCuentascredito(Cliente c) {
        return cuentacreditoDao.consultList("from Cuentacredito cc where cc.cliente.id=" + c.getId());
    }
    
    @Override
    public List<String> buscarCuentasporpagar(Cliente c) {
        List<String> lstr = new ArrayList<>();
        List<Cuentacredito> lcc = cuentacreditoDao.consultList("from Cuentacredito cc where cc.cliente.id=" + c.getId() + " and cc.estadocredito.id=6");
        
        for (Cuentacredito cc : lcc) {
            double total;
            try {
                total = Double.parseDouble(formatd.format(Double.parseDouble(desembolsoDao.consultUnique("select sum(d.cuotac) from Desembolso d where d.estadodesembolso.id<3 and d.cuentacredito.id=" + cc.getId()).toString())));
            } catch (Exception e) {
                total = 0.0;
            }
            
            String json = gson.toJson(cc);
            json = json.substring(0, json.length() - 1);
            json += ",\"total\":" + total + "}";
            
            lstr.add(json);
        }
        return lstr;
    }
}
