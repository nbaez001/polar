/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Caja;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentacredito;
import com.polar.sisfinance.entity.Empleado;
import com.polar.sisfinance.entity.Estadocivil;
import com.polar.sisfinance.entity.Garante;
import com.polar.sisfinance.entity.Genero;
import com.polar.sisfinance.entity.Mastertable;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Productoahorro;
import com.polar.sisfinance.entity.Productocredito;
import com.polar.sisfinance.entity.Tipoempleado;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.AgenciaService;
import com.polar.sisfinance.service.CajaService;
import com.polar.sisfinance.service.CuentacreditoService;
import com.polar.sisfinance.service.EstadocivilService;
import com.polar.sisfinance.service.FrecuenciaaporteService;
import com.polar.sisfinance.service.FrecuenciapagoService;
import com.polar.sisfinance.service.GaranteService;
import com.polar.sisfinance.service.GeneroService;
import com.polar.sisfinance.service.MastertableService;
import com.polar.sisfinance.service.PermisoService;
import com.polar.sisfinance.service.PersonaService;
import com.polar.sisfinance.service.PersonajuridicaService;
import com.polar.sisfinance.service.PersonanaturalService;
import com.polar.sisfinance.service.ProductoahorroService;
import com.polar.sisfinance.service.ProductocreditoService;
import com.polar.sisfinance.service.RolService;
import com.polar.sisfinance.service.TipoahorroService;
import com.polar.sisfinance.service.TipoempleadoService;
import com.polar.sisfinance.service.TipomonedaService;
import com.polar.sisfinance.service.UsuarioService;
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
@RequestMapping("administracion")
public class AdministracionController {

    @Autowired
    ProductocreditoService productocreditoService;
    @Autowired
    MastertableService mastertableService;
    @Autowired
    AgenciaService agenciaService;
    @Autowired
    CuentacreditoService cuentacreditoService;
    @Autowired
    FrecuenciapagoService frecuenciapagoService;
    @Autowired
    PersonanaturalService personanaturalService;
    @Autowired
    PersonajuridicaService personajuridicaService;
    @Autowired
    GaranteService garanteService;
    @Autowired
    CajaService cajaService;
    @Autowired
    RolService rolService;
    @Autowired
    UsuarioService usuarioService;
    @Autowired
    PersonaService personaService;
    @Autowired
    TipoempleadoService tipoempleadoService;
    @Autowired
    ProductoahorroService productoahorroService;
    @Autowired
    TipoahorroService tipoahorroService;
    @Autowired
    FrecuenciaaporteService frecuenciaaporteService;
    @Autowired
    TipomonedaService tipomonedaService;
    @Autowired
    PermisoService permisoService;
    @Autowired
    GeneroService generoService;
    @Autowired
    EstadocivilService estadocivilService;

    Gson gson;

    public AdministracionController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/productocredito", method = RequestMethod.GET)
    public ModelAndView productoCredito(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("administracion/productocredito");

        mav.addObject("productocredito", new Productocredito());
        
        //ADICION DE PARAMETROS DE CONSULTA
        Map<String, Object> eqParams = new HashMap<>();
        eqParams.put("idTabla", 1);
        List<String> listaAscOrders = new ArrayList<>();
        listaAscOrders.add("idItem");
        mav.addObject("listaTipocredito", mastertableService.listarTablaDeterminada(eqParams, null, listaAscOrders, null, 0));

        //MODIFICACION DE PARAMETROS PARA CONSULTA DE TIPO MONEDA
        eqParams.remove("idTabla");
        eqParams.put("idTabla", 2);
        mav.addObject("listaTipomoneda", mastertableService.listarTablaDeterminada(eqParams, null, listaAscOrders, null, 0));
        
        //MODIFICACION DE PARAMETROS PARA CONSULTA DE TIPO GARANTIA
        eqParams.remove("idTabla");
        eqParams.put("idTabla", 7);
        mav.addObject("listaTipogarantia", mastertableService.listarTablaDeterminada(eqParams, null, listaAscOrders, null, 0));

        mav.addObject("listaFrecuenciapago", frecuenciapagoService.list());

        mav.addObject("listaProductocredito", productocreditoService.list());
        return new SessionUtil().sesion(mav, sesion, 1);
    }

