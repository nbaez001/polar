/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Conyugue;
import com.polar.sisfinance.entity.Departamento;
import com.polar.sisfinance.entity.Distrito;
import com.polar.sisfinance.entity.Estadocivil;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Provincia;
import com.polar.sisfinance.entity.Representantelegal;
import com.polar.sisfinance.service.ClienteService;
import com.polar.sisfinance.service.PersonanaturalService;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.polar.sisfinance.entity.news.Data;
import com.polar.sisfinance.service.DepartamentoService;
import com.polar.sisfinance.service.DistritoService;
import com.polar.sisfinance.service.EstadocivilService;
import com.polar.sisfinance.service.GeneroService;
import com.polar.sisfinance.service.PaisService;
import com.polar.sisfinance.service.PersonaService;
import com.polar.sisfinance.service.PersonajuridicaService;
import com.polar.sisfinance.service.ProvinciaService;
import com.polar.sisfinance.util.SessionUtil;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
@Controller
@RequestMapping("admision")
public class AdmisionController {

    @Autowired
    PersonanaturalService personanaturalService;
    @Autowired
    ClienteService clienteService;
    @Autowired
    PersonajuridicaService personajuridicaService;
    @Autowired
    PersonaService personaService;
    @Autowired
    PaisService paisService;
    @Autowired
    DepartamentoService departamentoService;
    @Autowired
    ProvinciaService provinciaService;
    @Autowired
    DistritoService distritoService;
    @Autowired
    GeneroService generoService;
    @Autowired
    EstadocivilService estadocivilService;

    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView clienteNatural(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("admision/personanatural");

        sesion.setAttribute("listaConyugue", null);

        mav.addObject("listaPersonanatural", personanaturalService.list());
        mav.addObject("listaPais", paisService.list());
        mav.addObject("listaGenero", generoService.list());
        mav.addObject("listaEstadocivil", estadocivilService.list());

        return new SessionUtil().sesion(mav, sesion, 5);
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String saveClientenatural(@RequestBody Data data, HttpSession sesion) {
        Calendar calendar = Calendar.getInstance();

        //MODIFICACION DE DATOS PERSONA
        Persona p = data.getPersona();
        if (p.getFechaNacimiento() != null) {
            calendar.setTime(p.getFechaNacimiento());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            p.setFechaNacimiento(calendar.getTime());
        }

        Persona person = personaService.get(p.getDni());
        if (person != null) {
            p.setId(person.getId());
        }

        //MODIFICACION DATOS CLIENTE
        Cliente c = data.getCliente();
        c.setCodigo("CN-00" + (personanaturalService.obtenerNumeroClientenatural() + 1));
        c.setFechaInscripcion(new Date());

        Personanatural pn = data.getPersonanatural();
        List<Conyugue> listaConyugue = (List<Conyugue>) sesion.getAttribute("listaConyugue");

        int dato;
        if (listaConyugue == null || listaConyugue.isEmpty()) {
            dato = clienteService.crearClienteNatural(p, pn, c, null);
        } else {
            if (listaConyugue.size() == 1) {
                dato = clienteService.crearClienteNatural(p, pn, c, listaConyugue.get(0));
            } else {
                return "3";
            }
        }

        if (dato == 1) {
            sesion.setAttribute("listaConyugue", null);
            String conyugue = (pn.getPersona().getConyugue() == null) ? "N" : "S";

            String cadena = "{\"id\":\"" + pn.getId() + "\","
                    + "\"clienteCodigo\":\"" + pn.getCliente().getCodigo() + "\","
                    + "\"personaNombre\":\"" + pn.getPersona().getNombre() + "\","
                    + "\"personaApellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                    + "\"personaApellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                    + "\"personaDni\":\"" + pn.getPersona().getDni() + "\","
                    + "\"personaDireccion\":\"" + pn.getPersona().getDireccion() + "\","
                    + "\"personaCelular\":\"" + pn.getPersona().getCelular() + "\","
                    + "\"clienteFechaInscripcion\":\"" + formater.format(pn.getCliente().getFechaInscripcion()) + "\","
                    + "\"personaConyugue\":\"" + conyugue + "\","
                    + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";

            return cadena;
        } else {
            return dato + "";
        }
    }

    @RequestMapping(value = "/quitarclientenatural", method = RequestMethod.POST)
    @ResponseBody
    public int quitarClientenatural(int id) {
        Personanatural pn = personanaturalService.get(id);

        int dato = clienteService.eliminarClientenatural(pn);
        return dato;
    }

    @RequestMapping(value = "/modificarclientenatural", method = RequestMethod.POST)
    @ResponseBody
    public String modificarClientenatural(@RequestBody Personanatural personanatural) {
        Calendar calendar = Calendar.getInstance();

        //MODIFICACION DE DATOS PERSONA
        Persona p = personanatural.getPersona();
        if (p.getFechaNacimiento() != null) {
            calendar.setTime(p.getFechaNacimiento());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            p.setFechaNacimiento(calendar.getTime());
        }

        int dato = clienteService.modificarClienteNatural(personanatural);
        if (dato != 1) {
            return dato + "";
        } else {
            String conyugue = (personanatural.getPersona().getConyugue() == null) ? "N" : "S";

            String cadena = "{\"id\":\"" + personanatural.getId() + "\","
                    + "\"clienteCodigo\":\"" + personanatural.getCliente().getCodigo() + "\","
                    + "\"personaNombre\":\"" + personanatural.getPersona().getNombre() + "\","
                    + "\"personaApellidoPat\":\"" + personanatural.getPersona().getApellidoPat() + "\","
                    + "\"personaApellidoMat\":\"" + personanatural.getPersona().getApellidoMat() + "\","
                    + "\"personaDni\":\"" + personanatural.getPersona().getDni() + "\","
                    + "\"personaDireccion\":\"" + personanatural.getPersona().getDireccion() + "\","
                    + "\"personaCelular\":\"" + personanatural.getPersona().getCelular() + "\","
                    + "\"clienteFechaInscripcion\":\"" + formater.format(personanatural.getCliente().getFechaInscripcion()) + "\","
                    + "\"personaConyugue\":\"" + conyugue + "\","
                    + "\"idCliente\":\"" + personanatural.getCliente().getId() + "\"}";

            return cadena;
        }
    }

    @RequestMapping(value = "/cargarclientenatural", method = RequestMethod.POST)
    @ResponseBody
    public String cargarClientenatural(int id) {
        Personanatural pn = personanaturalService.get(id);
        if (pn != null) {
            String fechaNacimiento = (pn.getPersona().getFechaNacimiento() != null) ? formater.format(pn.getPersona().getFechaNacimiento()) : "";

            String cadena = "{\"id\":\"" + pn.getId() + "\","
                    + "\"clienteCodigo\":\"" + pn.getCliente().getCodigo() + "\","
                    + "\"personaDni\":\"" + pn.getPersona().getDni() + "\","
                    + "\"personaNombre\":\"" + pn.getPersona().getNombre() + "\","
                    + "\"personaApellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                    + "\"personaApellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                    + "\"personaDireccion\":\"" + pn.getPersona().getDireccion() + "\","
                    + "\"personaDistrito\":\"" + pn.getPersona().getDistrito() + "\","
                    + "\"personaProvincia\":\"" + pn.getPersona().getProvincia() + "\","
                    + "\"personaDepartamento\":\"" + pn.getPersona().getDepartamento() + "\","
                    + "\"personaPais\":\"" + pn.getPersona().getPais() + "\","
                    + "\"personaCelular\":\"" + pn.getPersona().getCelular() + "\","
                    + "\"personaEmail\":\"" + pn.getPersona().getEmail() + "\","
                    + "\"personaRuc\":\"" + pn.getPersona().getRuc() + "\","
                    + "\"personaEstadocivil\":" + pn.getPersona().getEstadocivil().getId() + ","
                    + "\"personaFechanacimiento\":\"" + fechaNacimiento + "\","
                    + "\"personaGenero\":" + pn.getPersona().getGenero().getId() + ","
                    + "\"personaNacionalidad\":\"" + pn.getPersona().getNacionalidad() + "\","
                    + "\"personaProfesion\":\"" + pn.getPersona().getProfesion() + "\",";

            if (pn.getPersona().getConyugue() != null) {
                cadena += "\"conyugueDni\":\"" + pn.getPersona().getConyugue().getDni() + "\","
                        + "\"conyugueNombre\":\"" + pn.getPersona().getConyugue().getNombre() + "\","
                        + "\"conyugueApellidoPat\":\"" + pn.getPersona().getConyugue().getApellidoPat() + "\","
                        + "\"conyugueApellidoMat\":\"" + pn.getPersona().getConyugue().getApellidoMat() + "\","
                        + "\"conyugueNumerohijos\":\"" + pn.getPersona().getConyugue().getNumeroHijos() + "\","
                        + "\"conyugueNumerodependientes\":\"" + pn.getPersona().getConyugue().getNumeroDependientes() + "\","
                        + "\"conyugueProfesion\":\"" + pn.getPersona().getConyugue().getProfesion() + "\","
                        + "\"clienteFechaInscripcion\":\"" + formater.format(pn.getCliente().getFechaInscripcion()) + "\","
                        + "\"personaConyugue\":\"S\","
                        + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";
            } else {
                cadena += "\"conyugueDni\":\"0\","
                        + "\"conyugueNombre\":\"-\","
                        + "\"conyugueApellidoPat\":\"-\","
                        + "\"conyugueApellidoMat\":\"-\","
                        + "\"conyugueNumerohijos\":\"0\","
                        + "\"conyugueNumerodependientes\":\"0\","
                        + "\"conyugueProfesion\":\"-\","
                        + "\"clienteFechaInscripcion\":\"-\","
                        + "\"personaConyugue\":\"N\","
                        + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";
            }
            return cadena;
        } else {
            return "0";
        }
    }

    @RequestMapping(value = "/agregarconyugue", method = RequestMethod.POST)
    @ResponseBody
    public List<String> agregarConyugue(@RequestBody Conyugue conyugue, HttpSession sesion) {
        List<Conyugue> listaConyugue = (List<Conyugue>) sesion.getAttribute("listaConyugue");
        List<String> listaCadena = new ArrayList<>();

        if (listaConyugue == null) {
            listaConyugue = new ArrayList<>();
            listaConyugue.add(conyugue);
        } else {
            for (Conyugue c : listaConyugue) {
                if (c.getDni().equals(conyugue.getDni())) {
                    return listaCadena;
                }
            }
            listaConyugue.add(conyugue);
        }
        sesion.setAttribute("listaConyugue", listaConyugue);

        //LECTURA Y DEVOLUCION DE LISTA REPRESENTANTE
        String cadena;
        for (Conyugue c : listaConyugue) {
            cadena = "{\"id\":\"" + c.getId() + "\","
                    + "\"dni\":\"" + c.getDni() + "\","
                    + "\"nombre\":\"" + c.getNombre() + "\","
                    + "\"apellidoPat\":\"" + c.getApellidoPat() + "\","
                    + "\"apellidoMat\":\"" + c.getApellidoMat() + "\","
                    + "\"numeroHijos\":\"" + c.getNumeroHijos() + "\","
                    + "\"numeroDependientes\":\"" + c.getNumeroDependientes() + "\","
                    + "\"profesion\":\"" + c.getProfesion() + "\"}";
            listaCadena.add(cadena);
        }
        return listaCadena;
    }

    @RequestMapping(value = "/quitarconyugue", method = RequestMethod.POST)
    @ResponseBody
    public List<String> quitarConyugue(String dni, HttpSession sesion) {
        List<Conyugue> listaConyugue = (List<Conyugue>) sesion.getAttribute("listaConyugue");
        List<String> listaCadena = new ArrayList<>();

        if (listaConyugue == null) {
            listaConyugue = new ArrayList<>();
        } else {
            for (Conyugue c : listaConyugue) {
                if (c.getDni().equals(dni)) {
                    listaConyugue.remove(c);
                }
            }
        }
        sesion.setAttribute("listaConyugue", listaConyugue);

        //LECTURA Y DEVOLUCION DE LISTA REPRESENTANTE
        String cadena;
        for (Conyugue c : listaConyugue) {
            cadena = "{\"id\":\"" + c.getId() + "\","
                    + "\"dni\":\"" + c.getDni() + "\","
                    + "\"nombre\":\"" + c.getNombre() + "\","
                    + "\"apellidoPat\":\"" + c.getApellidoPat() + "\","
                    + "\"apellidoMat\":\"" + c.getApellidoMat() + "\","
                    + "\"numeroHijos\":\"" + c.getNumeroHijos() + "\","
                    + "\"numeroDependientes\":\"" + c.getNumeroDependientes() + "\","
                    + "\"profesion\":\"" + c.getProfesion() + "\"}";
            listaCadena.add(cadena);
        }
        return listaCadena;
    }

    @RequestMapping(value = "/clientejuridico", method = RequestMethod.GET)
    public ModelAndView clientejuridico(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("admision/personajuridica");
        //SETEAMOS REPRESENTANTE CERO
        sesion.setAttribute("listaRepresentantelegal", null);

        mav.addObject("listaPersonajuridica", personajuridicaService.list());
        mav.addObject("listaPais", paisService.list());

        return new SessionUtil().sesion(mav, sesion, 5);
    }

    @RequestMapping(value = "/clientejuridico", method = RequestMethod.POST)
    @ResponseBody
    public String saveClientejuridico(@RequestBody Personajuridica personajuridica, HttpSession sesion) {
        //MODIFICACION DATOS CLIENTE
        Cliente c = new Cliente(null, new Date(), true);
        c.setCodigo("CJ-00" + (personajuridicaService.obtenerNumeroClientejuridico() + 1));

        List<Representantelegal> listaRepresentantelegal = (List<Representantelegal>) sesion.getAttribute("listaRepresentantelegal");
        if (listaRepresentantelegal == null || listaRepresentantelegal.isEmpty()) {
            return "2";
        }

        if (personajuridicaService.existe(personajuridica.getRuc()) != null) {
            return "2";
        }

        int dato = clienteService.crearClienteJuridico(personajuridica, c, listaRepresentantelegal);
        if (dato == 1) {

            String fechaFundacion = "-";
            if (personajuridica.getFechaFundacion() != null) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                fechaFundacion = format.format(personajuridica.getFechaFundacion());
            }

            String cadena = "{\"id\":\"" + personajuridica.getId() + "\","
                    + "\"razonSocial\":\"" + personajuridica.getRazonSocial() + "\","
                    + "\"nombreComercial\":\"" + personajuridica.getNombreComercial() + "\","
                    + "\"giroNegocio\":\"" + personajuridica.getGiroNegocio() + "\","
                    + "\"ruc\":\"" + personajuridica.getRuc() + "\","
                    + "\"direccion\":\"" + personajuridica.getDireccion() + "\","
                    + "\"telefono\":\"" + personajuridica.getTelefono() + "\","
                    + "\"email\":\"" + personajuridica.getEmail() + "\","
                    + "\"fechaFundacion\":\"" + fechaFundacion + "\","
                    + "\"estado\":\"" + personajuridica.isEstado() + "\","
                    + "\"idCliente\":\"" + personajuridica.getCliente().getId() + "\","
                    + "\"codigoCliente\":\"" + personajuridica.getCliente().getCodigo() + "\"}";

            //SETEAMOS REPRESENTANTE CERO
            sesion.setAttribute("listaRepresentantelegal", null);

            return cadena;
        } else {
            return dato + "";
        }
    }

