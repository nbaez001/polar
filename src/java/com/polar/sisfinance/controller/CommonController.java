/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Estadocivil;
import com.polar.sisfinance.entity.Frecuenciaaporte;
import com.polar.sisfinance.entity.Genero;
import com.polar.sisfinance.entity.Naturalezacomprobante;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Productoahorro;
import com.polar.sisfinance.entity.Productocredito;
import com.polar.sisfinance.entity.Rol;
import com.polar.sisfinance.entity.Tipoahorro;
import com.polar.sisfinance.entity.Tipodocumento;
import com.polar.sisfinance.entity.Tipoempleado;
import com.polar.sisfinance.entity.Tipomoneda;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.AgenciaService;
import com.polar.sisfinance.service.EstadocivilService;
import com.polar.sisfinance.service.FrecuenciaaporteService;
import com.polar.sisfinance.service.GeneroService;
import com.polar.sisfinance.service.NaturalezacomprobanteService;
import com.polar.sisfinance.service.PersonajuridicaService;
import com.polar.sisfinance.service.PersonanaturalService;
import com.polar.sisfinance.service.ProductoahorroService;
import com.polar.sisfinance.service.ProductocreditoService;
import com.polar.sisfinance.service.RolService;
import com.polar.sisfinance.service.TipoahorroService;
import com.polar.sisfinance.service.TipodocumentoService;
import com.polar.sisfinance.service.TipoempleadoService;
import com.polar.sisfinance.service.TipomonedaService;
import com.polar.sisfinance.service.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author nerio
 */
@Controller
@RequestMapping("common")
public class CommonController {

    @Autowired
    ProductoahorroService productoahorroService;
    @Autowired
    TipoahorroService tipoahorroService;
    @Autowired
    TipomonedaService tipomonedaService;
    @Autowired
    FrecuenciaaporteService frecuenciaaporteService;
    @Autowired
    PersonanaturalService personanaturalService;
    @Autowired
    ProductocreditoService productocreditoService;
    @Autowired
    AgenciaService agenciaService;
    @Autowired
    UsuarioService usuarioService;
    @Autowired
    TipoempleadoService tipoempleadoService;
    @Autowired
    RolService rolService;
    @Autowired
    GeneroService generoService;
    @Autowired
    EstadocivilService estadocivilService;
    @Autowired
    PersonajuridicaService personajuridicaService;
    @Autowired
    NaturalezacomprobanteService naturalezacomprobanteService;
    @Autowired
    TipodocumentoService tipodocumentoService;

    Gson gson;

    public CommonController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/listarproductoahorro", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listaProductoahorro() {
        List<Productoahorro> listaProductoahorro = productoahorroService.reverseList();

