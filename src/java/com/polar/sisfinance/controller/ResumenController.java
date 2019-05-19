/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Productocredito;
import com.polar.sisfinance.entity.news.Fechas;
import com.polar.sisfinance.service.AgenciaService;
import com.polar.sisfinance.service.CuentacreditoService;
import com.polar.sisfinance.service.PersonajuridicaService;
import com.polar.sisfinance.service.PersonanaturalService;
import com.polar.sisfinance.service.ProductocreditoService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
@RequestMapping("resumen")
public class ResumenController {

    @Autowired
    CuentacreditoService cuentacreditoService;
    @Autowired
    PersonanaturalService personanaturalService;
    @Autowired
    PersonajuridicaService personajuridicaService;
    @Autowired
    AgenciaService agenciaService;
    @Autowired
    ProductocreditoService productocreditoService;

    @RequestMapping(value = "/carteramorosa", method = RequestMethod.GET)
    public String carteraMorosa(HttpSession sesion) {
        return "resumen/carteramorosa";
    }

    @RequestMapping(value = "/listarcuentamorosa", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarCuentamorosa() {
        return cuentacreditoService.listaCarteramorosa();
    }

    @RequestMapping(value = "/buscarmorosonatural", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarMorosonatural(@RequestBody Persona p) {
        List<String> listaCadena = new ArrayList<>();
        if (p.getId() == 1) {
            List<Personanatural> lista = personanaturalService.buscarClientenaturalPorDni(p.getDni());
            if (lista == null) {
                return listaCadena;
            } else {
                int c = 0;
                for (Personanatural pn : lista) {
                    c++;
                    int numeroCuentamorosa = cuentacreditoService.numeroCuentamorosa(pn.getCliente().getId()).size();
                    String dato = "{\"id\":" + c + ","
                            + "\"codigo\":\"" + pn.getCliente().getCodigo() + "\","
                            + "\"dni\":\"" + pn.getPersona().getDni() + "\","
                            + "\"nombre\":\"" + pn.getPersona().getNombre() + "\","
                            + "\"apellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                            + "\"apellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                            + "\"cl\":\"" + pn.getCliente().getCodigo().substring(0, 2) + "\","
                            + "\"numeroCuentamorosa\":\"" + numeroCuentamorosa + "\","
                            + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";
                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } else {
            List<Personanatural> lista = personanaturalService.buscarClientenaturalPorNombre(p.getNombre(), p.getApellidoPat(), p.getApellidoMat());
            if (lista == null) {
                return listaCadena;
            } else {
                int c = 0;
                for (Personanatural pn : lista) {
                    c++;
                    int numeroCuentamorosa = cuentacreditoService.numeroCuentamorosa(pn.getCliente().getId()).size();
                    String dato = "{\"id\":" + c + ","
                            + "\"codigo\":\"" + pn.getCliente().getCodigo() + "\","
                            + "\"dni\":\"" + pn.getPersona().getDni() + "\","
                            + "\"nombre\":\"" + pn.getPersona().getNombre() + "\","
                            + "\"apellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                            + "\"apellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                            + "\"cl\":\"" + pn.getCliente().getCodigo().substring(0, 2) + "\","
                            + "\"numeroCuentamorosa\":\"" + numeroCuentamorosa + "\","
                            + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";
                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        }
    }

    @RequestMapping(value = "/buscarmorosojuridico", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarClientejuridico(@RequestBody Personajuridica p) {
        List<String> listaCadena = new ArrayList<>();
        if (p.getId() == 1) {
            List<Personajuridica> lista = personajuridicaService.buscarClientejuridicoPorRuc(p.getRuc());
            if (lista == null) {
                return listaCadena;
            } else {
                int c = 0;
                for (Personajuridica pj : lista) {
                    c++;

                    int numeroCuentamorosa = cuentacreditoService.numeroCuentamorosa(pj.getCliente().getId()).size();
                    String dato = "{\"id\":" + c + ","
                            + "\"codigo\":\"" + pj.getCliente().getCodigo() + "\","
                            + "\"ruc\":\"" + pj.getRuc() + "\","
                            + "\"razonSocial\":\"" + pj.getRazonSocial() + "\","
                            + "\"nombreComercial\":\"" + pj.getNombreComercial() + "\","
                            + "\"cl\":\"" + pj.getCliente().getCodigo().substring(0, 2) + "\","
                            + "\"numeroCuentamorosa\":\"" + numeroCuentamorosa + "\","
                            + "\"idCliente\":\"" + pj.getCliente().getId() + "\"}";

                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } else {
            List<Personajuridica> lista = personajuridicaService.buscarClientejuridicoPorNombre(p.getRazonSocial(), p.getNombreComercial());
            if (lista == null) {
                return listaCadena;
            } else {
                int c = 0;
                for (Personajuridica pj : lista) {
                    c++;
                    int numeroCuentamorosa = cuentacreditoService.numeroCuentamorosa(pj.getCliente().getId()).size();
                    String dato = "{\"id\":" + c + ","
                            + "\"codigo\":\"" + pj.getCliente().getCodigo() + "\","
                            + "\"ruc\":\"" + pj.getRuc() + "\","
                            + "\"razonSocial\":\"" + pj.getRazonSocial() + "\","
                            + "\"nombreComercial\":\"" + pj.getNombreComercial() + "\","
                            + "\"cl\":\"" + pj.getCliente().getCodigo().substring(0, 2) + "\","
                            + "\"numeroCuentamorosa\":\"" + numeroCuentamorosa + "\","
                            + "\"idCliente\":\"" + pj.getCliente().getId() + "\"}";

                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        }
    }

    @RequestMapping(value = "/buscarmorosoporfechas", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarMorosoporfechas(@RequestBody Fechas f) {
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        List<String> listaCadena = new ArrayList<>();

        try {
            List<Cuentacredito> lista = cuentacreditoService.cuentasMorosa(f.getFechaInicio(), f.getFechaFin());

            if (lista == null || lista.isEmpty()) {
                return listaCadena;
            } else {
                for (Cuentacredito cc : lista) {
                    String dato = "";
                    Personanatural pn = personanaturalService.obtenerPorCodigoCliente(cc.getCliente().getId());

                    if (pn != null) {
                        dato += "{\"codigo\":\"" + cc.getCliente().getCodigo() + "\","
                                + "\"dato1\":\"" + pn.getPersona().getDni() + "\","
                                + "\"dato2\":\"" + pn.getPersona().getNombre() + "\","
                                + "\"dato3\":\"" + pn.getPersona().getApellidoPat() + " " + pn.getPersona().getApellidoMat() + "\","
                                + "\"cl\":\"" + cc.getCliente().getCodigo().substring(0, 2) + "\","
                                + "\"numeroCuentamorosa\":\"" + cuentacreditoService.numeroCuentamorosa(cc.getCliente().getId()).size() + "\","
                                + "\"idCliente\":\"" + cc.getCliente().getId() + "\"}";
                    } else {
                        Personajuridica pj = personajuridicaService.obtenerPorCodigoCliente(cc.getCliente().getId());

                        dato += "{\"codigo\":\"" + cc.getCliente().getCodigo() + "\","
                                + "\"dato1\":\"" + pj.getRuc() + "\","
                                + "\"dato2\":\"" + pj.getRazonSocial() + "\","
                                + "\"dato3\":\"" + pj.getNombreComercial() + "\","
                                + "\"cl\":\"" + cc.getCliente().getCodigo().substring(0, 2) + "\","
                                + "\"numeroCuentamorosa\":\"" + cuentacreditoService.numeroCuentamorosa(cc.getCliente().getId()).size() + "\","
                                + "\"idCliente\":\"" + cc.getCliente().getId() + "\"}";
                    }

                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } catch (Exception e) {
            return listaCadena;
        }
    }

    @RequestMapping(value = "/buscarmorosoproductocredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarMorosoproductocredito(@RequestBody Productocredito pc) {
        List<String> listaCadena = new ArrayList<>();

        try {
            List<Object[]> lista = cuentacreditoService.cuentasMorosaPorProductocredito(pc.getId());

            if (lista == null || lista.isEmpty()) {
                return listaCadena;
            } else {
                for (Object[] o : lista) {
                    String dato = "{\"id\":\"" + o[0] + "\","
                            + "\"codigo\":\"" + o[1] + "\","
                            + "\"nombre\":\"" + o[2] + "\","
                            + "\"formaPago\":\"" + o[3] + "\","
                            + "\"tasa\":\"" + o[4] + "\","
                            + "\"numeroCuentamorosa\":\"" + o[5] + "\"}";

                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } catch (Exception e) {
            return listaCadena;
        }
    }

    @RequestMapping(value = "/reportecreditos", method = RequestMethod.GET)
    public ModelAndView reporteCreditos(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("resumen/reportecreditos");
        mav.addObject("listaProductocredito", productocreditoService.list());
        mav.addObject("listaAgencia", agenciaService.list());

        return mav;
    }

    @RequestMapping(value = "/resumencreditosporfechas", method = RequestMethod.POST)
    @ResponseBody
    public List<String> resumencreditosporfechas(String fechaInicio, String fechaFin, int idProductoCredito) {
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        List<String> listaCadena = new ArrayList<>();

        try {
            Date fechaInicio2 = formater.parse(fechaInicio);
            Date fechaFin2 = formater.parse(fechaFin);

            List<Object[]> lista = cuentacreditoService.cuentasPorProductocredito(fechaInicio2, fechaFin2, idProductoCredito);

            if (lista == null || lista.isEmpty()) {
                return listaCadena;
            } else {
                for (Object[] o : lista) {
                    String dato = "{\"id\":\"" + o[0] + "\","
                            + "\"codigo\":\"" + o[1] + "\","
                            + "\"nombre\":\"" + o[2] + "\","
                            + "\"formaPago\":\"" + o[3] + "\","
                            + "\"tasa\":\"" + o[4] + "\","
                            + "\"numero\":\"" + o[5] + "\"}";

                    listaCadena.add(dato);
                }
                return listaCadena;
            }
        } catch (Exception e) {
            return listaCadena;
        }
    }
}