    @RequestMapping(value = "/quitarclientejuridico", method = RequestMethod.POST)
    @ResponseBody
    public int quitarClientejuridico(int id) {
        int dato = clienteService.eliminarClientejuridico(personajuridicaService.get(id));
        return dato;
    }

    @RequestMapping(value = "/modificarclientejuridico", method = RequestMethod.POST)
    @ResponseBody
    public int modificarClientejuridico() {
        return 0;
    }

    @RequestMapping(value = "/agregarrepresentantelegal", method = RequestMethod.POST)
    @ResponseBody
    public List<String> agregarRepresentantelegal(@RequestBody Representantelegal representantelegal, HttpSession sesion) {
        List<Representantelegal> listaRepresentantelegal = (List<Representantelegal>) sesion.getAttribute("listaRepresentantelegal");
        List<String> listaCadena = new ArrayList<>();

        Persona person = personaService.get(representantelegal.getPersona().getDni());
        if (person != null) {
            representantelegal.setPersona(person);
        }

        if (listaRepresentantelegal == null || listaRepresentantelegal.isEmpty()) {
            listaRepresentantelegal = new ArrayList<>();
            listaRepresentantelegal.add(representantelegal);
        } else {
            for (Representantelegal rl : listaRepresentantelegal) {
                Persona p = rl.getPersona();
                if (p.getDni().equals(representantelegal.getPersona().getDni())) {
                    return listaCadena;
                }
            }
            listaRepresentantelegal.add(representantelegal);
        }
        sesion.setAttribute("listaRepresentantelegal", listaRepresentantelegal);

        //LECTURA Y DEVOLUCION DE LISTA REPRESENTANTE
        String cadena;
        for (Representantelegal rl : listaRepresentantelegal) {
            cadena = "{\"id\":\"" + rl.getPersona().getId() + "\","
                    + "\"dni\":\"" + rl.getPersona().getDni() + "\","
                    + "\"nombre\":\"" + rl.getPersona().getNombre() + "\","
                    + "\"apellidoPat\":\"" + rl.getPersona().getApellidoPat() + "\","
                    + "\"apellidoMat\":\"" + rl.getPersona().getApellidoMat() + "\","
                    + "\"direccion\":\"" + rl.getPersona().getDireccion() + "\","
                    + "\"cargo\":\"" + rl.getCargo() + "\","
                    + "\"celular\":\"" + rl.getPersona().getCelular() + "\"}";
            listaCadena.add(cadena);
        }
        return listaCadena;
    }

