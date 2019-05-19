/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.entity.Aporte;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.service.CuentaahorroService;
import com.polar.sisfinance.service.TransaccionService;
import com.polar.sisfinance.util.SessionUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author nerio
 */
@Controller
@RequestMapping("ahorro")
public class AhorroController {

    @Autowired
    CuentaahorroService cuentaahorroService;
    @Autowired
    TransaccionService transaccionService;

    Gson gson;

    public AhorroController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/cuentaahorro", method = RequestMethod.GET)
    public String cuentaCredito(ModelMap model, HttpSession session) {
        return new SessionUtil().sesion("ahorro/cuentaahorro", session, 10, model);
    }

    @RequestMapping(value = "/calcularinteres", method = RequestMethod.POST)
    @ResponseBody
    public List<String> calcularInteres(@RequestBody Cuentaahorro ca) {
        return cuentaahorroService.ListarInteres(ca);
    }

    @RequestMapping(value = "/listarcuentaahorro", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarCuentaahorro(@RequestBody Cliente c) {
        List<String> lstr = new ArrayList<>();

        List<Cuentaahorro> lc = cuentaahorroService.listarCuentaahorros(c);

        for (Cuentaahorro ca : lc) {
            lstr.add(gson.toJson(ca));
        }
        return lstr;

    }

    @RequestMapping(value = "/obtenercodigoca", method = RequestMethod.POST)
    @ResponseBody
    public int obtenerCodigoca() {
        return (cuentaahorroService.obtenerNumeroCuentaahorro() + 1);
    }

    @RequestMapping(value = "/registrarcuentaahorropf", method = RequestMethod.POST)
    @ResponseBody
    public int registrarCuentaahorropf(@RequestBody Cuentaahorro ca) {
        return cuentaahorroService.registrarcuentaahorropf(ca);
    }

    @RequestMapping(value = "/registrarcuentaahorroah", method = RequestMethod.POST)
    @ResponseBody
    public int registrarCuentaahorroah(@RequestBody Cuentaahorro ca) {
        return cuentaahorroService.registrarcuentaahorroah(ca);
    }

    @RequestMapping(value = "/eliminarcuentaahorro", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarCuentaahorro(@RequestBody Cuentaahorro ca) {
        return cuentaahorroService.delete(ca);
    }

    @RequestMapping(value = "/listarcpf", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarCPF(@RequestBody Cliente c) {
        List<String> lstr = new ArrayList<>();

        List<Cuentaahorro> lc = cuentaahorroService.listarCPF(c);

        for (Cuentaahorro ca : lc) {
            lstr.add(gson.toJson(ca));
        }
        return lstr;
    }

    @RequestMapping(value = "/listarcah", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listarCAH(@RequestBody Cliente c) {
        List<String> lstr = new ArrayList<>();

        List<Aporte> la = cuentaahorroService.listarCAH(c);

        for (Aporte a : la) {
            lstr.add(gson.toJson(a));
        }
        return lstr;
    }

    @RequestMapping(value = "/aperturarah", method = RequestMethod.POST)
    @ResponseBody
    public int aperturarAH(@RequestBody Aporte a, HttpSession sesion) {
        return transaccionService.aperturarAH(a, sesion);
    }

    @RequestMapping(value = "/cobrarah", method = RequestMethod.POST)
    @ResponseBody
    public int cobrarAH(@RequestBody Aporte a, HttpSession sesion) {
        return transaccionService.cobrarAH(a, sesion);
    }

    @RequestMapping(value = "/aperturarpf", method = RequestMethod.POST)
    @ResponseBody
    public int aperturarPF(@RequestBody Cuentaahorro ca, HttpSession session) {
        return transaccionService.aperturarPF(ca, session);
    }
}
