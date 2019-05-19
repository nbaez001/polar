<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%SimpleDateFormat formateadorFecha = new SimpleDateFormat("EEEE d MMMM yyyy (HH:mm");%>
<!DOCTYPE html>
<html ng-app="operacionesModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transacciones cajero</title>
        <jsp:include page="../shared/favicon.jsp" flush="true"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/animate/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de datepicker  -->
        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nav-md" style="font-family: Cambria" ng-controller="transaccionesController">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h5>Cajero: <i>${cajero.usuario.usuario}</i> </h5>
                                <h5>Saldo: <i id="saldoCajero">${cajero.saldoCierre}</i></h5>
                                <a href="${pageContext.request.contextPath}/operaciones/cerrarcajero?id=${cajero.id}" class="btn-primary btn-xs">Cerrar caja</a>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Ir!</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Transacciones de caja <i class="fa fa-book"></i></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a href="#"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="#"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-12">
                                                    <label>Fecha transaccion</label>
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-4">
                                                            <div id="reportrange" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                                <span style="color: #73879C"><%=formateadorFecha.format(new Date())%>) Horas</span> <b class="caret"></b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- DATOS ADICIONALES-->
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Prestamos</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Cuotas</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Ahorros</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Comprobantes</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content5" role="tab" id="profile-tab4" data-toggle="tab" aria-expanded="false">Transacciones</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Busqueda</legend>
                                                                            <div class="row" style="padding-bottom: 15px">
                                                                                <form id="formulario">
                                                                                    <div class="col-ss-12 col-xs-9 col-sm-9">
                                                                                        <label>Cliente (*)</label>
                                                                                        <div class="row">
                                                                                            <input name="idCliente" hidden="" type="number">
                                                                                            <div class="col-ss-2 col-xs-2 col-sm-3" style="padding-right: 0px">
                                                                                                <input id="codigoCliente" class="form-control" value="CC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                                                            </div>
                                                                                            <div class="col-ss-10 col-xs-10 col-sm-9" style="padding-left: 0px">
                                                                                                <input name="nombreCliente" id="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-3 col-sm-3" style="padding-top: 23px">
                                                                                        <button onclick="$.llenarCuentas()" type="button" class="btn btn-primary">Buscar</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </fieldset>
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuentas de credito del cliente</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaCuentacredito">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta credito</th>
                                                                                                <th>Moneda</th>
                                                                                                <th>Importe credito</th>
                                                                                                <th>Deducibles</th>
                                                                                                <th>Monto desembolso</th>
                                                                                                <th>Estado</th>
                                                                                                <th>Accion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr class="odd">
                                                                                                <td valign="top" colspan="8" class="dataTables_empty">No hay registros de cuentas pendientes</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <button onclick="$.llenarCuentas()" class="btn btn-success btn-xs">Actualizar</button>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Busqueda</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <select ng-options="opcionPago as opcionPago.denominacion for opcionPago in opcionPagos track by opcionPago.id" ng-model="opcionPago" class="form-control" style="color: blueviolet">
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <br>
                                                                            <div ng-show="opcionPago.id === 0" class="row" style="padding-bottom: 15px">
                                                                                <form id="formulario2">
                                                                                    <div class="col-ss-12 col-xs-9 col-sm-9">
                                                                                        <label>Cliente (*)</label>
                                                                                        <div class="row">
                                                                                            <input name="idCliente" hidden="" type="number">
                                                                                            <div class="col-ss-2 col-xs-2 col-sm-3" style="padding-right: 0px">
                                                                                                <input id="codigoCliente" class="form-control" value="CC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                                                            </div>
                                                                                            <div class="col-ss-10 col-xs-10 col-sm-9" style="padding-left: 0px">
                                                                                                <input name="nombreCliente" id="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-3 col-sm-3" style="padding-top: 23px">
                                                                                        <button onclick="$.llenarCuotas()" type="button" class="btn btn-primary">Buscar</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                            <div ng-show="opcionPago.id === 1" class="row" style="padding-bottom: 15px">
                                                                                <form name="formulariopfb" ng-submit="buscarpfb(formulariopfb)" ng-validate="validatepfb">
                                                                                    <div class="col-ss-12 col-xs-9 col-sm-9">
                                                                                        <label>Cliente (*)</label>
                                                                                        <div class="row">
                                                                                            <div class="col-ss-2 col-xs-2 col-sm-3" style="padding-right: 0px">
                                                                                                <input ng-model="operacion.transaccion.cliente.codigo" class="form-control" disabled="" style="text-align: center; color:  #322660" type="text">
                                                                                            </div>
                                                                                            <div class="col-ss-10 col-xs-10 col-sm-9" style="padding-left: 0px">
                                                                                                <input name="nombreCliente" ng-model="operacion.transaccion.nombrecliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalCliente2" type="text">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-3 col-sm-3" style="padding-top: 23px">
                                                                                        <button type="submit" class="btn btn-primary">Buscar cuentas</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </fieldset>
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuotas pendientes del cliente</legend>
                                                                            <div ng-show="opcionPago.id === 0" class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <div id="cabeceratablaPagocuota"></div>
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaPagocuota">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta credito</th>
                                                                                                <th>Fecha vencimiento</th>
                                                                                                <th>Cuota</th>
                                                                                                <th>Mora</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                                <th>Total</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr class="odd">
                                                                                                <td valign="top" colspan="9" class="dataTables_empty">No hay registros de cuotas</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                            <div ng-show="opcionPago.id === 1" class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped jambo_table bulk_action">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta credito</th>
                                                                                                <th>Moneda</th>
                                                                                                <th>Frecuencia pago</th>
                                                                                                <th>Fecha vencimiento</th>
                                                                                                <th>Importe credito</th>
                                                                                                <th>Total</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-show="cuentaahorrospfcs.length > 0" ng-repeat="cuentaahorrospfc in cuentaahorrospfcs">
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.id}}</td>
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.cuentaCredito}}</td>
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.moneda}}</td>
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.frecuenciapago.nombre}}</td>
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.fechaVencimiento}}</td>
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.importeCredito}}</td>
                                                                                                <td style="vertical-align: middle">{{cuentaahorrospfc.total}}</td>
                                                                                                <td><input ng-model="operacion.total" name="total" class="form-control" type="number"></td>
                                                                                                <td><button ng-click="registrarPagopf(cuentaahorrospfc)" class="btn btn-primary btn-sm">Pagar</button></td>
                                                                                            </tr>
                                                                                            <tr ng-show="cuentaahorrospfcs.length <= 0">
                                                                                                <td valign="top" colspan="9" class="dataTables_empty">No hay registros de cuentas con cuotas por pagar</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab2">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Buscar cuentas ahorro</legend>
                                                                            <div class="row" style="padding-bottom: 15px">
                                                                                <form name="formulario3" ng-submit="buscarCuentaahorro(formulario3)" ng-validate="validateCuentaahorro">
                                                                                    <div class="col-ss-12 col-xs-9 col-sm-9">
                                                                                        <label>Cliente (*)</label>
                                                                                        <div class="row">
                                                                                            <div class="col-ss-2 col-xs-2 col-sm-3" style="padding-right: 0px">
                                                                                                <input ng-model="codigoCliente" class="form-control" disabled="" style="text-align: center; color:  #322660" type="text">
                                                                                            </div>
                                                                                            <div class="col-ss-10 col-xs-10 col-sm-9" style="padding-left: 0px">
                                                                                                <input ng-model="nombreCliente" name="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalCliente" type="text">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-3 col-sm-3" style="padding-top: 23px">
                                                                                        <button type="submit" class="btn btn-primary">Buscar</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </fieldset>
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuentas de ahorro</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table ng-show="cuentaahorrospf.length === 0 && cuentaahorrosah.length === 0" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta ahorro</th>
                                                                                                <th>Moneda</th>
                                                                                                <th>Importe ahorro</th>
                                                                                                <th>Tipo</th>
                                                                                                <th>Fecha apertura</th>
                                                                                                <th>Estado</th>
                                                                                                <th>Total</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td valign="top" colspan="9" class="dataTables_empty">No hay registros de cuentas ahorro pendientes de transaccion</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                    <table ng-show="cuentaahorrospf.length !== 0" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta ahorro</th>
                                                                                                <th>Moneda</th>
                                                                                                <th>Importe ahorro</th>
                                                                                                <th>Tipo</th>
                                                                                                <th>Fecha apertura</th>
                                                                                                <th>Estado</th>
                                                                                                <th>Total</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-repeat="cuentaahorro in cuentaahorrospf">
                                                                                                <td>{{cuentaahorro.id}}</td>
                                                                                                <td>{{cuentaahorro.codigo}}</td>
                                                                                                <td>{{cuentaahorro.tipomoneda.denominacion}}</td>
                                                                                                <td>{{cuentaahorro.importe}}</td>
                                                                                                <td>{{cuentaahorro.productoahorro.tipoahorro.denominacion}}</td>
                                                                                                <td>{{cuentaahorro.fechaApertura}}</td>
                                                                                                <td>{{cuentaahorro.estadocuentaahorro.denominacion}}</td>
                                                                                                <td>{{cuentaahorro.importe|currency: 'S/. ' }}</td>
                                                                                                <td><button class="btn btn-info btn-xs" ng-click="aperturarpf(cuentaahorro)">Aperturar</button></td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                    <table ng-show="cuentaahorrosah.length !== 0" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta ahorro</th>
                                                                                                <th>Moneda</th>
                                                                                                <th>Importe ahorro</th>
                                                                                                <th>Monto inscripcion</th>
                                                                                                <th>Monto carnet</th>
                                                                                                <th>Tipo</th>
                                                                                                <th>Fecha apertura</th>
                                                                                                <th>Estado</th>
                                                                                                <th>Total</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-repeat="aporte in cuentaahorrosah">
                                                                                                <td>{{aporte.cuentaahorro.id}}</td>
                                                                                                <td>{{aporte.cuentaahorro.codigo}}</td>
                                                                                                <td>{{aporte.cuentaahorro.tipomoneda.denominacion}}</td>
                                                                                                <td>{{aporte.cuentaahorro.importe}}</td>
                                                                                                <td><i ng-if="aporte.cuentaahorro.estadocuentaahorro.id === 1">{{aporte.cuentaahorro.montoInscripcion}}</i><i ng-if="aporte.cuentaahorro.estadocuentaahorro.id !== 1">0.00</i></td>
                                                                                                <td><i ng-if="aporte.cuentaahorro.estadocuentaahorro.id === 1">{{aporte.cuentaahorro.montoCarnet}}</i><i ng-if="aporte.cuentaahorro.estadocuentaahorro.id !== 1">0.00</i></td>
                                                                                                <td>{{aporte.cuentaahorro.productoahorro.tipoahorro.denominacion}}</td>
                                                                                                <td>{{aporte.cuentaahorro.fechaApertura}}</td>
                                                                                                <td>{{aporte.cuentaahorro.estadocuentaahorro.denominacion}}</td>
                                                                                                <td><i ng-if="aporte.cuentaahorro.estadocuentaahorro.id === 1">{{aporte.cuentaahorro.importe + aporte.cuentaahorro.montoInscripcion + aporte.cuentaahorro.montoCarnet}}</i><i ng-if="aporte.cuentaahorro.estadocuentaahorro.id !== 1">{{aporte.cuentaahorro.importe}}</i></td>
                                                                                                <td ng-show="aporte.cuentaahorro.estadocuentaahorro.id === 1"><button class="btn btn-info btn-xs" ng-click="aperturarah(aporte)">Aperturar</button></td>
                                                                                                <td ng-show="aporte.cuentaahorro.estadocuentaahorro.id !== 1"><button class="btn btn-info btn-xs" ng-click="cobrarah(aporte)">Cobrar aporte</button></td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab3">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Busqueda</legend>
                                                                            <div class="row" style="padding-bottom: 15px">
                                                                                <form id="formulario3">
                                                                                    <div class="col-ss-12 col-xs-9 col-sm-9">
                                                                                        <label>Cliente (*)</label>
                                                                                        <div class="row">
                                                                                            <input name="idCliente" hidden="" type="number">
                                                                                            <div class="col-ss-2 col-xs-2 col-sm-3" style="padding-right: 0px">
                                                                                                <input id="codigoCliente" class="form-control" value="CC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                                                            </div>
                                                                                            <div class="col-ss-10 col-xs-10 col-sm-9" style="padding-left: 0px">
                                                                                                <input name="nombreCliente" id="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-3 col-sm-3" style="padding-top: 23px">
                                                                                        <button onclick="$.llenarComprobantes()" type="button" class="btn btn-primary">Buscar</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </fieldset>
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Comprobantes de ingreso y egreso</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaComprobante">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Cliente</th>
                                                                                                <th>Glosa</th>
                                                                                                <th>Fecha</th>
                                                                                                <th>Tipo</th>
                                                                                                <th>monto</th>
                                                                                                <th style="text-align: center">Opcion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr class="odd">
                                                                                                <td valign="top" colspan="7" class="dataTables_empty">No hay registros de comprobantes</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab_content5" aria-labelledby="profile-tab4">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Registro de transacciones</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaTransaccion">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th>N°</th>
                                                                                                <th>Codigo</th>
                                                                                                <th>Fecha</th>
                                                                                                <th>Nombre cliente</th>
                                                                                                <th>Tipo</th>
                                                                                                <th>Monto</th>
                                                                                                <th>Accion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-repeat="transaccion in transaccions">
                                                                                                <td>{{transaccion.id}}</td>
                                                                                                <td>{{transaccion.codigo}}</td>
                                                                                                <td>{{transaccion.fecha}}</td>
                                                                                                <td>{{transaccion.nombrecliente}}</td>
                                                                                                <td>{{transaccion.tipotransaccion.denominacion}}</td>
                                                                                                <td>{{transaccion.monto}}</td>
                                                                                                <td><a target="_blank" href="${pageContext.request.contextPath}/reporte/recibotransaccion?type=pdf&&tipo={{transaccion.tipotransaccion.id}}&&id={{transaccion.id}}"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo transaccion</a></td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalBuscarcliente" tabindex="-1" role="dialog" aria-labelledby="modalBuscarClienteLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalBuscarClienteLabel">Buscar cliente</h4>
                    </div>
                    <div id="bodyModal" class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <select id="opcionCliente" class="form-control" style="color: #322660">
                                                <option value="0">SELECCIONAR</option>
                                                <option value="1">PERSONA NATURAL</option>
                                                <option value="2">PERSONA JURIDICA</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="opcionPersonanatural" class="row" hidden="">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>DNI</label>
                                                    <input id="dniBusqueda" class="form-control" placeholder="DNI" type="number" onkeyup="$.buscarClientenatural(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Nombre</label>
                                            <input id="nombreBusqueda" class="form-control" placeholder="NOMBRE" type="text" onkeyup="$.buscarClientenatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido paterno</label>
                                            <input id="apellidoPatBusqueda" class="form-control" placeholder="APELLIDO PATERNO" type="text" onkeyup="$.buscarClientenatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido materno</label>
                                            <input id="apellidoMatBusqueda" class="form-control" placeholder="APELLIDO MATERNO" type="text" onkeyup="$.buscarClientenatural(2)">
                                        </div>
                                    </div>
                                    <div id="opcionPersonajuridica" class="row" hidden="">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>RUC</label>
                                                    <input id="rucBusqueda" class="form-control" placeholder="RUC" type="number" onkeyup="$.buscarClientejuridico(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Razon social</label>
                                            <input id="razonsocialBusqueda" class="form-control" placeholder="RAZON SOCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre comercial</label>
                                            <input id="nombrecomercialBusqueda" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaBuscarcliente">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalBuscarproductocredito" tabindex="-1" role="dialog" aria-labelledby="modalBuscarClienteLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalBuscarClienteLabel">Buscar producto credito</h4>
                    </div>
                    <div id="bodyModal" class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Tipo moneda</label>
                                            <select id="idTipomonedaBusqueda" class="form-control">
                                                <c:forEach var="item" items="${listaTipomoneda}">
                                                    <option value="${item.id}">${item.denominacion}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre</label>
                                            <input id="nombrepBusqueda" class="form-control" placeholder="NOMBRE" type="text" onkeyup="$.buscarProductocredito($(this).val())">  
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaBuscarproductocredito">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalCliente" tabindex="-1" role="dialog" aria-labelledby="modalClienteLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalClienteLabel">Buscar cliente</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <select ng-options="opcionCliente as opcionCliente.denominacion for opcionCliente in opcionClientes track by opcionCliente.id" ng-model="opcionCliente" ng-change="opcionBusquedacliente()" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div ng-show="opcionCliente.id === 1" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>DNI</label>
                                                    <input ng-model="clienteb.dni" class="form-control" placeholder="DNI" type="number" ng-keyup="listarPersonanatural(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Nombre</label>
                                            <input ng-model="clienteb.nombre" class="form-control" placeholder="NOMBRE" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido paterno</label>
                                            <input ng-model="clienteb.apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido materno</label>
                                            <input ng-model="clienteb.apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                <thead>
                                                    <tr>
                                                        <th>Codigo</th>
                                                        <th>DNI</th>
                                                        <th>Nombre</th>
                                                        <th>Apellidos</th>
                                                        <th>Id cliente</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="personanatural in personanaturals" ng-click="seleccionar(personanatural)">
                                                        <td>{{personanatural.cliente.codigo}}</td>
                                                        <td>{{personanatural.persona.dni}}</td>
                                                        <td>{{personanatural.persona.nombre}}</td>
                                                        <td>{{personanatural.persona.apellidoPat}} {{personanatural.persona.apellidoMat}}</td>
                                                        <td>{{personanatural.cliente.id}}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div ng-show="opcionCliente.id === 2" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>RUC</label>
                                                    <input id="rucBusqueda" class="form-control" placeholder="RUC" type="number" onkeyup="$.buscarClientejuridico(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Razon social</label>
                                            <input id="razonsocialBusqueda" class="form-control" placeholder="RAZON SOCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre comercial</label>
                                            <input id="nombrecomercialBusqueda" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">

                                            </table>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalCliente2" tabindex="-1" role="dialog" aria-labelledby="modalClienteLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="color: #449ACA; text-align: center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalClienteLabel">Buscar cliente</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <select ng-options="opcionCliente as opcionCliente.denominacion for opcionCliente in opcionClientes track by opcionCliente.id" ng-model="opcionCliente" ng-change="opcionBusquedacliente()" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div ng-show="opcionCliente.id === 1" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>DNI</label>
                                                    <input ng-model="clienteb.dni" class="form-control" placeholder="DNI" type="number" ng-keyup="listarPersonanatural(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Nombre</label>
                                            <input ng-model="clienteb.nombre" class="form-control" placeholder="NOMBRE" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido paterno</label>
                                            <input ng-model="clienteb.apellidoPat" class="form-control" placeholder="APELLIDO PATERNO" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-4">
                                            <label>Apellido materno</label>
                                            <input ng-model="clienteb.apellidoMat" class="form-control" placeholder="APELLIDO MATERNO" type="text" ng-keyup="listarPersonanatural(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                <thead>
                                                    <tr>
                                                        <th>Codigo</th>
                                                        <th>DNI</th>
                                                        <th>Nombre</th>
                                                        <th>Apellidos</th>
                                                        <th>Id cliente</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="personanatural in personanaturals" ng-click="seleccionarpn(personanatural)">
                                                        <td>{{personanatural.cliente.codigo}}</td>
                                                        <td>{{personanatural.persona.dni}}</td>
                                                        <td>{{personanatural.persona.nombre}}</td>
                                                        <td>{{personanatural.persona.apellidoPat}} {{personanatural.persona.apellidoMat}}</td>
                                                        <td>{{personanatural.cliente.id}}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div ng-show="opcionCliente.id === 2" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>RUC</label>
                                                    <input id="rucBusqueda" class="form-control" placeholder="RUC" type="number" onkeyup="$.buscarClientejuridico(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Razon social</label>
                                            <input id="razonsocialBusqueda" class="form-control" placeholder="RAZON SOCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre comercial</label>
                                            <input id="nombrecomercialBusqueda" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" onkeyup="$.buscarClientejuridico(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped responsive-utilities jambo_table bulk_action">

                                            </table>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/icheck/icheck.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/operacionesModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                        $.notificar = function (titulo, tipo, mensaje) {
                                                            new PNotify({
                                                                title: titulo,
                                                                type: tipo,
                                                                text: mensaje,
                                                                nonblock: {
                                                                    nonblock: true
                                                                },
                                                                before_close: function (PNotify) {
                                                                    PNotify.update({
                                                                        title: PNotify.options.title + " - Enjoy your Stay",
                                                                        before_close: null
                                                                    });
                                                                    PNotify.queueRemove();
                                                                    return false;
                                                                }
                                                            });
                                                        };

                                                        $.llenarCliente = function (id) {
                                                            var codigo = $("#tablaBuscarcliente #" + id + " td")[0].innerHTML;
                                                            var nombre = $("#tablaBuscarcliente #" + id + " td")[2].innerHTML;
                                                            var apellido = $("#tablaBuscarcliente #" + id + " td")[3].innerHTML;
                                                            var idCliente = $("#tablaBuscarcliente #" + id + " td")[4].innerHTML;

                                                            $("#formulario input[name=idCliente]").val(idCliente);
                                                            $("#formulario input[id=codigoCliente]").val(codigo);
                                                            $("#formulario input[id=nombreCliente]").val(nombre + " " + apellido);
                                                            $("#formulario2 input[name=idCliente]").val(idCliente);
                                                            $("#formulario2 input[id=codigoCliente]").val(codigo);
                                                            $("#formulario2 input[id=nombreCliente]").val(nombre + " " + apellido);
                                                            $("#formulario3 input[name=idCliente]").val(idCliente);
                                                            $("#formulario3 input[id=codigoCliente]").val(codigo);
                                                            $("#formulario3 input[id=nombreCliente]").val(nombre + " " + apellido);

                                                            $('#modalBuscarcliente').modal('hide');

                                                            $("#tablaCuentacredito tbody").html('<tr class="odd"><td valign="top" colspan="8" class="dataTables_empty">No hay registros de cuentas para desembolso</td></tr>');
                                                            $("#tablaPagocuota tbody").html('<tr class="odd"><td valign="top" colspan="9" class="dataTables_empty">No hay registros de cuotas</td></tr>');
                                                            $("#tablaComprobante body").html('<tr class="odd"><td valign="top" colspan="7" class="dataTables_empty">No hay registros de comprobantes</td></tr>');
                                                        };

                                                        $.llenarCuentas = function () {
                                                            var idCliente = $("#formulario input[name=idCliente]").val();
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/listarcuentacredito',
                                                                data: {idCliente: idCliente},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    var added = '';
                                                                    if (data.length !== 0) {
                                                                        $.each(data, function (i, value) {
                                                                            var json = JSON.parse(value);
                                                                            added += '<tr id=' + json.id + '>' +
                                                                                    '<td>' + (i + 1) + '</td>' +
                                                                                    '<td>' + json.cuentaCredito + '</td>' +
                                                                                    '<td>' + json.moneda + '</td>' +
                                                                                    '<td>' + json.importeCredito + '</td>' +
                                                                                    '<td>' + parseFloat(parseFloat(json.centralRiesgo) + parseFloat(json.gastosAdministrativo) + parseFloat(json.seguroDesgravamen) + parseFloat(json.encaje)) + '</td>' +
                                                                                    '<td style="color:blue">' + json.montoDesembolso + '</td>' +
                                                                                    '<td>' + json.estadoDesembolso + '</td>' +
                                                                                    '<td><button class="btn btn-info btn-xs" onclick="$.desembolsar(' + json.id + ',' + json.montoDesembolso + ')">Desembolsar</button></td>' +
                                                                                    '</tr>';
                                                                        });
                                                                        $("#tablaCuentacredito tbody").html(added);
                                                                        $.notificar("Notificacion", "info", "Se cargo correctamente las cuentas para desembolsar del cliente");
                                                                    }
                                                                    else {
                                                                        added += '<tr class="odd">' +
                                                                                '<td valign="top" colspan="8" class="dataTables_empty">No hay registros de cuentas para desembolso</td>' +
                                                                                '</tr>';
                                                                        $("#tablaCuentacredito tbody").html(added);
                                                                        $.notificar("Notificacion", "info", "No se pudo obtener cuentas para desembolsar de este cliente");
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.llenarCuotas = function () {
                                                            var idCliente = $("#formulario2 input[name=idCliente]").val();
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/cuotascuentacredito',
                                                                data: {idCliente: idCliente},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    var added = '';
                                                                    if (data.length !== 0) {
                                                                        $.each(data, function (i, value) {
                                                                            var json = JSON.parse(value);
                                                                            added += '<tr id=' + json.id + '>' +
                                                                                    '<td>' + (i + 1) + '</td>' +
                                                                                    '<td>' + json.cuentacredito + '</td>' +
                                                                                    '<td>' + json.fechaVence + '</td>';
                                                                            if (json.idEstadodesembolso === 1) {
                                                                                added += '<td>' + parseFloat(json.cuotac).toFixed(2) + '</td>' +
                                                                                        '<td>' + parseFloat(json.mora).toFixed(2) + '</td>' +
                                                                                        '<td style="text-align:center"> - </td>' +
                                                                                        '<td contenteditable="true" style="background-color:#E9EFF8">' + (parseFloat(json.cuotac)).toFixed(2) + '</td>' +
                                                                                        '<td style="text-align:center"><input onClick="$.montoTotal()" type="checkbox"> Pagar</td>' +
                                                                                        '<td style="text-align:center">-</td>' +
                                                                                        '</tr>';
                                                                            }
                                                                            else {
                                                                                if (parseFloat(json.cuotac).toFixed(1) === "0.0") {
                                                                                    added += '<td>' + parseFloat(json.cuotac).toFixed(2) + '</td>' +
                                                                                            '<td>' + parseFloat(json.mora).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.agregarMora($(this).parent().parent())" type="checkbox">Pagar mora</td>' +
                                                                                            '<td contenteditable="true" style="background-color:#E9EFF8">' + (parseFloat(json.cuotac)).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.montoTotal()" type="checkbox"> Pagar</td>' +
                                                                                            '<td style="text-align:center"><button class="btn btn-xs btn-warning" onClick="$.absolverMora(' + json.id + ')">Condonar mora</button></td>' +
                                                                                            '</tr>';
                                                                                }
                                                                                else {
                                                                                    added += '<td>' + parseFloat(json.cuotac).toFixed(2) + '</td>' +
                                                                                            '<td>' + parseFloat(json.mora).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.agregarMora($(this).parent().parent())" type="checkbox">Pagar mora</td>' +
                                                                                            '<td contenteditable="true" style="background-color:#E9EFF8">' + (parseFloat(json.cuotac)).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.montoTotal()" type="checkbox"> Pagar</td>' +
                                                                                            '<td style="text-align:center">-</td>' +
                                                                                            '</tr>';
                                                                                }
                                                                            }
                                                                        });
                                                                        $("#tablaPagocuota tbody").html(added);
                                                                        $.notificar("Notificacion", "info", "Se cargo las cuotas del cliente correctamente");

                                                                        $("#cabeceratablaPagocuota").html('Total <i id="montoTotalPagar" style="margin-right:30px">0.0</i><button class="btn btn-primary btn-xs" type="button" onClick="$.pagarSeleccionados()">Pagar seleccionados</button>');
                                                                    }
                                                                    else {
                                                                        added += '<tr class="odd">' +
                                                                                '<td valign="top" colspan="9" class="dataTables_empty">No hay registros de cuotas</td>' +
                                                                                '</tr>';
                                                                        $("#tablaPagocuota tbody").html(added);
                                                                        $.notificar("Notificacion", "info", "No hay cuotas pendientes de pagar para este cliente");
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.llenarCuotasdespuespago = function () {
                                                            var idCliente = $("#formulario2 input[name=idCliente]").val();
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/cuotascuentacredito',
                                                                data: {idCliente: idCliente},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    var added = '';
                                                                    if (data.length !== 0) {
                                                                        $.each(data, function (i, value) {
                                                                            var json = JSON.parse(value);
                                                                            added += '<tr id=' + json.id + '>' +
                                                                                    '<td>' + (i + 1) + '</td>' +
                                                                                    '<td>' + json.cuentacredito + '</td>' +
                                                                                    '<td>' + json.fechaVence + '</td>';
                                                                            if (json.idEstadoCuentacredito === 1) {
                                                                                added += '<td>' + parseFloat(json.cuotac).toFixed(2) + '</td>' +
                                                                                        '<td>' + parseFloat(json.mora).toFixed(2) + '</td>' +
                                                                                        '<td style="text-align:center"> - </td>' +
                                                                                        '<td contenteditable="true" style="background-color:#E9EFF8">' + (parseFloat(json.cuotac)).toFixed(2) + '</td>' +
                                                                                        '<td style="text-align:center"><input onClick="$.montoTotal()" type="checkbox"> Pagar</td>' +
                                                                                        '<td style="text-align:center">-</td>' +
                                                                                        '</tr>';
                                                                            }
                                                                            else {
                                                                                if (parseFloat(json.cuotac).toFixed(1) === "0.0") {
                                                                                    added += '<td>' + parseFloat(json.cuotac).toFixed(2) + '</td>' +
                                                                                            '<td>' + parseFloat(json.mora).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.agregarMora($(this).parent().parent())" type="checkbox">Pagar mora</td>' +
                                                                                            '<td contenteditable="true" style="background-color:#E9EFF8">' + (parseFloat(json.cuotac)).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.montoTotal()" type="checkbox"> Pagar</td>' +
                                                                                            '<td style="text-align:center"><button class="btn btn-xs btn-warning" onClick="$.absolverMora(' + json.id + ')">Condonar mora</button></td>' +
                                                                                            '</tr>';
                                                                                }
                                                                                else {
                                                                                    added += '<td>' + parseFloat(json.cuotac).toFixed(2) + '</td>' +
                                                                                            '<td>' + parseFloat(json.mora).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.agregarMora($(this).parent().parent())" type="checkbox">Pagar mora</td>' +
                                                                                            '<td contenteditable="true" style="background-color:#E9EFF8">' + (parseFloat(json.cuotac)).toFixed(2) + '</td>' +
                                                                                            '<td style="text-align:center"><input onClick="$.montoTotal()" type="checkbox"> Pagar</td>' +
                                                                                            '<td style="text-align:center">-</td>' +
                                                                                            '</tr>';
                                                                                }
                                                                            }
                                                                        });
                                                                        $("#tablaPagocuota tbody").html(added);

                                                                        $("#cabeceratablaPagocuota").html('Total <i id="montoTotalPagar" style="margin-right:30px">0.0</i><button class="btn btn-primary btn-xs" type="button" onClick="$.pagarSeleccionados()">Pagar seleccionados</button>');
                                                                    }
                                                                    else {
                                                                        added += '<tr class="odd">' +
                                                                                '<td valign="top" colspan="9" class="dataTables_empty">No hay registros de cuotas</td>' +
                                                                                '</tr>';
                                                                        $("#tablaPagocuota tbody").html(added);
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.llenarComprobantes = function () {
                                                            var idCliente = $("#formulario3 input[name=idCliente]").val();
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/comprobantesingresoegreso',
                                                                data: {idCliente: idCliente},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    var added = '';
                                                                    if (data.length !== 0) {
                                                                        $.each(data, function (i, value) {
                                                                            var json = JSON.parse(value);
                                                                            added += '<tr id=' + json.id + '>' +
                                                                                    '<td>' + (i + 1) + '</td>' +
                                                                                    '<td>' + json.cliente + '</td>' +
                                                                                    '<td>' + json.glosa + '</td>' +
                                                                                    '<td>' + json.fecha + '</td>' +
                                                                                    '<td>' + json.naturalezaComprobante + '</td>';

                                                                            if (json.idnaturalezaComprobante === 1) {
                                                                                added += '<td>' + parseFloat(json.monto).toFixed(2) + '</td>' +
                                                                                        '<td style="text-align:center"><button onClick="$.transaccionComprobante(' + json.id + ',' + json.monto + ')" class="btn btn-warning btn-xs">Cobrar</button></td>' +
                                                                                        '</tr>';
                                                                            }
                                                                            else {
                                                                                added += '<td>' + parseFloat(json.monto).toFixed(2) + '</td>' +
                                                                                        '<td style="text-align:center"><button onClick="$.transaccionComprobante(' + json.id + ',' + json.monto + ')" class="btn btn-warning btn-xs">Pagar</button></td>' +
                                                                                        '</tr>';
                                                                            }
                                                                        });
                                                                        $("#tablaComprobante tbody").html(added);
                                                                        $.notificar("Notificacion", "info", "Se cargo los comprobantes correctamente");
                                                                    }
                                                                    else {
                                                                        added += '<tr class="odd">' +
                                                                                '<td valign="top" colspan="7" class="dataTables_empty">No hay registros de comprobantes</td>' +
                                                                                '</tr>';
                                                                        $("#tablaComprobante body").html(added);
                                                                        $.notificar("Notificacion", "info", "No se ha encontrado registros");
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.buscarClientenatural = function (id) {
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/credito/buscarclientenatural',
                                                                data: {dni: $("#dniBusqueda").val(), nombre: $("#nombreBusqueda").val(), apellidoPat: $("#apellidoPatBusqueda").val(), apellidoMat: $("#apellidoMatBusqueda").val(), id: id},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    var added = '<thead><tr class="headings">' +
                                                                            '<th>Codigo </th>' +
                                                                            '<th>DNI</th>' +
                                                                            '<th>Nombre </th>' +
                                                                            '<th>Apellidos</th>' +
                                                                            '<th>Id cliente</th>' +
                                                                            '</tr></thead><tbody>';

                                                                    if (data !== "0") {
                                                                        $.each(data, function (i, value) {
                                                                            var json = JSON.parse(value);
                                                                            added += '<tr id="' + json.idCliente + '" onClick="$.llenarCliente(' + json.idCliente + ')">' +
                                                                                    '<td>' + json.codigo + '</td>' +
                                                                                    '<td>' + json.dni + '</td>' +
                                                                                    '<td>' + json.nombre + '</td>' +
                                                                                    '<td>' + json.apellidoPat + ' ' + json.apellidoMat + '</td>' +
                                                                                    '<td>' + json.idCliente + '</td>' +
                                                                                    '</tr>';
                                                                        });

                                                                        added += '</tbody>';

                                                                        $("#tablaBuscarcliente").html(added);
                                                                    }
                                                                    else {
                                                                        added += '<tr class="odd">' +
                                                                                '<td valign="top" colspan="8" class="dataTables_empty">No hay registros de comprobantes</td>' +
                                                                                '</tr>' +
                                                                                '</tbody>';
                                                                        $("#tablaBuscarcliente").html(added);
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.buscarClientejuridico = function (id) {
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/credito/buscarclientejuridico',
                                                                data: {ruc: $("#rucBusqueda").val(), razonSocial: $("#razonsocialBusqueda").val(), nombreComercial: $("#nombrecomercialBusqueda").val(), id: id},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    var added = '<thead><tr class="headings">' +
                                                                            '<th>Codigo </th>' +
                                                                            '<th>RUC</th>' +
                                                                            '<th>Razon social </th>' +
                                                                            '<th>Nombre comercial</th>' +
                                                                            '<th>Id cliente</th>' +
                                                                            '</tr></thead><tbody>';

                                                                    if (data !== "0") {
                                                                        $.each(data, function (i, value) {
                                                                            var json = JSON.parse(value);
                                                                            added += '<tr id="' + json.idCliente + '" onClick="$.llenarCliente(' + json.idCliente + ')">' +
                                                                                    '<td>' + json.codigo + '</td>' +
                                                                                    '<td>' + json.ruc + '</td>' +
                                                                                    '<td>' + json.razonSocial + '</td>' +
                                                                                    '<td>' + json.nombreComercial + '</td>' +
                                                                                    '<td>' + json.idCliente + '</td>' +
                                                                                    '</tr>';
                                                                        });

                                                                        added += '</tbody>';

                                                                        $("#tablaBuscarcliente").html(added);
                                                                    }
                                                                    else {
                                                                        added += '<tr class="odd">' +
                                                                                '<td valign="top" colspan="8" class="dataTables_empty">No hay registros de comprobantes</td>' +
                                                                                '</tr>' +
                                                                                '</tbody>';
                                                                        $("#tablaBuscarcliente").html(added);
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.desembolsar = function (id, pago) {
                                                            var idCliente = $("#formulario input[name=idCliente]").val();
                                                            var nombreCliente = $("#formulario input[name=nombreCliente]").val();
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/desembolsarcuentacredito',
                                                                data: {idCuentacredito: id, idCliente: idCliente, nombreCliente: nombreCliente, pago: pago},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    if (data === 0) {
                                                                        $.notificar("Notificacion", "info", "Ocurrio un error al registrar la transaccion");
                                                                    }
                                                                    else {
                                                                        if (data === 2) {
                                                                            $.notificar("Notificacion", "info", "No hay saldo en caja");
                                                                        }
                                                                        else {
                                                                            if (data === 3) {
                                                                                $.notificar("Notificacion", "warning", "Error, el estado de la caja esta cerrada, solicite al Jefe de Operaciones que vuelva a abrirla");
                                                                            }
                                                                            else {
                                                                                if (data === 4) {
                                                                                    $.notificar("Notificacion", "warning", "Error, la cuenta ya ha sido desembolsada.");
                                                                                }
                                                                                else {
                                                                                    $("#tablaTransaccion tbody").prepend('<tr>' +
                                                                                            '<td>-</td>' +
                                                                                            '<td>' + data.codigo + '</td>' +
                                                                                            '<td>' + data.fecha + '</td>' +
                                                                                            '<td>' + data.nombreCliente + '</td>' +
                                                                                            '<td>' + data.tipoTransaccion + '</td>' +
                                                                                            '<td>' + data.monto + '</td>' +
                                                                                            '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/recibotransaccion?type=pdf&&tipo=' + data.idTipotransaccion + '&&id=' + data.id + '"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo transaccion</a></td>' +
                                                                                            '</tr>');

                                                                                    $("#saldoCajero").html((parseFloat($("#saldoCajero").html()) - parseFloat(pago)).toFixed(2));

                                                                                    $.notificar("Notificacion", "success", "Se ha procesado el comprobante a nombre de: " + nombreCliente + " , imprima su recibo en la seccion 'Transacciones'.");

                                                                                    $("#tablaCuentacredito #" + id).remove();
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.transaccionComprobante = function (id, monto) {
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/transaccioncomprobante',
                                                                data: {id: id, nombreCliente: $("#formulario3 input[name=nombreCliente]").val()},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    if (data === 0) {
                                                                        $.notificar("Notificacion", "error", "Ocurrio un error al realizar la transaccion");
                                                                    }
                                                                    else {
                                                                        if (data === 2) {
                                                                            $.notificar("Notificacion", "warning", "No hay saldo suficiente en cajero.");
                                                                        }
                                                                        else {
                                                                            if (data === 3) {
                                                                                $.notificar("Notificacion", "warning", "La transaccion para este comprobante ya se ha realizado");
                                                                            }
                                                                            else {
                                                                                if (data === 10) {
                                                                                    window.location.href = "${pageContext.request.contextPath}/home";
                                                                                }
                                                                                else {
                                                                                    $("#tablaTransaccion tbody").prepend('<tr>' +
                                                                                            '<td>' + data.id + '</td>' +
                                                                                            '<td>' + data.codigo + '</td>' +
                                                                                            '<td>' + data.fecha + '</td>' +
                                                                                            '<td>' + data.nombreCliente + '</td>' +
                                                                                            '<td>' + data.tipoTransaccion + '</td>' +
                                                                                            '<td>' + data.monto + '</td>' +
                                                                                            '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/recibotransaccion?type=pdf&&tipo=' + data.idTipotransaccion + '&&id=' + data.id + '"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo transaccion</a></td>' +
                                                                                            '</tr>');
                                                                                    if (data.idTipotransaccion === 3) {
                                                                                        $("#saldoCajero").html((parseFloat($("#saldoCajero").html()) - parseFloat(monto)).toFixed(2));
                                                                                    }
                                                                                    else {
                                                                                        $("#saldoCajero").html((parseFloat($("#saldoCajero").html()) + parseFloat(monto)).toFixed(2));
                                                                                    }

                                                                                    $.notificar("Notificacion", "success", "Se ha registrado correctamente la transaccion del comprobante , imprima su recibo en la seccion 'Transacciones'.");

                                                                                    $("#tablaComprobante #" + id).remove();
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };

                                                        $.pagarSeleccionados = function () {
                                                            var listaPagados = [];
                                                            var listaCuotacero = "";
                                                            var listaMontosmayores = "";
                                                            var fila = 0;

                                                            $("#tablaPagocuota tbody tr").each(function (index)
                                                            {
                                                                var id = 0;
                                                                var pago = 0.0;
                                                                var valor = 0.0;
                                                                var pagaMora = false;
                                                                $(this).children("td").each(function (index2)
                                                                {
                                                                    id = $(this).parent().prop('id');
                                                                    if (index2 === 0) {
                                                                        fila = parseInt($(this).html());
                                                                    }
                                                                    if (index2 === 3) {
                                                                        valor = parseFloat($(this).html());
                                                                    }
                                                                    if (index2 === 5) {
                                                                        if ($(this).children('input').prop('checked')) {
                                                                            pagaMora = true;
                                                                        }
                                                                    }
                                                                    if (index2 === 6) {
                                                                        pago = parseFloat($(this).html()).toFixed(1);
                                                                    }
                                                                    if (index2 === 7) {
                                                                        if ($(this).children('input').prop('checked')) {
                                                                            listaPagados.push({id: id, pago: pago, pagaMora: pagaMora});
                                                                            if (pago === "0.0") {
                                                                                listaCuotacero += " " + fila + ",";
                                                                            }
                                                                            if (pago > valor) {
                                                                                if (!pagaMora) {
                                                                                    listaMontosmayores += " " + fila + ",";
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                });
                                                            });
                                                            if (listaMontosmayores.length < 1) {
                                                                if (listaCuotacero.length < 1) {
                                                                    if (listaPagados.length > 0) {

                                                                        var data2 = {
                                                                            listaPagados: listaPagados,
                                                                            nombreCliente: $("#formulario2 input[name=nombreCliente]").val(),
                                                                            idCliente: $("#formulario2 input[name=idCliente]").val()
                                                                        };

                                                                        $.ajax({
                                                                            type: 'POST',
                                                                            url: '${pageContext.request.contextPath}/operaciones/pagocuotascuentacredito',
                                                                            contentType: 'application/json',
                                                                            data: JSON.stringify(data2),
                                                                            dataType: "json",
                                                                            success: function (data) {
                                                                                if (data !== 0) {
                                                                                    if (data !== 2) {
                                                                                        if (data !== 3) {
                                                                                            $("#tablaTransaccion tbody").prepend('<tr>' +
                                                                                                    '<td>-</td>' +
                                                                                                    '<td>' + data.codigo + '</td>' +
                                                                                                    '<td>' + data.fecha + '</td>' +
                                                                                                    '<td>' + data.nombreCliente + '</td>' +
                                                                                                    '<td>' + data.tipoTransaccion + '</td>' +
                                                                                                    '<td>' + data.monto + '</td>' +
                                                                                                    '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/recibotransaccion?type=pdf&&tipo=' + data.idTipotransaccion + '&&id=' + data.id + '"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo transaccion</a></td>' +
                                                                                                    '</tr>');

                                                                                            $("#saldoCajero").html((parseFloat($("#saldoCajero").html()) + parseFloat($("#montoTotalPagar").html())).toFixed(2));
                                                                                            $.notificar("Notificacion", "success", "Se registro el cobro correctamente correctamente, dirijase a la seccion de 'Transacciones' para imprimir el recibo");
                                                                                            $.llenarCuotasdespuespago();
                                                                                        }
                                                                                        else {
                                                                                            $.notificar("Notificacion", "warning", "Error, una cuota seleccionada ya estaba pagada, refresque la pagina para actualizar las cuotas por pagar.");
                                                                                        }
                                                                                    }
                                                                                    else {
                                                                                        $.notificar("Notificacion", "warning", "Error, el estado de la caja esta cerrada, solicite al Jefe de Operaciones que vuelva a abrirla");
                                                                                    }
                                                                                }
                                                                                else {
                                                                                    $.notificar("Notificacion", "error", "No se pudo realizar el registro del cobro");
                                                                                }
                                                                            },
                                                                            error: function (xhr, status, error) {
                                                                                $.notificar("Notificacion", "error", "Error: " + error);
                                                                            }
                                                                        });
                                                                    }
                                                                    else {
                                                                        $.notificar("Notificacion", "warning", "Seleccione las cuotas que se desea pagar");
                                                                    }
                                                                }
                                                                else {
                                                                    $.notificar("Notificacion", "warning", "La cuota " + listaCuotacero + " seleccionada tiene un Total de pago de 0.0, ingrese el monto debido");
                                                                }
                                                            }
                                                            else {
                                                                $.notificar("Notificacion", "warning", "La cuota " + listaMontosmayores + " insertada es mayor a la cuota que se debe pagar, ingrese el monto menor o igual a la cuota");
                                                            }
                                                        };

                                                        $.montoTotal = function () {
                                                            var monto = 0.0;
                                                            $("#tablaPagocuota tbody tr").each(function (index)
                                                            {
                                                                var temporal = 0.0;
                                                                $(this).children("td").each(function (index2)
                                                                {
                                                                    if (index2 === 6) {
                                                                        temporal = parseFloat(parseFloat($(this).html()).toFixed(1));
                                                                        $(this).html(parseFloat(temporal).toFixed(2));
                                                                    }
                                                                    if (index2 === 7) {
                                                                        if ($(this).children('input').prop('checked')) {
                                                                            monto += temporal;
                                                                        }
                                                                    }
                                                                });
                                                            });
                                                            $("#montoTotalPagar").html(monto.toFixed(2));
                                                        };

                                                        $.agregarMora = function (dom) {
                                                            var mora = 0.0;
                                                            var cuota = 0.0;
                                                            var total = 0.0;
                                                            var bandera = false;

                                                            dom.children("td").each(function (index2)
                                                            {
                                                                if (index2 === 3) {
                                                                    cuota = parseFloat($(this).html());
                                                                }
                                                                if (index2 === 4) {
                                                                    mora = parseFloat($(this).html());
                                                                }
                                                                if (index2 === 5) {
                                                                    if ($(this).children('input').prop('checked')) {
                                                                        bandera = true;
                                                                        total = cuota + mora;
                                                                    }
                                                                    else {
                                                                        total = cuota;
                                                                        bandera = false;
                                                                    }
                                                                }
                                                                if (index2 === 6) {
                                                                    total = total.toFixed(1);
                                                                    if (bandera === true) {
                                                                        $(this).html(parseFloat(total).toFixed(2));
                                                                        $(this).prop({contenteditable: false});
                                                                        $(this).css("color", "red");
                                                                    }
                                                                    else {
                                                                        $(this).html(parseFloat(total).toFixed(2));
                                                                        $(this).prop({contenteditable: true});
                                                                        $(this).css("color", "#73879C");
                                                                    }
                                                                }
                                                            });

                                                            $.montoTotal();
                                                        };

                                                        $.absolverMora = function (id) {
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '${pageContext.request.contextPath}/operaciones/absolvermoracuentacredito',
                                                                data: {id: id},
                                                                dataType: "json",
                                                                success: function (data) {
                                                                    if (data === 1) {
                                                                        $.notificar("Notificacion", "success", "Se proceso correctamente la peticion");
                                                                        $.llenarCuotasdespuespago();
                                                                    }
                                                                    else {
                                                                        if (data === 2) {
                                                                            $.notificar("Notificacion", "warning", "La mora seleccionada ya esta CONDONADA, actualice la pagina para tener las moras pendientes.");
                                                                        }
                                                                        else {
                                                                            if (data === 10) {
                                                                                window.location.href = "${pageContext.request.contextPath}/home";
                                                                            }
                                                                            else {
                                                                                $.notificar("Notificacion", "error", "Ocurrio un error al procesar la accion");
                                                                            }
                                                                        }
                                                                    }
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    $.notificar("Notificacion", "error", "Error: " + error);
                                                                }
                                                            });
                                                        };
        </script>
        <script type="text/javascript">
                    $(document).ready(function () {
                        $("#opcionCliente").change(function () {
                            var val = $("#opcionCliente").val();
                            if (val === "1") {
                                $("#opcionPersonanatural").show();
                                $("#opcionPersonajuridica").hide();
                            }
                            else {
                                if (val === "2") {
                                    $("#opcionPersonajuridica").show();
                                    $("#opcionPersonanatural").hide();
                                }
                            }
                        });

                        $('.open-tab').click(function () {
                            $("#myTab li[class=active]").removeClass("active");

                            var tab = $("#profile-tab").parent();
                            tab.addClass("active");
                        });
                    });
        </script>
    </body>
</html>
