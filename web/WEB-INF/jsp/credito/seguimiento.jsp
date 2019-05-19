<%-- 
    Document   : index
    Created on : 13/02/2016, 03:29:06 AM
    Author     : nerio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="creditoModule">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguimiento cuenta credito</title>
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
    <body class="nav-md" style="font-family: Cambria" ng-controller="seguimientoController">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbarLeft.jsp" flush="true"/>
                <jsp:include page="../shared/navbarTop.jsp" flush="true"/>
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
                                                            <div class="col-ss-3 col-xs-3 col-sm-2" style="padding-right: 0px">
                                                                <input ng-model="codigoCliente" class="form-control" disabled="" style="text-align: center; color:  #322660" type="text">
                                                            </div>
                                                            <div class="col-ss-9 col-xs-9 col-sm-8" style="padding-left: 0px">
                                                                <input ng-model="nombreCliente" class="form-control" placeholder="CLIENTE" data-toggle="modal" data-target="#modalBuscarcliente" type="text">
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
                                                                                                <th>N°</th>
                                                                                                <th>Cuenta credito</th>
                                                                                                <th>Moneda</th>
                                                                                                <th>Importe credito</th>
                                                                                                <th>Monto desembolso</th>
                                                                                                <th>Desembolsado</th>
                                                                                                <th>Accion</th>
                                                                                                <th>Accion</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr ng-show="cuentacreditos.length > 0" ng-repeat="cuentacredito in cuentacreditos">
                                                                                                <td>{{cuentacredito.id}}</td>
                                                                                                <td>{{cuentacredito.cuentaCredito}}</td>
                                                                                                <td>{{cuentacredito.moneda}}</td>
                                                                                                <td>{{cuentacredito.importeCredito}}</td>
                                                                                                <td>{{cuentacredito.montoDesembolso}}</td>
                                                                                                <td>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 1" style="color: blue">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 2" style="color: red">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 3" style="color: orange">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 4" style="color: #1479B8">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 5" style="color: green">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 6" style="color: blue">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                    <i ng-if="cuentacredito.estadocredito.id === 7" style="color: blueviolet">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                                </td>
                                                                                                <td><a target="_blank" href="${pageContext.request.contextPath}/reporte/historialplanpagos?type=pdf&&cl={{cuentacredito.cliente.codigo.substr(0, 2)}}&&id={{cuentacredito.id}}"><i class="fa fa-file-pdf-o"></i> Historial plan pagos</a></td>
                                                                                                <td ng-if="cuentacredito.cliente.codigo.substr(0, 2) === 'CN'">
                                                                                                    <a href="#tab_content2" role="tab" data-toggle="tab" class="open-tab"  ng-click="cargardetallecn(cuentacredito)"><i class="fa fa-cubes"></i> Ver detalles</a>
                                                                                                </td>
                                                                                                <td ng-if="cuentacredito.cliente.codigo.substr(0, 2) === 'CJ'">
                                                                                                    <a href="#tab_content2" role="tab" data-toggle="tab" class="open-tab" ng-click="cargardetallecj(cuentacredito)"><i class="fa fa-cubes"></i> Ver detalles</a>
                                                                                                </td>
                                                                                            <tr ng-show="cuentacreditos.length === 0">
                                                                                                <td colspan="8" class="dataTables_empty">No hay registro de cuentas para el cliente seleccionado</td>
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
                                                                <div ng-show="clientecn.id !== 0" id="detailcn" class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading" style="text-align: center;color: blue">CREDITO {{cuentacredito.cuentaCredito}}</div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <fieldset>
                                                                                    <legend style="font-size:14px"><b>Datos del cliente</b></legend>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Codigo cliente: </b>{{cuentacredito.cliente.codigo}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Dni: </b>{{clientecn.dni}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Nombre: </b>{{clientecn.nombre}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Apellidos: </b>{{clientecn.apellidoPat}} {{clientecn.apellidoMat}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Direccion: </b>{{clientecn.direccion}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Celular: </b>{{clientecn.celular}}
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>
                                                                            <div class="row" style="padding-top:10px">
                                                                                <fieldset>
                                                                                    <legend style="font-size:14px"><b>Datos de credito</b></legend>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Producto credito: </b>{{cuentacredito.productocredito.nombre}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Cuenta credito: </b>{{cuentacredito.cuentaCredito}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Importe credito: </b>{{cuentacredito.importeCredito}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Interes: </b>{{cuentacredito.interes}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Moneda: </b>{{cuentacredito.moneda}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Plazo pago: </b>{{cuentacredito.plazo}} meses
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Fecha apertura: </b>{{cuentacredito.fechaApertura}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Monto desembolso: </b>{{cuentacredito.montoDesembolso}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>estado credito: </b>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 1" style="color: blue">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 2" style="color: red">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 3" style="color: orange">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 4" style="color: #1479B8">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 5" style="color: green">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 6" style="color: blue">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 7" style="color: blueviolet">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>
                                                                            <div class="row" style="padding-top:10px">
                                                                                <fieldset>
                                                                                    <legend style="font-size:14px"><b>Garantes</b></legend>
                                                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                                                        <table class="table table-striped">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td>N°</td>
                                                                                                    <td>Tipo</td>
                                                                                                    <td>Descripcion</td>
                                                                                                    <td>Importe garante</td>
                                                                                                    <td>Importe comprometido</td>
                                                                                                    <td>Moneda</td>
                                                                                                    <td>Fecha activacion</td>
                                                                                                    <td>Fecha levantamiento</td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <tr ng-show="garantes.length !== 0" ng-repeat="garante in garantes">
                                                                                                    <td>-</td>
                                                                                                    <td>{{garante.tipoGrante}}</td>
                                                                                                    <td>{{garante.descripcion}}</td>
                                                                                                    <td>{{garante.importeGarante}}</td>
                                                                                                    <td>{{garante.importeComprometido}}</td>
                                                                                                    <td>{{garante.tipoMoneda}}</td>
                                                                                                    <td>{{garante.fechaActivacion}}</td>
                                                                                                    <td>{{garante.fechaLevantamiento}}</td>
                                                                                                </tr>
                                                                                                <tr ng-show="garantes.length === 0">
                                                                                                    <td valign="top" colspan="8" class="dataTables_empty">No hay garantes registrados</td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div ng-show="clientecj.id !== 0" id="detailcj" class="col-ss-12 col-xs-12 col-sm-12" style="margin-top: 10px">
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading" style="text-align: center;color: blue">CREDITO {{cuentacredito.cuentaCredito}}</div>
                                                                        <div class="panel-body">
                                                                            <div class="row" >
                                                                                <fieldset>
                                                                                    <legend style="font-size:14px"><b>Datos del cliente</b></legend>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Codigo cliente: </b>{{cuentacredito.cliente.codigo}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>RUC: </b>{{clientecj.ruc}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Razon social </b>{{clientecj.razonSocial}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Nombre comercial </b>{{clientecj.nombreComercial}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Giro del negocio: </b>{{clientecj.giroNegocio}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Direccion: </b>{{clientecj.direccion}}
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>
                                                                            <div class="row" style="padding-top:10px">
                                                                                <fieldset>
                                                                                    <legend style="font-size:14px"><b>Datos de credito</b></legend>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Producto credito: </b>{{cuentacredito.productocredito.nombre}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Cuenta credito: </b>{{cuentacredito.cuentaCredito}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Importe credito: </b>{{cuentacredito.importeCredito}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Interes: </b>{{cuentacredito.interes}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Moneda: </b>{{cuentacredito.moneda}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Plazo pago: </b>{{cuentacredito.plazo}} meses
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Fecha apertura: </b>{{cuentacredito.fechaApertura}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>Monto desembolso: </b>{{cuentacredito.montoDesembolso}}
                                                                                    </div>
                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                        <b>estado credito: </b>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 1" style="color: blue">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 2" style="color: red">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 3" style="color: orange">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 4" style="color: #1479B8">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 5" style="color: green">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 6" style="color: blue">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                        <i ng-if="cuentacredito.estadocredito.id === 7" style="color: blueviolet">{{cuentacredito.estadocredito.denominacion}}</i>
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>
                                                                            <div class="row" style="padding-top:10px">
                                                                                <fieldset>
                                                                                    <legend style="font-size:14px"><b>Garantes</b></legend>
                                                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                                                        <table class="table table-striped">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td>N°</td>
                                                                                                    <td>Tipo</td>
                                                                                                    <td>Descripcion</td>
                                                                                                    <td>Importe garante</td>
                                                                                                    <td>Importe comprometido</td>
                                                                                                    <td>Moneda</td>
                                                                                                    <td>Fecha activacion</td>
                                                                                                    <td>Fecha levantamiento</td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <tr ng-show="garantes.length !== 0" ng-repeat="garante in garantes">
                                                                                                    <td>-</td>
                                                                                                    <td>{{garante.tipoGrante}}</td>
                                                                                                    <td>{{garante.descripcion}}</td>
                                                                                                    <td>{{garante.importeGarante}}</td>
                                                                                                    <td>{{garante.importeComprometido}}</td>
                                                                                                    <td>{{garante.tipoMoneda}}</td>
                                                                                                    <td>{{garante.fechaActivacion}}</td>
                                                                                                    <td>{{garante.fechaLevantamiento}}</td>
                                                                                                </tr>
                                                                                                <tr ng-show="garantes.length === 0">
                                                                                                    <td valign="top" colspan="8" class="dataTables_empty">No hay garantes registrados</td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
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
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-6">
                                            <select ng-options="opcionCliente as opcionCliente.denominacion for opcionCliente in opcionClientes track by opcionCliente.id" ng-model="opcionCliente" class="form-control">
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
                                            <table class="table table-striped jambo_table bulk_action">
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
                                                    <tr ng-show="personanaturals.length > 0" ng-repeat="personanatural in personanaturals" ng-click="seleccionarpn(personanatural)">
                                                        <td>{{personanatural.cliente.codigo}}</td>
                                                        <td>{{personanatural.persona.dni}}</td>
                                                        <td>{{personanatural.persona.nombre}}</td>
                                                        <td>{{personanatural.persona.apellidoPat}} {{personanatural.persona.apellidoMat}}</td>
                                                        <td>{{personanatural.cliente.id}}</td>
                                                    </tr>
                                                    <tr ng-show="personanaturals.length <= 0">
                                                        <td colspan="5" class="dataTables_empty">No hay registros de clientes persona natural</td>
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
                                                    <input ng-model="personaj.ruc" class="form-control" placeholder="RUC" type="number" ng-keyup="listarPersonajuridica(1)">  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Razon social</label>
                                            <input ng-model="personaj.razonSocial" class="form-control" placeholder="RAZON SOCIAL" type="text" ng-keyup="listarPersonajuridica(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-6">
                                            <label>Nombre comercial</label>
                                            <input ng-model="personaj.nombreComercial" class="form-control" placeholder="NOMBRE COMERCIAL" type="text" ng-keyup="listarPersonajuridica(2)">
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="padding-top: 10px">
                                            <table class="table table-striped jambo_table bulk_action">
                                                <thead>
                                                    <tr>
                                                        <th>Codigo </th>
                                                        <th>RUC</th>
                                                        <th>Razon social </th>
                                                        <th>Nombre comercial</th>
                                                        <th>Id cliente</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="personajuridicas.length > 0" ng-repeat="personajuridica in personajuridicas" ng-click="seleccionarpj(personajuridica)">
                                                        <td>{{personajuridica.cliente.codigo}}</td>
                                                        <td>{{personajuridica.ruc}}</td>
                                                        <td>{{personajuridica.razonSocial}}</td>
                                                        <td>{{personajuridica.nombreComercial}}</td>
                                                        <td>{{personajuridica.cliente.id}}</td>
                                                    </tr>
                                                    <tr ng-show="personajuridicas.length <= 0">
                                                        <td colspan="5" class="dataTables_empty">No hay registros de clientes persona juridica</td>
                                                    </tr>
                                                </tbody>                                                
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
        <script src="${pageContext.request.contextPath}/assets/controller/creditoModule.js" type="text/javascript"></script>
    </body>
</html> 
