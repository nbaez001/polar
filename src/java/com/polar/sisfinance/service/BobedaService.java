/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Micha
 */
public interface BobedaService extends GenericService<Bobeda>{
    
    public boolean isBefore(Date fechaDB, Date fechaActual);
    
    public boolean isEquals(Date fechaDB, Date fechaActual);
    
    public boolean isAfter(Date fechaDB, Date fechaActual);
    
    public Bobeda lastBobeda();
    
    public List<Bobeda> listarUltimosBobeda();
    
    public int abrirBobeda(Bobeda b, List<Detallesaldobobeda> dsApertura, List<Detallesaldobobeda> dsCierre);
}