    @RequestMapping(value = "/quitarrepresentantelegal", method = RequestMethod.POST)
    @ResponseBody
    public List<String> quitarRepresentantelegal(String dni, HttpSession sesion) {
        List<Representantelegal> listaRepresentantelegal = (List<Representantelegal>) sesion.getAttribute("listaRepresentantelegal");
        List<String> listaCadena = new ArrayList<>();

        if (listaRepresentantelegal == null) {
            return listaCadena;
        } else {
            for (int i = 0; i < listaRepresentantelegal.size(); i++) {
                Representantelegal rl = listaRepresentantelegal.get(i);
                if (rl.getPersona().getDni().equals(dni)) {
                    listaRepresentantelegal.remove(i);
                }
            }
        }
        sesion.setAttribute("listaRepresentantelegal", listaRepresentantelegal);

        //LECTURA Y DEVOLUCION DE LISTA REPRESENTANTE
        String cadena;
        for (Representantelegal rl : listaRepresentantelegal) {
            cadena = "{\"id\":\"" + rl.getPersona().getId() + "\","
                    + "\"dni\":\"" + rl.getPersona().getDni() + "\","
                    + "\"nombre\":\"" + rl.getPersona().getNombre() + "\","
                    + "\"apellidoPat\":\"" + rl.getPersona().getApellidoPat() + "\","
                    + "\"apellidoMat\":\"" + rl.getPersona().getApellidoMat() + "\","
                    + "\"direccion\":\"" + rl.getPersona().getDireccion() + "\","
                    + "\"cargo\":\"" + rl.getCargo() + "\","
                    + "\"celular\":\"" + rl.getPersona().getCelular() + "\"}";
            listaCadena.add(cadena);
        }
        return listaCadena;
    }

