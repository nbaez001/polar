/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.polar.sisfinance.dao.ComprobanteDao;
import com.polar.sisfinance.dao.DetallecomprobanteDao;
import com.polar.sisfinance.dao.PersonajuridicaDao;
import com.polar.sisfinance.dao.PersonanaturalDao;
import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Detallecomprobante;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.ComprobanteService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
@Service
public class ComprobanteServiceImpl extends GenericServiceImpl<Comprobante> implements ComprobanteService {

    @Autowired
    ComprobanteDao comprobanteDao;
    @Autowired
    DetallecomprobanteDao detallecomprobanteDao;
    @Autowired
    PersonanaturalDao personanaturalDao;
    @Autowired
    PersonajuridicaDao personajuridicaDao;

    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat formaterd;
    Gson gson;

    public ComprobanteServiceImpl() {
        simbolo.setDecimalSeparator('.');
        formaterd = new DecimalFormat("####.#", simbolo);

        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @Override
    public int saveComprobante(List<Detallecomprobante> ldc, HttpSession sesion) {
        Usuario usuario = (Usuario) sesion.getAttribute("user");
        Comprobante c = ldc.get(0).getComprobante();

        c.setUsuario(usuario);
        c.setFecha(new Date());
        c.setIdEstado(1);
        
        if (ldc.isEmpty()) {
            return 2;
        } else {
            double monto = 0.0;
            for (Detallecomprobante dc : ldc) {
                monto += dc.getMonto();
            }
            c.setMonto(Double.parseDouble(formaterd.format(monto)));
            
            return comprobanteDao.saveComprobante(c, ldc);
        }
    }

    @Override
    public int lastComprobante() {
        try {
            return Integer.parseInt(comprobanteDao.consultUnique("select max(id) from Comprobante").toString());
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int deleteComprobante(int id) {
        Comprobante comprobante = comprobanteDao.read(id);
        if (comprobante.getIdEstado() != 1) {
            return 2;
        } else {
            List<Detallecomprobante> listaDetallecomprobante = detallecomprobanteDao.consultList("from Detallecomprobante dc where dc.comprobante.id=" + id);
            return comprobanteDao.deleteComprobante(comprobante, listaDetallecomprobante);
        }
    }

    @Override
    public List<Comprobante> listPorCliente(int idCliente) {
        return comprobanteDao.consultList("from Comprobante c where c.idEstado=1 and c.cliente.id=" + idCliente);
    }

    @Override
    public List<String> listarComprobanteCompleto() {
        List<String> lstr = new ArrayList<>();

        List<Comprobante> lc = comprobanteDao.consultList("from Comprobante");

        for (Comprobante c : lc) {
            String json = gson.toJson(c);

            Personanatural pn = (Personanatural) personanaturalDao.consultUnique("from Personanatural pn where pn.cliente.id=" + c.getCliente().getId());
            if (pn != null) {
                json = json.substring(0, json.length() - 1);
                json += ",\"nombre\":\"" + pn.getPersona().getNombre() + " " + pn.getPersona().getApellidoPat() + " " + pn.getPersona().getApellidoMat() + "\"}";
            } else {
                Personajuridica pj = (Personajuridica) personajuridicaDao.consultUnique("from Personajuridica pj where pj.cliente.id=" + c.getCliente().getId());
                json = json.substring(0, json.length() - 1);
                json += ",\"nombre\":\"" + pj.getRazonSocial() + "\"}";
            }
            lstr.add(json);
        }

        return lstr;
    }
}
