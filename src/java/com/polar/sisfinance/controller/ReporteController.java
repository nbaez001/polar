/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.controller;

import com.polar.sisfinance.entity.Cuentaahorro;
import com.polar.sisfinance.entity.Usuario;
import com.polar.sisfinance.service.CuentaahorroService;
import com.polar.sisfinance.util.ConectionUtil;
import com.polar.sisfinance.util.NumeroUtil;
import com.polar.sisfinance.util.ReporteUtil;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author nerio
 */
@Controller
@RequestMapping("reporte")
public class ReporteController {

    @Autowired
    CuentaahorroService cuentaahorroService;

    @RequestMapping(value = "/reporteplanpagos")
    public void download(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idCuentacredito", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (cl.equals("CN")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reportePlanpagos.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reportePlanpagos2.jasper";
            }

//            JasperDesign jd = JRXmlLoader.load(pathReporte);
//            JasperReport jr = JasperCompileManager.compileReport(jd);
            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/recibotransferencia")
    public void reciboTransferenciacaja(@RequestParam String type, @RequestParam int idTipo, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");
            
            Map<String, Object> params = new HashMap<>();
            params.put("idTransferencia", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            params.put("SUBREPORT_DIR",applicationPath + File.separator + "assets/report/");

            String pathReporte;

            if (idTipo == 1) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboTransferenciacaja.jasper";
            } else {
                if (idTipo == 2) {
                    pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboTransferenciabobeda.jasper";
                } else {
                    if (idTipo == 3) {
                        pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboTransferenciacaja2.jasper";
                    } else {
                        pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboTransferenciaCierrecaja.jasper";
                    }
                }
            }
//            JasperDesign jd = JRXmlLoader.load(pathReporte);
//            JasperReport jr = JasperCompileManager.compileReport(jd);
            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process recibo");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/recibomovimientobobeda")
    public void reciboMovimientobobeda(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idMovimientobobeda", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboMovimientobobeda.jasper";

//            JasperDesign jd = JRXmlLoader.load(pathReporte);
//            JasperReport jr = JasperCompileManager.compileReport(jd);
            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process recibo");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/recibotransaccion")
    public void reciboTransaccion(@RequestParam String type, @RequestParam int tipo, @RequestParam int id, HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("idTransaccion", id);
            params.put("simboloMoneda", "S/.");
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");
            String pathReporte;

            if (tipo == 1) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboTransaccion1.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reciboTransaccion2.jasper";
            }

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process recibo");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reporteclientejuridico")
    public void reporteClientejuridico(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idCliente", id);
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");
            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteClientejuridico.jasper";

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process recibo");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reporteclientenatural")
    public void reporteClientenatural(@RequestParam String type, @RequestParam String conyugue, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idCliente", id);
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (conyugue.equals("N")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteClientenatural.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteClientenatural2.jasper";
            }

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process recibo");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportemoroso")
    public void reporteMoroso(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idCliente", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (cl.equals("CN")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteMorosonatural.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteMorosojuridico.jasper";
            }