    //DUDA SOBRE USABILIDAD
    @RequestMapping(value = "/validarpersona", method = RequestMethod.POST)
    @ResponseBody
    public String validarPersona(String dni) {
        Persona p = personaService.get(dni);
        if (p == null) {
            return "0";
        } else {
            String cadena = "{\"id\":\"" + p.getId() + "\","
                    + "\"dni\":\"" + p.getDni() + "\","
                    + "\"nombre\":\"" + p.getNombre() + "\","
                    + "\"apellidoPat\":\"" + p.getApellidoPat() + "\","
                    + "\"apellidoMat\":\"" + p.getApellidoMat() + "\","
                    + "\"direccion\":\"" + p.getDireccion() + "\","
                    + "\"celular\":\"" + p.getCelular() + "\","
                    + "\"email\":\"" + p.getEmail() + "\","
                    + "\"ruc\":\"" + p.getRuc() + "\","
                    + "\"estadoCivil\":\"" + p.getEstadocivil().getDenominacion() + "\","
                    + "\"fechaNacimiento\":\"" + p.getFechaNacimiento() + "\","
                    + "\"sexo\":\"" + p.getGenero().getDenominacion() + "\"}";
            return cadena;
            //AQUI
        }
    }

    @RequestMapping(value = "/validarclientenatural", method = RequestMethod.POST)
    @ResponseBody
    public String validarClientenatural(Integer dni) {
        List<Personanatural> listaPersonanatural = personanaturalService.buscarClientenaturalPorDni2(dni);
        if (listaPersonanatural.isEmpty()) {
            Persona p = personaService.get(dni);
            if (p == null) {
                return "0";
            } else {
                String cadena = "{\"id\":\"" + p.getId() + "\","
                        + "\"dni\":\"" + p.getDni() + "\","
                        + "\"nombre\":\"" + p.getNombre() + "\","
                        + "\"apellidoPat\":\"" + p.getApellidoPat() + "\","
                        + "\"apellidoMat\":\"" + p.getApellidoMat() + "\","
                        + "\"direccion\":\"" + p.getDireccion() + "\","
                        + "\"celular\":\"" + p.getCelular() + "\","
                        + "\"email\":\"" + p.getEmail() + "\","
                        + "\"ruc\":\"" + p.getRuc() + "\","
                        + "\"estadoCivil\":\"" + p.getEstadocivil().getDenominacion() + "\","
                        + "\"fechaNacimiento\":\"" + p.getFechaNacimiento() + "\","
                        + "\"sexo\":\"" + p.getGenero().getDenominacion() + "\"}";
                return cadena;
                //AQUI
            }
        } else {
            if (listaPersonanatural.size() == 1) {
                return "1";
            } else {
                return "2";
            }
        }
    }

