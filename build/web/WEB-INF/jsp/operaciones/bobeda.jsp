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
        <title>Administrar bobeda</title>
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
                                <h4>Administracion de bobeda </h4>
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
                                        <h2>Administracion de bobeda <i class="fa fa-book"></i></h2>
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
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <fieldset>
                                                        <legend style="font-family: Cambria">Bobeda de caja</legend>
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                <label>Id</label>
                                                                <input class="form-control" placeholder="ID" type="number" disabled="" value="${bobeda.id}">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                <label>Bobeda</label>
                                                                <input class="form-control" placeholder="BOBEDA" type="text" disabled="" value="${bobeda.nombre}">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                <label>Moneda</label>
                                                                <input class="form-control" placeholder="MONEDA" type="text" disabled="" value="${bobeda.moneda}">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                <label>Agencia</label>
                                                                <input class="form-control" placeholder="AGENCIA" type="text" disabled="true" value="${agencia.nombre}">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                                                <a href="${pageContext.request.contextPath}/operaciones/cerrarbobeda" class="btn btn-primary btn-xs">Cerrar bobeda</a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Detalle saldo por denominacion</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Transferencias</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Movimiento de saldo en bobeda</a>
                                                    </li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-6">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Inicio del dia</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped" id="detallesaldoBobedaInicial">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">Denominacion</th>
                                                                                                <th class="column-title">Valor</th>
                                                                                                <th class="column-title">Cantidad</th>
                                                                                                <th class="column-title">Total</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <c:forEach var="item" items="${listaDsbApertura}">
                                                                                                <tr>
                                                                                                    <td>${item.denominacion}</td>
                                                                                                    <td>${item.valor}</td>
                                                                                                    <td>${item.cantidad}</td>
                                                                                                    <td>${item.monto}</td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <b>Total</b> ${bobeda.montoApertura}
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-6">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Fin del dia</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped" id="detallesaldoBobedaInicial">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">Denominacion</th>
                                                                                                <th class="column-title">Valor</th>
                                                                                                <th class="column-title">Cantidad</th>
                                                                                                <th class="column-title">Total</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <c:forEach var="item" items="${listaDsbCierre}">
                                                                                                <tr>
                                                                                                    <td>${item.denominacion}</td>
                                                                                                    <td>${item.valor}</td>
                                                                                                    <td>${item.cantidad}</td>
                                                                                                    <td>${item.monto}</td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <b>Total</b> ${bobeda.montoCierre}
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <table class="table table-striped" id="detallesaldoBobedaInicial">
                                                                    <thead>
                                                                        <tr class="headings">
                                                                            <th class="column-title">N°</th>
                                                                            <th class="column-title">Cajero</th>
                                                                            <th class="column-title">Nombre</th>
                                                                            <th class="column-title">Detalle</th>
                                                                            <th class="column-title">Monto</th>
                                                                            <th class="column-title">Hora</th>
                                                                            <th class="column-title">Usuario que transfiere</th>
                                                                            <th class="column-title">Opcion</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:set var="count2" value="0" scope="page" />
                                                                        <c:forEach var="item" items="${listaTransferencia}">
                                                                            <c:set var="count2" value="${count2 + 1}" scope="page"/>
                                                                            <tr>
                                                                                <td>${count2}</td>
                                                                                <td>${item.cajeroByIdCajero1.id}</td>
                                                                                <td>${item.cajeroByIdCajero1.caja.nombre}</td>
                                                                                <td>${item.motivo}</td>
                                                                                <td>${item.monto}</td>
                                                                                <td><fmt:formatDate pattern="HH:mm" value="${item.fecha}"></fmt:formatDate></td>
                                                                                <td>${item.usuario.usuario} - ${item.usuario.empleado.persona.nombre} ${item.usuario.empleado.persona.apellidoPat}</td>
                                                                                <td class="column-title">
                                                                                    <a target="_blank" href="${pageContext.request.contextPath}/reporte/recibotransferencia?type=pdf&&idTipo=${item.tipotransferencia.id}&&id=${item.id}"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo</a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <table class="table table-striped">
                                                                    <thead>
                                                                        <tr class="headings">
                                                                            <th class="column-title">N°</th>
                                                                            <th class="column-title">Denominacion</th>
                                                                            <th class="column-title">Monto</th>
                                                                            <th class="column-title">Tipo</th>
                                                                            <th class="column-title">Bobeda</th>
                                                                            <th class="column-title">Usuario</th>
                                                                            <th class="column-title">Hora</th>
                                                                            <th class="column-title">Accion</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:set var="count3" value="0" scope="page" />
                                                                        <c:forEach var="item" items="${listaMovimientobobeda}">
                                                                            <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                                            <tr>
                                                                                <td>${count3}</td>
                                                                                <td>${item.denominacion}</td>
                                                                                <td>${item.monto}</td>
                                                                                <td>${item.ingreso}</td>
                                                                                <td>${item.bobeda.nombre}</td>
                                                                                <td>${item.usuario.empleado.persona.nombre} ${item.usuario.empleado.persona.apellidoPat}</td>
                                                                                <td><fmt:formatDate pattern="HH:mm" value="${item.fecha}"></fmt:formatDate></td>
                                                                                    <td class="column-title">
                                                                                        <a target="_blank" href="${pageContext.request.contextPath}/reporte/recibomovimientobobeda?type=pdf&&id=${item.id}"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo</a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
                                                <a href="javascript:void(0)" onclick="$.mostrarModal()"><h2>Cajeros activos <i class="fa fa-plus-circle" style="color: blueviolet"></i></h2></a>
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
                                            <table class="table table-striped" id="detallesaldoBobedaInicial">
                                                <thead>
                                                    <tr class="headings">
                                                        <th class="column-title">Estado</th>
                                                        <th class="column-title">Caja</th>
                                                        <th class="column-title">Cajero</th>
                                                        <th class="column-title">Saldo Inicial</th>
                                                        <th class="column-title">Hora apertura</th>
                                                        <th class="column-title">Saldo Final</th>
                                                        <th class="column-title">Accion</th>
                                                        <th class="column-title">Transferencia</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="item" items="${listaCajero}">
                                                        <tr>
                                                            <c:choose>
                                                                <c:when test="${item.idEstado eq 10}">
                                                                    <td style="color: blue"><b>PENDIENTE</b></td>
                                                                </c:when>
                                                                <c:when test="${item.idEstado eq 11}">
                                                                    <td style="color: green"><b>ABIERTO</b></td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td style="color: red"><b>CERRADO</b></td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td>${item.caja.nombre}</td>
                                                            <td>${item.usuario.empleado.persona.nombre} ${item.usuario.empleado.persona.apellidoPat}</td>
                                                            <td>${item.saldoApertura}</td>
                                                            <td><fmt:formatDate pattern="HH:mm" value="${item.fechaApertura}"></fmt:formatDate></td>
                                                            <td>${item.saldoCierre}</td>
                                                            <c:choose>
                                                                <c:when test="${item.idEstado eq 10}">
                                                                    <td>
                                                                        <a href="javascript:void(0)" onclick="$.mostrarDetallesaldo(${item.id})"><i class="fa fa-gear"></i> Abrir</a>
                                                                    </td>
                                                                </c:when>
                                                                <c:when test="${item.idEstado eq 11}">
                                                                    <td>-</td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td><a href="javascript:void(0)" onclick="$.reaperturarCaja(${item.id})"><i class="fa fa-gears"></i> Reabrir caja</a></td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${item.idEstado eq 10}">
                                                                    <td>-</td>
                                                                </c:when>
                                                                <c:when test="${item.idEstado eq 11}">
                                                                    <td>
                                                                        <a href="javascript:void(0)" onclick="$.mostrarDetallesaldo2(${item.id})"><i class="fa fa-cube"></i> Transferencia</a>    
                                                                    </td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>-</td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div id="detailPanel" class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px" hidden="">
                                            <div class="panel panel-danger">
                                                <div class="panel-heading" style="text-align: center">Detalles saldo cajero</div>
                                                <div class="panel-body">

                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-6">
                                                            <fieldset>
                                                                <legend style="font-family: Cambria">Inicio del dia</legend>
                                                                <table class="table table-striped" id="detallesaldoCajeroInicial">
                                                                    <thead>
                                                                        <tr class="headings">
                                                                            <th class="column-title">Denominacion</th>
                                                                            <th class="column-title">Valor</th>
                                                                            <th class="column-title">Cantidad</th>
                                                                            <th class="column-title">Total</th>
                                                                            <th class="column-title">Accion</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <select onchange="$.calcular()">
                                                                                    <option value="200">DOSCIENTOS</option>
                                                                                    <option value="100">CIEN</option>
                                                                                    <option value="50">CINCUENTA</option>
                                                                                    <option value="20">VEINTE</option>
                                                                                    <option value="10">DIEZ</option>
                                                                                    <option value="5">CINCO</option>
                                                                                    <option value="2">DOS</option>
                                                                                    <option value="1">UN SOL</option>
                                                                                    <option value="0.5">CINCUENTA CENTIMOS</option>
                                                                                    <option value="0.2">VEINTE CENTIMOS</option>
                                                                                    <option value="0.1">DIEZ CENTIMOS</option>
                                                                                </select>
                                                                            </td>
                                                                            <td>200.00</td>
                                                                            <td contenteditable="true" onkeyup="$.calcular()">0</td>
                                                                            <td>0.0</td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" onclick="$.quitarCelda($(this).parent().parent())"><i class="fa fa-close" style="color: red"></i></a>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <a href="javascript:void(0)" onclick="$.agregarCelda()"><i class="fa fa-plus" style="color: blue">Agregar celda</i></a>
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6">
                                                            <fieldset>
                                                                <legend style="font-family: Cambria">Fin del dia</legend>
                                                                <table class="table table-striped" id="detallesaldoCajeroFinal">
                                                                    <thead>
                                                                        <tr class="headings">
                                                                            <th class="column-title">Denominacion</th>
                                                                            <th class="column-title">Valor</th>
                                                                            <th class="column-title">Cantidad</th>
                                                                            <th class="column-title">Total</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>DOSCIENTOS</td>
                                                                            <td>200.00</td>
                                                                            <td>0</td>
                                                                            <td>0.0</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <div style="text-align: right">
                                                                    <b>TOTAL SALDO APERTURA: </b><b id="totalSaldoInicio">0.0</b>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="padding-top: 15px">
                                                        <div id="denominacionRemesaPanel" class="col-ss-12 col-xs-12" hidden="">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer" style="text-align: center">

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
        <div class="modal fade" id="modalCaja" tabindex="-1" role="dialog" aria-labelledby="modalCajaLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formulario">
                        <div class="modal-header" style="color: #449ACA; text-align: center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="modalBuscarClienteLabel">Activar cajero</h4>
                        </div>
                        <div id="bodyModal" class="modal-body">
                            <div class="row">
                                <div class="col-ss-12 col-xs-12">
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Seleccione caja</label>
                                                <select name="idCaja" class="form-control">
                                                    <c:forEach var="item" items="${listaCaja}">
                                                        <option value="${item.id}">${item.nombre}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Seleccione usuario</label>
                                                <select name="idUsuario" class="form-control">
                                                    <c:forEach var="item" items="${listaUsuario}">
                                                        <option value="${item.id}">${item.usuario} - ${item.empleado.persona.nombre} ${item.empleado.persona.apellidoPat}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button onclick="$.activarCajero()" type="button" class="btn btn-primary">Activar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">Cancelar</button>
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
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#formulario").validate({
                    rules: {
                        idCaja: {
                            required: true
                        },
                        idUsuario: {
                            required: true
                        }
                    },
                    messages: {
                        idCaja: {
                            required: "Seleccione uno obligatoriamente"
                        },
                        idUsuario: {
                            required: "Seleccione uno obligatoriamente"
                        }
                    },
                    submitHandler: function () {
                        var idCaja = $("#formulario select[name=idCaja] option:selected").val();
                        var idUsuario = $("#formulario select[name=idUsuario] option:selected").val();
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/operaciones/agregarcajero",
                            data: {idCaja: idCaja, idUsuario: idUsuario},
                            dataType: "json",
                            success: function (data) {
                                if (data === 0) {
                                    $.notificar("Notificacion", "error", "Error, se produjo un error al activar cajero");
                                }
                                else {
                                    if (data === 10) {
                                        window.location.href = "${pageContext.request.contextPath}/home";
                                    } else {
                                        $('#modalCaja').modal('hide');
                                        window.location.href = "${pageContext.request.contextPath}/operaciones/bobeda";
                                    }
                                }
                            },
                            error: function (data) {
                                $.notificar("Notificacion", "error", "Error: " + data);
                            }
                        });

                    }
                });
            });

            $.activarCajero = function () {
                $("#formulario").submit();
            };

            $.mostrarModal = function () {
                $('#modalCaja').modal('show');
            };

            $.mostrarDetallesaldo = function (id) {
                $("#detailPanel .panel-footer").html('<button class="btn btn-primary" onclick="$.abrirCajero(' + id + ')">Abrir cajero</button>');
                $("#denominacionRemesaPanel").hide();

                $("#detailPanel").show();
                $('html,body').animate({
                    scrollTop: $("#detailPanel").offset().top
                }, 2000);
            };

            $.mostrarDetallesaldo2 = function (id) {
                $("#denominacionRemesaPanel").html('<input id="denominacionRemesa" type="text" class="form-control"><span id="denominacionRemesaspan" style="color:red"></span>');
                $("#denominacionRemesaPanel").show();

                $("#detailPanel .panel-footer").html('<button class="btn btn-primary" onclick="$.transferenciaCajero(' + id + ')">Realizar transferencia</button>');
                $("#detailPanel").show();

                $('html,body').animate({
                    scrollTop: $("#detailPanel").offset().top
                }, 2000);
            };


            $.abrirCajero = function (id) {

                var cajero = {
                    id: id,
                    saldoApertura: parseFloat($("#totalSaldoInicio").html()),
                    saldoCierre: parseFloat($("#totalSaldoInicio").html())
                };

                var detallesaldocajeros = [];

                var denominacion = '';
                var valor = 0.0;
                var cantidad = 0;
                var total = 0.0;
                $("#detallesaldoCajeroFinal tbody tr").each(function (index)
                {
                    $(this).children("td").each(function (index2)
                    {
                        if (index2 === 0) {
                            denominacion = $(this).text();
                        }
                        if (index2 === 1) {
                            valor = parseFloat($(this).text());
                        }
                        if (index2 === 2) {
                            cantidad = parseFloat($(this).text());
                        }
                        if (index2 === 3) {
                            total = parseFloat($(this).text());
                        }
                    });
                    detallesaldocajeros.push({denominacion: denominacion, valor: valor, cantidad: cantidad, monto: total, apertura: true, cajero: cajero});
                });

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/operaciones/abrircajero",
                    contentType: "application/json",
                    data: JSON.stringify(detallesaldocajeros),
                    dataType: "json",
                    success: function (data) {
                        if (data === 0) {
                            $.notificar("Notificacion", "error", "Error, se produjo un error al abrir cajero");
                        }
                        else {
                            if (data === 2) {
                                $.notificar("Notificacion", "info", "Solo puede insertar billetes y monedas disponibles en bobeda");
                            }
                            else {
                                if (data === 3) {
                                    $.notificar("Notificacion", "info", "No hay suficientes billetes y/o monedas para realizar la transaccion");
                                }
                                else {
                                    if (data === 4) {
                                        $.notificar("Notificacion", "info", "No hay suficiente dinero en bobeda para realizar la transferencia");
                                    }
                                    else {
                                        if (data === 10) {
                                            window.location.href = "${pageContext.request.contextPath}/home";
                                        } else {
                                            window.location.href = "${pageContext.request.contextPath}/operaciones/bobeda";
                                        }
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

            $.transferenciaCajero = function (id) {
                var motivo = $("#denominacionRemesa").val();
                var monto = parseFloat($("#totalSaldoInicio").html());
                if (motivo.length < 1) {
                    $("#denominacionRemesaspan").html("complete el campo de detalle");
                } else {
                    if (monto < 1) {
                        $("#denominacionRemesaspan").html("El monto de la transferencia es insignificante");
                    }
                    else {
                        var detallesaldotransferencias = [];

                        var denominacion = '';
                        var valor = 0.0;
                        var cantidad = 0;
                        var total = 0.0;
                        $("#detallesaldoCajeroFinal tbody tr").each(function (index)
                        {
                            $(this).children("td").each(function (index2)
                            {
                                if (index2 === 0) {
                                    denominacion = $(this).text();
                                }
                                if (index2 === 1) {
                                    valor = parseFloat($(this).text());
                                }
                                if (index2 === 2) {
                                    cantidad = parseFloat($(this).text());
                                }
                                if (index2 === 3) {
                                    total = parseFloat($(this).text());
                                }
                            });
                            detallesaldotransferencias.push({denominacion: denominacion, valor: valor, cantidad: cantidad, monto: total, apertura: true});
                        });

                        var tipotransferencia = {
                            id: 1
                        };

                        var cajeroByIdCajero1 = {
                            id: id
                        };

                        var transferencia = {
                            bobeda: null,
                            cajeroByIdCajero1: cajeroByIdCajero1,
                            tipotransferencia: tipotransferencia,
                            usuario: null,
                            motivo: motivo,
                            fecha: null,
                            detallesaldotransferencias: detallesaldotransferencias
                        };

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/operaciones/transferenciacajero",
                            contentType: "application/json",
                            data: JSON.stringify(transferencia),
                            dataType: "json",
                            success: function (data) {
                                if (data === 0) {
                                    $.notificar("Notificacion", "error", "Error, se produjo un error en la transferencia");
                                }
                                else {
                                    if (data === 2) {
                                        $.notificar("Notificacion", "info", "Solo puede insertar billetes y monedas disponibles en bobeda");
                                    }
                                    else {
                                        if (data === 3) {
                                            $.notificar("Notificacion", "info", "No hay suficientes billetes y/o monedas para realizar la transaccion");
                                        }
                                        else {
                                            if (data === 4) {
                                                $.notificar("Notificacion", "info", "No hay suficiente dinero en bobeda para realizar la transferencia");
                                            }
                                            else {
                                                if (data === 10) {
                                                    window.location.href = "${pageContext.request.contextPath}/home";
                                                } else {
                                                    window.location.href = "${pageContext.request.contextPath}/operaciones/bobeda";
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            error: function (xhr, status, error) {
                                $.notificar("Notificacion", "error", "Error: " + error);
                            }
                        });
                    }
                }

            };

            $.calcular = function () {
                var added = '';

                var valorTotal = 0.0;
                var denominacion = '';
                var valor = 0.0;
                var cantidad = 0;
                var total = 0.0;
                $("#detallesaldoCajeroInicial tbody tr").each(function (index)
                {
                    $(this).children("td").each(function (index2)
                    {
                        if (index2 === 0) {
                            denominacion = $(this).children().find('option:selected').text();
                            valor = parseFloat($(this).children().find('option:selected').val());
                        }
                        if (index2 === 1) {
                            $(this).text(valor);
                        }
                        if (index2 === 2) {
                            cantidad = parseFloat($(this).text());
                        }
                        if (index2 === 3) {
                            $(this).text((valor * cantidad).toFixed(2));
                            total = parseFloat($(this).text());
                            valorTotal += parseFloat($(this).text());
                        }
                    });
                    added += '<tr><td>' + denominacion + '</td><td>' + valor + '</td><td>' + cantidad + '</td><td>' + total + '</td></tr>';
                });

                $("#detallesaldoCajeroFinal tbody").html(added);
                $("#totalSaldoInicio").html(parseFloat(valorTotal).toFixed(2));
            };

            $.agregarCelda = function () {
                $("#detallesaldoCajeroInicial tbody").append('<tr><td>' +
                        '<select onchange="$.calcular()">' +
                        '<option value="200">DOSCIENTOS</option>' +
                        '<option value="100">CIEN</option>' +
                        '<option value="50">CINCUENTA</option>' +
                        '<option value="20">VEINTE</option>' +
                        '<option value="10">DIEZ</option>' +
                        '<option value="5">CINCO</option>' +
                        '<option value="2">DOS</option>' +
                        '<option value="1">UN SOL</option>' +
                        '<option value="0.5">CINCUENTA CENTIMOS</option>' +
                        '<option value="0.2">VEINTE CENTIMOS</option>' +
                        '<option value="0.1">DIEZ CENTIMOS</option>' +
                        '</select>' +
                        '</td>' +
                        '<td>200.00</td>' +
                        '<td contenteditable="true" onkeyup="$.calcular()">0</td>' +
                        '<td>0.0</td>' +
                        '<td><a href="javascript:void(0)" onclick="$.quitarCelda($(this).parent().parent())"><i class="fa fa-close" style="color: red"></i></a></td>' +
                        '</tr>');
                $("#detallesaldoCajeroFinal tbody").append('<tr>' +
                        '<td>DOSCIENTOS</td><td>200.00</td><td>0</td><td>0.0</td>' +
                        '</tr>');
            };

            $.quitarCelda = function (dom) {
                dom.remove();

                $.calcular();
            };

            $.reaperturarCaja = function (id) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/operaciones/reaperturarcaja",
                    data: {id: id},
                    dataType: "json",
                    success: function (data) {
                        if (data === 0) {
                            $.notificar("Notificacion", "error", "Error, se produjo un error al reaperturar el cajero");
                        }
                        else {
                            if (data === 10) {
                                window.location.href = "${pageContext.request.contextPath}/home";
                            }
                            else {
                                window.location.href = "${pageContext.request.contextPath}/operaciones/bobeda";
                            }
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
