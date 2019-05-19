<%-- 
    Document   : categoria
    Created on : 29/12/2015, 10:47:48 AM
    Author     : Nerio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%SimpleDateFormat formateadorFecha = new SimpleDateFormat("EEEE d MMMM yyyy (HH:mm");%>
<!DOCTYPE html>
<html ng-app="adminProductoahorroModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar producto ahorro</title>
        <%@include file="../shared/favicon.jsp" %>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/animate/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de error  -->
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <!--  Estilos de datepicker  -->
        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
    </head>
    <body ng-controller="ProductoahorroController" class="nav-md" style="font-family: Cambria">
        <div class="container body">
            <div class="main_container">
                <%@include file="../shared/navbarLeft.jsp" %>
                <%@include file="../shared/navbarTop.jsp" %>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Administracion de productos ahorro </h4>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Go!</button>
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
                                        <h2>Crear nuevo producto ahorro <i class="fa fa-book"></i></h2>
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
                                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                                    <label>Tipo ahorro (*)</label>
                                                    <select ng-options="tipoahorro as tipoahorro.denominacion for tipoahorro in tipoahorros track by tipoahorro.id" ng-model="productoahorro.tipoahorro" ng-change="actualizarFormulario()" class="form-control">
                                                    </select>
                                                </div>
                                                <form id="formulario1" name="formulario1" ng-submit="registrarProductopf(formulario1)" ng-validate="validationFormulario1">
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Nombre producto (*)</label>
                                                        <input ng-model="productoahorro.nombre" name="nombre" class="form-control" placeholder="PLAZOFIJO" autofocus="" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Descripcion</label>
                                                        <textarea ng-model="productoahorro.descripcion" name="descripcion" class="form-control" placeholder="AHORRO A PLAZO FIJO"></textarea>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Moneda (*)</label>
                                                        <select ng-options="tipomoneda as tipomoneda.denominacion for tipomoneda in tipomonedas track by tipomoneda.id" ng-model="productoahorro.tipomoneda" name="tipomoneda" class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Tasa efectiva anual(*)</label>
                                                        <input ng-model="productoahorro.tea" name="tea" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Inicio fecha vigencia (*)</label>
                                                        <input ng-model="productoahorro.inicioFechaVigencia" name="inicioFechaVigencia" class="form-control" id="datepicker1">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Fin fecha vigencia (*)</label>
                                                        <input ng-model="productoahorro.finFechaVigencia" name="finFechaVigencia" class="form-control" id="datepicker2">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Documentos sustentatorios</label>
                                                        <textarea ng-model="productoahorro.docSustentatorios" name="docSustentatorios" class="form-control" placeholder="TITULOS..."></textarea>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Monto minimo</label>
                                                        <input ng-model="productoahorro.montoMinimo" name="montoMinimo" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Monto maximo</label>
                                                        <input ng-model="productoahorro.montoMaximo" name="montoMaximo" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Periodo minimo</label>
                                                        <input ng-model="productoahorro.periodoMinimo" name="periodoMinimo" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Periodo máximo</label>
                                                        <input ng-model="productoahorro.periodoMaximo" name="periodoMaximo" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                                        <input type="submit" value="Crear" class="btn btn-primary">
                                                    </div>
                                                </form>
                                                <form id="formulario2" name="formulario2" ng-submit="registrarProductoah(formulario2)" ng-validate="validationFormulario2" hidden="">
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Nombre producto (*)</label>
                                                        <input ng-model="productoahorro.nombre" name="nombre" type="text" class="form-control" placeholder="RAPIDIARIOS" autofocus="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Descripcion</label>
                                                        <textarea ng-model="productoahorro.descripcion" name="descripcion" class="form-control" placeholder="AHORRO DE APORTES EN RANGOS DE TIEMPO"></textarea>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Moneda (*)</label>
                                                        <select ng-options="tipomoneda as tipomoneda.denominacion for tipomoneda in tipomonedas track by tipomoneda.id" ng-model="productoahorro.tipomoneda" name="tipomoneda" class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Tasa efectiva anual (*)</label>
                                                        <input ng-model="productoahorro.tea" name="tea" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Inicio fecha vigencia (*)</label>
                                                        <input ng-model="productoahorro.inicioFechaVigencia" name="inicioFechaVigencia" class="form-control" id="datepicker3"/>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Fin fecha vigencia (*)</label>
                                                        <input ng-model="productoahorro.finFechaVigencia" name="finFechaVigencia" class="form-control" id="datepicker4"/>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Documentos sustentatorios</label>
                                                        <textarea ng-model="productoahorro.docSustentatorios" name="docSustentatorios" class="form-control" placeholder="TITULOS..."></textarea>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Frecuencia aporte</label>
                                                        <select ng-options="frecuenciaaporte as frecuenciaaporte.nombre for frecuenciaaporte in frecuenciaaportes track by frecuenciaaporte.id" ng-model="productoahorro.frecuenciaaporte" name="frecuenciaaporte" class="form-control">
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Monto minimo</label>
                                                        <input ng-model="productoahorro.montoMinimo" name="montoMinimo" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Monto maximo</label>
                                                        <input ng-model="productoahorro.montoMaximo" name="montoMaximo" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Monto inscripcion</label>
                                                        <input ng-model="productoahorro.montoInscripcion" name="montoInscripcion" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                                        <label>Monto carnet</label>
                                                        <input ng-model="productoahorro.montoCarnet" name="montoCarnet" class="form-control" type="number">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                                        <input type="submit" value="Crear" class="btn btn-primary">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <div class="profile_title">
                                            <div class="col-ss-12 col-xs-4">
                                                <h2>Productos ahorro</h2>
                                            </div>
                                            <div class="col-ss-12 col-xs-8">
                                                <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    <span style="color: #73879C"><%=formateadorFecha.format(new Date())%>) Horas</span> <b class="caret"></b>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Actividad reciente</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                        <!-- start recent activity -->
                                                        <ul class="messages" id="listaProductocredito">
                                                            <li ng-repeat="productoahorro in productoahorros">
                                                                <img src="" class="avatar" alt="Avatar" >
                                                                <div class="message_date">
                                                                    <h4 class="date text-info">{{productoahorro.finFechaVigencia}}</h4>
                                                                    <p class="month">Fin vigencia</p>
                                                                </div>
                                                                <div class="message_wrapper">
                                                                    <h4 class="heading">{{productoahorro.nombre}}</h4>
                                                                    <blockquote class="message" style="font-size: 13px">
                                                                        <b>Codigo: </b>{{productoahorro.codigo}}<br>
                                                                        <b>Descripcion: </b>{{productoahorro.descripcion}}<br>
                                                                        <b>Tasa: </b>{{productoahorro.tea}}%<br>
                                                                        <b>Tipo: </b>{{productoahorro.tipoahorro.denominacion}}<br>
                                                                        <b>Monto maximo: </b>{{productoahorro.montoMaximo}}<br>
                                                                        <b>Monto minimo: </b>{{productoahorro.montoMinimo}}<br>
                                                                    </blockquote>
                                                                    <br />
                                                                    <p class="url">
                                                                        <span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
                                                                        <a ng-click="modificarproductoahorro(productoahorro)" href="javascript:void(0)"><i class="fa fa-paperclip"></i> Editar </a>
                                                                        <span class="fs1 text-info" aria-hidden="true" data-icon="" style="padding-left: 20px"></span>
                                                                        <a ng-click="eliminarproductoahorro(productoahorro)" href="javascript:void(0)" style="color: red"><i class="fa fa-trash"></i> Eliminar </a>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@include file="../shared/footer.jsp" %>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formulario3" ng-submit="registrarProductopf(formulario3)" ng-validate="validationFormulario3">
                        <div class="modal-header" style="color: #449ACA; text-align: center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"  id="myModalLabel">Modificar producto ahorro</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Nombre producto (*)</label>
                                    <input ng-model="productoahorro2.nombre" name="nombre" class="form-control" placeholder="PLAZOFIJO" autofocus="" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                    <label>Descripcion</label>
                                    <textarea ng-model="productoahorro2.descripcion" name="descripcion" class="form-control" placeholder="AHORRO A PLAZO FIJO"></textarea>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Moneda (*)</label>
                                    <select ng-options="tipomoneda as tipomoneda.denominacion for tipomoneda in tipomonedas track by tipomoneda.id" ng-model="productoahorro2.tipomoneda" name="tipomoneda" class="form-control">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Tasa efectiva anual(*)</label>
                                    <input ng-model="productoahorro2.tea" name="tea" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Fin fecha vigencia (*)</label>
                                    <input ng-model="productoahorro2.finFechaVigencia" name="finFechaVigencia" class="form-control" id="datepicker2">
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                    <label>Documentos sustentatorios</label>
                                    <textarea ng-model="productoahorro2.docSustentatorios" name="docSustentatorios" class="form-control" placeholder="TITULOS..."></textarea>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Monto minimo</label>
                                    <input ng-model="productoahorro2.montoMinimo" name="montoMinimo" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Monto maximo</label>
                                    <input ng-model="productoahorro2.montoMaximo" name="montoMaximo" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Periodo minimo</label>
                                    <input ng-model="productoahorro2.periodoMinimo" name="periodoMinimo" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Periodo máximo</label>
                                    <input ng-model="productoahorro2.periodoMaximo" name="periodoMaximo" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                    <input type="submit" value="Crear" class="btn btn-primary">
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formulario4" ng-submit="registrarProductoah(formulario4)" ng-validate="validationFormulario4" hidden="">
                        <div class="modal-header" style="color: #449ACA; text-align: center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel2">Modificar producto ahorro</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">                            
                                <div class="col-ss-12 col-xs-6 col-sm-6">
                                    <label>Nombre producto (*)</label>
                                    <input ng-model="productoahorro2.nombre" name="nombre" type="text" class="form-control" placeholder="RAPIDIARIOS" autofocus="">
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                    <label>Descripcion</label>
                                    <textarea ng-model="productoahorro2.descripcion" name="descripcion" class="form-control" placeholder="AHORRO DE APORTES EN RANGOS DE TIEMPO"></textarea>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Moneda (*)</label>
                                    <select ng-options="tipomoneda as tipomoneda.denominacion for tipomoneda in tipomonedas track by tipomoneda.id" ng-model="productoahorro2.tipomoneda" name="tipomoneda" class="form-control">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Tasa efectiva anual (*)</label>
                                    <input ng-model="productoahorro2.tea" name="tea" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Fin fecha vigencia (*)</label>
                                    <input ng-model="productoahorro2.finFechaVigencia" name="finFechaVigencia" class="form-control" id="datepicker6"/>
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                    <label>Documentos sustentatorios</label>
                                    <textarea ng-model="productoahorro2.docSustentatorios" name="docSustentatorios" class="form-control" placeholder="TITULOS..."></textarea>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Frecuencia aporte</label>
                                    <select ng-options="frecuenciaaporte as frecuenciaaporte.nombre for frecuenciaaporte in frecuenciaaportes track by frecuenciaaporte.id" ng-model="productoahorro2.frecuenciaaporte" name="frecuenciaaporte" class="form-control">
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Monto aporte</label>
                                    <input ng-model="productoahorro2.montoAporte" name="montoAporte" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Monto inscripcion</label>
                                    <input ng-model="productoahorro2.montoInscripcion" name="montoInscripcion" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-3">
                                    <label>Monto carnet</label>
                                    <input ng-model="productoahorro2.montoCarnet" name="montoCarnet" class="form-control" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                    <input type="submit" value="Crear" class="btn btn-primary">
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/progressbar/bootstrap-progressbar.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>


        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/adminProductoahorroModule.js" type="text/javascript"></script>

        <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
                                                    $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
                                                    $("#datepicker3").datepicker({dateFormat: 'yy-mm-dd'});
                                                    $("#datepicker4").datepicker({dateFormat: 'yy-mm-dd'});
                                                });
        </script>
    </body>
</html>
