/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.entity.Calendario;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Desembolso;
import com.polar.sisfinance.entity.Frecuenciapago;
import com.polar.sisfinance.entity.Garante;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Productocredito;
import com.polar.sisfinance.service.CalendarioService;
import com.polar.sisfinance.service.ClienteService;
import com.polar.sisfinance.service.CuentacreditoService;
import com.polar.sisfinance.service.FrecuenciapagoService;
import com.polar.sisfinance.service.MastertableService;
import com.polar.sisfinance.service.PersonajuridicaService;
import com.polar.sisfinance.service.PersonanaturalService;
import com.polar.sisfinance.service.ProductocreditoService;
import com.polar.sisfinance.util.SessionUtil;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("credito")
public class CreditoController {

    @Autowired
    CuentacreditoService cuentacreditoService;
    @Autowired
    CalendarioService calendarioService;
    @Autowired
    FrecuenciapagoService frecuenciapagoService;
    @Autowired
    PersonanaturalService personanaturalService;
    @Autowired
    PersonajuridicaService personajuridicaService;
    @Autowired
    ProductocreditoService productocreditoService;
    @Autowired
    MastertableService mastertableService;
    @Autowired
    ClienteService clienteService;

    Gson gson;

    public CreditoController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/cuentacredito", method = RequestMethod.GET)
    public ModelAndView cuentaCredito(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("credito/cuentacredito");
        //LIMPIAR SESION DE GARANTES PARA CREDITOS
        sesion.setAttribute("listaGarante", null);

        mav.addObject("codigoCuentacredito", "CR-00" + (cuentacreditoService.obtenerNumeroCuentacredito() + 1));

        //CALENDARIOS
        List<Calendario> listaCalendario = calendarioService.list();
        mav.addObject("listaCalendario", listaCalendario);
        //FRECUENCIAS PAGO
        List<Frecuenciapago> listaFrecuenciaPago = frecuenciapagoService.list();
        mav.addObject("listaFrecuenciapago", listaFrecuenciaPago);

        //LISTA TIPO MONEDA
        Map<String, Object> eqParams = new HashMap<>();
        eqParams.put("idTabla", 2);
        List<String> listaAscOrders = new ArrayList<>();
        listaAscOrders.add("idItem");
        mav.addObject("listaTipomoneda", mastertableService.listarTablaDeterminada(eqParams, null, listaAscOrders, null, 0));

        //LISTA TIPO GARANTE
        eqParams.put("idTabla", 3);
        mav.addObject("listaTipogarante", mastertableService.listarTablaDeterminada(eqParams, null, listaAscOrders, null, 0));

        return new SessionUtil().sesion(mav, sesion, 4);
    }