    @RequestMapping(value = "/cargardepartamento", method = RequestMethod.POST)
    @ResponseBody
    public List<String> cargarDepartamento(int idPais) {
        List<Departamento> listaDepartamento = departamentoService.listarPorPais(idPais);
        List<String> listaCadena = new ArrayList<>();

        if (listaDepartamento.isEmpty()) {
            return listaCadena;
        } else {
            for (Departamento d : listaDepartamento) {
                String cadena = "{\"id\":\"" + d.getId() + "\","
                        + "\"nombre\":\"" + d.getNombre() + "\"}";
                listaCadena.add(cadena);
            }
            return listaCadena;
        }
    }

    @RequestMapping(value = "/cargarprovincia", method = RequestMethod.POST)
    @ResponseBody
    public List<String> cargarProvincia(int idDepartamento) {
        List<Provincia> listaProvincia = provinciaService.listarPorDepartamento(idDepartamento);
        List<String> listaCadena = new ArrayList<>();

        if (listaProvincia.isEmpty()) {
            return listaCadena;
        } else {
            for (Provincia p : listaProvincia) {
                String cadena = "{\"id\":\"" + p.getId() + "\","
                        + "\"nombre\":\"" + p.getNombre() + "\"}";
                listaCadena.add(cadena);
            }
            return listaCadena;
        }
    }