//            JasperDesign jd = JRXmlLoader.load(pathReporte);
//            JasperReport jr = JasperCompileManager.compileReport(jd);
            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportebobeda")
    public void reporteBobeda(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idBobeda", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteBobeda.jasper";

//            JasperDesign jd = JRXmlLoader.load(pathReporte);
//            JasperReport jr = JasperCompileManager.compileReport(jd);
            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/historialplanpagos")
    public void historialPlanpagos(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");

            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idCuentacredito", id);
            params.put("simboloMoneda", "S/.");
            params.put("fecha", formater.format(new Date()));
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (cl.equals("CN")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "historialPlanpagos.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "historialPlanpagos2.jasper";
            }

//            JasperDesign jd = JRXmlLoader.load(pathReporte);
//            JasperReport jr = JasperCompileManager.compileReport(jd);
            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportecarteramorosa")
    public void reporteCarteramorosa(@RequestParam String type, @RequestParam String agencia, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("idProductocredito", id);
            params.put("agencia", agencia);
            params.put("fecha", formater.format(new Date()));
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteCarteramorosai.jasper";

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportegeneralcarteramorosa")
    public void reporteGeneralcarteramorosa(@RequestParam String type, @RequestParam String agencia, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            String applicationPath = request.getServletContext().getRealPath("");

            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();
            params.put("agencia", agencia);
            params.put("fecha", formater.format(new Date()));
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            params.put("SUBREPORT_DIR", applicationPath + File.separator + "assets/report" + File.separator);

            //RUTA REPORTE
            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reporteCarteramorosa.jasper";

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportecreditosotorgado")
    public void reporteCreditosotorgado(@RequestParam String type, @RequestParam String agencia, @RequestParam String fechaInicio, @RequestParam String fechaFin, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();

            params.put("idProductocredito", id);
            params.put("agencia", agencia);
            params.put("fechaInicio", fechaInicio);
            params.put("fechaFin", fechaFin);
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reportecreditootorgadoi.jasper";

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportegeneralcreditosotorgado")
    public void reporteGeneralcreditosotorgado(@RequestParam String type, @RequestParam String agencia, @RequestParam String fechaInicio, @RequestParam String fechaFin, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            String applicationPath = request.getServletContext().getRealPath("");

            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();

            params.put("agencia", agencia);
            params.put("fechaInicio", fechaInicio);
            params.put("fechaFin", fechaFin);
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            params.put("SUBREPORT_DIR", applicationPath + File.separator + "assets/report" + File.separator);

            //RUTA REPORTE
            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "reportecreditootorgadog.jasper";

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/hojadesembolso")
    public void hojaDesembolso(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();

            params.put("idCuentacredito", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");
            String pathReporte;

            if ("CN".equals(cl)) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "hojaDesembolso.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "hojaDesembolso2.jasper";
            }

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/pagare")
    public void pagare(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();

            params.put("idCuentacredito", id);
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");
            String pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "pagare.jasper";

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/contratoprestamo")
    public void contratoprestamo(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();

            params.put("idCuentacredito", id);
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (cl.equals("CN")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "contratoPrestamo.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "contratoPrestamo2.jasper";
            }

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/comprobante")
    public void comprobante(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Usuario usuario = (Usuario) sesion.getAttribute("user");
            Map<String, Object> params = new HashMap<>();

            params.put("idComprobante", id);
            params.put("simboloMoneda", "S/.");
            params.put("usuario", usuario.getEmpleado().getPersona().getNombre() + " " + usuario.getEmpleado().getPersona().getApellidoPat());
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (cl.equals("CN")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "comprobante.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "comprobante2.jasper";
            }

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    @RequestMapping(value = "/reportecertificado")
    public void reporteCertificado(@RequestParam String type, @RequestParam String cl, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession sesion) {
        try {
            Cuentaahorro ca = cuentaahorroService.get(id);
            NumeroUtil nu = new NumeroUtil();

            Map<String, Object> params = new HashMap<>();
            if (ca.getImporte() % 1 == 0) {
                params.put("montoTexto", nu.convertirLetras((int) ca.getImporte()).toUpperCase() + " Y 00/100");
            } else {
                String cadena = ca.getImporte() + "";
                String decimal = cadena.split("\\.")[1];

                if (decimal.length() < 1) {
                    decimal += "00";
                } else {
                    if (decimal.length() == 1) {
                        decimal += "0";
                    } else {
                        decimal = decimal.substring(0, 2);
                    }
                }

                params.put("montoTexto", nu.convertirLetras(Integer.parseInt(cadena.split("\\.")[0])).toUpperCase() + " Y " + decimal + "/100");

            }
            params.put("idCuentaahorro", id);
            //RUTA REPORTE
            String applicationPath = request.getServletContext().getRealPath("");

            String pathReporte;
            if (cl.equals("CN")) {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "contratoPlazofijo.jasper";
            } else {
                pathReporte = applicationPath + File.separator + "assets/report" + File.separator + "contratoPlazofijo2.jasper";
            }

            ConectionUtil conexion = new ConectionUtil();

            JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

            conexion.cerrarConexion();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();

            ReporteUtil util = new ReporteUtil();
            util.export(type, jp, response, baos);

            write("file002", response, baos);

        } catch (JRException jre) {
            System.out.println("Unable to process download");
            throw new RuntimeException(jre);
        }
    }

    private void write(String token, HttpServletResponse response,
            ByteArrayOutputStream baos) {
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            baos.writeTo(outputStream);
            outputStream.flush();
        } catch (Exception e) {
            System.out.println("Unable to write report to the output stream");
            throw new RuntimeException(e);
        }
    }
}
