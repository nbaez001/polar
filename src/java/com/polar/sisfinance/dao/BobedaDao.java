/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao;

import com.polar.sisfinance.entity.Bobeda;
import com.polar.sisfinance.entity.Detallesaldobobeda;
import java.util.List;

/**
 *
 * @author Micha
 */
public interface BobedaDao extends GenericDao<Bobeda> {

    public int abrirBobeda(Bobeda b, List<Detallesaldobobeda> dsApertura, List<Detallesaldobobeda> dsCierre);
}
