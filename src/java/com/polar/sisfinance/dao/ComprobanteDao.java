/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Comprobante;
import com.polar.sisfinance.entity.Detallecomprobante;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ComprobanteDao extends GenericDao<Comprobante> {

    public int saveComprobante(Comprobante comprobante, List<Detallecomprobante> listaDetallecomprobante);

    public int deleteComprobante(Comprobante comprobante, List<Detallecomprobante> listaDetallecomprobante);
}
