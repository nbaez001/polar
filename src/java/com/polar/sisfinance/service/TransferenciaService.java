/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Cajero;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import com.polar.sisfinance.entity.Detallesaldocajero;
import com.polar.sisfinance.entity.Detallesaldotransferencia;
import com.polar.sisfinance.entity.Transferencia;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface TransferenciaService extends GenericService<Transferencia>{

    public List<Transferencia> listaTransferenciascajaHoy();
    
    public List<Transferencia> listaTransferencias(Date fecha);

    public int transferirCajero(Bobeda b, Cajero c, List<Detallesaldobobeda> listaDsbCierre, List<Detallesaldocajero> listaDscCierre, List<Detallesaldotransferencia> listaDstr, Transferencia tr);
    
    public Transferencia obtenerTransferenciaCierreDeCaja(int idCajero);
}
