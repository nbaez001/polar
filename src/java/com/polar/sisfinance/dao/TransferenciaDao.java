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

/**
 *
 * @author nerio
 */
public interface TransferenciaDao extends GenericDao<Transferencia> {

    public int transferirCajero(Bobeda b, Cajero c, List<Detallesaldobobeda> detalleSaldoCierreBobeda, List<Detallesaldocajero> detalleSaldoCierreCaja, List<Detallesaldotransferencia> dstr, Transferencia tr);
}
