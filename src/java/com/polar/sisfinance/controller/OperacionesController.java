/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Caja;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Detallecomprobante;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Estadocredito;
import com.polar.sisfinance.entity.Estadodesembolso;
import com.polar.sisfinance.entity.Operacion;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Tipotransaccion;
import com.polar.sisfinance.entity.Tipotransferencia;
import com.polar.sisfinance.entity.Transaccion;
import com.polar.sisfinance.entity.Transferencia;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.entity.news.Data2;
import com.polar.sisfinance.entity.news.Data3;
import com.polar.sisfinance.service.AgenciaService;
import com.polar.sisfinance.service.BobedaService;
import com.polar.sisfinance.service.CajaService;
import com.polar.sisfinance.service.CajeroService;
import com.polar.sisfinance.service.ClienteService;
import com.polar.sisfinance.service.ComprobanteService;
import com.polar.sisfinance.service.CuentacreditoService;
import com.polar.sisfinance.service.DesembolsoService;
import com.polar.sisfinance.service.DetallecomprobanteService;
import com.polar.sisfinance.service.DetallesaldobobedaService;
import com.polar.sisfinance.service.DetallesaldocajeroService;
import com.polar.sisfinance.service.MastertableService;
import com.polar.sisfinance.service.NaturalezacomprobanteService;
import com.polar.sisfinance.service.OperacionService;
import com.polar.sisfinance.service.PersonajuridicaService;
import com.polar.sisfinance.service.PersonanaturalService;
import com.polar.sisfinance.service.TipodocumentoService;
import com.polar.sisfinance.service.TipotransaccionService;
import com.polar.sisfinance.service.TransaccionService;
import com.polar.sisfinance.service.TransferenciaService;
import com.polar.sisfinance.service.UsuarioService;
import com.polar.sisfinance.util.SessionUtil;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author nerio
 */
@Controller
@RequestMapping("operaciones")
public class OperacionesController {

    @Autowired
    BobedaService bobedaService;
    @Autowired
    CajeroService cajeroService;
    @Autowired
    CajaService cajaService;
    @Autowired
    MastertableService mastertableService;
    @Autowired
    AgenciaService agenciaService;
    @Autowired
    UsuarioService usuarioService;
    @Autowired
    TransferenciaService transferenciaService;
    @Autowired
    DetallesaldobobedaService detallesaldobobedaService;
    @Autowired
    DetallesaldocajeroService detallesaldocajeroService;
    @Autowired
    CuentacreditoService cuentacreditoService;
    @Autowired
    ClienteService clienteService;
    @Autowired
    TransaccionService transaccionService;
    @Autowired
    TipotransaccionService tipotransaccionService;
    @Autowired
    DesembolsoService desembolsoService;
    @Autowired
    ComprobanteService comprobanteService;
    @Autowired
    NaturalezacomprobanteService naturalezacomprobanteService;
    @Autowired
    TipodocumentoService tipodocumentoService;
    @Autowired
    PersonajuridicaService personajuridicaService;
    @Autowired
    PersonanaturalService personanaturalService;
    @Autowired
    DetallecomprobanteService detallecomprobanteService;
    @Autowired
    OperacionService operacionService;

    //NORMALIZACION DE DATOS
    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat formaterd;
    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
    Gson gson;

