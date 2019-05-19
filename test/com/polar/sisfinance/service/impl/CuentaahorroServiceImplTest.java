/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.service.impl;

import com.polar.sisfinance.entity.Cuentaahorro;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author nerio
 */
public class CuentaahorroServiceImplTest {
    
    public CuentaahorroServiceImplTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of obtenerNumeroCuentaahorro method, of class CuentaahorroServiceImpl.
     */
    @Test
    public void testObtenerNumeroCuentaahorro() {
        System.out.println("obtenerNumeroCuentaahorro");
        CuentaahorroServiceImpl instance = new CuentaahorroServiceImpl();
        int expResult = 0;
        int result = instance.obtenerNumeroCuentaahorro();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of ListarInteres method, of class CuentaahorroServiceImpl.
     */
    @Test
    public void testListarInteres() {
        System.out.println("ListarInteres");
        Cuentaahorro ca = new Cuentaahorro(0, null, null, null, null, null,"cc", 7, 100, 0, 0, 360, 0, null, null, 0);
        CuentaahorroServiceImpl instance = new CuentaahorroServiceImpl();
        List<String> expResult = null;
        List<String> result = instance.ListarInteres(ca);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