    @RequestMapping(value = "/cargardistrito", method = RequestMethod.POST)
    @ResponseBody
    public List<String> cargarDistrito(int idProvincia) {
        List<Distrito> listaDistrito = distritoService.listarPorProvincia(idProvincia);
        List<String> listaCadena = new ArrayList<>();

        if (listaDistrito.isEmpty()) {
            return listaCadena;
        } else {
            for (Distrito d : listaDistrito) {
                String cadena = "{\"id\":\"" + d.getId() + "\","
                        + "\"nombre\":\"" + d.getNombre() + "\"}";
                listaCadena.add(cadena);
            }
            return listaCadena;
        }
    }

    @RequestMapping(value = "/persona", method = RequestMethod.GET)
    public ModelAndView persona(HttpSession sesion) {
        ModelAndView mav = new ModelAndView("admision/persona");

        mav.addObject("listaPersonanatural", personanaturalService.list());
        mav.addObject("listaPais", paisService.list());
        mav.addObject("listaGenero", generoService.list());
        mav.addObject("listaEstadocivil", estadocivilService.list());

        return new SessionUtil().sesion(mav, sesion, 5);
    }

    @RequestMapping(value = "/persona", method = RequestMethod.POST)
    @ResponseBody
    public String savePersona(@RequestBody Data data, HttpSession sesion) {
        Calendar calendar = Calendar.getInstance();

        //MODIFICACION DE DATOS PERSONA
        Persona p = data.getPersona();
        if (p.getFechaNacimiento() != null) {
            calendar.setTime(p.getFechaNacimiento());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            p.setFechaNacimiento(calendar.getTime());
        }

        Persona person = personaService.get(p.getDni());
        if (person != null) {
            p.setId(person.getId());
        }

        //MODIFICACION DATOS CLIENTE
        Cliente c = data.getCliente();
        c.setCodigo("CN-00" + (personanaturalService.obtenerNumeroClientenatural() + 1));
        c.setFechaInscripcion(new Date());

        Personanatural pn = data.getPersonanatural();

        int dato = clienteService.crearClienteNatural(p, pn, c, null);

        if (dato == 1) {
            sesion.setAttribute("listaConyugue", null);
            String conyugue = (pn.getPersona().getConyugue() == null) ? "N" : "S";

            String cadena = "{\"id\":\"" + pn.getId() + "\","
                    + "\"clienteCodigo\":\"" + pn.getCliente().getCodigo() + "\","
                    + "\"personaNombre\":\"" + pn.getPersona().getNombre() + "\","
                    + "\"personaApellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                    + "\"personaApellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                    + "\"personaDni\":\"" + pn.getPersona().getDni() + "\","
                    + "\"personaDireccion\":\"" + pn.getPersona().getDireccion() + "\","
                    + "\"personaCelular\":\"" + pn.getPersona().getCelular() + "\","
                    + "\"clienteFechaInscripcion\":\"" + formater.format(pn.getCliente().getFechaInscripcion()) + "\","
                    + "\"personaConyugue\":\"" + conyugue + "\","
                    + "\"idCliente\":\"" + pn.getCliente().getId() + "\"}";

            return cadena;
        } else {
            return dato + "";
        }
    }

