package com.polar.sisfinance.entity;
// Generated 04/07/2016 09:00:43 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Departamento generated by hbm2java
 */
public class Departamento  implements java.io.Serializable {


     private Integer id;
     private Pais pais;
     private String nombre;
     private Set provincias = new HashSet(0);

    public Departamento() {
    }

	
    public Departamento(Pais pais, String nombre) {
        this.pais = pais;
        this.nombre = nombre;
    }
    public Departamento(Pais pais, String nombre, Set provincias) {
       this.pais = pais;
       this.nombre = nombre;
       this.provincias = provincias;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Pais getPais() {
        return this.pais;
    }
    
    public void setPais(Pais pais) {
        this.pais = pais;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set getProvincias() {
        return this.provincias;
    }
    
    public void setProvincias(Set provincias) {
        this.provincias = provincias;
    }




}