    @RequestMapping(value = "/productocredito", method = RequestMethod.POST)
    @ResponseBody
    public String guardarProductocredito(@RequestBody Productocredito productocredito) {
        Calendar calendar = Calendar.getInstance();
        //INCREMENTO DE FECHA DE INICIO VIGENCIA
        calendar.setTime(productocredito.getInicioFechaVigencia());
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        productocredito.setInicioFechaVigencia(calendar.getTime());

        //INCREMENTO DE FECHA DE INICIO VIGENCIA
        calendar.setTime(productocredito.getFinFechaVigencia());
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        productocredito.setFinFechaVigencia(calendar.getTime());

        productocredito.setCodigo("PC-00" + (productocreditoService.obtenerNumeroProductocredito() + 1));
        productocredito.setEstado(true);

        int dato = productocreditoService.create(productocredito);
        if (dato == 0) {
            return "0";
        } else {
            Mastertable mt = mastertableService.get(productocredito.getIdTipoMoneda());
            String moneda = (mt == null) ? "NULL" : mt.getDenominacion();

            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

            String cadena = "{\"id\":\"" + productocredito.getId() + "\","
                    + "\"codigo\":\"" + productocredito.getCodigo() + "\","
                    + "\"nombre\":\"" + productocredito.getNombre() + "\","
                    + "\"descripcion\":\"" + productocredito.getDescripcion() + "\","
                    + "\"montoMinimo\":\"" + productocredito.getMontoMinimo() + "\","
                    + "\"montoMaximo\":\"" + productocredito.getMontoMaximo() + "\","
                    + "\"tasa\":\"" + productocredito.getTasa() + "\","
                    + "\"minPeriodoGracia\":\"" + productocredito.getMinDiasPlazoPago() + "\","
                    + "\"maxPeriodoGracia\":\"" + productocredito.getMaxPeriodoGracia() + "\","
                    + "\"minDiasPlazoPago\":\"" + productocredito.getMinDiasPlazoPago() + "\","
                    + "\"maxDiasPlazoPago\":\"" + productocredito.getMaxDiasPlazoPago() + "\","
                    + "\"tem\":\"" + productocredito.getTem() + "\","
                    + "\"centralRiesgo\":\"" + productocredito.getCentralRiesgo() + "\","
                    + "\"encaje\":\"" + productocredito.getEncaje() + "\","
                    + "\"tasaSeguroDesgravamen\":\"" + productocredito.getTasaSeguroDesgravamen() + "\","
                    + "\"comisionGastosAdm\":\"" + productocredito.getComisionGastosAdm() + "\","
                    + "\"inicioFechaVigencia\":\"" + formater.format(productocredito.getInicioFechaVigencia()) + "\","
                    + "\"finFechaVigencia\":\"" + formater.format(productocredito.getFinFechaVigencia()) + "\","
                    + "\"docSustentatorios\":\"" + productocredito.getDocSustentatorios() + "\","
                    + "\"estado\":\"" + productocredito.isEstado() + "\","
                    + "\"tipoMoneda\":\"" + moneda + "\","
                    + "\"idTipoMoneda\":\"" + productocredito.getIdTipoMoneda() + "\","
                    + "\"idTipoCredito\":\"" + productocredito.getIdTipoCredito() + "\","
                    + "\"idFrecuenciapago\":\"" + productocredito.getFrecuenciapago().getId() + "\","
                    + "\"frecuenciaPago\":\"" + productocredito.getFrecuenciapago().getNombre() + "\"}";

            return cadena;
        }
    }

    @RequestMapping(value = "/quitarproductocredito", method = RequestMethod.POST)
    @ResponseBody
    public int quitarProductocredito(int id) {
        Productocredito p = new Productocredito();
        p.setId(id);

        int dato = productocreditoService.delete(p);
        return dato;
    }

