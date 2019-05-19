/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.dao.GenericDao;
import java.util.List;
import com.polar.sisfinance.service.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 * @param <T>
 */
@Service
public abstract class GenericServiceImpl<T> implements GenericService<T> {

    @Autowired
    GenericDao<T> genericDao;

    @Override
    public int create(T x) {
        return genericDao.save(x);
    }

    @Override
    public T get(int id) {
        return genericDao.read(id);
    }

    @Override
    public int update(T x) {
        return genericDao.update(x);
    }

    @Override
    public int delete(T x) {
        return genericDao.drop(x);
    }

    @Override
    public List<T> list() {
        return genericDao.findAll();
    }

}