        List<String> lista = new ArrayList<>();
        for (Productoahorro pa : listaProductoahorro) {
            String json = gson.toJson(pa);
            lista.add(json);
        }
        return lista;
    }

    @RequestMapping(value = "/listarproductoahorros", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listaProductoahorro(@RequestBody Productoahorro p) {
        List<Productoahorro> listaProductoahorro = productoahorroService.listarSimilar(p);

        List<String> lista = new ArrayList<>();
        for (Productoahorro pa : listaProductoahorro) {
            String json = gson.toJson(pa);
            lista.add(json);
        }
        return lista;
    }

    @RequestMapping(value = "/listartipoahorro", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarTipoahorro() {
        List<Tipoahorro> listaTipoahorro = tipoahorroService.list();
        List<String> lista = new ArrayList<>();

        for (Tipoahorro tipoahorro : listaTipoahorro) {
            String json = gson.toJson(tipoahorro);
            lista.add(json);
        }

        return lista;
    }

    @RequestMapping(value = "/listartipomoneda", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarTipomoneda() {

        List<Tipomoneda> listaTipomoneda = tipomonedaService.list();
        List<String> lista = new ArrayList<>();

        for (Tipomoneda tipomoneda : listaTipomoneda) {
            String json = gson.toJson(tipomoneda);
            lista.add(json);
        }

        return lista;
    }

    @RequestMapping(value = "/listarfrecuenciaaporte", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarFrecuenciaaporte() {

        List<Frecuenciaaporte> listaFrecuenciaaporte = frecuenciaaporteService.list();
        List<String> lista = new ArrayList<>();

        for (Frecuenciaaporte frecuenciaaporte : listaFrecuenciaaporte) {
            String json = gson.toJson(frecuenciaaporte);
            lista.add(json);
        }

        return lista;
    }

    @RequestMapping(value = "/listarpersonanatural", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarPersonanatural(@RequestBody Persona persona) {
        List<String> listaCadena = new ArrayList<>();
        if (persona.getId() == 1) {
            List<Personanatural> lista = personanaturalService.buscarClientenaturalPorDni(persona.getDni());
            for (Personanatural pn : lista) {
                listaCadena.add(gson.toJson(pn));
            }
        } else {
            List<Personanatural> lista = personanaturalService.buscarClientenaturalPorNombre(persona.getNombre(), persona.getApellidoPat(), persona.getApellidoMat());
            for (Personanatural pn : lista) {
                listaCadena.add(gson.toJson(pn));
            }
        }
        return listaCadena;
    }

    @RequestMapping(value = "/listarpersonajuridica", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarPersonajuridica(@RequestBody Personajuridica personajuridica) {
        List<String> listaCadena = new ArrayList<>();
        if (personajuridica.getId() == 1) {
            List<Personajuridica> lista = personajuridicaService.buscarClientejuridicoPorRuc(personajuridica.getRuc());
            for (Personajuridica pj : lista) {
                listaCadena.add(gson.toJson(pj));
            }
        } else {
            List<Personajuridica> lista = personajuridicaService.buscarClientejuridicoPorNombre(personajuridica.getRazonSocial(), personajuridica.getNombreComercial());
            for (Personajuridica pj : lista) {
                listaCadena.add(gson.toJson(pj));
            }
        }
        return listaCadena;
    }

    @RequestMapping(value = "/listarproductocredito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarProductocredito() {
        List<String> lstr = new ArrayList<>();
        List<Productocredito> lpc = productocreditoService.list();

        for (Productocredito pc : lpc) {
            lstr.add(gson.toJson(pc));
        }

        return lstr;
    }

    @RequestMapping(value = "/listaragencia", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarAgencia() {
        List<String> lstr = new ArrayList<>();
        List<Agencia> la = agenciaService.list();

        for (Agencia a : la) {
            lstr.add(gson.toJson(a));
        }

        return lstr;
    }

    @RequestMapping(value = "/listarusuario", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarUsuario() {
        List<String> lstr = new ArrayList<>();
        List<Usuario> lu = usuarioService.list();

        for (Usuario u : lu) {
            lstr.add(gson.toJson(u));
        }

        return lstr;
    }

    @RequestMapping(value = "/listartipoempleado", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarTipoempleado() {
        List<String> lstr = new ArrayList<>();
        List<Tipoempleado> lte = tipoempleadoService.list();

        for (Tipoempleado te : lte) {
            lstr.add(gson.toJson(te));
        }

        return lstr;
    }

    @RequestMapping(value = "/listarrol", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarRol() {
        List<String> lstr = new ArrayList<>();
        List<Rol> lr = rolService.list();

        for (Rol r : lr) {
            lstr.add(gson.toJson(r));
        }

        return lstr;
    }

    @RequestMapping(value = "/listargenero", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarGenero() {
        List<String> lstr = new ArrayList<>();
        List<Genero> lg = generoService.list();

        for (Genero g : lg) {
            lstr.add(gson.toJson(g));
        }

        return lstr;
    }

    @RequestMapping(value = "/listarestadocivil", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarEstadocivil() {
        List<String> lstr = new ArrayList<>();
        List<Estadocivil> lec = estadocivilService.list();

        for (Estadocivil ec : lec) {
            lstr.add(gson.toJson(ec));
        }

        return lstr;
    }

    @RequestMapping(value = "/listarnaturalezacomprobante", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarNaturalezacomprobante() {
        List<Naturalezacomprobante> lnc = naturalezacomprobanteService.list();
        List<String> lista = new ArrayList<>();

        for (Naturalezacomprobante nc : lnc) {
            lista.add(gson.toJson(nc));
        }

        return lista;
    }

    @RequestMapping(value = "/listartipodocumento", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarTipodocumento() {
        List<Tipodocumento> ltd = tipodocumentoService.list();
        List<String> lista = new ArrayList<>();

        for (Tipodocumento td : ltd) {
            lista.add(gson.toJson(td));
        }

        return lista;
    }
}