    @RequestMapping(value = "/modificarproductocredito", method = RequestMethod.POST)
    @ResponseBody
    public String modificarProductocredito(@RequestBody Productocredito p) {
        Calendar calendar = Calendar.getInstance();
        //INCREMENTO DE FIN FECHA VIGENCIA
        calendar.setTime(p.getFinFechaVigencia());
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        p.setFinFechaVigencia(calendar.getTime());

        //OBTENEMOS OBJETO PRINCIPAL
        Productocredito pr = productocreditoService.get(p.getId());
        //SETEO DE DATOS
        pr.setNombre(p.getNombre());
        pr.setIdTipoCredito(p.getIdTipoCredito());
        pr.setDescripcion(p.getDescripcion());
        pr.setFrecuenciapago(p.getFrecuenciapago());
        pr.setMontoMinimo(p.getMontoMinimo());
        pr.setMontoMaximo(p.getMontoMaximo());
        pr.setTasa(p.getTasa());
        pr.setMinPeriodoGracia(p.getMinPeriodoGracia());
        pr.setMaxPeriodoGracia(p.getMaxPeriodoGracia());
        pr.setMinDiasPlazoPago(p.getMinDiasPlazoPago());
        pr.setMaxDiasPlazoPago(p.getMaxDiasPlazoPago());
        pr.setTem(p.getTem());
        pr.setCentralRiesgo(p.getCentralRiesgo());
        pr.setEncaje(p.getEncaje());
        pr.setTasaSeguroDesgravamen(p.getTasaSeguroDesgravamen());
        pr.setComisionGastosAdm(p.getComisionGastosAdm());
        pr.setFinFechaVigencia(p.getFinFechaVigencia());
        pr.setDocSustentatorios(p.getDocSustentatorios());

        int dato = productocreditoService.update(pr);
        if (dato == 0) {
            return "0";
        } else {
            Mastertable mt = mastertableService.get(pr.getIdTipoMoneda());
            String moneda = (mt == null) ? "NULL" : mt.getDenominacion();

            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

            String cadena = "{\"id\":\"" + pr.getId() + "\","
                    + "\"codigo\":\"" + pr.getCodigo() + "\","
                    + "\"nombre\":\"" + pr.getNombre() + "\","
                    + "\"descripcion\":\"" + pr.getDescripcion() + "\","
                    + "\"montoMinimo\":\"" + pr.getMontoMinimo() + "\","
                    + "\"montoMaximo\":\"" + pr.getMontoMaximo() + "\","
                    + "\"tasa\":\"" + pr.getTasa() + "\","
                    + "\"minPeriodoGracia\":\"" + pr.getMinDiasPlazoPago() + "\","
                    + "\"maxPeriodoGracia\":\"" + pr.getMaxPeriodoGracia() + "\","
                    + "\"minDiasPlazoPago\":\"" + pr.getMinDiasPlazoPago() + "\","
                    + "\"maxDiasPlazoPago\":\"" + pr.getMaxDiasPlazoPago() + "\","
                    + "\"tem\":\"" + pr.getTem() + "\","
                    + "\"centralRiesgo\":\"" + pr.getCentralRiesgo() + "\","
                    + "\"encaje\":\"" + pr.getEncaje() + "\","
                    + "\"tasaSeguroDesgravamen\":\"" + pr.getTasaSeguroDesgravamen() + "\","
                    + "\"comisionGastosAdm\":\"" + pr.getComisionGastosAdm() + "\","
                    + "\"inicioFechaVigencia\":\"" + formater.format(pr.getInicioFechaVigencia()) + "\","
                    + "\"finFechaVigencia\":\"" + formater.format(pr.getFinFechaVigencia()) + "\","
                    + "\"docSustentatorios\":\"" + pr.getDocSustentatorios() + "\","
                    + "\"estado\":\"" + pr.isEstado() + "\","
                    + "\"tipoMoneda\":\"" + moneda + "\","
                    + "\"idTipoMoneda\":\"" + pr.getIdTipoMoneda() + "\","
                    + "\"idTipoCredito\":\"" + pr.getIdTipoCredito() + "\","
                    + "\"idFrecuenciapago\":\"" + pr.getFrecuenciapago().getId() + "\","
                    + "\"frecuenciaPago\":\"" + pr.getFrecuenciapago().getNombre() + "\"}";

            return cadena;
        }
    }

