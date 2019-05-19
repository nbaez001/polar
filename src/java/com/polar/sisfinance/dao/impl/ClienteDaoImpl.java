/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.dao.impl;

import com.polar.sisfinance.dao.ClienteDao;
import com.polar.sisfinance.entity.Cliente;
import com.polar.sisfinance.entity.Conyugue;
import com.polar.sisfinance.entity.Persona;
import com.polar.sisfinance.entity.Personajuridica;
import com.polar.sisfinance.entity.Personanatural;
import com.polar.sisfinance.entity.Representantelegal;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class ClienteDaoImpl extends GenericDaoImpl<Cliente> implements ClienteDao {

    @Override
    public int saveClienteNatural(Persona p, Personanatural pn, Cliente c, Conyugue cony) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            if (cony != null) {
                sesion.save(cony);
                p.setConyugue(cony);
            }

            sesion.save(p);

            sesion.save(c);

            pn.setCliente(c);
            pn.setPersona(p);

            sesion.save(pn);

            tx.commit();
            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int updateClienteNatural(Persona p, Personanatural pn, Cliente c, Conyugue cony) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            if (cony != null) {
                sesion.save(cony);
                p.setConyugue(cony);
            }

            sesion.update(p);

            sesion.save(c);

            pn.setCliente(c);
            pn.setPersona(p);
            sesion.save(pn);

            tx.commit();
            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int updateClienteNaturalNewConyugue(Persona p, Conyugue c) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {

            if (c != null) {
                sesion.save(c);
                p.setConyugue(c);
            }

            sesion.update(p);

            tx.commit();
            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int updateClienteNaturalExistConyugue(Persona p, Conyugue c) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            if (c != null) {
                sesion.update(c);
                p.setConyugue(c);
            }

            sesion.update(p);

            tx.commit();
            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int deleteClientenatural(Personanatural pn) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            Cliente c = pn.getCliente();
            Persona p = pn.getPersona();

            sesion.delete(pn);
            sesion.delete(p);
            sesion.delete(c);

            tx.commit();

            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int saveClienteJuridico(Personajuridica pj, Cliente c, List<Representantelegal> listaRepresentantelegal) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            sesion.save(c);

            pj.setCliente(c);
            sesion.save(pj);

            for (Representantelegal rl : listaRepresentantelegal) {
                rl.setPersonajuridica(pj);
                sesion.save(rl);
            }

            tx.commit();
            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public int deleteClientejuridico(Personajuridica pj, List<Representantelegal> listaRepresentantelegal) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        //Variable de respuesta
        int r = 0;

        try {
            for (Representantelegal rl : listaRepresentantelegal) {
                sesion.delete(rl);
            }

            sesion.delete(pj);
            sesion.delete(pj.getCliente());

            tx.commit();

            r++;
        } catch (Exception e) {
            System.out.println("" + e.getMessage());
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

}
