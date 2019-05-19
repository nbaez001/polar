/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Detallecomprobante;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface ComprobanteService extends GenericService<Comprobante> {

    int saveComprobante(List<Detallecomprobante> ldc, HttpSession sesion);

    int deleteComprobante(int id);

    int lastComprobante();

    List<Comprobante> listPorCliente(int idCliente);

    List<String> listarComprobanteCompleto();
}
