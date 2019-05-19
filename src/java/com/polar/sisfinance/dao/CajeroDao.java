/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Transferencia;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface CajeroDao extends GenericDao<Cajero> {

    public int abrirCajeroConMeresa(Bobeda b, List<Detallesaldobobeda> dsb, Transferencia tr, List<Detallesaldotransferencia> dstr, Cajero c, List<Detallesaldocajero> detalleSaldoApertura, List<Detallesaldocajero> detalleSaldoCierre);

    public int cerrarCajero(Bobeda bobeda, List<Detallesaldobobeda> listaDsb, List<Detallesaldobobeda> listaDsbNueva, Cajero cajero, Transferencia tr, List<Detallesaldotransferencia> listaDst, HttpSession Httpsesion);

    public int reaperturarCajero(Cajero cajero, Transferencia transferencia);
}