    @RequestMapping(value = "/quitarpersona", method = RequestMethod.POST)
    @ResponseBody
    public int quitarPersona(int id) {
        Personanatural pn = personanaturalService.get(id);

        int dato = clienteService.eliminarClientenatural(pn);
        return dato;
    }

    @RequestMapping(value = "/modificarpersona", method = RequestMethod.POST)
    @ResponseBody
    public String modificarPersona(@RequestBody Personanatural personanatural) {
        Calendar calendar = Calendar.getInstance();

        //MODIFICACION DE DATOS PERSONA
        Persona p = personanatural.getPersona();
        if (p.getFechaNacimiento() != null) {
            calendar.setTime(p.getFechaNacimiento());
            calendar.add(Calendar.DAY_OF_YEAR, 1);
            p.setFechaNacimiento(calendar.getTime());
        }

        int dato = clienteService.modificarClienteNatural(personanatural);
        if (dato != 1) {
            return dato + "";
        } else {
            String conyugue = (personanatural.getPersona().getConyugue() == null) ? "N" : "S";

            String cadena = "{\"id\":\"" + personanatural.getId() + "\","
                    + "\"clienteCodigo\":\"" + personanatural.getCliente().getCodigo() + "\","
                    + "\"personaNombre\":\"" + personanatural.getPersona().getNombre() + "\","
                    + "\"personaApellidoPat\":\"" + personanatural.getPersona().getApellidoPat() + "\","
                    + "\"personaApellidoMat\":\"" + personanatural.getPersona().getApellidoMat() + "\","
                    + "\"personaDni\":\"" + personanatural.getPersona().getDni() + "\","
                    + "\"personaDireccion\":\"" + personanatural.getPersona().getDireccion() + "\","
                    + "\"personaCelular\":\"" + personanatural.getPersona().getCelular() + "\","
                    + "\"clienteFechaInscripcion\":\"" + formater.format(personanatural.getCliente().getFechaInscripcion()) + "\","
                    + "\"personaConyugue\":\"" + conyugue + "\","
                    + "\"idCliente\":\"" + personanatural.getCliente().getId() + "\"}";

            return cadena;
        }
    }