    @RequestMapping(value = "/admisioncredito", method = RequestMethod.GET)
    public String admisionCredito(HttpSession sesion) {
        return new SessionUtil().sesion("administracion/admisioncredito", sesion, 3, new ModelMap());
    }

    @RequestMapping(value = "/listarcuentasadmision", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarCuentasadmision() {
        List<String> lstr = new ArrayList<>();

        List<Cuentacredito> lcc = cuentacreditoService.listarCuentasParaAprobacion();
        for (Cuentacredito cc : lcc) {
            lstr.add(gson.toJson(cc));
        }
        return lstr;
    }

    @RequestMapping(value = "/obtenernombre", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerNombre(@RequestBody Cuentacredito cc) {
        Personanatural pn = (Personanatural) personanaturalService.obtenerPorCodigoCliente(cc.getCliente().getId());
        if (pn != null) {
            return "{\"nombre\":\"" + pn.getPersona().getNombre() + " " + pn.getPersona().getApellidoPat() + " " + pn.getPersona().getApellidoMat() + "\",\"cl\":\"CN\"}";
        } else {
            Personajuridica pj = (Personajuridica) personajuridicaService.obtenerPorCodigoCliente(cc.getCliente().getId());
            return "{\"nombre\":\"" + pj.getRazonSocial() + "\",\"cl\":\"CJ\"}";
        }
    }

    @RequestMapping(value = "/admisioncredito", method = RequestMethod.POST)
    @ResponseBody
    public int admisionCredito(@RequestBody Cuentacredito cc) {
        return cuentacreditoService.admisionCuentacredito(cc);
    }

    @RequestMapping(value = "/obtenerclientecn", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerClientecn(@RequestBody Cliente c) {
        Persona p = personanaturalService.obtenerPorCodigoCliente(c);
        return gson.toJson(p);
    }

    @RequestMapping(value = "/obtenerclientecj", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerClientecj(@RequestBody Cliente c) {
        Personajuridica pj = personajuridicaService.obtenerPorCodigoCliente(c.getId());
        return gson.toJson(pj);
    }

    @RequestMapping(value = "/cargardetallegarante", method = RequestMethod.POST)
    @ResponseBody
    public List<String> cargarDetallegarante(@RequestBody Cuentacredito cc) {
        List<Garante> listaGarante = garanteService.listaPorCuentacredito(cc.getId());

        List<String> listaCadena = new ArrayList<>();
        if (listaGarante == null || listaGarante.isEmpty()) {
            return listaCadena;
        } else {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            for (Garante g : listaGarante) {
                String cadena = "{\"id\":\"" + g.getId() + "\","
                        + "\"numeroGarante\":\"" + g.getNumeroGarante() + "\","
                        + "\"descripcion\":\"" + g.getDescripcion() + "\","
                        + "\"fechaActivacion\":\"" + format.format(g.getFechaActivacion()) + "\","
                        + "\"fechaLevantamiento\":\"" + format.format(g.getFechaLevantamiento()) + "\","
                        + "\"importeGarante\":\"" + g.getImporteGarante() + "\","
                        + "\"importeComprometido\":\"" + g.getImporteComprometido() + "\","
                        + "\"importeLibre\":\"" + g.getImporteLibre() + "\","
                        + "\"estado\":\"" + g.isEstado() + "\","
                        + "\"tipoGrante\":\"" + g.getTipoGarante() + "\","
                        + "\"tipoMoneda\":\"" + g.getTipoMoneda() + "\"}";
                listaCadena.add(cadena);
            }

            return listaCadena;
        }

    }

    @RequestMapping(value = "/caja", method = RequestMethod.GET)
    public ModelAndView caja(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("administracion/caja");

        mav.addObject("listaCaja", cajaService.list());
        mav.addObject("listaAgencia", agenciaService.list());

        return new SessionUtil().sesion(mav, sesion, 6);
    }

    @RequestMapping(value = "/caja", method = RequestMethod.POST)
    @ResponseBody
    public String caja(@RequestBody Caja caja) {
        int dato = cajaService.create(caja);
        if (dato == 1) {
            String cadena = "{\"id\":\"" + caja.getId() + "\","
                    + "\"nombre\":\"" + caja.getNombre() + "\","
                    + "\"estado\":\"" + caja.isEstado() + "\"}";
            return cadena;
        } else {
            return "0";
        }
    }

    @RequestMapping(value = "/quitarcaja", method = RequestMethod.POST)
    @ResponseBody
    public int quitarCaja(int id) {
        Caja c = new Caja();
        c.setId(id);

        int dato = cajaService.delete(c);
        return dato;
    }

    @RequestMapping(value = "/administrarusuario", method = RequestMethod.GET)
    public String administrarUsuario(HttpSession sesion) {
        return new SessionUtil().sesion("administracion/usuario", sesion, 8, new ModelMap());
    }

    @RequestMapping(value = "/crearusuario", method = RequestMethod.POST)
    @ResponseBody
    public int crearUsuario(@RequestBody List<Permiso> lp) {
        return usuarioService.crearUsuario(lp);
    }

    @RequestMapping(value = "/modificarusuario", method = RequestMethod.POST)
    @ResponseBody
    public int modificarUsuario(@RequestBody List<Permiso> lp) {
        return usuarioService.modificarUsuario(lp);
    }

    @RequestMapping(value = "/eliminarusuario", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarUsuario(@RequestBody Usuario u) {
        return usuarioService.eliminarUsuario(u);
    }

    @RequestMapping(value = "/validarusuario", method = RequestMethod.POST)
    @ResponseBody
    public String validarUsuario(@RequestBody Persona p2) {
        Usuario u = usuarioService.existeUsuarioParaPersona(p2.getDni());
        if (u == null) {
            Persona p = personaService.get(p2.getDni());

            Agencia a = agenciaService.obtenerAgenciaPrincipal();
            Tipoempleado te = tipoempleadoService.list().get(0);
            if (p == null) {
                Genero g = generoService.list().get(0);
                Estadocivil ec = estadocivilService.list().get(0);
                return gson.toJson(new Usuario(-1, new Empleado(a, new Persona(ec, g, p2.getDni(), null, null, null, null, null), te, null), null, null, true));
            } else {

                return gson.toJson(new Usuario(0, new Empleado(a, p, te, null), null, null, true));
            }
        } else {
            return gson.toJson(u);
        }
    }

    @RequestMapping(value = "/productoahorro", method = RequestMethod.GET)
    public ModelAndView productoAhorro(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("administracion/productoahorro");
        return new SessionUtil().sesion(mav, sesion, 1);
    }

    @RequestMapping(value = "/productoahorro", method = RequestMethod.POST)
    @ResponseBody
    public int guardarProductoahorro(@RequestBody Productoahorro productoahorro) {
        return productoahorroService.guardarProductoahorro(productoahorro);
    }

    @RequestMapping(value = "/eliminarproductoahorro", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarProductoahorro(@RequestBody Productoahorro productoahorro) {
        return productoahorroService.delete(productoahorro);
    }

    @RequestMapping(value = "/modificarproductoahorro", method = RequestMethod.POST)
    @ResponseBody
    public String modificarProductoahorro(@RequestBody Productocredito p) {
        Calendar calendar = Calendar.getInstance();
        //INCREMENTO DE FIN FECHA VIGENCIA
        calendar.setTime(p.getFinFechaVigencia());
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        p.setFinFechaVigencia(calendar.getTime());

        //OBTENEMOS OBJETO PRINCIPAL
        Productocredito pr = productocreditoService.get(p.getId());
        //SETEO DE DATOS
        pr.setNombre(p.getNombre());
        pr.setIdTipoCredito(p.getIdTipoCredito());
        pr.setDescripcion(p.getDescripcion());
        pr.setFrecuenciapago(p.getFrecuenciapago());
        pr.setMontoMinimo(p.getMontoMinimo());
        pr.setMontoMaximo(p.getMontoMaximo());
        pr.setTasa(p.getTasa());
        pr.setMinPeriodoGracia(p.getMinPeriodoGracia());
        pr.setMaxPeriodoGracia(p.getMaxPeriodoGracia());
        pr.setMinDiasPlazoPago(p.getMinDiasPlazoPago());
        pr.setMaxDiasPlazoPago(p.getMaxDiasPlazoPago());
        pr.setTem(p.getTem());
        pr.setCentralRiesgo(p.getCentralRiesgo());
        pr.setEncaje(p.getEncaje());
        pr.setTasaSeguroDesgravamen(p.getTasaSeguroDesgravamen());
        pr.setComisionGastosAdm(p.getComisionGastosAdm());
        pr.setFinFechaVigencia(p.getFinFechaVigencia());
        pr.setDocSustentatorios(p.getDocSustentatorios());

        int dato = productocreditoService.update(pr);
        if (dato == 0) {
            return "0";
        } else {
            Mastertable mt = mastertableService.get(pr.getIdTipoMoneda());
            String moneda = (mt == null) ? "NULL" : mt.getDenominacion();

            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

            String cadena = "{\"id\":\"" + pr.getId() + "\","
                    + "\"codigo\":\"" + pr.getCodigo() + "\","
                    + "\"nombre\":\"" + pr.getNombre() + "\","
                    + "\"descripcion\":\"" + pr.getDescripcion() + "\","
                    + "\"montoMinimo\":\"" + pr.getMontoMinimo() + "\","
                    + "\"montoMaximo\":\"" + pr.getMontoMaximo() + "\","
                    + "\"tasa\":\"" + pr.getTasa() + "\","
                    + "\"minPeriodoGracia\":\"" + pr.getMinDiasPlazoPago() + "\","
                    + "\"maxPeriodoGracia\":\"" + pr.getMaxPeriodoGracia() + "\","
                    + "\"minDiasPlazoPago\":\"" + pr.getMinDiasPlazoPago() + "\","
                    + "\"maxDiasPlazoPago\":\"" + pr.getMaxDiasPlazoPago() + "\","
                    + "\"tem\":\"" + pr.getTem() + "\","
                    + "\"centralRiesgo\":\"" + pr.getCentralRiesgo() + "\","
                    + "\"encaje\":\"" + pr.getEncaje() + "\","
                    + "\"tasaSeguroDesgravamen\":\"" + pr.getTasaSeguroDesgravamen() + "\","
                    + "\"comisionGastosAdm\":\"" + pr.getComisionGastosAdm() + "\","
                    + "\"inicioFechaVigencia\":\"" + formater.format(pr.getInicioFechaVigencia()) + "\","
                    + "\"finFechaVigencia\":\"" + formater.format(pr.getFinFechaVigencia()) + "\","
                    + "\"docSustentatorios\":\"" + pr.getDocSustentatorios() + "\","
                    + "\"estado\":\"" + pr.isEstado() + "\","
                    + "\"tipoMoneda\":\"" + moneda + "\","
                    + "\"idTipoMoneda\":\"" + pr.getIdTipoMoneda() + "\","
                    + "\"idTipoCredito\":\"" + pr.getIdTipoCredito() + "\","
                    + "\"idFrecuenciapago\":\"" + pr.getFrecuenciapago().getId() + "\","
                    + "\"frecuenciaPago\":\"" + pr.getFrecuenciapago().getNombre() + "\"}";

            return cadena;
        }
    }
}