    public OperacionesController() {
        simbolo.setDecimalSeparator('.');
        formaterd = new DecimalFormat("####.#", simbolo);
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/bobeda", method = RequestMethod.GET)
    public ModelAndView bobeda(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("operaciones/bobeda");

        Bobeda b = bobedaService.lastBobeda();
        if (b.getIdEstado() == 9) {
            mav = new ModelAndView("operaciones/abrirbobeda");

            List<Bobeda> listaBobeda = bobedaService.listarUltimosBobeda();
            mav.addObject("listaBobeda", listaBobeda);

            return new SessionUtil().sesion(mav, sesion, 2);
        } else {
            Date hoy = new Date();
            boolean bandera = bobedaService.isBefore(b.getFechaApertura(), hoy);

            if (bandera) {
                //CERRAMOS LAST BOBEDA
                mav = new ModelAndView("redirect:/operaciones/cerrarbobeda");
                return new SessionUtil().sesion(mav, sesion, 2);

            } else {
                mav.addObject("listaCajero", cajeroService.cajerosHoy());
                mav.addObject("listaCaja", cajaService.listarDisponibles());
                mav.addObject("listaUsuario", usuarioService.listarDisponibles());
                mav.addObject("bobeda", b);
                mav.addObject("agencia", agenciaService.obtenerAgenciaPrincipal());
                mav.addObject("listaTransferencia", transferenciaService.listaTransferencias(b.getFechaApertura()));

                //LISTA DE DETALLE SALDO
                mav.addObject("listaDsbApertura", detallesaldobobedaService.listarDsbAperturaPorId(b.getId()));
                mav.addObject("listaDsbCierre", detallesaldobobedaService.listarDsbCierrePorId(b.getId()));

                //LISTA DE MOVMIENTO BOBEDA
                //mav.addObject("listaMovimientobobeda", movimientobobedaService.listaMovimientosbobedaHoy());
                return new SessionUtil().sesion(mav, sesion, 2);
            }
        }
    }

    @RequestMapping(value = "/bobeda", method = RequestMethod.POST)
    public ModelAndView bobeda() {
        ModelAndView mav = new ModelAndView("redirect:/operaciones/bobeda");

        Bobeda lastBobeda = bobedaService.lastBobeda();

        List<Detallesaldobobeda> listaDsbCierre = detallesaldobobedaService.listarDsbCierrePorId(lastBobeda.getId());

        List<Detallesaldobobeda> listaDsbApertura2 = new ArrayList<>();
        List<Detallesaldobobeda> listaDsbCierre2 = new ArrayList<>();

        for (Detallesaldobobeda dsb : listaDsbCierre) {
            Detallesaldobobeda dsb1 = new Detallesaldobobeda(null, dsb.getDenominacion(), dsb.getValor(), dsb.getCantidad(), dsb.getMonto(), true);
            Detallesaldobobeda dsb2 = new Detallesaldobobeda(null, dsb.getDenominacion(), dsb.getValor(), dsb.getCantidad(), dsb.getMonto(), false);
            listaDsbApertura2.add(dsb1);
            listaDsbCierre2.add(dsb2);
        }

        Bobeda b = new Bobeda("BOBEDA SOLES", lastBobeda.getMontoCierre(), lastBobeda.getMontoCierre(), new Date(), lastBobeda.getMoneda(), 8);

        bobedaService.abrirBobeda(b, listaDsbApertura2, listaDsbCierre2);
        return mav;
    }

    @RequestMapping(value = "/cerrarbobeda", method = RequestMethod.GET)
    public ModelAndView cerraBobeda(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("operaciones/cerrarbobeda");

        Bobeda b = bobedaService.lastBobeda();

        if (b.getIdEstado() == 9) {
            mav = new ModelAndView("index");
            mav.addObject("message", ">> La bobeda ya se encuentra cerrada");
        } else {
            List<Cajero> listaCajero = cajeroService.listarCajeros(b.getFechaApertura());
            mav.addObject("listaCajero", listaCajero);
            mav.addObject("bobeda", b);
        }
        return new SessionUtil().sesion(mav, sesion, 2);
    }

    @RequestMapping(value = "/cerrarbobeda", method = RequestMethod.POST)
    @ResponseBody
    public int cerrarBobeda(int id, HttpSession sesion) {

        Bobeda b = bobedaService.get(id);

        List<Cajero> listaCajeros = cajeroService.listarCajerosabiertos(b.getFechaApertura());
        if (listaCajeros.size() > 0) {
            return 2;
        } else {
            b.setFechaCierre(new Date());
            b.setIdEstado(9);

            return bobedaService.update(b);
        }
    }

    @RequestMapping(value = "/agregarcajero", method = RequestMethod.POST)
    @ResponseBody
    public int agregarCajero(int idCaja, int idUsuario, HttpSession sesion) {
        Usuario usuario = (Usuario) sesion.getAttribute("user");
        if (usuario != null) {
            Caja c = new Caja();
            c.setId(idCaja);

            Usuario u = new Usuario();
            u.setId(idUsuario);

            Cajero cajero = new Cajero(c, u, 0, 0, new Date(), false, 10);

            int dato = cajeroService.create(cajero);
            return dato;
        } else {
            return 10;
        }
    }

    @RequestMapping(value = "/abrircajero", method = RequestMethod.POST)
    @ResponseBody
    public int abrirCajero(@RequestBody List<Detallesaldocajero> ldsc, HttpSession sesion) {
        int dato;
        //OBTENERMOS EL USUARIO
        Usuario usuario = (Usuario) sesion.getAttribute("user");
        if (usuario != null) {
            Cajero c = cajeroService.get(ldsc.get(0).getCajero().getId());

            //INICIAMOS LISTA DE DETALLE PARA CAJERO
            List<Detallesaldocajero> ldsc2 = new ArrayList<>();
            for (Detallesaldocajero dsc : ldsc) {
                dsc.setApertura(false);
                ldsc2.add(dsc);
            }

            c.setSaldoApertura(Double.parseDouble(formaterd.format(ldsc.get(0).getCajero().getSaldoApertura())));
            c.setSaldoCierre(Double.parseDouble(formaterd.format(ldsc.get(0).getCajero().getSaldoCierre())));
            c.setIdEstado(11);

            if (c.getSaldoApertura() < 1) {
                dato = cajeroService.update(c);
            } else {
                //ACTUALIZA BOBEDA Y SU SALDO
                Bobeda bobeda = bobedaService.lastBobeda();
                double montoCierreBobeda = bobeda.getMontoCierre() - c.getSaldoApertura();
                if (montoCierreBobeda < 0) {
                    dato = 4;
                } else {
                    bobeda.setMontoCierre(montoCierreBobeda);
                    List<Detallesaldobobeda> listaBsbCierre = detallesaldobobedaService.listarDsbCierrePorId(bobeda.getId());

                    //SE CREA LA REMESA Y SUS DETALLE SALDO
                    List<Detallesaldotransferencia> listaDstr = new ArrayList<>();
                    for (Detallesaldocajero dsc : ldsc) {
                        Detallesaldotransferencia dstr = new Detallesaldotransferencia(null, dsc.getDenominacion(), dsc.getValor(), dsc.getCantidad(), dsc.getMonto(), true);
                        listaDstr.add(dstr);
                    }
                    Transferencia tr = new Transferencia(c, new Tipotransferencia(5), usuario, "REMESA A " + c.getCaja().getNombre() + " AL ABRIR", c.getSaldoApertura(), new Date());
                    tr.setBobeda(bobeda);

                    //ACTUALIZA DETALLE SALDO BOBEDA
                    for (Detallesaldotransferencia dst : listaDstr) {
                        int dato2 = incluidoEnListaBobeda(dst, listaBsbCierre);
                        if (dato2 != -1) {
                            Detallesaldobobeda dsb = listaBsbCierre.get(dato2);
                            int catidadBilletes = dsb.getCantidad() - dst.getCantidad();
                            //CONDICIONA DE VERIFICACION DE BILLETES
                            if (catidadBilletes < 0) {
                                return 3;
                            } else {
                                dsb.setCantidad(catidadBilletes);
                                dsb.setMonto(dsb.getCantidad() * dsb.getValor());

                                listaBsbCierre.set(dato2, dsb);
                            }
                        } else {
                            return 2;
                        }
                    }
                    dato = cajeroService.abrirCajeroConMeresa(bobeda, listaBsbCierre, tr, listaDstr, c, ldsc, ldsc2);
                }
            }
            return dato;
        } else {
            return 10;
        }
    }

    @RequestMapping(value = "/transferenciacajero", method = RequestMethod.POST)
    @ResponseBody
    public int transferenciaCajero(@RequestBody Transferencia transferencia, HttpSession sesion) {
        //OBTENEMOS USUARIO
        Usuario usuario = (Usuario) sesion.getAttribute("user");
        if (usuario != null) {
            Bobeda b = bobedaService.lastBobeda();
            Cajero c = cajeroService.get(transferencia.getCajeroByIdCajero1().getId());
            transferencia.setUsuario(usuario);
            transferencia.setBobeda(b);
            transferencia.setFecha(new Date());

            double montoTransferencia = 0.0;

            List<Detallesaldotransferencia> listaDstr = new ArrayList<>();
            Set<Map> setDsc = transferencia.getDetallesaldotransferencias();
            for (Map mapa : setDsc) {
                Detallesaldotransferencia dst = new Detallesaldotransferencia(null, mapa.get("denominacion").toString(), Double.parseDouble(mapa.get("valor").toString()), Integer.parseInt(mapa.get("cantidad").toString()), Double.parseDouble(mapa.get("monto").toString()), true);
                listaDstr.add(dst);
                montoTransferencia += dst.getMonto();
            }

            //SETEAMOS MONTO A TRANSFERENCIA
            transferencia.setMonto(montoTransferencia);

            List<Detallesaldocajero> listaDscCierre = detallesaldocajeroService.listarDscCierrePorId(c.getId());
            List<Detallesaldobobeda> listaDsbCierre = detallesaldobobedaService.listarDsbCierrePorId(b.getId());

            //ACTUALIZAMOS DATOS BOBEDA Y CAJERO
            for (Detallesaldotransferencia dst : listaDstr) {
                //BUSCAMOS SI HAY ESTA MONEDA EN BOBEDA
                int dato = incluidoEnListaBobeda(dst, listaDsbCierre);
                if (dato != -1) {
                    Detallesaldobobeda x = listaDsbCierre.get(dato);
                    int cantidadBilletes = x.getCantidad() - dst.getCantidad();
                    if (cantidadBilletes < 0) {
                        return 3;
                    } else {
                        x.setCantidad(cantidadBilletes);
                        x.setMonto(x.getCantidad() * x.getValor());

                        listaDsbCierre.set(dato, x);

                        //BUSCAMOS SI HAY ESTA MONEDA EN CAJERO
                        dato = incluidoEnListaCajero(dst, listaDscCierre);
                        if (dato != -1) {
                            Detallesaldocajero y = listaDscCierre.get(dato);
                            y.setCantidad(y.getCantidad() + dst.getCantidad());
                            y.setMonto(y.getCantidad() * y.getValor());

                            listaDscCierre.set(dato, y);
                        } else {
                            Detallesaldocajero y = new Detallesaldocajero(c, dst.getDenominacion(), dst.getValor(), dst.getCantidad(), dst.getValor() * dst.getCantidad(), false);
                            listaDscCierre.add(y);
                        }
                    }
                } else {
                    return 2;
                }
            }

            c.setSaldoCierre(c.getSaldoCierre() + transferencia.getMonto());
            double montoCierre = b.getMontoCierre() - transferencia.getMonto();

            if (montoCierre < 0) {
                return 4;
            } else {
                b.setMontoCierre(montoCierre);

                return transferenciaService.transferirCajero(b, c, listaDsbCierre, listaDscCierre, listaDstr, transferencia);
            }
        } else {
            return 10;
        }
    }

    @RequestMapping(value = "/transaccioncajero", method = RequestMethod.GET)
    public ModelAndView transaccionCajero(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("operaciones/transaccioncajero");

        Bobeda bobeda = bobedaService.lastBobeda();
        Usuario usuario = (Usuario) sesion.getAttribute("user");
        if (usuario != null) {
            if (bobeda.getIdEstado() == 8) {

                List<Cajero> listaCajero = cajeroService.listarCajeros(bobeda.getFechaApertura());

                for (Cajero c : listaCajero) {
                    if (c.getUsuario().getUsuario().equals(usuario.getUsuario()) && c.getUsuario().getContrasena().equals(usuario.getContrasena())) {
                        if (!c.isCerrado() && c.getIdEstado() == 11) {
                            sesion.setAttribute("cajero", c);

                            //ADDING DATA
                            Map<String, Object> eqParams = new HashMap<>();
                            eqParams.put("idTabla", 2);
                            List<String> listaAscOrders = new ArrayList<>();
                            listaAscOrders.add("idItem");
                            mav.addObject("listaTipomoneda", mastertableService.listarTablaDeterminada(eqParams, null, listaAscOrders, null, 0));

                            return new SessionUtil().sesion(mav, sesion, 7);
                        } else {
                            mav = new ModelAndView("index");
                            mav.addObject("message", "» El cajero al que intenta acceder esta cerrado o pendiente de apertura, solicite al jefe de operaciones abrirla.");
                            return mav;
                        }
                    }
                }

                mav = new ModelAndView("index");
                mav.addObject("message", "» Usted no tiene permisos para acceder a la caja.");
                return mav;
            } else {
                mav = new ModelAndView("index");
                mav.addObject("message", "» La bobeda se encuentra cerrada, solicite al Jefe de operaciones que la aperture.");
                return mav;
            }
        } else {
            mav = new ModelAndView("login");
            mav.addObject("error", "» La sesion ha expirado los 30 minutos de acceso.");
            return mav;
        }
    }

    @RequestMapping(value = "/listarcuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarCuentacredito(int idCliente) {
        List<Cuentacredito> listaCuentacredito = cuentacreditoService.listarCuentasParaDesembolso(idCliente);

        List<String> listaCadena = new ArrayList<>();
        if (listaCuentacredito == null || listaCuentacredito.isEmpty()) {
            return listaCadena;
        } else {
            String cadena;
            for (Cuentacredito cc : listaCuentacredito) {
                cadena = "{\"id\":\"" + cc.getId() + "\","
                        + "\"idCliente\":\"" + cc.getCliente().getId() + "\","
                        + "\"idProductocredito\":\"" + cc.getProductocredito().getId() + "\","
                        + "\"cuentaCredito\":\"" + cc.getCuentaCredito() + "\","
                        + "\"moneda\":\"" + cc.getMoneda() + "\","
                        + "\"idFrecuenciapago\":\"" + cc.getFrecuenciapago().getId() + "\","
                        + "\"importeCredito\":\"" + cc.getImporteCredito() + "\","
                        + "\"plazo\":\"" + cc.getPlazo() + "\","
                        + "\"tasaInteres\":\"" + cc.getTasaInteres() + "\","
                        + "\"periodoGracia\":\"" + cc.getPeriodoGracia() + "\","
                        + "\"plazoPagoCuotas\":\"" + cc.getPlazoPagoCuotas() + "\","
                        + "\"idCalendario\":\"" + cc.getCalendario().getId() + "\","
                        + "\"fechaApertura\":\"" + cc.getFechaApertura() + "\","
                        + "\"fechaVencimiento\":\"" + cc.getFechaVencimiento() + "\","
                        + "\"centralRiesgo\":\"" + cc.getCentralRiesgo() + "\","
                        + "\"gastosAdministrativo\":\"" + cc.getGastosAdministrativo() + "\","
                        + "\"seguroDesgravamen\":\"" + cc.getSeguroDesgravamen() + "\","
                        + "\"encaje\":\"" + cc.getEncaje() + "\","
                        + "\"montoDesembolso\":\"" + cc.getMontoDesembolso() + "\","
                        + "\"estadoDesembolso\":\"" + cc.getEstadocredito().getAbreviacion() + "\","
                        + "\"cliente\":\"" + cc.getCliente().getCodigo().substring(0, 2) + "\"}";
                listaCadena.add(cadena);
            }
            return listaCadena;
        }
    }

    @RequestMapping(value = "/desembolsarcuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public String desembolsarCuentacredito(int idCuentacredito, int idCliente, String nombreCliente, double pago, HttpSession sesion) {
        Cajero c = (Cajero) sesion.getAttribute("cajero");
        c = cajeroService.get(c.getId());

        if (!c.isCerrado()) {
            if (c.getSaldoCierre() >= pago) {
                c.setSaldoCierre(Double.parseDouble(formaterd.format(c.getSaldoCierre() - pago)));
                Tipotransaccion ttr = tipotransaccionService.get(1);

                //OBTENEMOS DATOS
                Cliente cl = clienteService.get(idCliente);
                Cuentacredito cc = cuentacreditoService.get(idCuentacredito);

                if (cc.getEstadocredito().getId() == 5) {

                    String codigo = "TR-00" + (transaccionService.obtenerNumeroTransaccion() + 1);

                    Transaccion tr = new Transaccion(c, cl, ttr, codigo, new Date(), nombreCliente);
                    Operacion op = new Operacion(tr, "DESEMBOLSO DE CREDITO", cc.getCuentaCredito(), 0.0, Double.parseDouble(formaterd.format(pago)), Double.parseDouble(formaterd.format(pago)));

                    //ACTUALIZACION DE ESTADO CREDITO
                    cc.setEstadocredito(new Estadocredito(6));

                    int dato = transaccionService.desembolsoCuentacredito(cc, tr, op, c, sesion);
                    if (dato == 1) {
                        String cadena = "{\"id\":\"" + tr.getId() + "\","
                                + "\"codigo\":\"" + tr.getCodigo() + "\","
                                + "\"fecha\":\"" + formater.format(tr.getFecha()) + "\","
                                + "\"nombreCliente\":\"" + tr.getNombrecliente() + "\","
                                + "\"idTipotransaccion\":\"" + tr.getTipotransaccion().getId() + "\","
                                + "\"monto\":" + Double.parseDouble(formaterd.format(pago)) + ","
                                + "\"tipoTransaccion\":\"" + tr.getTipotransaccion().getDenominacion() + "\"}";
                        return cadena;
                    } else {
                        return "0";
                    }
                } else {
                    return "4";
                }
            } else {
                return "2";
            }
        } else {
            return "3";
        }
    }

    @RequestMapping(value = "/cuotascuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> cuotasCuentacredito(int idCliente) {
        List<Desembolso> listaDesembolso = cuentacreditoService.listaPagoCuotas(idCliente);

        List<String> listaCadena = new ArrayList<>();
        for (Desembolso d : listaDesembolso) {
            String cadena = "{\"id\":\"" + d.getId() + "\","
                    + "\"idEstadodesembolso\":" + d.getEstadodesembolso().getId() + ","
                    + "\"fechaVence\":\"" + formater.format(d.getFechaVence()) + "\","
                    + "\"diaPago\":\"" + d.getDiaPago() + "\","
                    + "\"cuota\":\"" + d.getCuota() + "\","
                    + "\"cuotac\":\"" + d.getCuotac() + "\","
                    + "\"interes\":\"" + d.getInteres() + "\","
                    + "\"amortizacion\":\"" + d.getAmortizacion() + "\","
                    + "\"deudaExtinguida\":\"" + d.getDeudaExtinguida() + "\","
                    + "\"cuentacredito\":\"" + d.getCuentacredito().getCuentaCredito() + "\","
                    + "\"estado\":\"" + d.getEstadodesembolso().getNombre() + "\","
                    + "\"estadoMora\":\"" + d.getIdEstadomora() + "\","
                    + "\"mora\":\"" + d.getMora() + "\"}";
            listaCadena.add(cadena);
        }
        return listaCadena;
    }

    @RequestMapping(value = "/buscarcuentasporpagar", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarCuentasporpagar(@RequestBody Cliente c) {
        return cuentacreditoService.buscarCuentasporpagar(c);
    }

    @RequestMapping(value = "/pagocuotascuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public String pagocuotasCuentacredito(@RequestBody Data2 data2, HttpSession sesion) {
        Cajero c = (Cajero) sesion.getAttribute("cajero");
        if (!c.isCerrado()) {

            List<Desembolso> listaPagodesembolso = new ArrayList<>();
            List<Integer> listaCuentas = new ArrayList<>();
            List<Operacion> listaOperacion = new ArrayList<>();

            double pago = 0.0;
            for (Map mapa : data2.getListaPagados()) {
                int id = Integer.parseInt(mapa.get("id").toString());
                double paga = Double.parseDouble(formaterd.format(Double.parseDouble(mapa.get("pago").toString())));
                boolean pagaMora = Boolean.parseBoolean(mapa.get("pagaMora").toString());

                Desembolso des = desembolsoService.get(id);
                if (des.getEstadodesembolso().getId() != 3) {
                    if (pagaMora) {
                        pago += Double.parseDouble(formaterd.format(des.getCuotac() + des.getMora()));
                        Operacion op = new Operacion(null, "PAGO DE LA CUOTA DE CREDITO", des.getCuentacredito().getCuentaCredito(), des.getMora(), des.getCuotac(), Double.parseDouble(formaterd.format(des.getCuotac() + des.getMora())));
                        listaOperacion.add(op);

                        des.setEstadodesembolso(new Estadodesembolso(3));
                        des.setMora(0.0);
                        des.setCuotac(0.0);
                    } else {
                        if (des.getMora() > 0) {
                            //TIENE MORA
                            if (paga < des.getCuotac()) {
                                pago += Double.parseDouble(formaterd.format(paga));
                                Operacion op = new Operacion(null, "PAGO DE LA CUOTA DE CREDITO", des.getCuentacredito().getCuentaCredito(), 0.0, Double.parseDouble(formaterd.format(paga)), Double.parseDouble(formaterd.format(paga)));
                                listaOperacion.add(op);

                                des.setCuotac(Double.parseDouble(formaterd.format(des.getCuotac() - paga)));
                            } else {
                                if (paga == des.getCuotac()) {
                                    pago += Double.parseDouble(formaterd.format(des.getCuotac()));
                                    Operacion op = new Operacion(null, "PAGO DE LA CUOTA DE CREDITO", des.getCuentacredito().getCuentaCredito(), 0.0, des.getCuotac(), des.getCuotac());
                                    listaOperacion.add(op);

                                    des.setCuotac(0.0);
                                } else {
                                    pago += Double.parseDouble(formaterd.format(paga));
                                    Operacion op = new Operacion(null, "PAGO DE LA CUOTA DE CREDITO", des.getCuentacredito().getCuentaCredito(), Double.parseDouble(formaterd.format(paga - des.getCuotac())), des.getCuota(), Double.parseDouble(formaterd.format(paga)));
                                    listaOperacion.add(op);

                                    des.setMora(Double.parseDouble(formaterd.format(des.getMora() - (paga - des.getCuota()))));
                                    des.setCuotac(0.0);
                                }
                            }
                        } else {
                            //NO TIENE MORA
                            if (paga < des.getCuotac()) {
                                pago += Double.parseDouble(formaterd.format(paga));
                                Operacion op = new Operacion(null, "PAGO DE LA CUOTA DE CREDITO", des.getCuentacredito().getCuentaCredito(), 0.0, Double.parseDouble(formaterd.format(paga)), Double.parseDouble(formaterd.format(paga)));
                                listaOperacion.add(op);

                                des.setCuotac(Double.parseDouble(formaterd.format(des.getCuotac() - paga)));
                            } else {
                                pago += Double.parseDouble(formaterd.format(paga));
                                Operacion op = new Operacion(null, "PAGO DE LA CUOTA DE CREDITO", des.getCuentacredito().getCuentaCredito(), Double.parseDouble(formaterd.format(paga - des.getCuotac())), Double.parseDouble(formaterd.format(des.getCuotac())), Double.parseDouble(formaterd.format(paga)));
                                listaOperacion.add(op);

                                des.setEstadodesembolso(new Estadodesembolso(3));
                                des.setCuotac(0.0);
                            }
                        }
                    }

                    listaPagodesembolso.add(des);
                    if (!listaCuentas.contains(des.getCuentacredito().getId())) {
                        listaCuentas.add(des.getCuentacredito().getId());
                    }
                } else {
                    return "3";
                }
            }

            //SETEO DE SSALDO DE CAJA
            c.setSaldoCierre(Double.parseDouble(formaterd.format(c.getSaldoCierre() + pago)));

            Tipotransaccion ttr = tipotransaccionService.get(2);
            String codigo = "TR-00" + (transaccionService.obtenerNumeroTransaccion() + 1);

            Cliente cl = new Cliente();
            cl.setId(data2.getIdCliente());

            Transaccion tr = new Transaccion(c, cl, ttr, codigo, new Date(), data2.getNombreCliente());

            int dato = transaccionService.pagoCuotacuentacredito(listaPagodesembolso, tr, listaOperacion, c, sesion);
            if (dato == 1) {
                //ACTUALIZACION DE ESTADO CREDITO
                for (int id : listaCuentas) {
                    if (cuentacreditoService.estaCancelada(id)) {
                        cuentacreditoService.cerrarCuentacredito(id);
                    }
                }

                String cadena = "{\"id\":\"" + tr.getId() + "\","
                        + "\"codigo\":\"" + tr.getCodigo() + "\","
                        + "\"fecha\":\"" + formater.format(tr.getFecha()) + "\","
                        + "\"nombreCliente\":\"" + tr.getNombrecliente() + "\","
                        + "\"idTipotransaccion\":\"" + tr.getTipotransaccion().getId() + "\","
                        + "\"monto\":" + Double.parseDouble(formaterd.format(pago)) + ","
                        + "\"tipoTransaccion\":\"" + tr.getTipotransaccion().getDenominacion() + "\"}";
                return cadena;
            } else {
                return "0";
            }
        } else {
            return "2";
        }
    }

    @RequestMapping(value = "/pagofacilcuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public int pagoFacilcuentacredito(@RequestBody Data3 data, HttpSession sesion) {
        return transaccionService.pagoFacilcuotas(data, sesion);
    }

    @RequestMapping(value = "/cerrarcajero", method = RequestMethod.GET)
    public ModelAndView cerrarCaja(int id, HttpSession sesion) {
        ModelAndView mav = new ModelAndView("operaciones/cerrarcajero");
        mav.addObject("listaDscApertura", detallesaldocajeroService.listarDscAperturaPorId(id));
        return mav;
    }

    @RequestMapping(value = "/cerrarcajero", method = RequestMethod.POST)
    @ResponseBody
    public String cerrarCaja(@RequestBody List<Detallesaldocajero> listadetallesaldocajero, HttpSession sesion) {
        Cajero cajero = (Cajero) sesion.getAttribute("cajero");
        cajero = cajeroService.get(cajero.getId());

        Usuario usuario = (Usuario) sesion.getAttribute("user");
        if (usuario != null) {
            if (!cajero.isCerrado()) {
                Bobeda bobeda = bobedaService.lastBobeda();

                //DETALLE SALDO BOBEDA
                List<Detallesaldobobeda> listaDsb = detallesaldobobedaService.listarDsbCierrePorId(bobeda.getId());
                List<Detallesaldobobeda> listaDsbNueva = new ArrayList<>();

                List<Detallesaldotransferencia> listaDst = new ArrayList<>();

                Double montoMovimiento = 0.0;

                for (Detallesaldocajero dsc : listadetallesaldocajero) {
                    saldoIngresado(listaDst, listaDsbNueva, listaDsb, dsc);
                    montoMovimiento += Double.parseDouble(formaterd.format(dsc.getMonto()));
                }

                montoMovimiento = Double.parseDouble(formaterd.format(montoMovimiento));

                if (cajero.getSaldoCierre() == montoMovimiento) {
                    Tipotransferencia ttr = new Tipotransferencia();
                    ttr.setId(4);
                    Transferencia tr = new Transferencia(bobeda, cajero, null, ttr, usuario, "CIERRE DE CAJERO " + cajero.getCaja().getNombre(), Double.parseDouble(formaterd.format(montoMovimiento)), new Date(), null);

                    bobeda.setMontoCierre(Double.parseDouble(formaterd.format(bobeda.getMontoCierre() + montoMovimiento)));
                    cajero.setSaldoCierre(Double.parseDouble(formaterd.format(cajero.getSaldoCierre() - montoMovimiento)));
                    cajero.setFechaCierre(new Date());
                    cajero.setCerrado(true);
                    cajero.setIdEstado(12);

                    int dato = cajeroService.cerrarCajero(bobeda, listaDsb, listaDsbNueva, cajero, tr, listaDst, sesion);
                    if (dato == 0) {
                        return "0";
                    } else {
                        return "{\"idTransaccion\":\"" + tr.getId() + "\"}";
                    }
                } else {
                    return "3";
                }
            } else {
                return "2";
            }
        } else {
            return "10";
        }
    }

    @RequestMapping(value = "/cerrarcajapendiente", method = RequestMethod.POST)
    @ResponseBody
    public int cerrarCajapendiente(int id, HttpSession sesion) {
        Cajero cajero = cajeroService.get(id);
        if (cajero == null) {
            return 0;
        } else {
            cajero.setFechaCierre(new Date());
            cajero.setCerrado(true);
            cajero.setIdEstado(12);
            return cajeroService.update(cajero);
        }
    }

    @RequestMapping(value = "/reaperturarcaja", method = RequestMethod.POST)
    @ResponseBody
    public int reaperturarCaja(int id, HttpSession sesion) {
        Usuario usuario = (Usuario) sesion.getAttribute("user");
        if (usuario != null) {
            Cajero cajero = cajeroService.get(id);
            cajero.setCerrado(false);
            cajero.setIdEstado(11);

            Transferencia tr = transferenciaService.obtenerTransferenciaCierreDeCaja(id);
            tr.setTipotransferencia(new Tipotransferencia(2));
            tr.setMotivo("REMESA A BOBEDA DESDE " + cajero.getCaja().getNombre());

            return cajeroService.reaperturarCajero(cajero, tr);
        } else {
            return 10;
        }
    }

    @RequestMapping(value = "/absolvermoracuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public int absolverMoracuentacredito(int id, HttpSession sesion) {
        Cajero c = (Cajero) sesion.getAttribute("cajero");
        if (!c.isCerrado()) {
            Desembolso des = desembolsoService.get(id);
            if (des.getEstadodesembolso().getId() != 3) {
                des.setEstadodesembolso(new Estadodesembolso(3));
                des.setMora(0.0);

                int dato = desembolsoService.update(des);

                if (dato == 1) {
                    //ACTUALIZA CUENTA
                    if (cuentacreditoService.estaCancelada(des.getCuentacredito().getId())) {
                        cuentacreditoService.cerrarCuentacredito(des.getCuentacredito().getId());
                    }
                    return 1;
                } else {
                    return 0;
                }
            } else {
                return 2;
            }
        } else {
            return 10;
        }
    }

    @RequestMapping(value = "/comprobante", method = RequestMethod.GET)
    public String comprobante(HttpSession sesion) {
        return new SessionUtil().sesion("operaciones/comprobante", sesion, 2, new ModelMap());
    }

    @RequestMapping(value = "/obtenercodigocomp", method = RequestMethod.POST)
    @ResponseBody
    public int obtenerCodigocomp() {
        return comprobanteService.lastComprobante();
    }

    @RequestMapping(value = "/comprobante", method = RequestMethod.POST)
    @ResponseBody
    public int saveComprobante(@RequestBody List<Detallecomprobante> dtc, HttpSession sesion) {
        return comprobanteService.saveComprobante(dtc, sesion);
    }

    @RequestMapping(value = "/quitarcomprobante", method = RequestMethod.POST)
    @ResponseBody
    public int quitarComprobante(@RequestBody Comprobante c, HttpSession sesion) {
        return comprobanteService.deleteComprobante(c.getId());
    }

//    @RequestMapping(value = "/agregardetallecomprobante", method = RequestMethod.POST)
//    @ResponseBody
//    public List<String> agregarDetallecomprobante(@RequestBody Detallecomprobante detallecomprobante, HttpSession sesion) {
//        List<Detallecomprobante> listaDetallecomprobante = (List<Detallecomprobante>) sesion.getAttribute("listaDetallecomprobante");
//        List<String> listaCadena = new ArrayList<>();
//
//        if (listaDetallecomprobante == null || listaDetallecomprobante.isEmpty()) {
//            listaDetallecomprobante = new ArrayList<>();
//            listaDetallecomprobante.add(detallecomprobante);
//        } else {
//            listaDetallecomprobante.add(detallecomprobante);
//        }
//        sesion.setAttribute("listaDetallecomprobante", listaDetallecomprobante);
//
//        //LECTURA Y DEVOLUCION DE LISTA REPRESENTANTE
//        String cadena;
//        int c = 0;
//        for (Detallecomprobante dc : listaDetallecomprobante) {
//            cadena = "{\"id\":" + c + ","
//                    + "\"descripcion\":\"" + dc.getDescripcion() + "\","
//                    + "\"motivo\":\"" + dc.getTipodocumento().getId() + "\","
//                    + "\"monto\":\"" + dc.getMonto() + "\"}";
//            listaCadena.add(cadena);
//            c++;
//        }
//        return listaCadena;
//    }
//    @RequestMapping(value = "/quitardetallecomprobante", method = RequestMethod.POST)
//    @ResponseBody
//    public List<String> quitarDetallecomprobante(int id, HttpSession sesion) {
//        List<Detallecomprobante> listaDetallecomprobante = (List<Detallecomprobante>) sesion.getAttribute("listaDetallecomprobante");
//        List<String> listaCadena = new ArrayList<>();
//
//        if (listaDetallecomprobante == null) {
//            return listaCadena;
//        } else {
//            listaDetallecomprobante.remove(id);
//        }
//        sesion.setAttribute("listaDetallecomprobante", listaDetallecomprobante);
//
//        //LECTURA Y DEVOLUCION DE LISTA REPRESENTANTE
//        String cadena;
//        int c = 0;
//        for (Detallecomprobante dc : listaDetallecomprobante) {
//            cadena = "{\"id\":" + c + ","
//                    + "\"descripcion\":\"" + dc.getDescripcion() + "\","
//                    + "\"motivo\":\"" + dc.getTipodocumento().getId() + "\","
//                    + "\"monto\":\"" + dc.getMonto() + "\"}";
//            listaCadena.add(cadena);
//            c++;
//        }
//        return listaCadena;
//    }
    @RequestMapping(value = "/comprobantesingresoegreso", method = RequestMethod.POST)
    @ResponseBody
    public List<String> comprobantesIngresoegreso(int idCliente, HttpSession sesion) {
        List<String> listaCadena = new ArrayList<>();
        List<Comprobante> listaComprobante = comprobanteService.listPorCliente(idCliente);

        if (listaComprobante == null || listaComprobante.isEmpty()) {
            return listaCadena;
        } else {
            for (Comprobante comprobante : listaComprobante) {
                Personanatural pnc = personanaturalService.obtenerPorCodigoCliente(idCliente);
                if (pnc != null) {
                    String cadena = "{\"id\":\"" + comprobante.getId() + "\","
                            + "\"cliente\":\"" + pnc.getPersona().getNombre() + " " + pnc.getPersona().getApellidoPat() + " " + pnc.getPersona().getApellidoMat() + "\","
                            + "\"fecha\":\"" + formater.format(comprobante.getFecha()) + "\","
                            + "\"monto\":\"" + comprobante.getMonto() + "\","
                            + "\"glosa\":\"" + comprobante.getGlosa() + "\","
                            + "\"tipoCliente\":\"CN\","
                            + "\"idnaturalezaComprobante\":" + comprobante.getNaturalezacomprobante().getId() + ","
                            + "\"naturalezaComprobante\":\"" + comprobante.getNaturalezacomprobante().getDenominacion() + "\"}";

                    listaCadena.add(cadena);
                } else {
                    Personajuridica pjc = personajuridicaService.obtenerPorCodigoCliente(idCliente);
                    String cadena = "{\"id\":\"" + comprobante.getId() + "\","
                            + "\"cliente\":\"" + pjc.getRazonSocial() + " " + pjc.getNombreComercial() + "\","
                            + "\"fecha\":\"" + formater.format(comprobante.getFecha()) + "\","
                            + "\"monto\":\"" + comprobante.getMonto() + "\","
                            + "\"glosa\":\"" + comprobante.getGlosa() + "\","
                            + "\"tipoCliente\":\"CJ\","
                            + "\"idnaturalezaComprobante\":" + comprobante.getNaturalezacomprobante().getId() + ","
                            + "\"naturalezaComprobante\":\"" + comprobante.getNaturalezacomprobante().getDenominacion() + "\"}";
                    listaCadena.add(cadena);
                }
            }
            return listaCadena;
        }
    }

    @RequestMapping(value = "/transaccioncomprobante", method = RequestMethod.POST)
    @ResponseBody
    public String transaccionComprobante(int id, String nombreCliente, HttpSession sesion) {
        Cajero c = (Cajero) sesion.getAttribute("cajero");
        c = cajeroService.get(c.getId());

        if (!c.isCerrado()) {
            Comprobante comprobante = comprobanteService.get(id);
            List<Detallecomprobante> listaDetallecomprobante = detallecomprobanteService.listDetallecomprobante(id);
            if (comprobante.getNaturalezacomprobante().getId() == 1) {
                //INGRESO
                c.setSaldoCierre(Double.parseDouble(formaterd.format(c.getSaldoCierre() + comprobante.getMonto())));
                Tipotransaccion ttr = tipotransaccionService.get(4);

                //OBTENEMOS DATOS
                Cliente cl = clienteService.get(comprobante.getCliente().getId());

                if (comprobante.getIdEstado() == 1) {

                    String codigo = "TR-00" + (transaccionService.obtenerNumeroTransaccion() + 1);

                    Transaccion tr = new Transaccion(c, cl, ttr, codigo, new Date(), nombreCliente);
                    tr.setGlosa(comprobante.getGlosa());

                    List<Operacion> listaOperacion = new ArrayList<>();
                    for (Detallecomprobante dc : listaDetallecomprobante) {
                        Operacion op = new Operacion(tr, dc.getDescripcion(), "-", 0.0, Double.parseDouble(formaterd.format(dc.getMonto())), Double.parseDouble(formaterd.format(dc.getMonto())));
                        listaOperacion.add(op);
                    }

                    //ACTUALIZACION DE ESTADO COMPROBANTE
                    comprobante.setIdEstado(2);

                    int dato = transaccionService.transaccionComprobante(comprobante, tr, listaOperacion, c, sesion);
                    if (dato == 1) {
                        String cadena = "{\"id\":\"" + tr.getId() + "\","
                                + "\"codigo\":\"" + tr.getCodigo() + "\","
                                + "\"fecha\":\"" + formater.format(tr.getFecha()) + "\","
                                + "\"nombreCliente\":\"" + tr.getNombrecliente() + "\","
                                + "\"idTipotransaccion\":" + tr.getTipotransaccion().getId() + ","
                                + "\"monto\":" + comprobante.getMonto() + ","
                                + "\"tipoTransaccion\":\"" + tr.getTipotransaccion().getDenominacion() + "\"}";
                        return cadena;
                    } else {
                        return "0";
                    }
                } else {
                    //TRANSACCIONADO
                    return "3";
                }
            } else {
                //EGRESO
                if (c.getSaldoCierre() >= comprobante.getMonto()) {
                    c.setSaldoCierre(Double.parseDouble(formaterd.format(c.getSaldoCierre() - comprobante.getMonto())));
                    Tipotransaccion ttr = tipotransaccionService.get(3);

                    //OBTENEMOS DATOS
                    Cliente cl = clienteService.get(comprobante.getCliente().getId());

                    if (comprobante.getIdEstado() == 1) {

                        String codigo = "TR-00" + (transaccionService.obtenerNumeroTransaccion() + 1);

                        Transaccion tr = new Transaccion(c, cl, ttr, codigo, new Date(), nombreCliente);
                        List<Operacion> listaOperacion = new ArrayList<>();
                        for (Detallecomprobante dc : listaDetallecomprobante) {
                            Operacion op = new Operacion(tr, dc.getDescripcion(), "-", 0.0, Double.parseDouble(formaterd.format(dc.getMonto())), Double.parseDouble(formaterd.format(dc.getMonto())));
                            listaOperacion.add(op);
                        }

                        //ACTUALIZACION DE ESTADO COMPROBANTE
                        comprobante.setIdEstado(2);

                        int dato = transaccionService.transaccionComprobante(comprobante, tr, listaOperacion, c, sesion);
                        if (dato == 1) {
                            String cadena = "{\"id\":\"" + tr.getId() + "\","
                                    + "\"codigo\":\"" + tr.getCodigo() + "\","
                                    + "\"fecha\":\"" + formater.format(tr.getFecha()) + "\","
                                    + "\"nombreCliente\":\"" + tr.getNombrecliente() + "\","
                                    + "\"idTipotransaccion\":" + tr.getTipotransaccion().getId() + ","
                                    + "\"tipoTransaccion\":\"" + tr.getTipotransaccion().getDenominacion() + "\"}";
                            return cadena;
                        } else {
                            return "0";
                        }
                    } else {
                        //TRANSACCIONADO
                        return "3";
                    }
                } else {
                    //NO HAY SALDO
                    return "2";
                }
            }
        } else {
            //SESION TERMINADA
            return "10";
        }
    }

    @RequestMapping(value = "/listatransaccion", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listaTransaccion(HttpSession sesion) {
        Cajero c = (Cajero) sesion.getAttribute("cajero");
        return transaccionService.listarTransacciones(c.getId());
    }

    @RequestMapping(value = "/listarcomprobante", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarComprobante(HttpSession sesion) {
        return comprobanteService.listarComprobanteCompleto();
    }

    public void saldoIngresado(List<Detallesaldotransferencia> listaDst, List<Detallesaldobobeda> listaDsbNueva, List<Detallesaldobobeda> listaDsbActualizable, Detallesaldocajero dsc) {
        Detallesaldotransferencia dst = new Detallesaldotransferencia(null, dsc.getDenominacion(), dsc.getValor(), dsc.getCantidad(), dsc.getMonto(), false);
        listaDst.add(dst);

        int indice = -1;
        for (int i = 0; i < listaDsbActualizable.size(); i++) {
            Detallesaldobobeda dsb = listaDsbActualizable.get(i);
            if (dsb.getValor() == dsc.getValor()) {
                indice = i;
            }
        }

        int indice2 = -1;
        for (int i = 0; i < listaDsbNueva.size(); i++) {
            Detallesaldobobeda dsb = listaDsbNueva.get(i);
            if (dsb.getValor() == dsc.getValor()) {
                indice2 = i;
            }
        }

        if (indice != -1) {
            Detallesaldobobeda dsb = listaDsbActualizable.get(indice);
            dsb.setCantidad(dsb.getCantidad() + dsc.getCantidad());
            dsb.setMonto(Double.parseDouble(formaterd.format(dsb.getMonto() + dsc.getCantidad() * dsc.getValor())));
        } else {
            if (indice2 != -1) {
                Detallesaldobobeda dsbAux = listaDsbNueva.get(indice2);
                dsbAux.setCantidad(dsbAux.getCantidad() + dsc.getCantidad());
                dsbAux.setMonto(Double.parseDouble(formaterd.format(dsbAux.getMonto() + dsc.getCantidad() * dsc.getValor())));
            } else {
                Detallesaldobobeda dsb2 = new Detallesaldobobeda(null, dsc.getDenominacion(), dsc.getValor(), dsc.getCantidad(), Double.parseDouble(formaterd.format(dsc.getMonto())), false);
                listaDsbNueva.add(dsb2);
            }

        }
    }

    public int incluidoEnListaBobeda(Detallesaldotransferencia dst, List<Detallesaldobobeda> lista) {
        int item = -1;
        for (int i = 0; i < lista.size(); i++) {
            Detallesaldobobeda dsb = lista.get(i);
            if (dsb.getDenominacion().equals(dst.getDenominacion())) {
                item = i;
            }
        }
        return item;
    }

    public int incluidoEnListaCajero(Detallesaldotransferencia dst, List<Detallesaldocajero> lista) {
        int item = -1;
        for (int i = 0; i < lista.size(); i++) {
            Detallesaldocajero dsc = lista.get(i);
            if (dsc.getDenominacion().equals(dst.getDenominacion())) {
                item = i;
            }
        }
        return item;
    }
}
