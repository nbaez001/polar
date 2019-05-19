package com.polar.sisfinance.util;

import com.polar.sisfinance.dao.PermisoDao;
import com.polar.sisfinance.dao.impl.PermisoDaoImpl;
import com.polar.sisfinance.entity.Permiso;
import com.polar.sisfinance.entity.Usuario;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author nerio
 */
public class SessionUtil {
    PermisoDao permisoDao = new PermisoDaoImpl();
    
    public ModelAndView sesion(ModelAndView mav, HttpSession sesion, int requerido) {
        try {
            Usuario user = (Usuario) sesion.getAttribute("user");

            List<Permiso> listaPermiso = permisoDao.consultList("from Permiso p where p.usuario.id="+user.getId());

            int dato = 0;
            for (Permiso p : listaPermiso) {
                if (p.getRol().getId() == requerido) {
                    dato++;
                }
            }

            if (dato == 0) {
                mav = new ModelAndView("index");
                mav.addObject("message", "» Usted no tiene permisos para acceder a la opcion que eligio.");
                return mav;
            } else {
                return mav;
            }
        } catch (Exception e) {
            mav = new ModelAndView("login");
            mav.addObject("error", "» La sesion ha expirado los 30 minutos de acceso.");
            return mav;
        }
    }

    public String sesion(String v, HttpSession sesion, int requerido, ModelMap model) {
        try {
            Usuario user = (Usuario) sesion.getAttribute("user");

            List<Permiso> listaPermiso = permisoDao.consultList("from Permiso p where p.usuario.id="+user.getId());

            int dato = 0;
            for (Permiso p : listaPermiso) {
                if (p.getRol().getId() == requerido) {
                    dato++;
                }
            }

            if (dato == 0) {
                model.addAttribute("message", "» Usted no tiene permisos para acceder a la opcion que eligio.");
                return "index";
            } else {
                return v;
            }
        } catch (Exception e) {
            model.addAttribute("error", "» La sesion ha expirado los 30 minutos de acceso.");
            return "login";
        }
    }

    public boolean sesion(HttpSession sesion, int requerido) {
        try {
            Usuario user = (Usuario) sesion.getAttribute("user");
            List<Permiso> listaPermiso = permisoDao.consultList("from Permiso p where p.usuario.id="+user.getId());

            int dato = 0;
            for (Permiso p : listaPermiso) {
                if (p.getRol().getId() == requerido) {
                    dato++;
                }
            }
            return dato != 0;
        } catch (Exception e) {
            return false;
        }
    }

}