    @RequestMapping(value = "/buscarclientenatural", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarPersonanatural(Integer dni, String nombre, String apellidoPat, String apellidoMat, int id) {
        List<String> listaCadena = new ArrayList<>();
        if (id == 1) {
            List<Personanatural> lista = personanaturalService.buscarClientenaturalPorDni(dni);
            if (lista == null) {
                return listaCadena;
            } else {
                for (Personanatural pn : lista) {
                    String dato = "{\"codigo\":\"" + pn.getCliente().getCodigo() + "\","
                            + "\"dni\":\"" + pn.getPersona().getDni() + "\","
                            + "\"nombre\":\"" + pn.getPersona().getNombre() + "\","
                            + "\"apellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                            + "\"apellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                            + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";
                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } else {
            List<Personanatural> lista = personanaturalService.buscarClientenaturalPorNombre(nombre, apellidoPat, apellidoMat);
            if (lista == null) {
                return listaCadena;
            } else {
                for (Personanatural pn : lista) {
                    String dato = "{\"codigo\":\"" + pn.getCliente().getCodigo() + "\","
                            + "\"dni\":\"" + pn.getPersona().getDni() + "\","
                            + "\"nombre\":\"" + pn.getPersona().getNombre() + "\","
                            + "\"apellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                            + "\"apellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                            + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";
                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        }
    }

    @RequestMapping(value = "/buscarclientejuridico", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarClientejuridico(String ruc, String razonSocial, String nombreComercial, int id) {
        List<String> listaCadena = new ArrayList<>();
        if (id == 1) {
            List<Personajuridica> lista = personajuridicaService.buscarClientejuridicoPorRuc(ruc);
            if (lista == null) {
                return listaCadena;
            } else {
                for (Personajuridica pj : lista) {
                    String dato = "{\"codigo\":\"" + pj.getCliente().getCodigo() + "\","
                            + "\"ruc\":\"" + pj.getRuc() + "\","
                            + "\"razonSocial\":\"" + pj.getRazonSocial() + "\","
                            + "\"nombreComercial\":\"" + pj.getNombreComercial() + "\","
                            + "\"idCliente\":\"" + pj.getCliente().getId() + "\"}";
                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } else {
            List<Personajuridica> lista = personajuridicaService.buscarClientejuridicoPorNombre(razonSocial, nombreComercial);
            if (lista == null) {
                return listaCadena;
            } else {
                for (Personajuridica pj : lista) {
                    String dato = "{\"codigo\":\"" + pj.getCliente().getCodigo() + "\","
                            + "\"ruc\":\"" + pj.getRuc() + "\","
                            + "\"razonSocial\":\"" + pj.getRazonSocial() + "\","
                            + "\"nombreComercial\":\"" + pj.getNombreComercial() + "\","
                            + "\"idCliente\":\"" + pj.getCliente().getId() + "\"}";
                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        }
    }

    @RequestMapping(value = "/buscarProductocredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarProductocredito(String texto, int idTipomoneda) {
        Map<String, Object> likeParams = new HashMap<>();
        likeParams.put("nombre", texto);

        Map<String, Object> eqParams = new HashMap<>();
        eqParams.put("idTipoMoneda", idTipomoneda);

        if (texto != null) {
            List<Productocredito> lista = productocreditoService.buscarProductocredito(likeParams, eqParams);

            if (lista == null) {
                return null;
            } else {
                List<String> listaCadena = new ArrayList<>();
                String cadena;
                for (Productocredito pc : lista) {
                    cadena = "{\"id\":\"" + pc.getId() + "\","
                            + "\"codigo\":\"" + pc.getCodigo() + "\","
                            + "\"nombre\":\"" + pc.getNombre() + "\","
                            + "\"descripcion\":\"" + pc.getDescripcion() + "\","
                            + "\"montoMinimo\":\"" + pc.getMontoMinimo() + "\","
                            + "\"montoMaximo\":\"" + pc.getMontoMaximo() + "\","
                            + "\"tasa\":\"" + pc.getTasa() + "\","
                            + "\"minPeriodoGracia\":\"" + pc.getMinPeriodoGracia() + "\","
                            + "\"maxPeriodoGracia\":\"" + pc.getMaxPeriodoGracia() + "\","
                            + "\"minDiasPlazoPago\":\"" + pc.getMinDiasPlazoPago() + "\","
                            + "\"maxDiasPlazoPago\":\"" + pc.getMaxDiasPlazoPago() + "\","
                            + "\"tem\":\"" + pc.getTem() + "\","
                            + "\"centralRiesgo\":\"" + pc.getCentralRiesgo() + "\","
                            + "\"encaje\":\"" + pc.getEncaje() + "\","
                            + "\"tasaSeguroDesgravamen\":\"" + pc.getTasaSeguroDesgravamen() + "\","
                            + "\"comisionGastosAdm\":\"" + pc.getComisionGastosAdm() + "\","
                            + "\"inicioFechaVigencia\":\"" + pc.getInicioFechaVigencia() + "\","
                            + "\"finFechaVigencia\":\"" + pc.getFinFechaVigencia() + "\","
                            + "\"docSustentatorios\":\"" + pc.getDocSustentatorios() + "\","
                            + "\"estado\":\"" + pc.isEstado() + "\","
                            + "\"idTipoMoneda\":\"" + pc.getIdTipoMoneda() + "\","
                            + "\"idTipoCredito\":\"" + pc.getIdTipoCredito() + "\"}";
                    listaCadena.add(cadena);
                }
                return listaCadena;
            }
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/calcularcuotas", method = RequestMethod.POST)
    @ResponseBody
    public List<String> calcularcuotas(@RequestBody Cuentacredito cuentacredito) {
        //MODIFICACION DE FECHA APERTURA
        Calendar calendar = Calendar.getInstance();
        List<String> listaCadena = new ArrayList<>();
        if (cuentacredito.getFechaApertura() != null) {
            calendar.setTime(cuentacredito.getFechaApertura());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            cuentacredito.setFechaApertura(calendar.getTime());

            List<Desembolso> lista = cuentacreditoService.calcularCuotas(cuentacredito);

            if (lista != null) {
                String cadena;
                SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                for (Desembolso des : lista) {
                    cadena = "{\"fechaVence\":\"" + formater.format(des.getFechaVence()) + "\","
                            + "\"diaPago\":\"" + des.getDiaPago() + "\","
                            + "\"cuota\":\"" + des.getCuota() + "\","
                            + "\"interes\":\"" + des.getInteres() + "\","
                            + "\"amortizacion\":\"" + des.getAmortizacion() + "\","
                            + "\"saldoInsoluto\":\"" + des.getSaldoInsoluto() + "\","
                            + "\"deudaExtinguida\":\"" + des.getDeudaExtinguida() + "\"}";
                    listaCadena.add(cadena);
                }
                return listaCadena;
            } else {
                return listaCadena;
            }
        } else {
            return listaCadena;
        }
    }

    @RequestMapping(value = "/agregargarante", method = RequestMethod.POST)
    @ResponseBody
    public List<String> agregargarante(@RequestBody Garante garante, HttpSession sesion) {
        List<Garante> listaGarante = (List<Garante>) sesion.getAttribute("listaGarante");
        List<String> listaCadena = new ArrayList<>();

        if (garante.getFechaActivacion() == null || garante.getFechaLevantamiento() == null) {
            return listaCadena;
        } else {
            //SETEO DE FECHAS
            Calendar calendar = Calendar.getInstance();

            calendar.setTime(garante.getFechaActivacion());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            garante.setFechaActivacion(calendar.getTime());

            calendar.setTime(garante.getFechaLevantamiento());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            garante.setFechaLevantamiento(calendar.getTime());

            if (listaGarante == null) {
                listaGarante = new ArrayList<>();
                listaGarante.add(garante);
            } else {
                listaGarante.add(garante);
            }
            sesion.setAttribute("listaGarante", listaGarante);

            //LECTURA Y DEVOLUCION DE LISTA GARANTES
            String cadena;
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            for (Garante g : listaGarante) {
                cadena = "{\"id\":\"" + g.getId() + "\","
                        + "\"numeroGarante\":\"" + g.getNumeroGarante() + "\","
                        + "\"descripcion\":\"" + g.getDescripcion() + "\","
                        + "\"fechaActivacion\":\"" + formater.format(g.getFechaActivacion()) + "\","
                        + "\"fechaLevantamiento\":\"" + formater.format(g.getFechaLevantamiento()) + "\","
                        + "\"importeGarante\":\"" + g.getImporteGarante() + "\","
                        + "\"importeComprometido\":\"" + g.getImporteComprometido() + "\","
                        + "\"importeLibre\":\"" + g.getImporteLibre() + "\","
                        + "\"estado\":\"" + g.isEstado() + "\","
                        + "\"tipoGarante\":\"" + g.getTipoGarante() + "\","
                        + "\"tipoMoneda\":\"" + g.getTipoMoneda() + "\","
                        + "\"idCuentacredito\":\"" + g.getCuentacredito() + "\"}";
                listaCadena.add(cadena);
            }
            return listaCadena;
        }

    }

    @RequestMapping(value = "/crearcuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public int crearcuentacredito(@RequestBody Cuentacredito cuentacredito, HttpSession sesion) {
        //MODIFICACION DE FECHA APERTURA
        Calendar calendar = Calendar.getInstance();
        if (cuentacredito.getFechaApertura() != null) {
            calendar.setTime(cuentacredito.getFechaApertura());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            cuentacredito.setFechaApertura(calendar.getTime());

            cuentacredito.setImporteCredito(cuentacredito.getImporteCredito());

            List<Desembolso> listaDesembolso = cuentacreditoService.calcularCuotas(cuentacredito);
            List<Garante> listaGarante = (List<Garante>) sesion.getAttribute("listaGarante");

            int dato = cuentacreditoService.crearCuentacredito(cuentacredito, listaDesembolso, listaGarante);
            sesion.setAttribute("listaGarante", null);

            return dato;
        } else {
            return 0;
        }
    }

    //INVALIDO, POR DESAPARECER
    @RequestMapping(value = "/listarcuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarcuentacredito(int idCliente) {
        Cliente cl = clienteService.get(idCliente);

        List<String> listaCadena = new ArrayList<>();
        if (cl != null) {
            List<Cuentacredito> listaCuentacredito = cuentacreditoService.listarCuentasPorCliente(cl.getId());

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
                            + "\"idEstadocredito\":" + cc.getEstadocredito().getId() + ","
                            + "\"cliente\":\"" + cc.getCliente().getCodigo().substring(0, 2) + "\"}";
                    listaCadena.add(cadena);
                }
                return listaCadena;
            }
        } else {
            return listaCadena;
        }
    }

    @RequestMapping(value = "/listarcuentascredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarcuentascredito(@RequestBody Cliente c) {
        List<String> lstr = new ArrayList<>();
        List<Cuentacredito> lcc = cuentacreditoService.listarCuentascredito(c);

        for (Cuentacredito cc : lcc) {
            lstr.add(gson.toJson(cc));
        }

        return lstr;
    }

    @RequestMapping(value = "/obtenerproductocredito", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerProductocredito(int idProductocredito) {
        Productocredito pc = productocreditoService.get(idProductocredito);
        if (pc != null) {
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            String cadena = "{\"id\":\"" + pc.getId() + "\","
                    + "\"idFrecuenciapago\":\"" + pc.getFrecuenciapago().getId() + "\","
                    + "\"frecuenciapago\":\"" + pc.getFrecuenciapago().getNombre() + "\","
                    + "\"codigo\":\"" + pc.getCodigo() + "\","
                    + "\"nombre\":\"" + pc.getNombre() + "\","
                    + "\"descripcion\":\"" + pc.getDescripcion() + "\","
                    + "\"montoMinimo\":\"" + pc.getMontoMinimo() + "\","
                    + "\"montoMaximo\":\"" + pc.getMontoMaximo() + "\","
                    + "\"tasa\":\"" + pc.getTasa() + "\","
                    + "\"minPeriodoGracia\":\"" + pc.getMinPeriodoGracia() + "\","
                    + "\"maxPeriodoGracia\":\"" + pc.getMaxPeriodoGracia() + "\","
                    + "\"minDiasPlazoPago\":\"" + pc.getMinDiasPlazoPago() + "\","
                    + "\"maxDiasPlazoPago\":\"" + pc.getMaxDiasPlazoPago() + "\","
                    + "\"tem\":\"" + pc.getTem() + "\","
                    + "\"centralRiesgo\":\"" + pc.getCentralRiesgo() + "\","
                    + "\"encaje\":\"" + pc.getEncaje() + "\","
                    + "\"tasaSeguroDesgravamen\":\"" + pc.getTasaSeguroDesgravamen() + "\","
                    + "\"comisionGastosAdm\":\"" + pc.getComisionGastosAdm() + "\","
                    + "\"inicioFechaVigencia\":\"" + formater.format(pc.getInicioFechaVigencia()) + "\","
                    + "\"finFechaVigencia\":\"" + formater.format(pc.getFinFechaVigencia()) + "\","
                    + "\"docSustentatorios\":\"" + pc.getDocSustentatorios() + "\","
                    + "\"idFrecuenciapago\":\"" + pc.getFrecuenciapago().getId() + "\","
                    + "\"estado\":\"" + pc.isEstado() + "\"}";
            return cadena;
        } else {
            return null;
        }
    }

    @RequestMapping(value = "/seguimiento", method = RequestMethod.GET)
    public ModelAndView seguimiento(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("credito/seguimiento");
        return mav;
    }

    @RequestMapping(value = "/eliminarcuentacredito", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarCuentacredito(int id, HttpSession sesion) {
        return cuentacreditoService.quitarCuentacredito(id);
    }
}