    @RequestMapping(value = "/cargarpersona", method = RequestMethod.POST)
    @ResponseBody
    public String cargarPersona(int id) {
        Personanatural pn = personanaturalService.get(id);
        if (pn != null) {
            String fechaNacimiento = (pn.getPersona().getFechaNacimiento() != null) ? formater.format(pn.getPersona().getFechaNacimiento()) : "";

            String cadena = "{\"id\":\"" + pn.getId() + "\","
                    + "\"clienteCodigo\":\"" + pn.getCliente().getCodigo() + "\","
                    + "\"personaDni\":\"" + pn.getPersona().getDni() + "\","
                    + "\"personaNombre\":\"" + pn.getPersona().getNombre() + "\","
                    + "\"personaApellidoPat\":\"" + pn.getPersona().getApellidoPat() + "\","
                    + "\"personaApellidoMat\":\"" + pn.getPersona().getApellidoMat() + "\","
                    + "\"personaDireccion\":\"" + pn.getPersona().getDireccion() + "\","
                    + "\"personaDistrito\":\"" + pn.getPersona().getDistrito() + "\","
                    + "\"personaProvincia\":\"" + pn.getPersona().getProvincia() + "\","
                    + "\"personaDepartamento\":\"" + pn.getPersona().getDepartamento() + "\","
                    + "\"personaPais\":\"" + pn.getPersona().getPais() + "\","
                    + "\"personaCelular\":\"" + pn.getPersona().getCelular() + "\","
                    + "\"personaEmail\":\"" + pn.getPersona().getEmail() + "\","
                    + "\"personaRuc\":\"" + pn.getPersona().getRuc() + "\","
                    + "\"personaEstadocivil\":" + pn.getPersona().getEstadocivil().getId() + ","
                    + "\"personaFechanacimiento\":\"" + fechaNacimiento + "\","
                    + "\"personaGenero\":" + pn.getPersona().getGenero().getId() + ","
                    + "\"personaNacionalidad\":\"" + pn.getPersona().getNacionalidad() + "\","
                    + "\"personaProfesion\":\"" + pn.getPersona().getProfesion() + "\"}";
            return cadena;
        } else {
            return "0";
        }
    }
}
