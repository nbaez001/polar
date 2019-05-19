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
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface CajeroService extends GenericService<Cajero>{

    public List<Cajero> cajerosHoy();

    public List<Cajero> listaActivos();

    public int abrirCajeroConMeresa(Bobeda b, List<Detallesaldobobeda> listaDsbCierre, Transferencia tr, List<Detallesaldotransferencia> listaDstr, Cajero c, List<Detallesaldocajero> listaDscApertura, List<Detallesaldocajero> listaDscCierre);

    public int cerrarCajero(Bobeda bobeda, List<Detallesaldobobeda> listaDsb, List<Detallesaldobobeda> listaDsbNueva, Cajero cajero, Transferencia tr, List<Detallesaldotransferencia> listaDst, HttpSession Httpsesion);
    
    public int reaperturarCajero(Cajero cajero, Transferencia transferencia);
    
    public List<Cajero> listarCajeros(Date fecha);
    
    public List<Cajero> listarCajerosabiertos(Date fecha);
}
