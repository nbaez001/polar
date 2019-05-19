/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.polar.sisfinance.entity.Agencia;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.AgenciaService;
import com.polar.sisfinance.service.EmpleadoService;
import com.polar.sisfinance.service.PaisService;
import com.polar.sisfinance.service.PersonaService;
import com.polar.sisfinance.service.UsuarioService;
import com.polar.sisfinance.util.HashUtil;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author nerio
 */
@Controller
public class HomeController {

    @Autowired
    UsuarioService usuarioService;
    @Autowired
    AgenciaService agenciaService;
    @Autowired
    PersonaService personaService;
    @Autowired
    EmpleadoService empleadoService;
    @Autowired
    PaisService paisService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(HttpSession session) {
        if (agenciaService.existeInitParams()) {
            Usuario user = (Usuario) session.getAttribute("user");
            if (user != null) {
                return "redirect:/home";
            } else {
                return "redirect:/home/login";
            }
        } else {
            return "redirect:/home/initparams";
        }
    }

    @RequestMapping(value = "home/login", method = RequestMethod.GET)
    public ModelAndView index(@ModelAttribute Usuario user) {

        List<Agencia> agencia = agenciaService.list();
        if (agencia == null || agencia.isEmpty()) {
            ModelAndView mav = new ModelAndView("redirect:/home/initvalues");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("user", user);

            return mav;
        }
    }

    @RequestMapping(value = "home/login", method = RequestMethod.POST)
    public String indexPost(Usuario user, HttpSession session, ModelMap modelMap) {
        Usuario u = usuarioService.obtenerPorId(user.getUsuario(), user.getContrasena());

        user.setContrasena(HashUtil.getStringMessageDigest(user.getContrasena(), HashUtil.SHA1));
        if (u == null) {
            modelMap.put("user", user);
            modelMap.put("error", "El usuario o contraseña son incorrectos");
            return "login";
        } else {
            session.setAttribute("user", u);
            return "redirect:/home";
        }
    }

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        if (session.getAttribute("user") != null) {
            ModelAndView mav = new ModelAndView("index");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("error", "Autentifiquese por favor...");
            return mav;
        }
    }

    @RequestMapping(value = "home/perfil", method = RequestMethod.GET)
    public ModelAndView perfil(HttpSession session) {
        if (session.getAttribute("user") != null) {
            ModelAndView mav = new ModelAndView("perfil");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("redirect:/home/login");
            return mav;
        }
    }

    @RequestMapping(value = "home/salir")
    public String salir(HttpSession session) {
        //obtener usuario de session
        session.setAttribute("user", null);
        return "redirect:/home/login";
    }

    @RequestMapping(value = "home/initvalues", method = RequestMethod.GET)
    public ModelAndView guardarInitValues() {
        //obtener usuario de session
        ModelAndView mav = new ModelAndView("initvalues");
        mav.addObject("listaPais", paisService.list());
        return mav;
    }

    @RequestMapping(value = "home/initvalues", method = RequestMethod.POST)
    @ResponseBody
    public int guardarInitValues(String nombre, String ruc, String direccion, String telefono,
            String distrito, String provincia, String departamento, String pais, Integer dni,
            String nombrep, String apellidoPat, String apellidoMat, String direccionp,
            Long celular, String cargo, String usuario, String contrasena) {
        //FORMACION DE OBJETOS DE REGISTRO
        Agencia ag = new Agencia(nombre, ruc, direccion, telefono, distrito, provincia, departamento, pais, false);
        Persona p = new Persona(dni, nombrep, apellidoPat, apellidoMat, direccionp, celular);

        return agenciaService.saveInitValues(ag, p, cargo, usuario, contrasena);
    }
}
