<%-- 
    Document   : categoria
    Created on : 29/12/2015, 10:47:48 AM
    Author     : Nerio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%SimpleDateFormat formateadorFecha = new SimpleDateFormat("EEEE d MMMM yyyy (HH:mm");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar producto credito</title>
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
    <body class="nav-md" style="font-family: Cambria">
        <div class="container body">
            <div class="main_container">
                <%@include file="../shared/navbarLeft.jsp" %>
                <%@include file="../shared/navbarTop.jsp" %>
                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Administracion de productos crediticios </h4>
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
                                        <h2>Crear nuevo producto crediticio <i class="fa fa-book"></i></h2>
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
                                                <form id="formulario">

                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Nombre</label>
                                                        <input name="nombre" type="text" class="form-control" placeholder="REGULAR" autofocus="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Tipo credito</label>
                                                        <select name="idTipoCredito" class="form-control">
                                                            <c:forEach var="item" items="${listaTipocredito}">
                                                                <option value="${item.id}">${item.denominacion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Descripcion</label>
                                                        <textarea name="descripcion" class="form-control" placeholder="CREDITO OTORGADO SIN OBJETIVO DESCRITO"></textarea>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-6">
                                                        <label>Tipo garantia</label>
                                                        <select name="idTipoGarantia" class="form-control">
                                                            <c:forEach var="item" items="${listaTipogarantia}">
                                                                <option value="${item.id}">${item.denominacion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Moneda</label>
                                                        <select name="idTipoMoneda" class="form-control">
                                                            <c:forEach var="item" items="${listaTipomoneda}">
                                                                <option value="${item.id}">${item.denominacion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Pagos</label>
                                                        <select name="idFrecuenciapago" class="form-control">
                                                            <c:forEach var="item" items="${listaFrecuenciapago}">
                                                                <option value="${item.id}">${item.nombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Monto minimo</label>
                                                        <input name="montoMinimo" class="form-control" type="number" value="100">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Monto maximo</label>
                                                        <input name="montoMaximo" class="form-control" type="number" value="1000">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Tasa de interes <i id="tipoPago">(*)</i></label>
                                                        <input name="tasa" class="form-control" type="number" value="40">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Periodo de gracia minimo</label>
                                                        <input name="minPeriodoGracia" class="form-control" type="number" value="0">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Periodo de gracia maximo</label>
                                                        <input name="maxPeriodoGracia" class="form-control" type="number" value="10">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Plazo de pago minimo(dias)</label>
                                                        <input name="minDiasPlazoPago" class="form-control" type="number" value="0">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Plazo de pago maximo(dias)</label>
                                                        <input name="maxDiasPlazoPago" class="form-control" type="number" value="2">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Tasa de interes mora <i>(TEM Dia) %</i></label>
                                                        <input name="tem" class="form-control" type="number" value="0.25">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Central de riesgo</label>
                                                        <input name="centralRiesgo" class="form-control" type="number" value="10">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Encaje</label>
                                                        <input name="encaje" class="form-control" type="number" value="0" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Tasa del seguro de desgravamen</label>
                                                        <input name="tasaSeguroDesgravamen" class="form-control" type="number" value="0">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Comision de gastos administrativos</label>
                                                        <input name="comisionGastosAdm" class="form-control" type="number" value="0">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Inicio fecha vigencia</label>
                                                        <input name="inicioFechaVigencia" class="form-control" id="datepicker1"/>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                        <label>Fin fecha vigencia</label>
                                                        <input name="finFechaVigencia" class="form-control" id="datepicker2"/>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Documentos sustentatorios</label>
                                                        <textarea name="docSustentatorios" class="form-control" placeholder="TITULOS..."></textarea>
                                                    </div>

                                                    <div class="col-ss-12 col-xs-12" style="padding-top: 5px">
                                                        <input id="crear" type="submit" value="Crear" class="btn btn-primary">
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
                                                <h2>Productos crediticios</h2>
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
                                                            <c:forEach var="item" items="${listaProductocredito}">
                                                                <li id="${item.id}">
                                                                    <img src="" class="avatar" alt="Avatar" >
                                                                    <div class="message_date">
                                                                        <h4 class="date text-info"><fmt:formatDate pattern="YYYY-MM-dd" value="${item.finFechaVigencia}"></fmt:formatDate></h4>
                                                                            <p class="month">Fin vigencia</p>
                                                                        </div>
                                                                        <div class="message_wrapper">
                                                                            <h4 class="heading">${item.nombre}</h4>
                                                                        <blockquote class="message" style="font-size: 13px">
                                                                            <b>Codigo: </b>${item.codigo}<br>
                                                                            <b>Descripcion: </b>${item.descripcion}<br>
                                                                            <b>Monto maximo: </b>${item.montoMaximo}<br>
                                                                            <b>Tasa: </b>${item.tasa}<br>
                                                                            <c:forEach var="moneda" items="${listaTipomoneda}">
                                                                                <c:if test="${moneda.id eq item.idTipoMoneda}">
                                                                                    <b>Moneda: </b>${moneda.denominacion}<br>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <b>Pagos: </b>${item.frecuenciapago.nombre}<br>
                                                                        </blockquote>
                                                                        <br />
                                                                        <p class="url">
                                                                            <span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
                                                                            <a href="javascript:void(0)" onclick="$.abrirModal(${item.id}, '${item.nombre}', '${item.descripcion}', ${item.montoMinimo}, ${item.montoMaximo}, ${item.tasa}, ${item.minPeriodoGracia}, ${item.maxPeriodoGracia}, ${item.minDiasPlazoPago}, ${item.maxDiasPlazoPago}, ${item.tem}, ${item.centralRiesgo}, ${item.encaje}, ${item.tasaSeguroDesgravamen}, ${item.comisionGastosAdm}, '${item.inicioFechaVigencia}', '${item.finFechaVigencia}', '${item.docSustentatorios}', ${item.estado}, ${item.idTipoMoneda}, ${item.idTipoCredito}, ${item.frecuenciapago.id})"><i class="fa fa-paperclip"></i> Editar </a>
                                                                            <span class="fs1 text-info" aria-hidden="true" data-icon="" style="padding-left: 20px"></span>
                                                                            <a href="javascript:void(0)" onclick="$.quitarProductocredito(${item.id})" style="color: red"><i class="fa fa-trash"></i> Eliminar </a>
                                                                        </p>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>
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
                    <form id="formulario2">
                        <div class="modal-header" style="color: #449ACA; text-align: center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Modificar producto credito</h4>
                        </div>
                        <div id="bodyModal" class="modal-body">
                            <div class="row">
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Nombre</label>
                                    <input name="id2" type="number" hidden="">
                                    <input name="nombre2" class="form-control" placeholder="NOMBRE PRODUCTO CREDITO" type="text">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Tipo credito</label>
                                    <select name="idTipoCredito2" class="form-control">
                                        <c:forEach var="item" items="${listaTipocredito}">
                                            <option value="${item.id}">${item.denominacion}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12 col-md-12">
                                    <label>Descripcion</label>
                                    <textarea name="descripcion2" class="form-control" placeholder="DESCRIPCION"></textarea>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Frecuencia pago</label>
                                    <select name="idFrecuenciapago2" class="form-control">
                                        <c:forEach var="item" items="${listaFrecuenciapago}">
                                            <option value="${item.id}">${item.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Monto minimo</label>
                                    <input name="montoMinimo2" class="form-control" placeholder="MONTO MINIMO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Monto maximo</label>
                                    <input name="montoMaximo2" class="form-control" placeholder="MONTO MAXIMO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Tasa de interes</label>
                                    <input name="tasa2" class="form-control" placeholder="TASA" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Periodo de gracia minimo</label>
                                    <input name="minPeriodoGracia2" class="form-control" placeholder="PERIODO GRACIA MINIMO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Periodo gracia maximo</label>
                                    <input name="maxPeriodoGracia2" class="form-control" placeholder="PERIODO GRACIA MAXIMO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Plazo de pago minimo(dias)</label>
                                    <input name="minDiasPlazoPago2" class="form-control" placeholder="PLAZO DE PAGO MINIMO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Plazo de pago maximo(dias)</label>
                                    <input name="maxDiasPlazoPago2" class="form-control" placeholder="PLAZO DE PAGO MAXIMO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Tasa de interes mora <i>(TEM Dia) %</i></label>
                                    <input name="tem2" class="form-control" placeholder="TASA INTERES MORA" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Central de riesgo</label>
                                    <input name="centralRiesgo2" class="form-control" placeholder="CENTRAL DE RIESGO" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Encaje</label>
                                    <input name="encaje2" class="form-control" placeholder="ENCAJE" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Tasa seguro desgravamen</label>
                                    <input name="tasaSeguroDesgravamen2" class="form-control" placeholder="TASA SEGURO DESGRAVAMEN" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Comision de gastos administrativos</label>
                                    <input name="comisionGastosAdm2" class="form-control" placeholder="COMISION GASTOS ADMINISTRATIVOS" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-6 col-sm-6 col-md-6">
                                    <label>Fecha fin vigencia</label>
                                    <input name="finFechaVigencia2" class="form-control" id="datepicker3" placeholder="FIN VIGENCIA">
                                </div>
                                <div class="col-ss-12 col-xs-12 col-sm-12 col-md-12">
                                    <label>Documentos sustentatorios</label>
                                    <textarea name="docSustentatorios2" class="form-control" placeholder="DOCUMENTOS SUSTENTATORIOS"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Actulizar</button>
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

                                                                                $.limpiarControles = function () {
                                                                                    $("#formulario input[name=nombre]").val("");
                                                                                    $("#formulario textarea[name=descripcion]").val("");
                                                                                    $("#formulario input[name=montoMinimo]").val(0);
                                                                                    $("#formulario input[name=montoMaximo]").val(0);
                                                                                    $("#formulario input[name=tasa]").val(0);
                                                                                    $("#formulario input[name=minPeriodoGracia]").val(0);
                                                                                    $("#formulario input[name=maxPeriodoGracia]").val(0);
                                                                                    $("#formulario input[name=minDiasPlazoPago]").val(0);
                                                                                    $("#formulario input[name=maxDiasPlazoPago]").val(0);
                                                                                    $("#formulario input[name=tem]").val(0);
                                                                                    $("#formulario input[name=centralRiesgo]").val(0);
                                                                                    $("#formulario input[name=tasaComision]").val(0);
                                                                                    $("#formulario input[name=tasaSeguroDesgravamen]").val(0);
                                                                                    $("#formulario input[name=comisionGastosAdm]").val(0);
                                                                                    $("#formulario input[name=inicioFechaVigencia]").val("");
                                                                                    $("#formulario input[name=finFechaVigencia]").val("");
                                                                                    $("#formulario textarea[name=docSustentatorios]").val("");
                                                                                };

                                                                                $("#formulario select[name=idTipoCredito]").change(function () {
                                                                                    var selected = $("#formulario select[name=idTipoCredito] option:selected").text().toUpperCase();
                                                                                    if (selected === "EXTRAORDINARIO") {
                                                                                        $("#formulario input[name=encaje]").attr({disabled: true});
                                                                                        $("#formulario input[name=encaje]").val(0);
                                                                                    }
                                                                                    else {
                                                                                        $("#formulario input[name=encaje]").removeAttr("disabled");
                                                                                    }
                                                                                });

                                                                                $("#formulario2 select[name=idTipoCredito2]").change(function () {
                                                                                    var selected = $("#formulario2 select[name=idTipoCredito2] option:selected").text().toUpperCase();
                                                                                    if (selected === "EXTRAORDINARIO") {
                                                                                        $("#formulario2 input[name=encaje2]").attr({disabled: true});
                                                                                        $("#formulario2 input[name=encaje2]").val(0);
                                                                                    }
                                                                                    else {
                                                                                        $("#formulario2 input[name=encaje2]").removeAttr("disabled");
                                                                                    }
                                                                                });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#formulario").validate({
                    rules: {
                        nombre: {
                            required: true
                        },
                        descripcion: {
                            required: true
                        },
                        montoMinimo: {
                            required: true
                        },
                        montoMaximo: {
                            required: true
                        },
                        tasa: {
                            required: true
                        },
                        minPeriodoGracia: {
                            required: true
                        },
                        maxPeriodoGracia: {
                            required: true
                        },
                        minDiasPlazoPago: {
                            required: true
                        },
                        maxDiasPlazoPago: {
                            required: true
                        },
                        tem: {
                            required: true
                        },
                        centralRiesgo: {
                            required: true
                        },
                        encaje: {
                            required: true
                        },
                        tasaSeguroDesgravamen: {
                            required: true
                        },
                        comisionGastosAdm: {
                            required: true
                        },
                        inicioFechaVigencia: {
                            required: true
                        },
                        finFechaVigencia: {
                            required: true
                        },
                        docSustentatorios: {
                            required: true
                        },
                        idTipoMoneda: {
                            required: true
                        },
                        idTipoGarantia: {
                            required: true
                        },
                        idTipoCredito: {
                            required: true
                        },
                        idFrecuenciapago: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        descripcion: {
                            required: "Campo obligatorio"
                        },
                        montoMinimo: {
                            required: "Campo obligatorio"
                        },
                        montoMaximo: {
                            required: "Campo obligatorio"
                        },
                        tasa: {
                            required: "Campo obligatorio"
                        },
                        minPeriodoGracia: {
                            required: "Campo obligatorio"
                        },
                        maxPeriodoGracia: {
                            required: "Campo obligatorio"
                        },
                        minDiasPlazoPago: {
                            required: "Campo obligatorio"
                        },
                        maxDiasPlazoPago: {
                            required: "Campo obligatorio"
                        },
                        tem: {
                            required: "Campo obligatorio"
                        },
                        centralRiesgo: {
                            required: "Campo obligatorio"
                        },
                        encaje: {
                            required: "Campo obligatorio"
                        },
                        tasaSeguroDesgravamen: {
                            required: "Campo obligatorio"
                        },
                        comisionGastosAdm: {
                            required: "Campo obligatorio"
                        },
                        inicioFechaVigencia: {
                            required: "Campo obligatorio"
                        },
                        finFechaVigencia: {
                            required: "Campo obligatorio"
                        },
                        docSustentatorios: {
                            required: "Campo obligatorio"
                        },
                        idTipoMoneda: {
                            required: "Campo obligatorio"
                        },
                        idTipoGarantia: {
                            required: "Campo obligatorio"
                        },
                        idTipoCredito: {
                            required: "Campo obligatorio"
                        },
                        idFrecuenciapago: {
                            required: "Campo obligatorio"
                        }
                    },
                    submitHandler: function () {
                        var inicioFechaVigencia = $("#formulario input[name=inicioFechaVigencia]").val();
                        var finFechaVigencia = $("#formulario input[name=finFechaVigencia]").val();
                        var frecuenciapago = {
                            id: $("#formulario select[name=idFrecuenciapago]").val()
                        };
                        var productocredito = {
                            nombre: $("#formulario input[name=nombre]").val(),
                            descripcion: $("#formulario textarea[name=descripcion]").val(),
                            montoMinimo: $("#formulario input[name=montoMinimo]").val(),
                            montoMaximo: $("#formulario input[name=montoMaximo]").val(),
                            tasa: $("#formulario input[name=tasa]").val(),
                            minPeriodoGracia: $("#formulario input[name=minPeriodoGracia]").val(),
                            maxPeriodoGracia: $("#formulario input[name=maxPeriodoGracia]").val(),
                            minDiasPlazoPago: $("#formulario input[name=minDiasPlazoPago]").val(),
                            maxDiasPlazoPago: $("#formulario input[name=maxDiasPlazoPago]").val(),
                            tem: $("#formulario input[name=tem]").val(),
                            centralRiesgo: $("#formulario input[name=centralRiesgo]").val(),
                            encaje: $("#formulario input[name=encaje]").val(),
                            tasaSeguroDesgravamen: $("#formulario input[name=tasaSeguroDesgravamen]").val(),
                            comisionGastosAdm: $("#formulario input[name=comisionGastosAdm]").val(),
                            inicioFechaVigencia: inicioFechaVigencia,
                            finFechaVigencia: finFechaVigencia,
                            docSustentatorios: $("#formulario textarea[name=docSustentatorios]").val(),
                            idTipoMoneda: $("#formulario select[name=idTipoMoneda]").val(),
                            idTipoGarantia: $("#formulario select[name=idTipoGarantia]").val(),
                            idTipoCredito: $("#formulario select[name=idTipoCredito]").val(),
                            frecuenciapago: frecuenciapago
                        };
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/administracion/productocredito",
                            contentType: "application/json",
                            data: JSON.stringify(productocredito),
                            dataType: "json",
                            success: function (data) {
                                if (data === 0) {
                                    $.notificar("Notificacion", "error", "Error, se produjo un error al registrar los datos");
                                }
                                else {
                                    $.notificar("Notificacion", "success", "Los datos se han regitrado correctamente");
                                    $.limpiarControles();
                                    $("#listaProductocredito").prepend(
                                            '<li id="' + data.id + '"><img src="" class="avatar" alt="Avatar" >' +
                                            '<div class="message_date">' +
                                            '<h4 class="date text-info">' + data.finFechaVigencia + '</h4>' +
                                            '<p class="month">Fin vigencia</p>' +
                                            '</div>' +
                                            '<div class="message_wrapper">' +
                                            '<h4 class="heading">' + data.nombre + '</h4>' +
                                            '<blockquote class = "message" style = "font-size: 13px">' +
                                            '<b> Descripcion: </b>' + data.descripcion + '<br>' +
                                            '<b>Codigo: </b>' + data.codigo + '<br>' +
                                            '<b> Monto maximo: </b>' + data.montoMaximo + '<br>' +
                                            '<b> Tasa: </b>' + data.tasa + '<br>' +
                                            '<b> Moneda: </b>' + data.tipoMoneda + '<br>' +
                                            '<b> Pagos: </b>' + data.frecuenciaPago + '<br>' +
                                            '</blockquote>' +
                                            '<br/>' +
                                            '<p class="url">' +
                                            '<span class="fs1 text-info" aria-hidden="true" data-icon=""></span>' +
                                            '<a href="javascript:void(0)" onclick="$.abrirModal(' + data.id + ', \'' + data.nombre + '\', \'' + data.descripcion + '\', ' + data.montoMinimo + ', ' + data.montoMaximo + ', ' + data.tasa + ', ' + data.minPeriodoGracia + ', ' + data.maxPeriodoGracia + ', ' + data.minDiasPlazoPago + ', ' + data.maxDiasPlazoPago + ', ' + data.tem + ', ' + data.centralRiesgo + ', ' + data.encaje + ', ' + data.tasaSeguroDesgravamen + ', ' + data.comisionGastosAdm + ', \'' + data.inicioFechaVigencia + '\', \'' + data.finFechaVigencia + '\', \'' + data.docSustentatorios + '\', ' + data.estado + ', ' + data.idTipoMoneda + ', ' + data.idTipoCredito + ', ' + data.idFrecuenciapago + ')"><i class="fa fa-paperclip"></i> Editar </a>' +
                                            '<span class="fs1 text-info" aria-hidden="true" data-icon="" style="padding-left: 20px"></span>' +
                                            '<a href="javascript:void(0)" onclick="$.quitarProductocredito(' + data.id + ')" style="color: red"><i class="fa fa-trash"></i> Eliminar </a>' +
                                            '</p>' +
                                            '</div></li>');
                                }

                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                });

                $("#formulario2").validate({
                    rules: {
                        nombre2: {
                            required: true
                        },
                        idTipoCredito2: {
                            required: true
                        },
                        descripcion2: {
                            required: true
                        },
                        idFrecuenciapago2: {
                            required: true
                        },
                        montoMinimo2: {
                            required: true
                        },
                        montoMaximo2: {
                            required: true
                        },
                        tasa2: {
                            required: true
                        },
                        minPeriodoGracia2: {
                            required: true
                        },
                        maxPeriodoGracia2: {
                            required: true
                        },
                        minDiasPlazoPago2: {
                            required: true
                        },
                        maxDiasPlazoPago2: {
                            required: true
                        },
                        tem2: {
                            required: true
                        },
                        centralRiesgo2: {
                            required: true
                        },
                        encaje2: {
                            required: true
                        },
                        tasaSeguroDesgravamen2: {
                            required: true
                        },
                        comisionGastosAdm2: {
                            required: true
                        },
                        finFechaVigencia2: {
                            required: true
                        },
                        docSustentatorios2: {
                            required: true
                        }
                    },
                    messages: {
                        nombre2: {
                            required: "Campo obligatorio"
                        },
                        idTipoCredito2: {
                            required: "Campo obligatorio"
                        },
                        descripcion2: {
                            required: "Campo obligatorio"
                        },
                        idFrecuenciapago2: {
                            required: "Campo obligatorio"
                        },
                        montoMinimo2: {
                            required: "Campo obligatorio"
                        },
                        montoMaximo2: {
                            required: "Campo obligatorio"
                        },
                        tasa2: {
                            required: "Campo obligatorio"
                        },
                        minPeriodoGracia2: {
                            required: "Campo obligatorio"
                        },
                        maxPeriodoGracia2: {
                            required: "Campo obligatorio"
                        },
                        minDiasPlazoPago2: {
                            required: "Campo obligatorio"
                        },
                        maxDiasPlazoPago2: {
                            required: "Campo obligatorio"
                        },
                        tem2: {
                            required: "Campo obligatorio"
                        },
                        centralRiesgo2: {
                            required: "Campo obligatorio"
                        },
                        encaje2: {
                            required: "Campo obligatorio"
                        },
                        tasaSeguroDesgravamen2: {
                            required: "Campo obligatorio"
                        },
                        comisionGastosAdm2: {
                            required: "Campo obligatorio"
                        },
                        finFechaVigencia2: {
                            required: "Campo obligatorio"
                        },
                        docSustentatorios2: {
                            required: "Campo obligatorio"
                        }
                    },
                    submitHandler: function () {
                        var idProductocredito = $("#formulario2 input[name=id2]").val();
                        var finFechaVigencia = $("#formulario2 input[name=finFechaVigencia2]").val();
                        var frecuenciapago = {
                            id: $("#formulario2 select[name=idFrecuenciapago2]").val()
                        };

                        var productocredito = {
                            id: idProductocredito,
                            nombre: $("#formulario2 input[name=nombre2]").val(),
                            descripcion: $("#formulario2 textarea[name=descripcion2]").val(),
                            montoMinimo: $("#formulario2 input[name=montoMinimo2]").val(),
                            montoMaximo: $("#formulario2 input[name=montoMaximo2]").val(),
                            tasa: $("#formulario2 input[name=tasa2]").val(),
                            minPeriodoGracia: $("#formulario2 input[name=minPeriodoGracia2]").val(),
                            maxPeriodoGracia: $("#formulario2 input[name=maxPeriodoGracia2]").val(),
                            minDiasPlazoPago: $("#formulario2 input[name=minDiasPlazoPago2]").val(),
                            maxDiasPlazoPago: $("#formulario2 input[name=maxDiasPlazoPago2]").val(),
                            tem: $("#formulario2 input[name=tem2]").val(),
                            centralRiesgo: $("#formulario2 input[name=centralRiesgo2]").val(),
                            encaje: $("#formulario2 input[name=encaje2]").val(),
                            tasaSeguroDesgravamen: $("#formulario2 input[name=tasaSeguroDesgravamen2]").val(),
                            comisionGastosAdm: $("#formulario2 input[name=comisionGastosAdm2]").val(),
                            finFechaVigencia: finFechaVigencia,
                            docSustentatorios: $("#formulario2 textarea[name=docSustentatorios2]").val(),
                            idTipoCredito: $("#formulario2 select[name=idTipoCredito2]").val(),
                            frecuenciapago: frecuenciapago
                        };
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/administracion/modificarproductocredito",
                            contentType: "application/json",
                            data: JSON.stringify(productocredito),
                            dataType: "json",
                            success: function (data) {
                                if (data === 0) {
                                    $.notificar("Notificacion", "error", "Error, se produjo un error al actualizar los datos");
                                }
                                else {
                                    $.notificar("Notificacion", "success", "Los datos se han actualizado correctamente");
                                    $.limpiarControles();
                                    $("#" + idProductocredito).remove();
                                    $("#listaProductocredito").prepend(
                                            '<li id="' + data.id + '"><img src="" class="avatar" alt="Avatar" >' +
                                            '<div class="message_date">' +
                                            '<h4 class="date text-info">' + data.finFechaVigencia + '</h4>' +
                                            '<p class="month">Fin vigencia</p>' +
                                            '</div>' +
                                            '<div class="message_wrapper">' +
                                            '<h4 class="heading">' + data.nombre + '</h4>' +
                                            '<blockquote class = "message" style = "font-size: 13px">' +
                                            '<b> Descripcion: </b>' + data.descripcion + '<br>' +
                                            '<b>Codigo: </b>' + data.codigo + '<br>' +
                                            '<b> Monto maximo: </b>' + data.montoMaximo + '<br>' +
                                            '<b> Tasa: </b>' + data.tasa + '<br>' +
                                            '<b> Moneda: </b>' + data.tipoMoneda + '<br>' +
                                            '<b> Pagos: </b>' + data.frecuenciaPago + '<br>' +
                                            '</blockquote>' +
                                            '<br/>' +
                                            '<p class="url">' +
                                            '<span class="fs1 text-info" aria-hidden="true" data-icon=""></span>' +
                                            '<a href="javascript:void(0)" onclick="$.abrirModal(' + data.id + ', \'' + data.nombre + '\', \'' + data.descripcion + '\', ' + data.montoMinimo + ', ' + data.montoMaximo + ', ' + data.tasa + ', ' + data.minPeriodoGracia + ', ' + data.maxPeriodoGracia + ', ' + data.minDiasPlazoPago + ', ' + data.maxDiasPlazoPago + ', ' + data.tem + ', ' + data.centralRiesgo + ', ' + data.encaje + ', ' + data.tasaSeguroDesgravamen + ', ' + data.comisionGastosAdm + ', \'' + data.inicioFechaVigencia + '\', \'' + data.finFechaVigencia + '\', \'' + data.docSustentatorios + '\', ' + data.estado + ', ' + data.idTipoMoneda + ', ' + data.idTipoCredito + ', ' + data.idFrecuenciapago + ')"><i class="fa fa-paperclip"></i> Editar </a>' +
                                            '<span class="fs1 text-info" aria-hidden="true" data-icon="" style="padding-left: 20px"></span>' +
                                            '<a href="javascript:void(0)" onclick="$.quitarProductocredito(' + data.id + ')" style="color: red"><i class="fa fa-trash"></i> Eliminar </a>' +
                                            '</p>' +
                                            '</div></li>');
                                    $("#myModal").modal('hide');
                                }

                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                });

                $("#formulario select[name=idFrecuenciapago]").change(function () {
                    $("#tipoPago").html("(" + $("#formulario select[name=idFrecuenciapago] option:selected").text().toLowerCase() + ") %");
                });

                $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
                $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
                $("#datepicker3").datepicker({dateFormat: 'yy-mm-dd'});
            });
        </script>

        <script>
            $.abrirModal = function (id, nombre, descripcion, montoMinimo, montoMaximo, tasa, minPeriodoGracia, maxPeriodoGracia, minDiasPlazoPago, maxDiasPlazoPago, tem, centralRiesgo, encaje, tasaSeguroDesgravamen, comisionGastosAdm, inicioFechaVigencia, finFechaVigencia, docSustentatorios, estado, idTipoMoneda, idTipoCredito, idFrecuenciapago) {
                $('#myModal').modal('show');

                $("#formulario2 input[name=id2]").val(id);
                $("#formulario2 input[name=nombre2]").val(nombre);
                $("#formulario2 textarea[name=descripcion2]").val(descripcion);
                $("#formulario2 input[name=montoMinimo2]").val(montoMinimo);
                $("#formulario2 input[name=montoMaximo2]").val(montoMaximo);
                $("#formulario2 input[name=tasa2]").val(tasa);
                $("#formulario2 input[name=minPeriodoGracia2]").val(minPeriodoGracia);
                $("#formulario2 input[name=maxPeriodoGracia2]").val(maxPeriodoGracia);
                $("#formulario2 input[name=minDiasPlazoPago2]").val(minDiasPlazoPago);
                $("#formulario2 input[name=maxDiasPlazoPago2]").val(maxDiasPlazoPago);
                $("#formulario2 input[name=tem2]").val(tem);
                $("#formulario2 input[name=centralRiesgo2]").val(centralRiesgo);
                $("#formulario2 input[name=encaje2]").val(encaje);
                $("#formulario2 input[name=tasaSeguroDesgravamen2]").val(tasaSeguroDesgravamen);
                $("#formulario2 input[name=comisionGastosAdm2]").val(comisionGastosAdm);
                $("#formulario2 input[name=finFechaVigencia2]").val(finFechaVigencia);
                $("#formulario2 textarea[name=docSustentatorios2]").val(docSustentatorios);
                $("#formulario2 select[name=idTipoMoneda2]").val(idTipoMoneda);
                $("#formulario2 select[name=idTipoCredito2]").val(idTipoCredito);
                $("#formulario2 select[name=idFrecuenciapago2]").val(idFrecuenciapago);
            };

            $.quitarProductocredito = function (id) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/administracion/quitarproductocredito',
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data === 0) {
                            $.notificar("Notificacion", "error", "Error al eliminar el producto credito (esto puede ser debido a que se tiene socios con este tipo de credito) ");
                        }
                        else {
                            $.notificar("Notificacion", "success", "El producto credito se elimino correctamente");
                            $("#" + id).hide();
                        }
                    },
                    error: function (xhr, status, error) {
                        $.notificar("Notificacion", "error", "Error: " + error);
                    }
                });
            };
        </script>
    </body>
</html>
