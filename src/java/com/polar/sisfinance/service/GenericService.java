/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service;

import java.util.List;

/**
 *
 * @author nerio
 * @param <T>
 */
public interface GenericService<T> {

    int create(T x);

    T get(int id);

    int update(T x);

    int delete(T x);

    List<T> list();
}
