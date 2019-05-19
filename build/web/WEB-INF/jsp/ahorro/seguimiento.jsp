<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguimiento cuenta credito</title>
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

        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
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
                                <h4>Administracion de cuenta credito</h4>
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
                                        <h2>Seguimiento de cuenta credito <i class="fa fa-book"></i></h2>
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
                                                <form id="formulario" method="post">
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <label>Cliente (*)</label>
                                                        <div class="row">
                                                            <input name="idCliente" hidden="" type="number">
                                                            <div class="col-ss-3 col-xs-3 col-sm-2" style="padding-right: 0px">
                                                                <input id="codigoCliente" class="form-control" value="CC-000000" disabled="" style="text-align: center; color:  #322660" type="text">
                                                            </div>
                                                            <div class="col-ss-9 col-xs-9 col-sm-8" style="padding-left: 0px">
                                                                <input name="nombreCliente" id="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <!-- DATOS ADICIONALES-->
                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Cuentas</a>
                                                            </li>
                                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Detalle cuenta</a>
                                                            </li>
                                                        </ul>
                                                        <div id="myTabContent" class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Cuentas de credito del cliente</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="tablaCuentacredito">
                                                                                        <thead>
                                                                                            <tr class="headings">
                                                                                                <th class="column-title">N°</th>
                                                                                                <th class="column-title">Cuenta credito</th>
                                                                                                <th class="column-title">Moneda</th>
                                                                                                <th class="column-title">Importe credito</th>
                                                                                                <th class="column-title">Monto desembolso</th>
                                                                                                <th class="column-title">Desembolsado</th>
                                                                                                <th class="column-title">Accion</th>
                                                                                                <th class="column-title">Accion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
                                                                                                <td>*</td>
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
                                                                <div class="panel panel-default" id="detailPanel">
                                                                    <div class="panel-heading">
                                                                        DETALLE CREDITO
                                                                    </div>
                                                                    <div class="panel-body">
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
                    <%@include file="../shared/footer.jsp" %>
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

                                                    $('#modalBuscarcliente').modal('hide');

                                                    $.llenarCuentas();
                                                };

                                                $.llenarCuentas = function () {
                                                    var idCliente = $("#formulario input[name=idCliente]").val();
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '${pageContext.request.contextPath}/credito/listarcuentacredito',
                                                        data: {idCliente: idCliente},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            var added = '';
                                                            if (data.length !== 0) {
                                                                $.each(data, function (i, value) {
                                                                    var json = JSON.parse(value);
                                                                    added += '<tr>' +
                                                                            '<td>' + (i + 1) + '</td>' +
                                                                            '<td>' + json.cuentaCredito + '</td>' +
                                                                            '<td>' + json.moneda + '</td>' +
                                                                            '<td>' + json.importeCredito + '</td>' +
                                                                            '<td>' + json.montoDesembolso + '</td>' +
                                                                            '<td>' + json.estadoDesembolso + '</td>' +
                                                                            '<td><a target="_blank" href="${pageContext.request.contextPath}/reporte/historialplanpagos?type=pdf&&cl=' + json.cliente + '&&id=' + json.id + '"><i class="fa fa-file-pdf-o"></i> Historial plan pagos</a></td>' +
                                                                            '<td><a href="#tab_content2" role="tab" data-toggle="tab" onclick="$.cargardetallesadmisioncredito' + json.cliente + '(' + json.id + ')"><i class="fa fa-cubes"></i> Ver detalles</a></td>' +
                                                                            '</tr>';
                                                                });
                                                                $("#tablaCuentacredito tbody").html(added);
                                                                $.notificar("Notificacion", "info", "Se cargo las cuentas del cliente correctamente");
                                                            }
                                                            else {
                                                                added += '<tr>' +
                                                                        '<td>NO</td>' +
                                                                        '<td>HAY</td>' +
                                                                        '<td>DATOS</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '<td>*</td>' +
                                                                        '</tr>';
                                                                $("#tablaCuentacredito tbody").html(added);
                                                                $.notificar("Notificacion", "info", "No se pudo obtener cuentas de este cliente");
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
                                                                    '<th class="column-title">Codigo </th>' +
                                                                    '<th class="column-title">DNI</th>' +
                                                                    '<th class="column-title">Nombre </th>' +
                                                                    '<th class="column-title">Apellidos</th>' +
                                                                    '<th class="column-title">Id cliente</th>' +
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
                                                                added += '<tr>No hay datos</tr></tbody>';
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
                                                                    '<th class="column-title">Codigo </th>' +
                                                                    '<th class="column-title">RUC</th>' +
                                                                    '<th class="column-title">Razon social </th>' +
                                                                    '<th class="column-title">Nombre comercial</th>' +
                                                                    '<th class="column-title">Id cliente</th>' +
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
                                                                added += '<tr>No hay datos</tr></tbody>';
                                                                $("#tablaBuscarcliente").html(added);
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.cargardetallesadmisioncreditoCN = function (id) {
                                                    $("#myTab li[class=active]").removeClass("active");
                                                    $("#profile-tab").parent().addClass("active");

                                                    $.ajax({
                                                        type: "POST",
                                                        url: "${pageContext.request.contextPath}/administracion/cargardetallesadmisioncreditocn",
                                                        data: {id: id},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            if (data !== "0") {
                                                                $("#detailPanel .panel-heading").html("DETALLE CREDITO " + data.cuentacredito);
                                                                $("#detailPanel .panel-body").html('<div class="row" >' +
                                                                        '<fieldset>' +
                                                                        '<legend style="font-size:14px"><b>Datos del cliente</b></legend>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Codigo cliente: </b>' + data.codigoCliente +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Dni: </b>' + data.dniPersona +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Nombre: </b>' + data.nombrePersona +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Apellidos: </b>' + data.apellidoPatPersona + ' ' + data.apellidoMatPersona +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Direccion: </b>' + data.direccionPersona +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Celular: </b>' + data.celularPersona +
                                                                        '</div>' +
                                                                        '</fieldset>' +
                                                                        '</div>' +
                                                                        '<div class="row" style="padding-top:10px">' +
                                                                        '<fieldset>' +
                                                                        '<legend style="font-size:14px"><b>Datos de credito</b></legend>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Producto credito: </b>' + data.nombreProductocredito +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Cuenta credito: </b>' + data.cuentacredito +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Importe credito: </b>' + data.importeCredito +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Interes: </b>' + data.interes +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Moneda: </b>' + data.moneda +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Plazo pago: </b>' + data.plazo + ' meses' +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Fecha apertura: </b>' + data.fechaApertura +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Monto desembolso: </b>' + data.montoDesembolso +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>estado credito: </b>' + data.estadocredito +
                                                                        '</div>' +
                                                                        '</fieldset>' +
                                                                        '</div>' +
                                                                        '<div class="row" style="padding-top:10px">' +
                                                                        '<fieldset>' +
                                                                        '<legend style="font-size:14px"><b>Garantes</b></legend>' +
                                                                        '<div id="garantePanel" class="col-ss-12 col-xs-12 col-sm-12">' +
                                                                        '</div>' +
                                                                        '</fieldset>' +
                                                                        '</div>');

                                                                $.cargardetallegarante(data.idCuentacredito);
                                                            }
                                                            else {
                                                                $.notificar("Notificacion", "error", "Error no se pudo obtener detalles del cliente");
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.cargardetallesadmisioncreditoCJ = function (id) {
                                                    $("#myTab li[class=active]").removeClass("active");
                                                    $("#profile-tab").parent().addClass("active");

                                                    $.ajax({
                                                        type: "POST",
                                                        url: "${pageContext.request.contextPath}/administracion/cargardetallesadmisioncreditocj",
                                                        data: {id: id},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            if (data !== "0") {
                                                                $("#detailPanel .panel-heading").html("DETALLE CREDITO " + data.cuentacredito);
                                                                $("#detailPanel .panel-body").html('<div class="row" >' +
                                                                        '<fieldset>' +
                                                                        '<legend style="font-size:14px"><b>Datos del cliente</b></legend>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Codigo cliente: </b>' + data.codigoCliente +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>RUC: </b>' + data.rucPersonaj +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Razon social </b>' + data.razonSocialPersonaj +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Nombre comercial </b>' + data.nombreComercialPersonaj +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Giro del negocio: </b>' + data.giroNegocioPersonaj +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Direccion: </b>' + data.direccionPersonaj +
                                                                        '</div>' +
                                                                        '</fieldset>' +
                                                                        '</div>' +
                                                                        '<div class="row" style="padding-top:10px">' +
                                                                        '<fieldset>' +
                                                                        '<legend style="font-size:14px"><b>Datos de credito</b></legend>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Producto credito: </b>' + data.nombreProductocredito +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Cuenta credito: </b>' + data.cuentacredito +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Importe credito: </b>' + data.importeCredito +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Interes: </b>' + data.interes +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Moneda: </b>' + data.moneda +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Plazo pago: </b>' + data.plazo + ' meses' +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Fecha apertura: </b>' + data.fechaApertura +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>Monto desembolso: </b>' + data.montoDesembolso +
                                                                        '</div>' +
                                                                        '<div class="col-ss-12 col-xs-6 col-sm-4">' +
                                                                        '<b>estado credito: </b>' + data.estadocredito +
                                                                        '</div>' +
                                                                        '</fieldset>' +
                                                                        '</div>' +
                                                                        '<div class="row" style="padding-top:10px">' +
                                                                        '<fieldset>' +
                                                                        '<legend style="font-size:14px"><b>Garantes</b></legend>' +
                                                                        '<div id="garantePanel" class="col-ss-12 col-xs-12 col-sm-12">' +
                                                                        '</div>' +
                                                                        '</fieldset>' +
                                                                        '</div>');

                                                                $.cargardetallegarante(data.idCuentacredito);
                                                            }
                                                            else {
                                                                $.notificar("Notificacion", "error", "Error no se pudo obtener detalles del cliente");
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            $.notificar("Notificacion", "error", "Error: " + error);
                                                        }
                                                    });
                                                };

                                                $.cargardetallegarante = function (idCuentacredito) {
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "${pageContext.request.contextPath}/administracion/cargardetallegarante",
                                                        data: {id: idCuentacredito},
                                                        dataType: "json",
                                                        success: function (data) {
                                                            var added = '<table class="table table-striped"><thead><tr>' +
                                                                    '<td>N°</td>' +
                                                                    '<td>Tipo</td>' +
                                                                    '<td>Descripcion</td>' +
                                                                    '<td>Importe garante</td>' +
                                                                    '<td>Importe comprometido</td>' +
                                                                    '<td>Moneda</td>' +
                                                                    '<td>Fecha activacion</td>' +
                                                                    '<td>Fecha levantamiento</td>' +
                                                                    '</tr></thead><tbody>';
                                                            if (data !== null) {
                                                                added += '<tbody>';
                                                                $.each(data, function (i, value) {
                                                                    var json = JSON.parse(value);
                                                                    added += '<tr id="' + json.id + '">' +
                                                                            '<td>' + (i + 1) + '</td>' +
                                                                            '<td>' + json.tipoGrante + '</td>' +
                                                                            '<td>' + json.descripcion + '</td>' +
                                                                            '<td>' + json.importeGarante + '</td>' +
                                                                            '<td>' + json.importeComprometido + '</td>' +
                                                                            '<td>' + json.tipoMoneda + '</td>' +
                                                                            '<td>' + json.fechaActivacion + '</td>' +
                                                                            '<td>' + json.fechaLevantamiento + '</td>' +
                                                                            '</tr>';
                                                                });
                                                                added += '</tbody></table>';

                                                                $("#garantePanel").html(added);
                                                            }
                                                            else {
                                                                added += '<tbody role="alert" aria-live="polite" aria-relevant="all"><tr class="odd"><td valign="top" colspan="11" class="dataTables_empty">No se encontraron garantes</td></tr></tbody>';
                                                                added += '</table>';

                                                                $("#garantePanel").html(added);
                                                                $.notificar("Notificacion", "info", "No se encontraron garantes para este credito");
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
            });
        </script>
    </body>
</html> 
